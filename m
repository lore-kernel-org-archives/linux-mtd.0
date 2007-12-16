Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J3taJ-00075x-Ct
	for linux-mtd@lists.infradead.org; Sun, 16 Dec 2007 13:31:17 +0000
Received: from mgw-mx06.nokia.com (mgw-mx06.nokia.com [192.100.122.233])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	lBGCo8LE022648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2007 14:50:09 +0200
Subject: Re: [PATCH] [MTD] ROMBLOCK: Readonly Block Device Layer Over MTD
From: Artem Bityutskiy <dedekind@infradead.org>
To: Gregory CLEMENT <gclement00@gmail.com>
In-Reply-To: <47651028.5030506@gmail.com>
References: <47651028.5030506@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sun, 16 Dec 2007 14:45:40 +0200
Message-Id: <1197809140.25999.63.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Joern Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	Konstantin Baydarov <kbaidarov@dev.rtsoft.ru>,
	Vitaly Wool <vitalywool@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2007-12-16 at 12:46 +0100, Gregory CLEMENT wrote:
> I send this mail again as my previous patch was mangled, I hope that now=20
> I fixed it.
>=20
> Hi,
> I generated this patch for linux 2.6.24.rc5 and tested it with cramfs
> and squashfs file systems.
> As Konstantin Baydarov submit this patch first maybe it would be better
> than he sign this patch, but if he can't or don't want it, I don't mind
> sign it...
>=20
> >From 9a06e0c1818e4b27a04a8adac7eee551c8aac115 Mon Sep 17 00:00:00 2001
> From: Gregory CLEMENT <gclement00@gmail.com>
> Date: Wed, 12 Dec 2007 17:41:23 +0100
> Subject: [PATCH] [MTD] BLOCK_RO: Readonly Block Device Layer Over MTD
>=20
> Description:
> The following patch adds readonly block device layer over mtd
> that allows to use any filesystem on this device in RO mode and thus
> gain faster mount times and better throughput rates.
> It allows to put one RO filesystem into NAND using a bad-block aware
> program initially, and mount it.  But be aware, it doesn't handle run-
> time bit flips or errors (even if this event seems pretty rare).
>=20
> How it works:
> Blocks translation routine was added to read sector function. Assuming
> that bad block won't appear during MTD reading and BBT is correct, bad
> block is skipped and requested block is lazily mapped to good one.
> Block driver based on the mtd readonly device driver mtdblock_ro.c and
> translation routine was taken from the patch of Pantelis Antoniou
> (which can be found at
> http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html).
> This patch was originally submit by Konstantin Baydarov, but never
> included nor rejected ( see
> http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835.html)=
.
>=20
> Signed-off-by: Gregory CLEMENT <gclement00@gmail.com>

For me this amount of mtdblock drivers looks strange. We have 2 already,
and this is the third.=20

If you really cannot modify mtdblock_ro, then I'd kindly ask you to also
write a good explanation: what are all those mtdblock/rombolck, what is
the difference, why we need so many of them. Then I would put your text
to the MTD web site.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
