Received: from wx-out-0506.google.com ([66.249.82.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IuyIH-0001Tz-No
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 17:43:47 -0500
Received: by wx-out-0506.google.com with SMTP id s7so918569wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 14:43:38 -0800 (PST)
Message-ID: <305035a40711211433x9054a11r11636ad708a325cd@mail.gmail.com>
Date: Wed, 21 Nov 2007 23:33:38 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121213257.GI20871@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<Pine.LNX.4.64.0711212145070.24710@lnxricardw.se.axis.com>
	<20071121213257.GI20871@lazybastard.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2007/11/21, J=F6rn Engel <joern@logfs.org>:
> On Wed, 21 November 2007 21:46:16 +0100, Ricard Wanderlof wrote:
> > On Wed, 21 Nov 2007, Josh Boyer wrote:
> >
> > > > > What problem does the driver solve?
> > > > It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> > > > embedded systems.
> > >
> > > Not really.  It allows you to put one of those filesystems into
> > > NAND using a bad-block aware program initially, and mount it.  It
> > > doesn't handle run-time bit flips or errors from what I can see.
> >
> > Won't ECC take care of spurious bit flips?
>
> Single-bit, yes.  Once you accumulated a bunch of them in proximity, it
> may no longer work.

That's mean that we can't have safe data on NAND flash device, isn't it?
If data is corrupted between tow read even journalized are log file
system will loose data.
Either there is a mechanism I missed in this file system or 2 bits
flipped are so rare that this event can be ignored.

--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
