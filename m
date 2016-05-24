Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b59iT-00027u-Hr
 for linux-mtd@lists.infradead.org; Tue, 24 May 2016 10:37:38 +0000
Received: by mail-lf0-x233.google.com with SMTP id k98so4554613lfi.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 May 2016 03:37:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57441937.9070302@nod.at>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
 <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
 <573EC17D.40809@nod.at>
 <CABatt_wQfDFN4U5SgOLrcxWNiZYVRQ4eGy1LQmdRJJN-qncUHw@mail.gmail.com>
 <CABatt_zj+0Vr9PjM64VMYk-Gx+UGW-Xo6vJFNLJ1DsPNm0LPHQ@mail.gmail.com>
 <574360B5.1040505@nod.at>
 <CABatt_xRU57kp1gWwS+gNbSM7_j=ZWAZnQqZ_gjhSGV-+ytMEA@mail.gmail.com>
 <57441937.9070302@nod.at>
Date: Tue, 24 May 2016 11:37:14 +0100
Message-ID: <CABatt_w4qzj9sqn9gQPMYe7c5y9hPCUws5QJNK_q6Kz+mMuMbw@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 24, 2016 at 10:04 AM, Richard Weinberger <richard@nod.at> wrote:
> Am 24.05.2016 um 10:31 schrieb Martin Townsend:
>> On Mon, May 23, 2016 at 8:57 PM, Richard Weinberger <richard@nod.at> wrote:
>>> Am 23.05.2016 um 16:16 schrieb Martin Townsend:
>>>>> Also will try patch on Monday :)
>>>> Hi Richard,
>>>>
>>>> with reboot I get the assert on shutdown too, the commit
>>>> 807612db2f9940b9fa6deaef054eb16d51bd3e00 is there already.  A
>>>> colleague doesn't see this problem so I will try on a newly flashed
>>>> board.
>>>
>>> Interesting, so it happens only with that UBIFS instance?
>>> Can you share a nanddump?
>>>
>> No problem, is there a specific command? looking at the help I would guess:
>> nanddump --bb=dumpbad --oob -f nand.img /dev/mtdX
>
> nandump --omitoob -f nand.img /dev/mtdX is fine.
>
>
>> Is there a preference as to where to put the dump file?
>
> Anything where I can download anonymously is fine.
>

Here's a link to the image
https://file.io/0s7OA9

I've just tried on another board and can still get the same assert so
it's not just a one off. I also saw this warning whilst formatting
this board.  I tried reflashing again until I did not get the warning
below but still saw the assert so I don't think they are related.
ubiformat: mtd12 (nand), size 533725184 bytes (509.0 MiB), 4072
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 4071 -- 100 % complete
ubiformat: 4070 eraseblocks are supposedly empty
ubiformat: 2 bad eraseblocks found, numbers: 1324, 1640
ubiformat: flashing eraseblock 191 -- 17 % complete  [   51.525672]
------------[ cut here ]------------
[   80.185567] WARNING: CPU: 0 PID: 896 at
/home/poweroasis/bia/build/am43-controller-aquila/tmp/work-shared/am43-controller-aquila/kernel-source/drivers/mtd/nand/nand_base.c:928
nand_wait+0x150/0x174()
[   80.207539] Modules linked in: xhci_plat_hcd xhci_hcd usbcore cmac
esp4 ah4 crypto_null rpmsg_pru virtio_rpmsg_bus pru_rproc dwc3
udc_core ti_am335x_adc kfifo_buf industrialio cpufreq_voltdm
thermal_sys pruss dwc3_omap extcon omap_rng c_can_platform c_can
rng_core can_dev max31865(O) lm73 hwmon omap_wdt ti_am335x_tscadc
phy_omap_usb2 sch_fq_codel ipv6
[   80.239238] CPU: 0 PID: 896 Comm: ubiformat Tainted: G           O
  4.1.18-g6b41ca0b94 #1
[   80.251528] Hardware name: Generic AM43 (Flattened Device Tree)
[   80.259707] Backtrace:
[   80.262225] [<c0013398>] (dump_backtrace) from [<c00135b8>]
(show_stack+0x18/0x1c)
[   80.273766]  r7:c07c11f4 r6:000003a0 r5:00000009 r4:00000000
[   80.279692] [<c00135a0>] (show_stack) from [<c060006c>]
(dump_stack+0x20/0x28)
[   80.291014] [<c060004c>] (dump_stack) from [<c00393f4>]
(warn_slowpath_common+0x80/0xb8)
[   80.301369] [<c0039374>] (warn_slowpath_common) from [<c00394d0>]
(warn_slowpath_null+0x24/0x2c)
[   80.312445]  r8:c0919bd8 r7:c0884ee0 r6:ffffaa20 r5:ee040010 r4:00000080
[   80.319433] [<c00394ac>] (warn_slowpath_null) from [<c045a150>]
(nand_wait+0x150/0x174)
[   80.331400] [<c045a000>] (nand_wait) from [<c04585e0>]
(nand_write_page+0x104/0x158)
[   80.341377]  r9:00000000 r8:00009000 r7:00000800 r6:c045d220
r5:ee040010 r4:ee040268
[   80.349386] [<c04584dc>] (nand_write_page) from [<c045ada0>]
(nand_do_write_ops+0x2a0/0x438)
[   80.361838]  r8:00009000 r7:ee040010 r6:ee040268 r5:ec737000 r4:c04584dc
[   80.368796] [<c045ab00>] (nand_do_write_ops) from [<c045b0e8>]
(nand_write+0x64/0x84)
[   80.380498]  r10:00020000 r9:00000000 r8:05da0000 r7:ec720000
r6:ec58be8c r5:ec58bdc8
[   80.388587]  r4:ee040010
[   80.391171] [<c045b084>] (nand_write) from [<c0448284>]
(part_write+0x48/0x50)
[   80.402601]  r10:ec58a000 r9:ee08a000 r8:be7eb418 r7:00000000
r6:00000000 r5:00000000
[   80.412195]  r4:00280000
[   80.416939] [<c044823c>] (part_write) from [<c0444f18>] (mtd_write+0x88/0xa0)
[   80.424109]  r5:00000000 r4:c044823c
[   80.431712] [<c0444e90>] (mtd_write) from [<c044ae1c>]
(mtdchar_write+0xdc/0x288)
[   80.443252]  r7:ec720000 r6:00000000 r5:ec58bf80 r4:00020000
[   80.449538] [<c044ad40>] (mtdchar_write) from [<c013a3a8>]
(__vfs_write+0x34/0xe4)
[   80.461287]  r10:00000000 r9:ec58a000 r8:c000fac4 r7:ec58bf80
r6:00020000 r5:c044ad40
[   80.469339]  r4:ee22ed80
[   80.471908] [<c013a374>] (__vfs_write) from [<c013acd8>]
(vfs_write+0x98/0x1a4)
[   80.484273]  r9:ec58a000 r8:c000fac4 r7:ec58bf80 r6:be7eb418
r5:00020000 r4:ee22ed80
[   80.492131] [<c013ac40>] (vfs_write) from [<c013b60c>] (SyS_write+0x4c/0xa8)
[   80.502751]  r9:ec58a000 r8:c000fac4 r7:00020000 r6:be7eb418
r5:ee22ed80 r4:ee22ed80
[   80.510770] [<c013b5c0>] (SyS_write) from [<c000f920>]
(ret_fast_syscall+0x0/0x3c)
[   80.522050]  r7:00000004 r6:00000000 r5:be80b508 r4:000002d9
[   80.527935] ---[ end trace a11e7645e6ddf1b3 ]---

> Thanks,
> //richard
