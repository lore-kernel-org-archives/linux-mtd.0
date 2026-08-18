Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB04FC5DF7E
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 11:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5LQeyVwOaNXQxAhNQ2eNrvwoti+OIDA20zbZ6p4TyQ=; b=RFGXdETitEt6fw
	/7MyRyXyJmbZ137YIHDo6KUeDp0yknkj2o5KvNqloZH60GUzIf07G6Tqi0628lk8gKtHzMeAEUmJP
	xVQw+mOZ9tqr4Q2WRHndb8ljlEPAFteLfgP+0WdA3mJBXTMFsZTS/osp1F7TFgCGULoS38E2/FdOL
	thccacNEuT2Zxg5KCubO3pkWU4/m7EyexN33sMBPNgEBi+02NG+NRcQpGggJ3taga2CimiZth6hlh
	CiOmwC1SAw/Tl+w3TAi9sDx50cv7D57c2OZhUi/3QDnKMwMMB4VsUUoDLEmmI7QG6dORUVqZOFevV
	J3Zn4XQqtp/OGv9Gw7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwID8-00000007rn2-1O8N;
	Tue, 18 Aug 2026 11:42:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwID6-00000007rm5-0UV5
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 11:42:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-481412f1828so1518320f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787053346; x=1787658146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0Lkar/FZUF71jSh3gVWEuj9Qdc3ucoRXfitsWLZ7XY=;
        b=g8E6ePrijIpWmEcQAry7UfndwsJq2czIsOkbVm2l8d/iVWX9f9/HEsmkrSb+j07yEu
         Pnz5Y3oBP280Q3ife7Zt+8qx3+3aZp+64KXxw4PjLy6ZfN0JCew2dcE1jSpZyQb2XmuO
         kD7bPVCI66LdqvGWYvjcUSd6GgSALLn8MWey1oRuw6ucopQJaAY/qBm4q4M/NF+Nonjo
         8+dy63Lddt2U7eGR+y9O3kNE756nz3xK9trps9mkFnDUF+wOzNp+O+XYx/ZQRIF0B8lj
         mLidbHIp2GTOtvXrMt1WT1dj7glJvTr/9dUGIohbrea+Cf/ldNvCdLUy702Kb5oo4u5A
         ExJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787053346; x=1787658146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C0Lkar/FZUF71jSh3gVWEuj9Qdc3ucoRXfitsWLZ7XY=;
        b=fLVqulxuitdFbi7WZhZuap5ctDjrTno/oUtUxnNsTM6ghH+dov7Hs+sCFV7eGUXEkS
         VqKK464bhmRoaiU3Nx47hjh1GROpBbgUSdqJc9ajq6+yrIzDzpdSODRPULSRCvHBthPa
         jHMEp7WDwYLXYeN3AhksxMb4pCNqDF9C7/6d9GhMlt1/d2aXnJg2s5tzwlRagni6S4CJ
         ZyLD5Vq+IR3SgtpLiYnAg1kOUloz7mCG/ac1GUmA5XYEzipKMWCmaCQUIMDBQ49twJkC
         Cwm8t5nVvPQGewx6RWY1Wt8maXVBewf1u4DKUyy0x/zZMyclgc5vhuqUBZrOF3+71GIV
         xdqQ==
X-Forwarded-Encrypted: i=1; AHgh+RohVicT6IInSu8QUhehvwqF+WHLfP8ZHYJDp0bnQJPORIhphsG3fh+PfNd8le7tskmwHtnFWnd8vas=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQB2Gj2LSp0etX9pGoZU04GQyVpnbkQHd6s6N2xOTJYCSEUyoU
	Sf9e9/HjBkpvaHPaRlWXtK8jbW5qobCZnkov+g9HFeUJR/ptnhT8LLdF
X-Gm-Gg: AR+sD12MQVrnzjQwG606UlWvMi5vGNsvpKeqTu2P4m/Xl1sPoY6z5MCkKJ7LPpIhOmT
	4LmbqiSNOk+vg+v/Le9wdwRjJshq2AGTjTO/OZymJHD8UwFV9h06o47Jy1F2obiD1YdtlSgW/3t
	+BVLB5YQ9NaHqHGxB2rQ0CK4TM3jo6OQrQc7O3pzStTVjAx5V2zqu3NZGLZZQLZ+mx8t6rszVyq
	AZE3kWS6omTnLIjDjB/oJh1lA+kDIC9PE8W5gwIGFWQl2VceoFWtKk5pGw2y3Lz/SMIj05y0CZu
	/x7b3NPTYBhzayiCAKNi604cA0bY6Xo6RBTh76uP3AmTxC8nn42URnFX5PNTt9Y/G3WQtjCACy6
	pA4L9ksR5bgEcV2dE5ol7WJ03y/fR4aZVdMXDo9RY9djcizfFcpM5ov5UHXLP1go+n9uwHd65oX
	lREuJiLG8m9N82NDRjsZrRZq2Oc4LJAl8qPFD1YBGjzwzMjQbHx/S8mVlUSBCsevKDWg==
X-Received: by 2002:a05:6000:290e:b0:47f:776f:3838 with SMTP id ffacd0b85a97d-481606f682dmr48887208f8f.6.1787053331518;
        Tue, 18 Aug 2026 04:42:11 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998780397esm28680785e9.3.2026.08.18.04.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 04:42:11 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Edward Karpicz <webmaster@toradex.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Tue, 18 Aug 2026 13:42:07 +0200
Message-ID: <20260818114208.2780311-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260818114208.2780311-1-mehmet.fide@gmail.com>
References: <20260818114208.2780311-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_044228_183124_EA671333 
X-CRM114-Status: GOOD (  18.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The driver only implements the 64-byte OOB layout, so attach_chip()
shrinks mtd->oobsize when the chip provides more. That clamp does not
survive: nand_scan_tail() runs nanddev_init() after ->attach_chip(), and
it restores mtd->oobsize from the memory organization, which still holds
the value detected from the chip.

The driver therefore transfers writesize + the chip's full OOB size, so
the hardware ECC parity ends up at a different offset than the layout the
controller was set up for, and every ECC-protected read fails with
-EBADMSG.

Measured on a Colibri VF61 (MX30LF4G28AC, 2048-byte pages, 112 bytes of
OOB): with the clamp lost, UBI cannot read the erase counter headers of
the pages U-Boot has just written, and the on-flash bad block table
written by an older kernel reads back with ECC errors, so the board does
not boot. Kernels before commit a7ab085d7c16 ("mtd: rawnand: Initialize
the nand_device object") are not affected because nothing overwrote the
clamp there, which is why the same chip works with a v4.4 kernel and
with U-Boot, whose copy of this driver has no memory organization to
restore the value from. Edward Karpicz reported that the clamp no longer
takes effect on this chip; see the link below.

Clamp the memory organization as well so the driver's 64-byte layout
stays in effect, and log the truncation once, as it decides which
on-flash layout the system uses.

Reported-by: Edward Karpicz <webmaster@toradex.com>
Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 9940681810cf..f27ef2b0884d 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -771,8 +771,14 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
 	}
 
 	/* Only 64 byte ECC layouts known */
-	if (mtd->oobsize > 64)
+	if (mtd->oobsize > 64) {
+		dev_info(nfc->dev,
+			 "using 64 of %d OOB bytes, ECC layout is unchanged\n",
+			 mtd->oobsize);
 		mtd->oobsize = 64;
+		/* nand_scan_tail() restores mtd->oobsize from the memorg */
+		nanddev_get_memorg(&chip->base)->oobsize = 64;
+	}
 
 	/* Use default large page ECC layout defined in NAND core */
 	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
