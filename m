Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKPxs-00081b-1I
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 07:05:40 +0000
Received: by gyh20 with SMTP id 20so505470gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 00:05:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
References: <BANLkTi=e1mUTX4X7ui+HVCGh=sZ=HLoNCw@mail.gmail.com>
	<20110511183322.da0739c9.akpm@linux-foundation.org>
	<BANLkTikrqzpU8qZ5FUgG4HaBgZAvmbOHrQ@mail.gmail.com>
Date: Thu, 12 May 2011 02:05:37 -0500
Message-ID: <BANLkTinGFDHj4s6nAXMiq8dYW_UO6W+YXg@mail.gmail.com>
Subject: Re: Bug in MTD NAND ONFI chipsize detection
From: Nitin Garg <nitingarg98@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is the tested patch, pls apply.

>From 1a73f1c3d066a491d0c806883788ab9abdc736f3 Mon Sep 17 00:00:00 2001
From: Nitin Garg <nitingarg98@gmail.com>
Date: Thu, 12 May 2011 01:31:53 -0500
Subject: [PATCH] Fix ONFI NAND flash size detection by using number of
Logical Units in device

Signed-off-by: Nitin Garg <nitingarg98@gmail.com>
---
=A0drivers/mtd/nand/nand_base.c | =A0 =A02 +-
=A01 files changed, 1 insertions(+), 1 deletions(-)
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..cdf6015 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2892,7 +2892,7 @@ static int nand_flash_detect_onfi(struct
mtd_info *mtd, struct nand_chip *chip,
=A0 =A0 =A0 =A0mtd->writesize =3D le32_to_cpu(p->byte_per_page);
=A0 =A0 =A0 =A0mtd->erasesize =3D le32_to_cpu(p->pages_per_block) * mtd->wr=
itesize;
=A0 =A0 =A0 =A0mtd->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
- =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
mtd->erasesize;
+ =A0 =A0 =A0 chip->chipsize =3D (uint64_t)le32_to_cpu(p->blocks_per_lun) *
le32_to_cpu(p->lun_count) * mtd->erasesize;
=A0 =A0 =A0 =A0busw =3D 0;
=A0 =A0 =A0 =A0if (le16_to_cpu(p->features) & 1)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busw =3D NAND_BUSWIDTH_16;
--
1.5.5.6
