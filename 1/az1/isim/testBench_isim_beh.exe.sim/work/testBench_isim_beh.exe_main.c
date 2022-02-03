/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003671928401_2386756495_init();
    work_m_00000000003534317993_4192652080_init();
    work_m_00000000001765913506_3872756523_init();
    work_m_00000000002164933061_4101485509_init();
    work_m_00000000000081137377_3637074472_init();
    work_m_00000000003890241820_3479014920_init();
    work_m_00000000002400297656_3052352512_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002400297656_3052352512");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
