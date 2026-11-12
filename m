Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAB1606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E5x2q5VQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ldLlfNo1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZs+aEsW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DKyrv9Wig+2d6TDBAWB23jPrPyfIxhWEd6WKs1s2RzU=; b=E5x2q5VQyCc4g00dr5Kc2wFFkG
	1GufnVtqRAeI63nBcp0M40Dmtdl8H5fuK39qYjzTNNiuv6L0oiz77WInZbXn1U+rN7X43tHRJ+a/L
	+N2qljGOh78baHf1DX5u3wkbjZpFY/Xw5tCaTaFtcnBNgHcjRpkzzKWP6gKKSx5ZKPU8oywAsSRjC
	ieo5ZJpPcT7KCB4zWUf2Fr8njscfRXhHI9F8nB5BP7FYwy75lvELDnvXo0dRm8XH6AhC9cLmHTw4x
	82TJoaqKDQQVCAtYr0YmzhSVJYgQWkosC4MLo7DY/VoY1zUUquRyyMGr/4v+tgomzBVKJE7hXDb9+
	9rVId6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdy-00000008OUt-21NQ;
	Thu, 12 Nov 2026 01:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdI-00000008N3Q-12fP
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=; b=ldLlfNo1OejUJ/N6+g24ixHzwp
	OIRyhYxI1FWEWqHZtcvfDCiQD9QwzBCIxyTWJRdMJj/aqUTnMHJAw7mstW2TNMhgqdolZII7pg98u
	96bQTsBqU+AqzrBvJEeS7Yk/CjliNsQ+i/BUWY3rEYuU+h7qxZaKVCIzocGiMD18cSMg1NX92ZAME
	nMaITEgASUZ7JPO3iLbbXZO5v0M4XYI89xIZD4TUo52LOrhrM5D0Pc3RTLwuf7WA3vtPDEDkbhb3g
	FUng4+O2zSsoy2TiQ2wzVHlVDnKVwU31wU59tt5Rq97NJyzupZiXEKQPFHnJ5xvN8kBtZhFHz5X55
	LBmavnAA==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd1-00000009mxN-2hEK
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:31 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-843b6f8e2c7so3946143a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446965; x=1795051765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=CZs+aEsWcx/XY1nDuWDhhPXgtRLVk5s8TcgnYOK2Xx6a/F8dANBym+CN8+wbyH/SWs
         avwz9AiIXeqTh4bSnItAiKNc4TKxlm8wj9pFZpitidSrKgHR8IwG8dUl/XRXwqLPI0uE
         6M9zpT/TuDM1OKtZlV6koMyAjZVbL4uxgIu8MrPucFY9+zksukQZhKpL7d1Hu5MPHP04
         o/4YqMr3NgWE+pPg1m3gnUQxCS963SNlPYtNXqSWEHnNS7HekeDQvElo9AcefhjX3Vrf
         aRcbdbuurndh75Bt+R+QjXyVS0TkuCPVJtXas9BmxFUwNoiE4BphEwoOnE3Dmi5W63di
         Holg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446965; x=1795051765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzoPIqBa9k2I9QI6NU/CHmPt/04WBehyiDuNsGP1QHg=;
        b=DDJU3Lkzbe/3TALdWiQtQoIzuWvmvWhdi1eaG/8ebaO8wIuApHpcEmEncXjhADVjJD
         TQFuB+ZzkYxcvxSMajMNikrcu8vkwkhD5Bz+VYO85dnCD2AZ2HdfEzHeFtBPZ3yrkeiV
         P46nUX6VNl2wB4UYp7TwlLm1ECJdehYe8+ocUwQtOmrkgUduTHOVi8W9WRJ99DmC2Aw3
         j2Y85rAwwSunrOFNceou1ShoTS2rvay17FLOFuKgxycPFq7puY0Kcg5IEr21vqJRW7iL
         hRJSgdKOEDATZOiHRIiqVS1lwpZiPh4HW2J0Us4T3NnpUrqhErphUFzuVnnty4ya7T1J
         L+Pg==
X-Gm-Message-State: APuU4Z+xv/RPC4s1N3soaL+ZNTG6y5qEhk36x+F857SIFW86GUu7n16w
	3Bm8FCrUaeg4NfSEWLXFhai79Ohj/nWeSH/tosT2i96WYAS7+X2oRaOB
X-Gm-Gg: AYBFou3ifxnge29NGgJc0h+ByZXa08q18R04qYZzUPdhYLZQ4yILhRvzzbpnhl4aogE
	xrqFWPMnGtt6GGCcGocJ1JF6apliNS0vkNeP1AOY8wRWNvatung0BB/x4J0hGhmIQrb+wLmEKjR
	K4GnOYbnIgjxiemjV2SUaZ7+45zh8BwkzFnMFtdXt0do9mm8SjkGGk13P6MMBhteF+9OqK1SZpa
	JOvOpCIy54Nz9ALSG9p9KwlPft9PRHlsEXDLXHVshvh38XwJZFjM8PlVTbyGLQSHVIkfTImuBlG
	xutGOgqVHRMCKdcLseNLq6pzQKCXUKEjpBIZM6gkfu9ZHADk/yEePoXY6PBWdU7c/tFKrHn8tRe
	hRMwTfBlskBoH4+6QZdFOvMwwgq/aRvNuLdYQXCGDTA1Q+JUyNB/Brae316WRLcxzfck19t28eC
	GAJ3MuDzbhg+ZbgSxzk8GUxamRRmOZCR2Y1z2eOeNds0fv9eLC3AVAaO3u0GMe0iRmFSOA+1NTI
	AoX0b7hz8q98DXeqOygbKJRsvgVNa9dWCt1O15F3gKLWNzEuqP395djnlQLNDUfGLvbv/SvPFPg
	KhlmxpsursoGTakRs3EYQ2DWXcyAuYUkdSR5uJaoRLIFD1AC7YnanFtAMKPSFTomw7CgmC3qvS7
	qmUBtddyNFZEeP2YD9lmvmwpP+rmRSqWr+rTjZOOTturvvfCjHE/WUBbYGe8w/RNAffUol01LRq
	mroC/4qRwJl1XoVlMgFNBTmAWQeT3p2fVB09hZvfrGVUNcM+UyG4wT
X-Received: by 2002:a05:6808:c123:b0:4f4:b62c:a3d8 with SMTP id 5614622812f47-56b9751ceebmr4316576b6e.33.1794446960103;
        Wed, 11 Nov 2026 17:29:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:26 -0700
Subject: [PATCH v3 47/58] mtd: rawnand: lpc32xx_mlc: retain chip state
 across removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-47-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012928_402235_77D0FAD0 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drain chip operations before releasing interrupts, DMA and controller
resources. Retain the embedded NAND chip and controller until the final
MTD reference releases their metadata.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: linux-arm-kernel@lists.infradead.org
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_mlc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_mlc.c b/drivers/mtd/nand/raw/lpc32xx_mlc.c
index 408b2aba2fdd..633d09471760 100644
--- a/drivers/mtd/nand/raw/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_mlc.c
@@ -687,9 +687,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	nand_chip = &host->nand_chip;
+	nand_chip->controller = &nand_chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, nand_chip->controller, host);
+	if (res)
+		return res;
 
 	host->pdev = pdev;
 
@@ -794,10 +799,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	mtd->name = DRV_NAME;
 
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_lifetime(nand_chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto free_irq;
+	}
 
 	return 0;
 
@@ -830,7 +841,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	free_irq(host->irq, host);
 	if (use_dma)
@@ -841,6 +852,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	lpc32xx_wp_enable(host);
 	gpiod_put(host->wp_gpio);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
