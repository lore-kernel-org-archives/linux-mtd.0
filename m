MIME-Version: 1.0
In-Reply-To: <4E2F6F90.7030207@freescale.com>
References: <1311230846-26437-1-git-send-email-b32955@freescale.com>
	<20110721215020.GA25344@pengutronix.de>
	<4E28EEE1.2050008@freescale.com>
	<20110722055731.GI26837@S2100-06.ap.freescale.net>
	<4E292FCF.6010608@freescale.com>
	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>
	<4E2F6F90.7030207@freescale.com>
Date: Thu, 28 Jul 2011 11:38:43 +0200
Message-ID: <CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, shijie8@gmail.com,
	Shawn Guo <shawn.guo@freescale.com>, LW@karo-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have test on mx23evk board. Still see the same issues.

On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie <b32955@freescale.com> wrote:
> Hi,
>
> Thanks for your test.
>
>> Hi,
>>
>> It's not really working for me.
>> I've applied all gpmi-nand driver patches and the dma driver patches.
>>
>> I have added following kernel parameters:
>> mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:rootfs0
>> rootfstype=3Dubifs gpmi_debug_init
>>
>> During boot I get already get DMA timeout:
>> [ =C2=A0 =C2=A02.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout=
, last DMA
>> :1
>> [ =C2=A0 =C2=A03.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
>> ...
>> (see log file in attach line 89)

I still see this DMA timeout when booting.
What kernel parameters do you use? I still use same as above.

>>
>> When trying flash_erraseall /dev/mtd1 I get:
>> Erasing 128 Kibyte @ 20000 -- =C2=A00 % complete [ =C2=A0 16.700000] [
>> gpmi_read_data : 832 ] step 1 error
>> [ =C2=A0 16.700000] [ gpmi_send_command : 749 ] step 1 error
>> [ =C2=A0 16.700000] [ mil_cmd_ctrl : 894 ] Chip: 0, Error -1
>> [ =C2=A0 16.700000] [ gpmi_send_command : 749 ] step 1 error
>> [ =C2=A0 16.700000] [ mil_cmd_ctrl : 894 ] Chip: 0, Error -1
>> [ =C2=A0 16.700000] [ gpmi_send_command : 749 ] step 1 error
>> [ =C2=A0 16.700000] [ mil_cmd_ctrl : 894 ] Chip: 0, Error -1
>> [ =C2=A0 16.700000] [ gpmi_read_data : 832 ] step 1 error
>> libmtd: error!: MEMERA[ =C2=A0 16.740000] [ gpmi_send_command : 749 ] st=
ep 1
>> error
>> SE64 ioctl failed for eraseblock[ =C2=A0 16.750000] [ mil_cmd_ctrl : 894=
 ]
>> Chip: 0, Error -1
>> =C2=A01 (mtd1)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 error 5 (Input/output error)
>> flash_erase: error!: /dev/mtd1: MTD Erase failure
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error 5 (Input/output er=
ror)
>> ...
>> (see log file in attach line 128 and further)

Also still same issue here.

>>
>> Environment:
>> - patches on a 2.6.39.1 kernel (needed to modify the patch a little
>> for changed mtd add/del interface).
>
> Please test the driver on :
> =C2=A0git://git.linaro.org/people/shawnguo/linux-2.6.git mxs-gpmi

I have used this branch.

>
> or on
>
> =C2=A0git://git.pengutronix.de/git/imx/linux-2.6.git =C2=A0imx-for-3.1
>
>
>
> I found the .config may influence the DMA.
> I guess there is some module which has impact to the DMA.
> So You should use the right .config first, you can get the right
> .config by two ways:
> [1] use the 'make mxs_defconfig' in the imx-for-3.1 branch of
> =C2=A0tree: git://git.pengutronix.de/git/imx/linux-2.6.git
>
> [2] use the attachment which is tested by me.

I have used this config file. Only thing changed to the config file is
(uboot savenv not working):
CONFIG_CMDLINE=3D"console=3DttyAMA0,115200
mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:rootfs0
rootfstype=3Dubifs gpmi_debug_init"
CONFIG_CMDLINE_FORCE=3Dy


br,
Koen

>
> Best Regards
> Huang Shijie
>
>
>
>> - using this on our own mx23 based board, so also added some board
>> init code for that.
>>
>>
>> On Fri, Jul 22, 2011 at 10:07 AM, Huang Shijie<b32955@freescale.com>
>> =C2=A0wrote:
>>>
>>> Hi Wolfram:
>>>>
>>>> On Fri, Jul 22, 2011 at 11:30:41AM +0800, Huang Shijie wrote:
>>>>>
>>>>> Hi,
>>>>>>>
>>>>>>> The general-purpose media interface(GPMI) controller is a flexible
>>>>>>> interface
>>>>>>> to up to several NAND flashs.
>>>>>>
>>>>>> ...
>>>>>>>
>>>>>>> To Walfram& =C2=A0 =C2=A0Artem:
>>>>>>> =C2=A0 =C2=A0 About how to disable the JFFS2 to use the OOB:
>>>>>>> =C2=A0 =C2=A0 I read the code, and I still have no idea about how t=
o use the
>>>>>>> ecclayout
>>>>>>> =C2=A0 =C2=A0 to do the job. Could you give me some hint? thanks.
>>>>>>
>>>>>> Have you checked mxc_nand.c for example? There is
>>>>>>
>>>>>> static struct nand_ecclayout nandv1_hw_eccoob_smallpage =3D {
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .eccbytes =3D 5,
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .eccpos =3D {6, 7, 8, 9, 10},
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .oobfree =3D {{0, 5}, {12, 4}, }
>>>>>> }
>>>>>>
>>>>>> defined as one layout. Now, you could define one where oobfree is
>>>>>> empty
>>>>>> and
>>>>>> eccbytes as big as the oob-area.
>>>>>>
>>>>> thanks. I will check the code.
>>>>>>>
>>>>>>> The driver depends on another GPMI-NAND device patch set, you can
>>>>>>> find
>>>>>>> them at :
>>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[1]
>>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2011-July/037033.htm=
l
>>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[2]
>>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2011-July/037031.htm=
l
>>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[3]
>>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2011-July/037032.htm=
l
>>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[4]
>>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2011-July/037034.htm=
l
>>>>>>>
>>>>>>> The driver also depends on another DMA patch by Shawn:
>>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0[0]
>>>>>>> http://lists.infradead.org/pipermail/linux-mtd/2011-June/036820.htm=
l
>>>>>>
>>>>>> This makes it difficult for testers/reviewers. Please try to get a
>>>>>> git-branch
>>>>>> from Freescale or Linaro.
>>>>>>
>>>>> Shawn will merge my patches to his Linaro branch.
>>
>> I don't see the DMA patch in the git?
>>
>>>> git://git.linaro.org/people/shawnguo/linux-2.6.git mxs-gpmi
>>>
>>> Please test the GPMI driver based this git tree.
>>
>> I will try that on an mx23evk board.
>>
>>> I tested, and the DMA-timeout does not occur any more.
>>>
>>> I notice that Shawn added two more patched to
>>> /arch/arm/config/mxs_defconfig:
>>> [1] ARM: mxs_defconfig: Add mx23evk and mx28evk build
>>> [2] ARM: mxs_defconfig: Change CONFIG_RTC_CLASS 'm' to 'y'
>>>
>>> Please check it. Maybe your kernel code misses them.
>>
>> I don't see any of this in the git?
>>
>>> Of course, you can use the my_config (i sent you last mail) for .config=
.
>>>
>>> Best Regards
>>> Huang Shijie
>>>
>>>
>>>> Shijie, please check and test it. =C2=A0I only did a build test.
>>>>
>>>
>>>
>>> _______________________________________________
>>> linux-arm-kernel mailing list
>>> linux-arm-kernel@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>
>
>
