Received: from mail-he1eur01on0057.outbound.protection.outlook.com
 ([104.47.0.57] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLkaI-0006qL-Pt
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 07:24:08 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Prabhakar
 Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: RE: Issue while oops and panic message logging to MTD partition
Date: Thu, 24 May 2018 07:22:35 +0000
Message-ID: <AM6PR04MB4053C5A6B67D587E177B53DD906A0@AM6PR04MB4053.eurprd04.prod.outlook.com>
References: <HE1PR0402MB2778B83183DA25027369540A90930@HE1PR0402MB2778.eurprd04.prod.outlook.com>
 <20180515140740.4f58911b@bbrezillon>
In-Reply-To: <20180515140740.4f58911b@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I tried to test this feature on NOR flash as well however it is not working=
. There is nothing written on the mtd partition provided through mtdoops.mt=
ddev. Is this the expected behavior?

Has anyone tried to test mtdoops feature on nor flash?

Thanks,
Jagdish

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Tuesday, May 15, 2018 5:38 PM
> To: Jagdish Gediya <jagdish.gediya@nxp.com>
> Cc: linux-mtd@lists.infradead.org; Prabhakar Kushwaha
> <prabhakar.kushwaha@nxp.com>
> Subject: Re: Issue while oops and panic message logging to MTD partition
>=20
> Hi,
>=20
> On Tue, 15 May 2018 10:49:15 +0000
> Jagdish Gediya <jagdish.gediya@nxp.com> wrote:
>=20
> > Hi,
> >
> > Setup details:
> > Board - Freescale ls1046ardb(ARM64)
> > MTD device - nand(IFC)
> >
> > CONFIG_MTD_OOPS is enabled to collect oops and panic logs.
> > Added bootargs to collect logs : mtdoops.mtddev=3D3
> > mtdoops.record_size=3D16384
> >
> > Issue:
> > Kernel hangs during oops log collection in function :fsl_ifc_run_comman=
d".
> > Below is the code location where it hangs exactly,
> >
> > /*
> >  * execute IFC NAND command and wait for it to complete  */ static
> > void fsl_ifc_run_command(struct mtd_info *mtd)
> > {		.
> > 		.
> > 		.
> > 		.
> > 		.
> >
> >         /* wait for command complete flag or timeout */
> >         wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
> >                            msecs_to_jiffies(IFC_TIMEOUT_MSECS));
> >
> > 		.
> > 		.
> > 		.
> > 		.
> > }
> >
> > "wait_event_timeout" is the exact culrit where kernel hangs. As
> > panic(...) disables the local interrupt by calling local_irq_disable(),=
 It looks like
> behavior is expected because timer interrupts are disabled and because of=
 that
> "wait_event_timeout" hangs forever.
> >
> > The odd behaviour is sometimes "wait_event_timeout" does not hang. The
> > reason could be being a multicore processor, some other core would rece=
ive
> the timer interrupt and as a result "wait_event_timeout" gets unblocked.
> >
> > How the other driver accomplish the timer replated work if any during t=
he
> panic path or in general when local interrupts are disabled?
>=20
> MTD_OOPS is just a mess, and I'm sure most driver simply don't support it
> properly. If you still want to use the feature, you'll probably have to f=
allback to
> status polling instead of using wait_event_timeout().
> See what the core does here [1].
>=20
> Still, I'd recommend not using MTD_OOPS if possible, because I fear that'=
s not
> the only problem you'll face. One problem I see is that the locking is
> completely bypassed when ->panic_write() is called, and your
> ->cmdfunc() might be called while another operation is still in
> progress (PROGRAM, ERASE, READ...) in order to get the NAND status.
> Looking at the ifc code, it seems the driver is not ready to cope with th=
at.
>=20
> Regards,
>=20
> Boris
>=20
> [1]https://emea01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fe=
li
> xir.bootlin.com%2Flinux%2Fv4.17-
> rc5%2Fsource%2Fdrivers%2Fmtd%2Fnand%2Fraw%2Fnand_base.c%23L648&d
> ata=3D02%7C01%7Cjagdish.gediya%40nxp.com%7Ca4d8df1c44a44dfa4abd08d5b
> a5c7bac%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63661982875
> 7277666&sdata=3D9zGWTGKp8ILZJLu8QdRz5YdmHnxI2cxYN7iYQYtAX9k%3D&res
> erved=3D0
