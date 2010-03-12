Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nq1Bp-0005VU-9h
	for linux-mtd@lists.infradead.org; Fri, 12 Mar 2010 09:29:57 +0000
Received: from az33smr02.freescale.net (az33smr02.freescale.net [10.64.34.200])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	o2C9TnN6004012 for <linux-mtd@lists.infradead.org>;
	Fri, 12 Mar 2010 02:29:49 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id o2C9TpR1002834
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Mar 2010 03:29:52 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Subject: RE: MLC nand driver for linux
Date: Fri, 12 Mar 2010 17:29:47 +0800
Message-ID: <3D9B2D7685E0734592024DD0F3028AE6B2AEB6@zch01exm23.fsl.freescale.net>
In-Reply-To: <aecf5e531003120119rde30668o2827d2e6f638b149@mail.gmail.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com><0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com><62cbdcd91003041227i5af7e246u381e1bf7802a8cb@mail.gmail.com><0554BEF07D437848AF01B9C9B5F0BC5D9C10D43E@dlee01.ent.ti.com>
	<aecf5e531003120119rde30668o2827d2e6f638b149@mail.gmail.com>
From: "Liu Hui-R64343" <r64343@freescale.com>
To: "Sasa Sasa" <sasak.1983@gmail.com>, "Paulraj, Sandeep" <s-paulraj@ti.com>
Cc: linux-mtd@lists.infradead.org, massimo cirillo <maxcir@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Sasa Sasa
> Sent: 2010年3月12日 17:19
> To: Paulraj, Sandeep
> Cc: linux-mtd@lists.infradead.org; massimo cirillo
> Subject: Re: MLC nand driver for linux
> 
> Hi Paulraj,
> 
> Thanks for your help.
> 
> I am able to bring basic mlc nand. But have some queries:-
> 1) Right now I am using no ECC. Can we write same data to 
> same page without erasing it in mlc nand which is possible for SLC.
> i.e writing "cat file > /dev/mtd0"  will corrupt mlc nand 
> while writing it multiple times.
MLC nand flash does not support mulple program without erasing, which 
Is different with SLC(tipically, it can program 4 times without erasing)

> 
> 
> 2) In jffs2 data gets corrupted while mounting and remounting 
> it again. and got the following error
> JFFS2 notice: (542) read_dnode: wrong data CRC in data node at
> 0x02109184: read 0x419fcf65, calculated 0x6e3d71b3.
Did you safely umount it? Imean not do the power cut without umount it.

> 
> Do you have any idea that these issues might be related to 
> timing programming for mlc nand. or any specific changes 
> would be done in mlc nand driver?
> 
> Regards
> Sasa
> 
> On Fri, Mar 5, 2010 at 3:16 AM, Paulraj, Sandeep 
> <s-paulraj@ti.com> wrote:
> >
> >
> >> Hi,
> >> Sorry my earlier message was rejected because of suspicious header.
> >>
> >> Hi Paulraj,
> >> I'm interested in testing Numonyx MLC Nand devices.
> >> So, what kind of tests have you done with MLC NAND ?
> > The ones we get in mtd-utils
> >> File system level ?
> > We load jffs and yaffs2
> >> Driver level ?
> > We check if ECC correction actually takes place
> >> Have you modified in any part the nand_base.c file ?
> > No.
> >> And what kernel version ?
> > The latest 2.6.33.. I have been working on it since 2.6.28.
> >> thanks
> >>
> >
> >
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
