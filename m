Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19BACC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANDm7XS68Og+WrbfbSRZQRSMbEap744Sc7hjREyc2HE=; b=UjwQXWTYZGJrOt
	XSz5gOSHOdPqWxNE+eZ/m1Vaw2xiz3eqw2YasBDxeQKye+wRTo8x0k6VgK/1pgo0I4Gml5U6Re+PE
	g0ImV+ygXsCG6CJjHB8ZF16C15nzrn/XskXg8EGzLZZ9WC1ZaAXfgPm04EPsoEchE+O34DdJMWmMd
	n8kTSiP+zpF6RZHBPzknLlewV42UDNF/us1c/OOiOfIVMNs3ZlQEhKFcgXL5Hu7cL9J2Uv3bp/GyV
	X83OHF/ZadBkEj4ph8j8t1vJ/P5YHswfKnxrCWHKRfOlGIDxxl64rg0/xyG8KvQCKIlW2pFK8BCkA
	uUDV0ctcktg7rI3ko41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuHr-0000000EsdN-3cN3;
	Wed, 14 Oct 2026 08:24:35 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuHp-0000000Escc-16P0
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 08:24:34 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dc1508191so481182f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966270; x=1792571070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XxdLcEY1thrJSIMPR8PdLXkd8KPKdgpsnyiFi+51MGw=;
        b=iZhjcA7OfuuSmk8k2XBhb/I0ItvdIJuDPUD4nYEwwMoe4wIEmDVyz2zb42Xy6wPP4l
         O8zEAH2m4IUUDOKk4+vz6SNZ1WaFjVxXft2BFxAkKecWSgHLyzjiT830wc8/zlXgrQ1E
         7VyHCgCvF7uAbvGNzo/z5FXwlz25dEjP5ARKrivUM9xhBOv48FhtxWE7vaCuEJORIxoW
         Sq0W4tukiYeT0g8qtts4DHsWvH5opkCivFgtBhfjZ+21v1h2yf/0peoN47l2F/WOaI8G
         dZeFRNFe8DFndNslaW4TLb7J3tWF1r0+hd6Wk9r9HC1vNgYEYycuz8SRGSMWiCI2QfZo
         hwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966270; x=1792571070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxdLcEY1thrJSIMPR8PdLXkd8KPKdgpsnyiFi+51MGw=;
        b=f0+sLVdIUsKA76PxNfZqOK8/xcO7UFlnjtwmy7xwT8YVsnA5JI3ioi5AkDe6tz6/QA
         XWPJDpGd11WuX4knDAkq/BIb3BzoR4JSafKNzLC1KOoL5kyFjQOChiYkgcTUXWm4gs60
         unHhvMEAJuNRTYD00gxMG0/bGplEDRg6EDp0fAu+5KJQA4Zb3J3pRQMGGJ3NR0YMQIf/
         KGc1IsA4Bda0sJQ0SAZOMjQEgGOgKABThgwBo7mJ+OrNGm8Mo3VdBRuGIlyhAp0pvR0x
         2T645sf4QEHKlVm5qq3Ss+WxXjycJ16oEHz3uPGN1Jjul5+RJa8bDb6nOQ/HKoX9IQ2n
         CNWA==
X-Forwarded-Encrypted: i=1; AKwUvBwUkcgvJ+l1XorIymDgZgoWS1qCF5SR2LEQGHxHY/fap1huy0n2vtQ8PwDm+jWMx7HStNUKODpWlUA=@lists.infradead.org
X-Gm-Message-State: AFq9FYIWRCnCb/cHt7ZhGjfcW5hOuZJK2Gv4cAPVapE0IQO9zkNbSdQo
	KHnle9+SJFKSz0mFAzrX8HJkIfECcqKCxN3J9MxWnWVI8Nk4zDh/+rYa
X-Gm-Gg: AYBFou3/Je/DQFMNRyQXQa4YTnVcNMerZ9KgKlgEwJdVEsYPqcfBdaxPMasfqnbOtM2
	NrjDvPzGpy9FXEJyRsLz2o7iR3WX8Hbi8S1Eb6cS8xVnXbfo2b7FabaVGHfKGa3aNWlv+xlZKat
	XM3n0BA+HNred5BDKMErbHrBBTgg6XL+9A1tjJUI97N8yh946Zfd2yCjUWODuJaxZ2rV7trK8Pm
	AuoMsvYuFIdatgKvTdTPr0q2cofL9PhIKSHrVlqi5ttGtpEko2g1GYe0IbplaofmlrypC97QxSH
	IDDsu3HiezhqpO7j0/mRJEOni6l4w+ddJuW/44WCRlQ0JdMzyz3s3XRd+yopiLuxi71pY/iN+RS
	8r2uLEBYCgnDMUq5CbMgW5N2GXBYldqvMevt70Tsa3mM5IPlXY4vveb17zUEhwiOI5bzfbrMAgH
	gZt5F9Mf7+VB5pOIBzrBB6yMhnEGyU9hvacHZwPxt6qQ8hL3UznEiMujh/cOi6jv+xuOtfbZIx+
	9OzgcToc0MkvOsZCcgWe22oL2R1ez1aZOd/JYHvyDh343yQoQGwPHSA9SqdV+IBoY8=
X-Received: by 2002:a05:6000:4312:b0:48c:45c1:5592 with SMTP id ffacd0b85a97d-48dba6f57ddmr28209823f8f.0.1791966270291;
        Wed, 14 Oct 2026 01:24:30 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm4122409f8f.53.2026.10.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:24:29 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	Manuel Lauss <manuel.lauss@googlemail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MTD: nand: Fix release_mem_region() size
Date: Wed, 14 Oct 2026 10:22:51 +0200
Message-ID: <20261014082258.33315-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_012433_314202_FE4A2AE9 
X-CRM114-Status: GOOD (  11.70  )
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

In au1550nd_probe(), request_mem_region() is called with size
resource_size(r), and release_mem_region() is called in the error path
with the same size. Howeve, in the cleanup function au1550nd_remove()
calls release_mem_region() with size 0x1000.

Change release size to match request.

Fixes: b67a1a02d463 ("MTD: nand: make au1550nd.c a platform_driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index f1e99197ab84..623a10dbce55 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -348,7 +348,7 @@ static void au1550nd_remove(struct platform_device *pdev)
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	iounmap(ctx->base);
-	release_mem_region(r->start, 0x1000);
+	release_mem_region(r->start, resource_size(r));
 	kfree(ctx);
 }
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
