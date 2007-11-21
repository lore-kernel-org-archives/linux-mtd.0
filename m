Received: from nz-out-0506.google.com ([64.233.162.227])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IutRY-0007cA-9B
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 12:33:02 -0500
Received: by nz-out-0506.google.com with SMTP id z3so1891389nzf
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 09:32:53 -0800 (PST)
Message-ID: <305035a40711210932r587b60e0u5d83cc382991e4b2@mail.gmail.com>
Date: Wed, 21 Nov 2007 18:32:49 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121171501.GE20871@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<20071121171501.GE20871@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2007/11/21, J=F6rn Engel <joern@logfs.org>:
> On Wed, 21 November 2007 10:58:17 -0600, Josh Boyer wrote:
> > > 2007/11/21, J=F6rn Engel <joern@logfs.org>:
> > > >
> > > > What problem does the driver solve?
> > > It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
> > > embedded systems.
> >
> > Not really.  It allows you to put one of those filesystems into
> > NAND using a bad-block aware program initially, and mount it.  It
> > doesn't handle run-time bit flips or errors from what I can see.
>
> Whether that is necessary I cannot tell.  Maybe some people have
> hardware where this isn't an issue.
>
> But why yet another mtdblock driver?  Is there a reason not to add the
> required bits to mtdblock_ro.c?

See the original thread for this:
it started here:
http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835.html

and the question of a new driver was first discussed here:
http://lists.infradead.org/pipermail/linux-mtd/2006-November/016844.html

> J=F6rn
>
> --
> Correctness comes second.
> Features come third.
> Performance comes last.
> Maintainability is easily forgotten.
>


--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
