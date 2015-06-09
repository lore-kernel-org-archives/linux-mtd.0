Received: from mail-by2on0131.outbound.protection.outlook.com
 ([207.46.100.131] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2ICt-00067r-5Y
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 12:00:40 +0000
From: Wang Haikun <Haikun.Wang@freescale.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH 3/4 v1] mtd: spi-nor: fsl-quadspi: fix qspi irq handler
 complete exception
Date: Tue, 9 Jun 2015 12:00:12 +0000
Message-ID: <DM2PR0301MB0623B62FB20DB638F58489A8F8BE0@DM2PR0301MB0623.namprd03.prod.outlook.com>
References: <1432554603-2857-1-git-send-email-haikun.wang@freescale.com>
 <CA+EcR22O8nWjdXj8CbJ+LgE=eR5B8XGVjvhqbsvzM8r7i8me1A@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Xu Han <han.xu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/3/2015 12:42 PM, Han Xu wrote:=0A=
> On Mon, May 25, 2015 at 6:50 AM, Haikun Wang <haikun.wang@freescale.com> =
wrote:=0A=
>> In case of interrupt arrive immediately after requesting irq,=0A=
>> kernel will panic due to uninitialized variable.=0A=
>>=0A=
>> Fix below exception on LS1021AQDS:=0A=
>> Unable to handle kernel NULL pointer dereference at virtual address=0A=
>> 00000000=0A=
>> pgd =3D 80003000=0A=
>> [00000000] *pgd=3D80000080004003, *pmd=3D00000000=0A=
>> Internal error: Oops: 206 [#1] SMP THUMB2=0A=
>> Modules linked in:=0A=
>> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.1.0-rc5+ #2=0A=
>> Hardware name: Freescale LS1021A=0A=
>> task: 80526f30 ti: 80522000 task.ti: 80522000=0A=
>> PC is at __wake_up_common+0x14/0x46=0A=
>> LR is at __wake_up_locked+0xb/0x10=0A=
>> pc : [<800388ae>]    lr : [<800388eb>]    psr: 400001b3=0A=
>> sp : 80523e78  ip : 00000008  fp : 00000001=0A=
>> r10: 00000000  r9 : 00000003  r8 : ee008000=0A=
>> r7 : 00000001  r6 : 80000193  r5 : 00000000  r4 : ee0c0bd0=0A=
>> r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : fffffff4=0A=
>> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  ISA Thumb  Segment kernel=
=0A=
>> Control: 70c5387d  Table: 80003000  DAC: fddff9d7=0A=
>> Process swapper/0 (pid: 0, stack limit =3D 0x80522210)=0A=
>> Stack: (0x80523e78 to 0x80524000)=0A=
>> 3e60:                                                       00000000=0A=
>> ee0c0bcc=0A=
>> 3e80: ee0c0bc8 80000193 00000000 ee0cb480 805532ff 800388eb 00000000=0A=
>> 00000003=0A=
>> 3ea0: 00000001 80038d7f ee0c0010 08010001 00000000 80211587 80211553=0A=
>> cf81af00=0A=
>> 3ec0: 00000017 8003e199 ee0cb480 cf81af00 ee0cb480 80532ec0 6e2b4000=0A=
>> 00000000=0A=
>> 3ee0: ee008000 00000001 803326d0 8003e265 00000000 ee0cb480 80532ec0=0A=
>> 8003ff6b=0A=
>> 3f00: 8003ff09 00000017 8051ebc4 8003dc77 00000000 8003de47 80523f48=0A=
>> f0002000=0A=
>> 3f20: 80523f48 805247d4 80523f7c 8051d384 8051fca0 8000924b 8000db28=0A=
>> 40000133=0A=
>> 3f40: ffffffff 8032df1b 00000001 00000000 00000000 80017be1 80522000=0A=
>> 00000000=0A=
>> 3f60: 00000000 80523f98 8051d384 8051fca0 803326d0 00000001 00000008=0A=
>> 80523f90=0A=
>> 3f80: 8000db27 8000db28 40000133 ffffffff 00000000 80038fd7 00000001=0A=
>> 00000000=0A=
>> 3fa0: 00000002 80556000 00000000 804eb933 ffffffff ffffffff 804eb545=0A=
>> 00000000=0A=
>> 3fc0: ffffffff 00000000 00000000 80512590 00000000 80556294 80524460=0A=
>> 8051258c=0A=
>> 3fe0: 80528050 80003010 410fc075 00000000 00000000 8000808f 00000000=0A=
>>          00000000=0A=
>> [<800388ae>] (__wake_up_common) from [<800388eb>]=0A=
>>          (__wake_up_locked+0xb/0x10)=0A=
>> [<800388eb>] (__wake_up_locked) from [<80038d7f>] (complete+0x1f/0x2a)=
=0A=
>> [<80038d7f>] (complete) from [<80211587>] (fsl_qspi_irq_handler+0x35/0x3=
8)=0A=
>> [<80211587>] (fsl_qspi_irq_handler) from [<8003e199>]=0A=
>>          (handle_irq_event_percpu+0x1b/0xb6)=0A=
>> [<8003e199>] (handle_irq_event_percpu) from [<8003e265>]=0A=
>>          (handle_irq_event+0x31/0x48)=0A=
>> [<8003e265>] (handle_irq_event) from [<8003ff6b>]=0A=
>>          (handle_fasteoi_irq+0x63/0xb8)=0A=
>> [<8003ff6b>] (handle_fasteoi_irq) from [<8003dc77>]=0A=
>>          (generic_handle_irq+0x13/0x1c)=0A=
>> [<8003dc77>] (generic_handle_irq) from [<8003de47>]=0A=
>>          (__handle_domain_irq+0x53/0x74)=0A=
>> [<8003de47>] (__handle_domain_irq) from [<8000924b>]=0A=
>>          (gic_handle_irq+0x27/0x40)=0A=
>> [<8000924b>] (gic_handle_irq) from [<8032df1b>] (__irq_svc+0x3b/0x5c)=0A=
>> Exception stack(0x80523f48 to 0x80523f90)=0A=
>> 3f40:                   00000001 00000000 00000000 80017be1 80522000=0A=
>> 00000000=0A=
>> 3f60: 00000000 80523f98 8051d384 8051fca0 803326d0 00000001 00000008=0A=
>> 80523f90=0A=
>> 3f80: 8000db27 8000db28 40000133 ffffffff=0A=
>> [<8032df1b>] (__irq_svc) from [<8000db28>] (arch_cpu_idle+0x14/0x20)=0A=
>> [<8000db28>] (arch_cpu_idle) from [<80038fd7>]=0A=
>>          (cpu_startup_entry+0x187/0x1c4)=0A=
>> [<80038fd7>] (cpu_startup_entry) from [<804eb933>]=0A=
>>          (start_kernel+0x27b/0x2e4)=0A=
>> [<804eb933>] (start_kernel) from [<8000808f>] (0x8000808f)=0A=
>> Code: 4617 469a f1a5 000c (682d) 3d0c=0A=
>> ---[ end trace 420f2b58e4270f57 ]---=0A=
>> Kernel panic - not syncing: Fatal exception in interrupt=0A=
>> CPU1: stopping=0A=
>> CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D         4.1.0-rc5+ #2=0A=
>> Hardware name: Freescale LS1021A=0A=
>> [<80011937>] (unwind_backtrace) from [<8000f4e7>] (show_stack+0xb/0xc)=
=0A=
>> [<8000f4e7>] (show_stack) from [<8032ad55>] (dump_stack+0x51/0x64)=0A=
>> [<8032ad55>] (dump_stack) from [<80010ff9>] (handle_IPI+0x7d/0xf8)=0A=
>> [<80010ff9>] (handle_IPI) from [<8000925b>] (gic_handle_irq+0x37/0x40)=
=0A=
>> [<8000925b>] (gic_handle_irq) from [<8032df1b>] (__irq_svc+0x3b/0x5c)=0A=
>> Exception stack(0xee079f90 to 0xee079fd8)=0A=
>> 9f80:                                     00000001 00000000 00000000=0A=
>> 80017be1=0A=
>> 9fa0: ee078000 00000000 00000000 ee079fe0 8051d384 8051fca0 803326d0=0A=
>> 00000001=0A=
>> 9fc0: 00000008 ee079fd8 8000db27 8000db28 40000133 ffffffff=0A=
>> [<8032df1b>] (__irq_svc) from [<8000db28>] (arch_cpu_idle+0x14/0x20)=0A=
>> [<8000db28>] (arch_cpu_idle) from [<80038fd7>]=0A=
>>          (cpu_startup_entry+0x187/0x1c4)=0A=
>> [<80038fd7>] (cpu_startup_entry) from [<80009311>] (__enable_mmu+0x1/0x1=
0)=0A=
>> ---[ end Kernel panic - not syncing: Fatal exception in interrupt=0A=
>>=0A=
>> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>=0A=
>> ---=0A=
>>   drivers/mtd/spi-nor/fsl-quadspi.c | 8 ++++++++=0A=
>>   1 file changed, 8 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl=
-quadspi.c=0A=
>> index 997eb20..fa615a0 100644=0A=
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> @@ -666,6 +666,10 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)=
=0A=
>>          qspi_writel(q, QUADSPI_MCR_RESERVED_MASK | QUADSPI_MCR_END_CFG_=
MASK,=0A=
>>                          base + QUADSPI_MCR);=0A=
>>=0A=
>> +       /* clear flag register before enable the interrupt */=0A=
>> +       reg =3D qspi_readl(q, q->iobase + QUADSPI_FR);=0A=
>> +       qspi_writel(q, reg, q->iobase + QUADSPI_FR);=0A=
>> +=0A=
>=0A=
> I think clear the interrupt before enable interrupt can fix this=0A=
> issue, init_completion in early stage is not necessary.=0A=
OK.=0A=
=0A=
Best regards,=0A=
Wang Haikun=0A=
>=0A=
> Han Xu=0A=
>=0A=
>>          /* enable the interrupt */=0A=
>>          qspi_writel(q, QUADSPI_RSER_TFIE, q->iobase + QUADSPI_RSER);=0A=
>>=0A=
>> @@ -878,6 +882,10 @@ static int fsl_qspi_probe(struct platform_device *p=
dev)=0A=
>>                  goto irq_failed;=0A=
>>          }=0A=
>>=0A=
>> +       /* In case of interrupt arrive immediately after requesting irq,=
=0A=
>> +        * kernel will panic without init_completion.=0A=
>> +        */=0A=
>> +       init_completion(&q->c);=0A=
>>          ret =3D devm_request_irq(dev, ret,=0A=
>>                          fsl_qspi_irq_handler, 0, pdev->name, q);=0A=
>>          if (ret) {=0A=
>> --=0A=
>> 2.1.0.27.g96db324=0A=
>>=0A=
>>=0A=
>> ______________________________________________________=0A=
>> Linux MTD discussion mailing list=0A=
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=
>=0A=
=0A=
