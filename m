Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453C4606C634
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsM2M/wO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mLNUl6fn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N5iPPE1t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5V1Bw4vNiYvJ8N6LPPI7loSGlJaNmRKnuS41dA3FHKs=; b=RsM2M/wOG3+OOpPl51iDZ4L2Oc
	pQMLGJ0ALjKzbesq0uyVp1OLWhJ3dj+bIOz71HpPdI5wL6IjXtYobzLMrBfjOhaEpyEd8WZoo7ZHB
	a9DgxrjdkHdzaPltjWwLJVccJ4Jd/fI94exXxfbxdd/bdhaftc08ExYk1REHs9rARvn4lVP3mwTp/
	EjRG2VdiADPsMvf/+CPb9H+WilUqTTCUlK9JaemwprRLzgsf1is87SJzkZQB8Je7VmR4g+O9lrapO
	MdDw/3pSBVLzhggVopapsPnryt7k+7UBld1ZDPTD3y21XvycAmsLDGEX8IHl6tfq4pI+eKtNPVZwn
	zUIVSicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXE-00000002wbt-31op;
	Tue, 10 Nov 2026 07:44:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXC-00000002wVl-3WUJ
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=; b=mLNUl6fnMFS8ZGUQf8oUbKopUn
	R1g0qQl4+zrIZedt7uuRyK6qWrGgzStsNk7a+1kddoRrkLTjjYlF0tSgQ0B2gq87QeWmA0GvBhBVb
	lUOgIp99IW5lC0v228vMVgGnCmwmwNzl20MKIxJ3m7tc93C9hnMpu4iaT2gq+Ub2GUhmlFmftT6QD
	sJxA2MAxfkgs+RAqCH9BV4TYsTqiMsFtjc30daJW0M9seK7ioVLLjn9lLo5Wyv+p+ZWc336jESIUR
	7LAxKvj2/xLnB/5aLScLgdORsbve77CGOuCQ1DtKsWPjyOFosVdLQHdK/2nhcJ000pctIfn3JWbJm
	VWCEwuRw==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX8-00000009FyU-39h3
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:48 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-53656465d1dso808381b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296683; x=1794901483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=N5iPPE1tEUZkeM7fVf6uIFBXHaHLqV1hDNAPeEahVwUejplzK1V+uX63+SI3WBVw58
         +NxTjYPTnANIF5bbqV5/dHPnUpCFwa3zXU68y8qe/NrIwU9kJZmrbunLA3ll+wZ7iH/m
         fq/uiz2YT+KDRNjnLI3xBb/tgKKUFkPAPET0RTvtjqTe5IvGZCYvPV04T2S+VToel2Zu
         UCpCjXjNBPYylJFmHaOFfT3EMxM/b5OlQiFZEsvhI1dDliHnT4xc4ZG/OyDtGZ5/zvjS
         jBJF+OrC5RxEx17KkbsSQJimIpPebhWpFlYwioFGhCoYQWXMm0iOaj0iMA9QXZ8QBwzp
         s5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296683; x=1794901483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X9Wh0VhZwdXQo9xIloNpny3dCBPLPixF7cRCMQpCJE=;
        b=ZjA6XrZyKMBGvnoatSUOWySPglb+JrtLaUPU9YoeeCeoj0odpLxvoyI8T4lE0W5f/9
         I6pMvDsY6LXtnGWk1jT13ltr1Nq5Z5d6HetJoWWRQyXT47HXpUoSFyV19efqMg7LBa2q
         8ZVnq3zayYJpzjugHEmHyRjONMaqJxdFznEosmvVflf2Ym1NWmXB1ZvdEGV5+W7jxmPP
         pr0ENCxzaQg2cPK1CWQu6iYxYnH/L1yIgQfSYimsH8jQykmwgx63v4L3zOmxT1sRVTOX
         Y8Dr8v1ACoupYTEJfaRs93eZ4aiyWqEnXBHVv/3BcrkrbjLT6yV6PXCZ9inCld26lQNM
         PcvQ==
