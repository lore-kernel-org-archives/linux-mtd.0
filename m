Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190eY3-0003O5-5f
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 10:28:47 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HCP00EGDMB300@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 11:28:16 +0200 (MEST)
Date: Wed, 02 Apr 2003 11:28:44 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200304010943.04279.asoneofus@nm.ru>
To: "A.L. Klyutchenya" <asoneofus@nm.ru>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <200304021228.44997.tglx@linutronix.de>
MIME-version: 1.0
References: <200304010207.14078.asoneofus@nm.ru>
 <20030401040736.0BA04406D@blood.actrix.co.nz>
 <200304010943.04279.asoneofus@nm.ru>
Content-type: text/plain; charset=koi8-r
Content-transfer-encoding: quoted-printable
Subject: Re: K9F5608U0B-YIB0000: 528 byte in page, or 512?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2003 13:02, A.L. Klyutchenya wrote:
> Dear sir,
> Thank you for quick answer.
>
> 1 =E1=D0=D2=C5=CC=D8 2003 07:36, Charles Manning =CE=C1=D0=C9=D3=C1=CC:
> > This is NAND flash. Do not try to treat it as NOR flash.
> > Use it with mtd/nand  and use YAFFS or JFFS2 file system.
>
> I want to write the first image, for booting system. I create
> this image (with kernel, MTD & Co). I have a possibility his
> write. Herewith: I have an physical access to page: size
> 256+256+16, and block on 32 pages. While NO MTD and NO kernel!
>
> > You must write NAND in whole pages, not on a per-byte basis.
>
> I understand that page it is necessary to write, but what bring
> the first image: chain on 512+512.... or 512+16 free + 512+16
> free...
>
> As even so write? :-) (to hrdware-level)
Please read http://linux-mtd.infraded.org/tech/nand.html

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
