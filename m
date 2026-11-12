Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079B6074E40
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCw5T3tD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DT9BqTxn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3r07WyR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yFjLeSNeRJPBvWr3oCK2Vzfwnj+wIQh2S1UuqGl9c7g=; b=uCw5T3tDctXULYsZSkfckkSQr9
	2g5XNPSA4qzJxr9Zajro+V8DyljG5LYOXsVmpLA6q+AIAUBDoeulaxG5Mj7lrU3pdUMIyUYL/eKhZ
	f0gSeaeamXo23UJNtWhEkwExdu2vFZIzgT6UtAl6bA68+mDsqcBObVQWcJEYJNyAZ7ulpoIYOpju8
	ljko7AiZZw9pxF5EluCUBAcKGnUka8nxnN7XRqCXXtIp0rO6t2mZ5LSIxdL0UXrtBitdMtCbL7la/
	VMT84uzoiTj0GK12WEKQXN5GjFPgnkxM7C35G8421gWz8HjPQ2j81SivDafFa0c++/DdP2BHuL0C1
	+aK8pLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdB-00000008Ms9-1KR3;
	Thu, 12 Nov 2026 01:29:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJck-00000008MB6-3h5L
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=; b=DT9BqTxnaq/DEI/nILLZAVZcFG
	RecL/thfXtjedskxpBDFyDUNl4Jw4E8ES3JCzAKey5SVawf0mtRBuQM1BlDJ0D4Y96kBRbMVzhDRg
	JlKIKsY3Xz0AWnGtwNvMtaQbcTTG0BrKw9Yngo/zgUYBXUGPQJb78vddhUIB+QfG8LlgjwGjh/Yxy
	k5mt3wDAsCgMv/1bPPurwqCwd9kPfaLAcVu7jvxAQ56V8aLRVQ/bZ1rqBWCXh1+0jpBzNNJvNhItG
	ng2Z7HS8l5oJfj3I5Po6FxRkexQWNtVNitGXc0sroxCqcBKfWof7l3+5Cy9LMt2/zmWFbXhvCPXpH
	3d71Mtjg==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcb-00000009mnD-339W
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:07 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-5326cdde017so1188447b6e.2
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446939; x=1795051739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=c3r07WyRTvEaP92pm/Dwq5aa5fNZrBcPmJHaeraFPTDopZzQ0+nswGbozSnjgqxb02
         SuYQrsARzA+OUD0Y0TLK4dUe9//HnMnQI7f9U7oAyo1lOL3olCYrqNMaYNfm3WBFfNX5
         Q1TuPOhWy2EMkTUxFhw7s+ZOKp0BgdGvz/GCrWybacGwHzXZYamk9KAo84KMdFkoei4l
         E+ilez0IP1nIU/tT3HaZnS3Xh9dEwzK0Y3oMFtSifo8xmkN2GqagAw86mc4H/NUges8s
         k5pRZAsTBFJwQqoHRg+dYLHFq26wPgBSWTH24E0LEwOKrk4c5duOZNS+6M+FMsgB6CpK
         oxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446939; x=1795051739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSM8sfrIu0eOErA39zMFzJp7l/ZmzKVDmewCjQgj0VY=;
        b=EI7pgPrKB0jzSClRAgHj+IbQXAIVRoruG+r3ox73l3ZZhyW6t1ZkMdRuS442B9yVBI
         6amIAx58TlyiLu8D/IcyY0WZU1GHySptTc7Vf9whVbGNH1+Ji9K+aVYmJp6mX/c7JEhI
         u9zgWzsAPlGytAVR6kUMpB6PZCcWih7nlLU3whQFidUKq0HmFsnVzExV+Jua2H88p4i3
         v4hZQUzAW+/x8KqwD7v4YJ6oTcOEmY9PtZSlVx2AvEbHdL0zmBxk+vrKSk5B9Z4rYmkM
         I0hHQg9b8VTa1GcWyHuX0PYfNhVPsp+bouMG09WX2EjwyOL9V2RgbzgIucCl3P6vYLib
         Zvmw==
X-Gm-Message-State: APuU4Z8GXsECAsxqXCtwSBVGqabRHnO78/STxx8VGB0XkVcydmv5dL6B
	2s1f1Q6JcYDx8f/NecfH1HEpv/RB0SG/2owyUJPkI9BPoTVbR+aXo2e1
X-Gm-Gg: AYBFou0xO2sDUSbTbE7TGruTy66i3iOfETHyvgQt/T5AdYyHWUD/h6V8IOrKr+N9OqN
	C/vc2f+5QVMW9FbKaOVYHRoWucY/HkeG+1i+Rfri3wsG5/h5k6GV4Cn5lcXUdifcNwbW8CchsMf
	cPLA3Fr9wogT1gH72c/QSVjMgYUMyOkTJf3xIVQnkJl6qbu+gNIs/ct/nIqdqIb8C5W00veqdos
	9hCWcwGcwU4wS7pLanYOAYZHi5pqr4+J9WxNZTWaicLCODqJj1/D+HtCD+u8n+n/K+uj4TyytWX
	Clt11z400otqoB3L+OQuhncMGtWGzT2aOSPZge4xHn1z6A3n8X8c4UeKu9CDY7VDuO4+HW0pyH4
	3dAamn9FeTFkRZjL1y58/kurP42zSGWF3XvUyqNWroKWlEt8v/RepcGgg8FUXKbkoMDqrEkM6xc
	UMC5nABrduNljtkcmHYC/c87vDXjr9/TyLygyZS1m4kM542T4bMBAQK2JUTixpO2ehwI9cmisfp
	EclnMuPuivsY7xmj8WPF3sRp8lPPvirdKe9AiO85ENxaQXZETm0tGbl0snHJG3oFsipL4E1GbwJ
	sgVlfdEOZFnIA0GI9E13cQz2C1wKI5m3DuzXHLSVZZPdm0Z4zYZNfIasqQ4BaOeyyzinN6YxUmi
	lFD9R8Qp5MO4p+xvaW5HfEJLv54NyGWSRD7Dv/vO+KNqVzq4Dj7Coo4vzCc2aopvRImlQWfMCEE
	S9A/jQrwW+iZU8EWYgEHbyn19DMydewJxVrMMMF1IUfQ6klkyINDu7
X-Received: by 2002:a05:6808:178f:b0:54c:7ce7:33ba with SMTP id 5614622812f47-56b967af722mr3635515b6e.28.1794446938800;
        Wed, 11 Nov 2026 17:28:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:06 -0700
Subject: [PATCH v3 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-27-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012904_041779_A82BE7EC 
X-CRM114-Status: GOOD (  15.93  )
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

Transfer flash-node ownership to the retained-chip helper.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a4de53f954e5..98cf91136d0b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -139,11 +139,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +177,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_lifetime(&data->chip, NULL);
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
@@ -191,14 +200,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
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
