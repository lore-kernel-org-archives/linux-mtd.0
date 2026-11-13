Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256B60A381A
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y2f2I2bJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c+Lv1E9S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G3XPpume
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UNUETX4auAZmQElyhJmwou2/IdjVGGJtLMv8t7Va3Ic=; b=y2f2I2bJaFyfAv/SHlJPRHOy0f
	nEUVeOQtLuipegcdCUk1tzlk0Zci8cNr1TLYuSQzhmAAUKtH29p9yJnKlrZOgSQrt36AKCC/30/2+
	dsDbTECTzUlxzM0pPprNcIdifCUr78EAYdVNPHffmfgI+/r0iThmSX/zPVa22K+WMOTvNXDvi0lr0
	RLm4axvolddQRnIA4EDHE5XUmIKaqTZRpOYbQXnoeLZS8wF9ANARlw7F60Y2sIzbfQyMtpkwgfj7W
	Nxf69rbHummZaaSLSsSNp73jyXmgwiir7h1b4T1FfDIWd/JrU9301pMOaojK+YpBf+nyHmEdGWIFy
	Dm/Ct96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoo-0000000Drk7-17m5;
	Fri, 13 Nov 2026 18:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoP-0000000Dr41-0MFH
	for linux-mtd@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=; b=c+Lv1E9SEmA2xW3iD5wn7YVRFo
	U4tOW6LodFo0qGO/avcClxQuQTLVD8aZ1uhtYvZykUVKZTXcFPWK5LfgBDXF/1SC4/JSvobzMbCfO
	0QAyQzFrX2bAU3+2e7C5zDWas7rEHV9LlUtETNg1fUEPfIAasHAlrW37bz7XGRmbXQjsCpDrNhuSn
	hFt+d14fSrSXnnG+LoM7FbFyCNzc8WTfke5XvHGbWWnTW/VeHp4VPCRerWfxRmX2EOrm47Pt/WzMS
	JRQvQMeH8OBDlfXKbtK4getVzqKmlczu6vkwHeCWvNelSTedGS9UhEyvn2WKTG+BPz2XLLuOpWb8o
	iSGPA5lQ==;
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoL-0000000Bdgq-0xAE
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:43 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-84e513877a3so1983189a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593739; x=1795198539; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=G3XPpumexUaKCccgPJm1e6oNRTyxUGujguH0U8y98NPbnoYobBf+nM5Yu9d9qPU8qS
         +pv/Xy+Y8SdqgGgCzMrlr4npBUbNzcugo+IRiZw6qL0jxpyO3C3NpexIHSAxdnEdf9A1
         d9bc9uwN37kxT2KyG8PB2H1u5AN863uCamvpsDc7GxxAoZisNa1qKI0unT4JCgBqHnMW
         DMIHX3UdXfsZj/bsUjjoVYoyUbscuM8qMlvOOdcGbQnx+FqbOcdXi8l9FpZMN/qu9IVP
         yTIUUgET4gF4OT9QtX+fkp1agUHhKMJUtbyJcs8CtcPq+viRgP68qm5SlhiXHIu2ggEo
         4sHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593739; x=1795198539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=UyuienTKpAo5D28C/fyrjG2H894hg30bf7BFrdS4ONozOQ2XBFCUebB3bEhws4sLfg
         RuPmjbjm0PRYt2wo+ANi2Od4I+/aPRnlBeu3WpLGHmwLWFBDsqNqpdfUcfecMIJm/yZG
         Z6B3ogu//yaKorrgP5z5LcwJsIpwAbcldT92X23Mu3yq4NFADsdek9IY1SE6eBxgT6RY
         sIk+QlF+q546os67ZUfezAt77ZSHfQP/jyT4PZI/xu2/MdrQeLejypKnoqj2zv+xQ74p
         13f2Ygk8ihWwdgjc5I34HTf9FdG1BPsn6E4CxSMneyRGYzCE5wfxLTTxqwmD6yvVsGec
         3GbQ==
X-Gm-Message-State: APuU4Z+P8VE53dKv2nwF95Vp/I5TBQM1WK4nWI7XRKHOwSkgR0oUdXcC
	lG5FIvykmcKIy4hK80RRO/YnZCir/Ntqo1/OW5VdEHRow8ZHwfjMcTnTkf8Ut0b5
X-Gm-Gg: AYBFou2d4kpiqWwLDYohcCrHZW7NA+DIIuC5j692rKSE3YDdBzJm3xH9kjBOD+IZ0E5
	VargywpkqxVxLj+zKOhgQCF8s8T8N9PKuGBM49jy3arhSDcRDotZQFgj6AmZ6BA3gVCcABprJiL
	K0xd8ueIFDR5hXYHqoN2b58+OjUnOLCgb7dhiRS6tUKUyET1VAQ6SEmnYGE2mhJ5r8gpA3xQjD8
	nkSVlEjW/nCLcvklmiRdfI8srbAoDO6hQkc56iJdmNiuVpqTJgcLubKHYbQzsUxPfm4p1jiEduM
	YJvd70spmLXgJ6GILrPhW5040IEq9w0eLlOvKji+VMXBz5p/xLCz4AJZdq7dmQDxIGneri47C5b
	1Nmy1stbyyJN0dwSWOZVAJ9iaGNc6gy21ZYLNX35rgVLEFMm4sM6a267j+3c90SyLwFiU4hiGrI
	Wo/qiqC3ZVF0xjfTLks2dkP0WEtJ3ZG10RhP94viFMy2XwpOnEqzpKbEuvddQDZ/2Cy8gpewq/P
	lXPJmTw824b0oZ23P2kNlcKwYWXjCozgtka7kaVUtK1PqM23YkG+fnJ497D6LnHnoLVPHYz2vBx
	6wM2rmTPXHfENNlDaXnDudwmink47tcjClUVOQcnRWeTIJSjzW1WwVfmcz/dpy9GUUUFV4wUYOu
	lBfG39ezwIl0eafXAHa6j/4eSCWi9+k2+7NEYmChJSWg68HpxASOcpyczuMvRZRoZed8YAAUZCv
	ie1x/FZk5fVZjyFhD2D0lohW6oYhyI7pPBLbPuMNAPmDuLtG9SnaNk
X-Received: by 2002:a05:6830:442a:b0:848:8d7d:4e47 with SMTP id 46e09a7af769-8615267812emr3934270a34.10.1794593739079;
        Fri, 13 Nov 2026 10:15:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:36 -0700
Subject: [PATCH v4 20/58] mtd: rawnand: socrates: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-20-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181541_213489_53FF8DC9 
X-CRM114-Status: GOOD (  15.71  )
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

Drain operations before unmapping the FPGA registers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1b578193af3b ("[MTD] [NAND] Add support for NAND on the Socrates board")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 91d4394c1137..5b9b99bc1b38 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -142,9 +142,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +159,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +190,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_lifetime(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +218,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
