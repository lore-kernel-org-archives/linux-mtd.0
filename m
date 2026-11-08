Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BCA606A321
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N22VW+Ud;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VY1KNamq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pLzbbD5v3ouvYeTR9YOPlJ5ej+xjZWNsl+eFM1aYXSs=; b=N22VW+UdzZWiRJaT3KXUO/xgZe
	N6XSaTCcy0kFRE5jUZFlli/45pmkFBIlVdIeBblNuV+FNMJQBbrfW3aueu2SIbd41PJOOYzhitEnP
	JOUILSLDM9AoX7bhZ8FClmMYRAUNxodbMnvCa+l5CQDUKxrY1bYMbGJH94qp5hn0n8Jl3d9D5XN0r
	9Ou8iQRevaeCzKCeK2uujL0YBhzF625/+CGfAqCUd87Fs+3RYXTceZ2iN7j6o/9WKCLSpq6nEfXZE
	Tdf/QBhjr90HywgTKofWaRjJw3j2cbp8joa/RZvrcdQPDLOpL4CtB8RST2Sw1xdanCurlk3IJjxv3
	apAneLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAAx-0000000Gggl-1hIZ;
	Sun, 08 Nov 2026 21:11:43 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAAu-0000000GggH-3AlV
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:11:42 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-702dedeb70dso127673eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172299; x=1794777099; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/tM7Th5heSIu0EjehKmDLLPeUVpt5UbMkUrc5jBJaHc=;
        b=VY1KNamqDr7uQEkXhqQafn4a8lKanW0YqdqTwEm9gCUEGn3MuIPOpnzVWFU82PHtJ7
         2p7f9utKdxLVmv+kUWupXGmyYC5bPcwoJfmgy01JauQqfv12aX+hoBJdqc0VYWVBVFwN
         kM1us9ZOVPENGv+gpfzPtsHkFWWrXEXlgFayrVx8k/tvZEYyrAwew/tIZj2STSh5HZ6S
         PSvVL0p6foTzoHmlZoQAhBtdBh1yzOwRfxM06xaoUPgo8tyP1dG94U1Xt69Msp/RS6mZ
         xijImdkv2uhl5+v51jtD1jUoPaKdLzhCFX9N7krRDCQvqSSEInmpvRF+cLpFk9Hme8gm
         4IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172299; x=1794777099;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/tM7Th5heSIu0EjehKmDLLPeUVpt5UbMkUrc5jBJaHc=;
        b=lgeAhagaUCTQprmoEBeVAMRvlxJ5fFtu8HlioXTtDqFCU6wjJk0rX77AUSti6eZzAj
         NHhad7PRrlx/vrpXfXx9/YId9K9JXuqH66aMXtXgNaBJj6ZDzk5Y4TIhJLnIxsMY5s84
         7kgiMLaEmDjprtvxTMTLtD2blS9Sh1dgQRFwmoOZbwvMaKiQz9+ykCo2PGbW0Dv3ImIr
         WlEKMlRVeNzzMj8kRFV+XVcBeXUlmtFGtj4HUOymxlj8ryTscQoTmkuTD/f/rjf6e/SX
         qCvt4Iu4QDayv9Fvcr3oiYUJUUH2qTbOCuix1z+Hsl8tvejX9C/az2Zen7YPTeS42PC1
         yATQ==
X-Gm-Message-State: APuU4Z9XqQeOCPWETfpGjTBRws8nMNyp2DPCwNJ1hPDAH/Q50nyQcS2T
	8KRcmrvQGXsKVcVsbMMJ4xX7wYK3VeurNQxH5xkAiGFs0YJzHd+RxFb1
X-Gm-Gg: AYBFou2JAOo37dAbEt4/62TEpOJDDRR1vxxx1xxAt6bMd+3vsE8skZIQf3TldXAkw7k
	WoQvP3d+3thcoxBGxas/R5KXxNN9KqLez9nIo4sTwoqS5ad3W1OQPOgbdYKzsCGMfgTlGg0YmPj
	tBJPakrQmjIuPC/kOgURmriRkwrt0T4ylNHFP/uxrnjpr74yotLZ7KHqdF/iOAPzhyB+mRIHmeJ
	dCUohTTIifXJRL/+AyB1I88CUtDrjnmPhQ/nVHpxohKENpSla4pjvT9XAOC1cxV7/cYKRlVePaV
	sG9fPg3BaoB9UntbW82tLEDI4iqITAYXmFxg42XIEfh5lB6cmcFG+wI6LMqvCTByBEKGv1PYNFm
	GHLZLg8mJotbzTsqPRpaM7YyMMC5Pac9I0Bc9AQ2jHESVxdyC58qFC4+Pt8CcEDm7fZS0MFlaSY
	ltwHkJr/YtJctWrbGq/xd5SA7c/SmMEqHb2SGkuDP1/BhnA9ATUbLHDCgFOdsOdZTklfWA2Jsw6
	dh60iRGtAcXagptYFjd79lrJJr9+si79GoTiOSqIZJWrJPTI9esw/gHqPJ4+YK/uVsGVkXHSe6F
	bnz6FaspQYdvslFQavhbJsfKsymSnoIKPcF8NzL049zxp1Xm8KBLFx4BGEIfUaXku0QjxlNbi53
	xeTMMBI5UTFQiftMU4zeM1HD+snjeYMmiYgWXqGNDszZQNCqw4cK/YnOjq+obKHn3W8Q6IVBnQr
	No7J0zKxkLsf+3HHeLhIJabeA+fOkGCTus3u+5sFwF0lY1YSy/5qw=
X-Received: by 2002:a05:6820:c2cc:20b0:716:d70f:1c1c with SMTP id 006d021491bc7-7170f30f0e9mr760112eaf.90.1794172299437;
        Sun, 08 Nov 2026 13:11:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f5e1e93sm1970733eaf.0.2026.11.08.13.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:11:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:11:37 -0700
Subject: [PATCH] mtd: leave the device type unset when naming fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQrCMBCEX6Xs2cUmBQ2+injIz9aukCibGJTSd
 zexhzl8w8y3QiZhynAZVhCqnPmZGqjDAH6x6U7IoTHoUZ+UGg3mt4tcMJaAgWqykVCoyBerwmk
 +e6cpmNFM0AwvoZk/f/v1tnO7P8iXruwLZzOhE5v80qtmPfbsr237ARH9KoSfAAAA
X-Change-ID: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131140_810933_8E050B64 
X-CRM114-Status: GOOD (  12.31  )
X-Spam-Score: -1.9 (-)
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

add_mtd_device() uses dev.type to reject a second registration of the
same MTD. It sets that field before dev_set_name(), but the failure path
for the name allocation leaves it set even though no device was
registered. Retrying registration then warns and fails with -EEXIST.

Set the type only after naming succeeds. The later registration error
paths already clear it before releasing the device.

Fixes: fa06052d637b ("mtd: Convert to dynamically allocated bdi infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..4f62a13dc481 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -798,12 +798,12 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.type = &mtd_devtype;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
