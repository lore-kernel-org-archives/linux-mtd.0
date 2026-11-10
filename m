Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32160A2616
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Esmei5Am;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=b4LDx2ql;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAIJp9LG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U4zPkM+4ti2Y82hphGnYUJ9l5aJmxvuWK+HjPQ2g0do=; b=Esmei5AmNNZhsT/mrI2wCIb0oQ
	NIDfsKNnQtLqmRwSmLrL3S4wRCu//qqP7HbLDBdLrdksm4W6uOaZrtcdkt+jU010Y50GVIp0ctzD5
	aZPupaFUQdATjf6hAkhj9J/44NSxiplQAAyXejbNFupuHU2E+HPT+7PvKqJ8MB6xeGQ3iNfYG+IXO
	xSjUwByV59AnwIqsdiIOaN/5J06/y2gMqlIGRjgCCopwpGTZmSMHosQoRR3KzLzMyg+T7QoZLaH21
	uyeTQ93L3BRxy0P4QIJ18Umleattdz4BHSrl46FILBSb3vf1Jppv81hv28BC5kk0nz/Bxg/bZvanx
	u1MBWP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYA-00000002y6h-3aQS;
	Tue, 10 Nov 2026 07:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXS-00000002x37-2xtJ
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=; b=b4LDx2qlEdsL/qumexAhHTng6P
	4pHyA8iBVygDvJReRaiD1x79LnSpRO98a1ls6BlaUJRp3agmUpg5zllSz9VvZZU8F29kh02/Pzl1P
	vy44qf6xLhThzstEjnKOeBSnzuo169vHcaKJq7LfywYHsKXNVO/V/SCUwu4t7WEPLKxwOWKZySNbT
	Rk+4olQ0SyyesFxIXvm9USvMsDTA9bGUrcJRMZEzJidkrCwv9JMg4cBNIO+GTzyLm0rjj1oHqH7hG
	isgaj2Ex5uafgrLGaYuktkNqT/xcDeUV3edo9mSC9tT2wLKneAY26Szsdtqo7EJBwDfC2SbtWBMKP
	Q96qM3VQ==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXL-00000007e3v-48IM
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:02 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6fe4372c5f3so962158eaf.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296697; x=1794901497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=wAIJp9LGlDYaxFyoTLjxCIMjils4rDWxb30Wjhnj7ftJIUo/w3RoQ3Dmk3CCDWw+go
         vAfeMm/k7RW1tBy5DCvX0wOVm4wJZdb6RftQAOJYHotUjrfB7k2DNm3jbPk5jNPX4Kmx
         I2eQuqcaBxqBjkfruhcYDiUUMgOym4DvQ1mQ4xF4526B/Wa28qWFJ0wV/0OE4fbA6de4
         7RSLTnM/2zsjX/alYzqeQNqyVCdvrmB9qN0RWN64LMwThLp3ZziquImdh2UfjkbrpbRQ
         ueYfL5L5trK7jj933yY27UGWcV/zbObaSQBrjr6Rv3ZpqYISPYTREhyLPE0+Hoa2Dt1a
         rCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296697; x=1794901497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=l7ViR6fleCq5GghuvlNi7GgjQyc77bwwHDHUhHPuG3VW5sGLXKGDhwBwXuToozK0+l
         g+a7sIe6xHAjJbx/LANpaeL7eb9s9jzjayg8npVfW8SQF0pBhGaLfBD3dGsHxsmTV8d5
         zWNOcCBOVrep/sNGnjqSU5Js03YfRyfizx5eJOk6+vBjzo2qPilWy1foeHR+ktkl+dyE
         p9UA3dPJMPfQqCX5qoMjcrfrpHCOgUkiehWwCbiC2fqAaezYBl1j3fax0SbNgI8LYzZL
         LpbtfX373/VjkvrQWBwwMSQzOFZ42cSMNRbh93sy9a7w1Hkd3eEIdqOVIJCDng65bquc
         /sDg==
X-Gm-Message-State: APuU4Z8elaL6xht/2zZn0HJxxVLpJwKhEynWAio6EQQT/v/GjSrpOMGM
	0qKMHTJfJxu7CTK0/HcE8Nn88IiAb5ik8hSvqqAEOhD/5fml9zHHrpdg
X-Gm-Gg: AYBFou0QDq8RI3bmkcJxV0QaegE/bYCC1sns9lnl19qGn4Erfesx2r/rctk9Ly1fJNw
	9ICa8yGTg9Ywyws7gLsgSJNP+onjdRq7d6dR9CCEWo+FjHDhBGDFf4TOQXDETZPRLdZSQH03toO
	98IOMWlrf1nCwXLGwWorYbBjIQIYUWQLsq4HsLj2VBS249gUK84UBh2dt+HoIm7JweqDtPwFqOL
	6C+RZDqL6jH+13CeNjBKGy8BT+arKH7Sw7Fde96nFJh7lgE6idzD2vF+vPe8kfbmROlsAeKa2pi
	D2LLtPs3mfuksYqVm7p+UjCL02bBex59XbUBWMNqHTSehxHx6GqhJSw0VakYlcjRlAWQhHPRgDj
	19ymKbjrhzpqrE1NFe0D9M0I0akaC7eG4rSTRmZ3g2VWbMlm5pT+w7pgoY2A3aPuM+FCQZl+fWM
	Bh0B5of8VbuXaBmRI7nkH+ztU+0hTHWzcegfiFYGaWKCnU7yOJ8fZvOuiKCLlwTpkGakFX8zL6g
	D+V8mMi6knxGKOpBGOtXzu4gIxbprGEqtxsLx5l/wx2pBBmfzV6PwIb/ZCYw7nKW0DtMQIL8+u7
	CU2nL//BkAB7LHVwc8N4kCNGLorxDuWuY7fpg//uVpUfSXfD70+sfdPXkTVH4fU37u9KC98n/Pk
	AzVBmKDGZDw9W0sj3WiKHSf5N8q/AHTqguZPedXKVi5G6RmTG6d21o40+j7CQ6JSurT9MEJEXva
	hdW8snKV6dzspowzj3yb2vokebGzxEwzcoLyLMQ1zWbI2ygv2JdvDIltnFzAxleQw/jekvoLL94
	w==
X-Received: by 2002:a05:6808:c232:b0:539:c292:8b04 with SMTP id 5614622812f47-5683c9dfddcmr1448284b6e.8.1794296696889;
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:36 -0700
Subject: [PATCH v2 33/58] mtd: rawnand: gpmi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-33-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074500_813653_81949FD3 
X-CRM114-Status: GOOD (  16.17  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
