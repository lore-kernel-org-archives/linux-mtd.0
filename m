Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986656073C4B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B6riaTdq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fTd77ou/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k5NNOhpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=brrDyy6ZI8Zko44MLLGXZ5Rz1dphKPZZ589GuW8YS4A=; b=B6riaTdqcBMC01/ZpZixE6O/wZ
	meIkxdW4Uhc+R9NSyos8bRtKe43Bxvr0cfyPDpQx5twXh3y6GCfwxGJH9BJ8FcpNl0LP8bnGcex/0
	UERt4ArT3xXLoIYgu7J1ExTX0yJBR1QMIbgHLiv8K7AgI3dIh6A8njpcavCGO3beVGpB3svcCTdMX
	YatccJnYaokLUZlStIxY5bgw8p9i8KIrP4iM97uS4GCXPn5qIbqhaxFBfryYp2eQLtMHNBW35//1q
	Sg2FeWHZkHpt3inwSbK3tNS0n81CfeOyd67y/PNfA33+Ae6Jg+/jfAK2c+H2jBBT58QM10NrgbYLE
	E1yLxhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXa-00000002xOI-0hGW;
	Tue, 10 Nov 2026 07:45:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXO-00000002wvU-1b9I
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=; b=fTd77ou/A5yppzUKS864gjVvqD
	WVCMcv0k2x2Vxx0MU04kxif0IzqbAlHnGgmdALn6lkIl9rRQKFdMdTLyjcYFoW9fyqdsq/UaJFKvl
	MpJANJmPOdt/8YvqCIx1AHUyUmnvoFuOONvwDyCRCadvpJ9EDrmmIi44psyXyGvGntpL0CVwb0UPm
	fq5LYdZPGxCHi9ILiDE79Qupdm93byRw1TVpySkaG46KxL3lvQfjs3mUBMd85z/uCYzFP31a+suPj
	6xhfVKWTVFgE2sH0l7bgtw6jAEOHbKU7Cpo/lS8ZeXMT1rer98Amyt0S7LaPvuUxyfUFeFzyI2ZBV
	5V44e+qA==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXJ-00000007e22-2Rum
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:59 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-70b875f6f13so1344107eaf.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296694; x=1794901494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=k5NNOhpKL5z9W7KlWlW5eaPD5du0uxvw0GfEn9udLaeJq1Q5RhMzYnUhizjZ0ud/3Y
         koxlm99Jn7JXWE0Z6IQVt1d71fy939eP3mX7y8V+vGfwIr+HI/TkTma4fGTYR6hf8xOn
         RGO9zvcsd7GB34Zu+M341tym4iiL1XTT8mRKvGwXEY4oENyMc3LdF3XqfQOfrw0BNQs2
         URdF9KCuZNr8biJ30M5Nvt0DZWhu6JZCud0uVaPwZZSE0vXpyyMo4oFyJIIZBdsh4EMW
         IgO6ijL+ofHxJ9oN1IXrbUWtqkZFempvo7R+teMRZwweYdQmZ6bMVUg3kRjpekjqO0Sc
         pvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296694; x=1794901494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=omCy8hxP8B76qJfp7pQOr9a+sQtJioM7jRueJHOAM3fGm/1XbLHo0tSYsCFa2Jif99
         YoOcCXx6cHkyBedYyjMpbqjPzDkPALS3RaLuGCoJqUzFPuFLU61uh3c6WgUKBhTzVbTz
         +NjiUyVL7hX9nONxncK8RScrbHYtQego0hy1Ndi18UZ4T8Jiwb4TG84sCEK5WBIvh/QO
         ivNFPp7a+ITtGFSd9lGZuNZ7g9m6zP+OgWBKbUDAJS/NCm+Xa3lzr2sAXTe4/11RaRSL
         lC7667zFTP6f7qkrZVYdaTHHLv2z+tlQbZ6fSWZnr5hxIpKu4kK0lXyJShzFbj7OMsWN
         /hDA==
X-Gm-Message-State: APuU4Z/UUWUbhBxrOwMFnnzF6YL+MOj3TvOiAVsk4Yo5z1maYGSjAium
	5qsK5+XMnfoo9lEhffeDX640dKqgodJZwHpe0yKyAQSENQ/glorcIvOG
X-Gm-Gg: AYBFou29pUpE4dQPQ5G5rdcWmlRGSNQ2fmE8rsOVHNA6A8Twwlq1YvY4yYPNhHBG4KF
	Yfw9pTNfqn0HJQsUvoZLKy1oRzl0CVlDqp+Moh8AhH1y3C90VaIzg9zqkPECfku01YuSe1CUZwW
	NvsitBi46egFwzIoSG2gaiASv3h2Gh2fuKSr/sTyO9vAdJHCTreLtN8fNmAkVk1w+ve///mwSkm
	gUVbti2aPwrZBqdKEiJFGLfvkoAJ0Py5OdU5jAMii/6TNXRuKp4wTZgL7Jmma2FOVnuV/0x+/Um
	PqQnA+/iO49jETDgv/6I+5twkiK9+KSifJWQdLIu0N+AqJmuT/f0hOfOyXsHfqCUTjlAbEeJL2R
	xzyEoCVcWwsMGivozbtJ1RosGWkfSj0+Nn6Rm2akgaa0UHjEjtplO8ZC7D0D7cfZP1GBspQZv7q
	qyvi42uwk2pBioy6UA53aIBehuba2qhFZfVkPflTq9OA15z9UrcYwvc1T6Z0Vz8lxfDFGchWDo/
	sJIecp7uVoiJEbEdxCFOAtc+87gAQ3r8jE2rF4DpR+1boIPk8rsZeygirhDAclsAggKhbeyYYyH
	Ed18WjjQped2JrXS1UA8hWwHc/mrOzGk11KC/+A7aH+VGfjsVfT/qGASR/E4O+DALWYp31e8iio
	XAwd8N/1d8Tn6+qPtcvSgdZ3s2ziyyQ6A0v85tTJZs2NgXurUrZVtzvuNGUN2pi3lGRpRifEdeB
	tgtmNzkW0g2xotF4A50qLZU/BiHTh89vb+oedgGIt8zcV3I87bheI=
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1346257b6e.19.1794296694580;
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:34 -0700
Subject: [PATCH v2 31/58] mtd: rawnand: mxc: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-31-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074458_004824_BDB23FD5 
X-CRM114-Status: GOOD (  18.92  )
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

Retain the embedded legacy controller and drain I/O before clock
disable.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
