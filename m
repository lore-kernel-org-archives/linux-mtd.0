Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6755B60A2618
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o28s5HeT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PGZgCQ8c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zHTIrnpmvh5C1HloZ6TB49Md8tzjIDEKa268rUsZSQE=; b=o28s5HeTpC1b44SrrTDA8sFG6R
	3PgyFuwfj6X3VBWYMW9prFWdEEOBQ9htTRX9LjFQqKPokQAgozMKbvkjLXpAmVZMz8BIEYCPjQv+p
	bZ6vbM7js/hxeZfdFe4mhjhM4hFr4eIPEkZriW9DW8WTFUjUf/bbI8B6nyLVAZvFVHe+JTR5zq5Vb
	lwTI3ClBjONK0j3+GN8i9LCm7ViKsSmiY7XIjmwQaOaQz5ZztW8uAOYekACoCSdAyDC/ovJCmgrz7
	pt9kH5vOCQpiDnJqNXEEPocrnF7gcLieCYfzp16i6rZ2TbkJoIuCHwUJ/xa90OfLpMCEgEnBtbpuf
	5JB1gwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgYA-00000002y5t-0Rli;
	Tue, 10 Nov 2026 07:45:50 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXD-00000002wY8-1SCL
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:45:05 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-490d838b425so910846fac.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296690; x=1794901490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=PGZgCQ8cjVqRXyWdp50YEtP3XlNLR7yW3/l2KKG6x5iFz5OYGWBLlRyTQ4k4xluLat
         iUBoRSNxCR1QHb+0dn6vm97gG8w+lZoCkVn14lI0QBVujbnG+30uKww7HYNftaWB8tmq
         KC9UTIzBPU1ffZl2JOexoPVf4jjYaUZ0NUQTqcfJDpSOWa0e8EqsVRtasuNcyaBAwQTS
         OSFJ7D5xMzOJNb+gOwuaZVUR8Vnmn7aPpJB6h9CpQCAtkXRtrWLSV2Vd7RvgEzDKYzhT
         /BK9tSLOM6Sovu9wrRboGW7R2gxljHHxvXK9U91he5tqNWDBE1IR99f8f3iPSuxKFj/k
         hzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296690; x=1794901490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=enFvh0zA6CCuLOetpAclIYPVTKBFrjEfRvIvNZp61j5UVUdE6SluwfLfl3Hv2MheXM
         lT1IaaNrnFJQHS9AG0JufF+tnYU/bXTkdfHvqatk+XdPHV+BIXG1nZAufcx7oGpG6nJd
         9F5i1JVcgx7dzDx4yagPPWYY952FDDkxTdrNTcC/kmQejTTjt9GJdD57f9J3QIwby0xF
         a9I7CUfTqx2UYEOKrNPcTRwuig1A46UR23mTmyH5xSprK+GAhMQmGIU3Jo5UnZ+Q28AZ
         zMIP+SPE7vKhCj5TeI6P8zEhDIV2SJcd56ICMBZv7bmrMJoxiCHTXGty3pzyKckTT4/n
         2RRQ==
X-Gm-Message-State: APuU4Z9j8bk0YA79t7g1mlj58JLKE257WgbNuT5ZQWx3atMWsZXc2x0+
	Ew4Cj68tetqixHMxSEz2lVWS08NxsS1ddhFtJ7hvfGvHwC5x0oCX4Hq8c6teXHP5
X-Gm-Gg: AYBFou35XgOnU+7YJrAqlhN+AdKeFlcufr71BmmHngdL7E7Mn6rPGVMiB8Scgret7Hu
	HMx5qZUyOwNBPcE4svXkCEl1HsmhyBdH7y+mXcxHyGF65vBwuNkiXFo+yQmn+Xu9nX2a1W/NQB9
	thw0V3WRX/8fdHCux91kfWCy7WMZQ5oLEzIb6Ui2WYYR8chEXhAi+nVpWDIlZ7BsA4LzBQwHorx
	DnX6BLLZr0Pvnffk7Su9BOOhyp9pKQ/iAiRThA1SkMEVjEKqtwa3EDQAKhqhFK8Fg5XXee1Db4Q
	G9flF9udspv3SsUWfLrHtTHgYBP1/ma4VKtiSM3LtqeuPVmOJvnUlHoWQoa6x+MAu4NCjXUylmN
	2XiLR3un9osTgHZNpJ27wgT+gn/TKUZve17lUC5CqkDSL0kMfb42+UehibyvhemqW3QRGt6uF+7
	NB6DkSr7k0XLWUEIn4oWn10CtK4CLZ2bjYkSzmaSVyfLZS9iYt/swfAv6d+2Iz2xSRuPuG6cl8G
	F25LC/2vdfczCI17tY7N87lurcyBOJObWhJRNtdnkzA7reR4EOA7Xagr6bn2byiwhwbsL+R8yAY
	vZHipJpPZkx4hUN/nK5bXf1G1vfXUkt7Y0uhjECLY9a/hs8UiqEE9t9IZZjhkR6xtVd1AZL5an7
	mkx+TnteHM9I2Aq0R0kIX4FzD5SYGc8QeMhr0lF9R32B2s1oeO24P5XIjjtSy5jhqT2NVru5Q63
	xRgUzRc3JUlZLqWrqDUYWFbyLvnJ5Q8tjB6E1GelEikx+4xowp3Uv3
X-Received: by 2002:a05:6808:4441:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-5683cc44e4bmr1593904b6e.29.1794296690088;
        Mon, 09 Nov 2026 23:44:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:30 -0700
Subject: [PATCH v2 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-27-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234451_432864_71E1E0C2 
X-CRM114-Status: GOOD (  15.30  )
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

Transfer flash-node ownership to the retained-chip helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a3294aaf43bd..a67f4d45f57b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -132,6 +132,11 @@ static const struct nand_controller_ops ts72xx_nand_ops = {
 	.exec_op = ts72xx_nand_exec_op,
 };
 
+static void ts72xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ts72xx_nand_data, controller));
+}
+
 static int ts72xx_nand_probe(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data;
@@ -139,11 +144,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, ts72xx_nand_release);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +182,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_release(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +205,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
