Received: from wx-out-0506.google.com ([66.249.82.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IusQw-0005dR-5Z
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 11:28:23 -0500
Received: by wx-out-0506.google.com with SMTP id s7so810458wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 08:28:07 -0800 (PST)
Message-ID: <305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
Date: Wed, 21 Nov 2007 17:28:05 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121160804.GC20871@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2007/11/21, J=F6rn Engel <joern@logfs.org>:
> On Wed, 21 November 2007 15:27:19 +0100, Gregory CLEMENT wrote:
> >
> > I come back with my question because it seems that last time I sent
> > this mail mtd mailing list was done during few weeks, so maybe  this
> > mail was lost.
>
> What problem does the driver solve?
It allow  to use cramfs/squashfs/fat in read-only on NAND flash for
embedded systems.
As far as I know, there is nothing to do it now in kernel: i.e. simply
managae badblock for read-only filesysteme.

PS: the patch don't apply on 2.6.23 kernel, I fixed it and I am
testing it before sending a updated patch.

>  Why don't any of the existing
> drivers solve it?
>
> J=F6rn
>
> --
> /* Keep these two variables together */
> int bar;
>


--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