X-Gm-Message-State: APuU4Z9bT/mC/UPXYcCmhfIpj21iwwMMuHKr3zVcuxsxkJm6G9Ibxtg0
	X3cWMwlOY6qyywUvcTduHvFeGUD7sYtUeoawdhqOKP1KaDBbszTJp41y
X-Gm-Gg: AYBFou00HnEjlWRIIxZTEdIJgunrtpEmh0+fhcBh6szAYSaU+6Oi1/5/7vy1VzJN7gf
	EPNn6D67cSApgIz2lqqhuA9G+Z2tFLUrpvAt/j+5XTBjoqZddBelpdSFYcpxN9CbS+fBe7aUPNk
	dVRLriYX0mbLEPNx+f5pBAek4GFus65jV9JqcX7QLUwmDr/WA2oDpGYTQfCuIMYPiRwfWYsZHbs
	hd1mYFTh169cWAvnO7aYMs00KJT/8BJoSfrzJ/SATOLvmVPM66h4X3xOoNCmAV5TX8VlcATXth0
	ONOFrB096IHV6ocRP+3QfqkBQQWP4gHYZtN+u5jz3FrPwUanoe5B1BfAYazK95bKIju/XPfATNC
	BNIV0ugtNC9MxvUjgltsw6vyKY5Zan37ybGMLmIvjUllzQVNRejwRk7uHNwQbTYhfLwqpRJsr6W
	R4jNNYbklVpOxYsvaEuJ0WyMUpC1Xr0ELLrShZ/GkICp+9H3LO92wOsoCa2Vx5m0TYtFQoOikat
	Vitke02cAtFlvaOul1rDYcxHtuZk9W/O4MW+dhyPro02WvSwiD7cHnrwCyAC0iz6ZfSF5WA6dxo
	wWuRSJ3zl5+gKGgbvVkWBEJWEdLjT7yTL5YUghuBiuPnRK87rUJ4XtN1rF4+Vds4LfNOlAncvNe
	8Oq49AbLs0N9EcXc6Z40M6cQfPRHJ23dmw8bGD9ds0zMxVbkP6VzqM/MU8WtMzvx5YxNWP6Mo3u
	GPj884pPEXdo+4ShoUtDOykotKM0PXBZHh/qtEvxXDhKswdiF+RlY=
X-Received: by 2002:a05:6808:4f6c:b0:522:1ac7:a573 with SMTP id 5614622812f47-5683cd19fe6mr1844320b6e.43.1794296683574;
        Mon, 09 Nov 2026 23:44:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:24 -0700
Subject: [PATCH v2 21/58] mtd: rawnand: fsl_upm: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-21-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074446_841772_84494FD2 
X-CRM114-Status: GOOD (  12.72  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Also clean up scanned chips when partition registration fails.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index f4dc990a8da1..bfa4f450d7c6 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -69,7 +69,16 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(&fun->chip, NULL);
+	if (ret) {
+		nand_cleanup(&fun->chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(&fun->chip);
+		mtd_put_master(mtd);
+	}
 err:
 	of_node_put(flash_np);
 	return ret;
@@ -160,6 +169,11 @@ static const struct nand_controller_ops fun_ops = {
 	.exec_op = fun_exec_op,
 };
 
+static void fun_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct fsl_upm_nand, base));
+}
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -169,9 +183,12 @@ static int fun_probe(struct platform_device *ofdev)
 	int size;
 	int i;
 
-	fun = devm_kzalloc(&ofdev->dev, sizeof(*fun), GFP_KERNEL);
+	fun = kzalloc_obj(*fun);
 	if (!fun)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &fun->base, fun_release);
+	if (ret)
+		return ret;
 
 	fun->io_base = devm_platform_get_and_ioremap_resource(ofdev, 0, &io_res);
 	if (IS_ERR(fun->io_base))
@@ -222,7 +239,6 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 
@@ -244,7 +260,8 @@ static void fun_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id of_fun_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
