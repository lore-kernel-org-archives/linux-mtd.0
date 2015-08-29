Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVdxz-00080T-UH
 for linux-mtd@lists.infradead.org; Sat, 29 Aug 2015 11:06:37 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: pxa3xx-nand: switch to dmaengine
References: <1440441674-12103-1-git-send-email-robert.jarzmik@free.fr>
 <20150828225019.GA1774@laptop.cereza>
Date: Sat, 29 Aug 2015 13:01:37 +0200
In-Reply-To: <20150828225019.GA1774@laptop.cereza> (Ezequiel Garcia's message
 of "Fri, 28 Aug 2015 19:50:20 -0300")
Message-ID: <87wpwe1hpq.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

> Robert,
>
> On 24 Aug 08:41 PM, Robert Jarzmik wrote:
>> Now pxa architecture has a dmaengine driver, remove the access to direct
>> dma registers in favor of the more generic dmaengine code.
>> 
>> This should be also applicable for mmp and orion, provided they work in
>> device-tree environment.
>> 
>> This patch also removes the previous hack which was necessary to make
>> the driver work in a devicetree environment.
>>
>
> Oh, this is nice.
>
> I haven't been following the PXA dmaengine effort,
> should I expect this to Just Work (TM) on a CM-X300 (PXA310) in linux-next?
No, because linux-next without it gives :
Unable to handle kernel paging request at virtual address e36208e4
pgd = c0004000
[e36208e4] *pgd=c360044e(bad)
Internal error: Oops: 823 [#1] ARM
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.0-rc8-next-20150828-cm-x300+ #864
Hardware name: CM-X300 module
task: e3436000 ti: e3444000 task.ti: e3444000
PC is at nand_scan_ident+0xe00/0x1330
LR is at nand_scan_ident+0xd28/0x1330
pc : [<c02a7250>]    lr : [<c02a7178>]    psr: 68000053
sp : e3445d70  ip : 68000053  fp : c0ba0c80
r10: 00000000  r9 : 000000dc  r8 : 000000ec
r7 : 00000001  r6 : e36208dc  r5 : 00000000  r4 : 20000000
r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
Control: 0000397f  Table: a0004018  DAC: 00000071
Process swapper (pid: 1, stack limit = 0xe3444198)
Stack: (0xe3445d70 to 0xe3446000)
5d60:                                     00000800 00000040 00000000 00000001
5d80: 00000095 00000001 e22e0500 00002000 9510dcec ffffffff e3620810 e3620810
5da0: e3620b24 e36208dc c0b8bd34 00000000 c02ab1a8 c02ab1e0 c0b8bd34 c02ac228
5dc0: c04823d8 e3620810 c0b885c0 c0b8bd4c c0b885d0 e3620878 00000007 e3403888
5de0: e3620810 00000000 c0b8bd34 80000000 001000d0 28000053 00000000 00000000
5e00: 00000000 c0206fc8 e22e5b40 000019b9 00000000 c00f8f94 00000002 00000000
5e20: e22ed190 e3529460 e3529460 c00f9148 e22ed0f0 e3529460 e3529460 00000001
5e40: e3529460 e22ed0f0 e22ed190 c04bde88 e3529460 ffffffed c0b885d0 fffffdfb
5e60: c0ba1a2c 00000000 c0533830 c051559c 00000000 c0271bfc c0271bcc c0b885d0
5e80: c0c02b6c c0ba1a2c c0b9bb48 c0270300 c0b885d0 c0ba1a2c c0b88604 c0b9bb48
5ea0: 00000000 c0270440 00000000 c0ba1a2c c02703b4 c026e890 e3432b8c e3477750
5ec0: c0ba1a2c e22ee000 00000000 c026f9e8 c04823d8 00000006 c0ba1a2c c0ba1a2c
5ee0: c0b85b80 e22e5b00 c052b2a0 c0270c04 00000000 c0b85b80 c0b85b80 c00096d0
5f00: c0bf6b6c e3407600 e3463980 c03d60f8 00000000 00000000 00000000 c00f0a4c
5f20: 00000000 00000000 e3ffce2e c002f694 00000000 c04f2d68 e3ffce49 00000006
5f40: 00000006 00000000 00000000 c053ee4c c053ef9c 00000006 c0bb1080 00000075
5f60: c0bb1080 c051559c 00000000 c0515d6c 00000006 00000006 00000000 c051559c
5f80: c0018bcc 00000000 c03d121c 00000000 00000000 00000000 00000000 00000000
5fa0: 00000000 c03d1224 00000000 c000a4d0 00000000 00000000 00000000 00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 50001052 31082120
[<c02a7250>] (nand_scan_ident) from [<c02ac228>] (pxa3xx_nand_probe+0x344/0xc6c)
[<c02ac228>] (pxa3xx_nand_probe) from [<c0271bfc>] (platform_drv_probe+0x30/0x94)
[<c0271bfc>] (platform_drv_probe) from [<c0270300>] (driver_probe_device+0x240/0x2f4)
[<c0270300>] (driver_probe_device) from [<c0270440>] (__driver_attach+0x8c/0x90)
[<c0270440>] (__driver_attach) from [<c026e890>] (bus_for_each_dev+0x70/0xa0)
[<c026e890>] (bus_for_each_dev) from [<c026f9e8>] (bus_add_driver+0x18c/0x210)
[<c026f9e8>] (bus_add_driver) from [<c0270c04>] (driver_register+0x78/0xf8)
[<c0270c04>] (driver_register) from [<c00096d0>] (do_one_initcall+0x80/0x1e8)
[<c00096d0>] (do_one_initcall) from [<c0515d6c>] (kernel_init_freeable+0x100/0x1c8)
[<c0515d6c>] (kernel_init_freeable) from [<c03d1224>] (kernel_init+0x8/0xec)
[<c03d1224>] (kernel_init) from [<c000a4d0>] (ret_from_fork+0x14/0x24)
Code: e0854093 e3a00000 e0232391 e0835005 (e1c640f8) 
---[ end trace b0bd534a8da9246f ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

>> -#ifndef ARCH_HAS_DMA
>> -	if (use_dma) {
>> +	dma_available = IS_ENABLED(CONFIG_ARM) &&
>> +		(IS_ENABLED(CONFIG_ARCH_PXA) || IS_ENABLED(CONFIG_ARCH_MMP));
>> +	if (use_dma && !dma_available) {
>
> Isn't it just simpler to always fallback to PIO if the
> devicetree doesn't provide any DMA channels?
Most certainly, but that deserves another patch as it changes the current
behavior.

> Platforms without DMA would fall naturally to PIO.
What about -EPROBE_DEFER handling ?

> Also: do we need to update the devicetree binding?
Yes, the example and an optional dma node property.

Cheers.

-- 
Robert
