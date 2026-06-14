Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F711CD98D2
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2026 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kFoiPAT2wZt+PbJO6yAwCBV+fRKXeEY59sZrvlgv8G0=; b=ikZyPXADpJsdxy
	N2CP1Yn9Ylwx1qhz8FFLOSxapvUhQ0rVRCSfGdswLgnh1tIfo+IQuSBJcyk2FbqQTGuQ4+aO2TzJ6
	9+mwinIsFKJ70qAOmX6nsDiF+Z0cLnoqoKVdHN4t+UI51OTAxN6wYgUUBkju1bOHaxhOTAbXlAes4
	DPvxbbTEdqND7XNsxuljPiM82bQWjhXU41IcSa1Dullh7EoZh1E7aomAm2LCBP37qYk0+4vzifkj2
	PfSIUNkGjqPUUFCmdr2reFVLzH7v4XMagCSc+x031iYZeyd2zABY+qAMy0mSr7Q4cDpDJ6ZS2yIsR
	gn52+U5J/8ETVPoYXSnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYeOF-0000000Cmoh-1mLs;
	Sun, 14 Jun 2026 06:32:15 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYeOC-0000000CmoK-1RSz
	for linux-mtd@lists.infradead.org;
	Sun, 14 Jun 2026 06:32:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so968480a12.3
        for <linux-mtd@lists.infradead.org>; Sat, 13 Jun 2026 23:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781418730; x=1782023530; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6uJ4C/N63XZ6QChWU9F0voZA7psF+7ng/LdBC6H6EVE=;
        b=Qt53Q+DfKyv1X7AuEAuT7032Mk23nQZXR4EQnviCIeiZnHtntt8FD9VCkhUvGDleWR
         i453Gfbn3iT4ey9FOv/41ZnfWN2MGvqQTh4fchxn57RDXGImAZQ/EaVbOxmLQ3G18akt
         wbxEuW1lF2mcGoe0VN5cTFH6RHb1/81x/E4XearEbyfaH2MKRrPU7WWF1rxvmIG5rJ0j
         I4y9ISqBC7FZtPuMkF14bXFX/7O3b+CxTdluTgVXBuum9d9hy9ISiKNpi2KJ+3hCbiPO
         1ScO8vGM0gDuBBGm0qzU2hp1+4TOsbyi5/dp+D6/nxYgWKPEg0eN3b20+uvRVLWL3XoO
         bUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781418730; x=1782023530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uJ4C/N63XZ6QChWU9F0voZA7psF+7ng/LdBC6H6EVE=;
        b=Lz8vgWEK4KEjX1gSKWC6+tWLGhVN0sqamHqeL8bZFsCCplBc73NvfwTPk3qe3VaxBk
         FiOpchqUSj357Rge6o2M0N3mqBEqQr0PLTv2XtV8dik5nSlqlgzpQ2TpZMKKuhnxy2hv
         EW/ZpWUGZNPW3n2w7BFA61ox/QQZgIIdrTvuI2yeudC14toIM/6iEJEZMSQdsnzPPcrl
         kE7ES3q8NZ3zmdLmSAaDIoez6kU7ICPFfvxPCsMQsVPynR6peRb0YUTCklT5CBJ6Z7oD
         uLsKKNh+rTAXOEJv5hWlOXNY3Y3mS/YBeVj7KgEQmhWFSMuohANG7Ce+SjzzJMu8FHLe
         djBg==
X-Gm-Message-State: AOJu0YyHOe2+QgPi/TcORdVTiRIeq8itXNGy5kjVg5/lF65Ed5n9e+2x
	tDYtQDKMc+onvInJRdZWZNoVovO/ToqqI3XSxiV7d95Bt2CoEO6TSvid6v6biQ==
X-Gm-Gg: Acq92OFEm+0wT54C1XzwhDc6GgSIpIWlkrKYob6QwpcgJ1k0sht7ikiIHn1UCoaPB+Y
	CaK/dczifJp/cBfhMm92Hdev46xIDzHTSDelEHUDaBx7s2YPg2YKKmk7B1QhaeR6OPmfMd2eYGb
	EOTVrVx2lbB/qnmO3JhQMAvQFD9/Cf7207XuWnXt3Tci88c4YboaZmH0bC29RzpDBDunpBUBj/W
	Rpw1WViq2NnX1GSxk0W/nE1oklmHwazEmyWdz3on90cFHMpFnqOO7bMhvSOnyA1OUYxoY0zyWdo
	5DGjTZWJsrp5+IB8tJ1LXHBsXsRxZliBDJonWOXnPdZTPgSzbUhGOZQHRlA6TfQ8+Q56iUxJEYT
	IBzpqC7xKkR7fzL55vg7B2zJTS0+qAvyJadMOlJ39pbBh+Kf8vwFNAe6VMCJg0utcg8R4bARaTe
	+mPvhaEy2RQ8TOw2Mhkk+yB/xhcBAFARHj22mo5YBHxF/eErAyUClv97HBG0mP3M/IklEQ1e/CY
	BElH1sU2344+sFHWBAQ+s5ErjdoVl5xUvQ=
X-Received: by 2002:a05:6300:218c:b0:3b4:7c33:296c with SMTP id adf61e73a8af0-3b79644cf8emr6017077637.45.1781418730281;
        Sat, 13 Jun 2026 23:32:10 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:6e63:e53e:e773:8f84])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8663164a0fsm5680721a12.8.2026.06.13.23.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 23:32:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: ndfc: fix gcc uninitialized var
Date: Sat, 13 Jun 2026 23:31:52 -0700
Message-ID: <20260614063152.1522268-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_233212_386670_4789545A 
X-CRM114-Status: GOOD (  11.40  )
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

Now that this can be built with COMPILE_TEST, an unassigned variable was
found. Set to 0 to fix the W=1 error under GCC.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606141301.iyVdFgl7-lkp@intel.com/
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index a937ca3eeff5..a48274297d3b 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -188,7 +188,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int err, len;
+	int err, len = 0;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
