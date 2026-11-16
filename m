Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224E3606A8AF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tDMu92Ai;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bWZTTYs6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cuNE7ByP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5FhiL+G0gHQX/+iRvHVoRqV6ce8h34gkpF8SxVU2eU8=; b=tDMu92AiMbH89M5z9vWqCNKBNB
	Lg98yzFS6k1FHCZ8iSQQNi1f7fsQrQqI5XClYZFZjN0vLKtb4ezQlTC+6zSk3TfygTnpyAVlTpBnl
	hiQaNjkzyzesvwd7YTtamGNbOQRhg3EJnFGICbgkK8O70NNX1C21mJIMkbYTbZ0Wl869NBah6s/d0
	QCqLbBDERbqw/0pd1yvWwq8bNz6MOZf+RxNoLNSU8JAPsN/Y4aLouQLKEZW/cR79I8DqqjdkDl3zA
	eDKx7dTno4ZPfDtEsnQ7CbDM4a1jB4wvoAZk8YvwG6qhGvA2IOqxZba6zHnuxY+sLIadFp9/+2C2l
	LJzoYhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEk-00000001G9e-261L;
	Mon, 16 Nov 2026 06:30:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEY-00000001Fm9-08qK
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=; b=bWZTTYs6AXRoJ+GKVmLJfRpUoN
	5LOz7GhDUD6CXrNVGBC4kIX+Vnbx2mt+jHI1R0txIeGKeOtD8HjgJjraU6T6cwbcvk+sDg1ybOq33
	Gs/QBKvMuLLBv+sEQl2Plh8VKaU2McOqYmEyNzp8gT0KjlxqaRFmjsRR6aU8HC8iFMqSBtUGVCRkg
	Juvc5fOUZCMN9a5JR8m8xUGjBXXfLpurPZalnytvrrRjkAbHy7QmG/6e3ovbTvCaYylGNiGtDbvWO
	lMNeD7udmzq/TaR0DrparsuBFgG+ljs7iqTjOMtop2FlBzLCAftlAsU72yz64jWRPovQ97AMvSKhx
	PYpXSkpQ==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEK-0000000CeOI-3jZe
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:28 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-71ad099391dso578023eaf.3
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810614; x=1795415414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=cuNE7ByPhkcxp4BdSE1+K+emVAMImfAX15tF6XhzEW7laUmCZZWgE61JH0nqv9C1BE
         POV5OTL/Esfc/Iv5QEuFFTVL9PCmbz9+sp4zJ8kn7cSSMW7B4Pk9AiFPuswhaNPSc2kw
         75JPZ+hkxsd4+itifSJG7+ke3KRm0d9Z40N06nOxkzCLrCrXBZ1r06zemhToUXlOkMnw
         tlfMPUfT83AdTC3Pa18S/8/FRDxh6I/kPn1CdSykjOULwBBtgcw9B8ivcwJsJdEFAmgk
         AH37/tR/akM3jh96S+hs58v8T/vQe3XALdWPzsH4pUP3zzTnx6mzfSK5tzQQgMNTdCVu
         rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810614; x=1795415414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=N+suTVhD/nhn2aAETz0N+Nq1AQbKS8+gDweXMQkT/FV53YJHroBJUuapIEex+qDx4E
         d7HVQeJVoTwlx87l7KgG3kQq+Hb5c0rRKRgpM5ji5n/bU3M0KgAGn38hTbwaaW0aJq5F
         AfUZI0/ZjMqYrJm9uubNdM8AYLeqpeF3lNPT+zKSGA6iEKOqtI5HXJnLCahWINDtMyq7
         tIRBJ0nOwVAEmD01UOt2ekCliMGbAhXr7fPLZi8D7lLpvwUv0YHO/jQ9sYH0wHeARUT6
         yte9vwF7Ae+QBvehFGaQxYZRxw2WJBoPLAo9bxVtK2NWL0Ngw9tj8VACgC6QKdK9a2gx
         MWUw==
X-Gm-Message-State: APuU4Z8gGp1jZAqM2ov1AXOfW2iQOwSl/FqlMahxkHA/bf1UW33mCGaq
	nkzSeZXe1VL7DulZiCH7dY0p/CN+HceB79Wi1USBCfL9lcJBuXHID8hy
X-Gm-Gg: AYBFou2WCQ4dmvBBuCxVuYcrPpxI2VdCrvn2wF/Ck/mFDFZIyy3pDxxr0Rv7iryeLDi
	zvRN9VuFaZZod/YnN8QSfgJclg+iBAyxUZPdyHknljpLvctGDMXO5oXrq1spQkvf9Orkq2eb6B1
	RSZtT3vhDw+iO+coS02zb0iMcLPe8FKbTRKwAyXkq0cxLMP6NLkIxxVHHuhsi61JAN2xxg6Z7EI
	9JhB+V57dVRJ9cRS1/QSdk2rC28qdjRHmxEakyti2nAFRMwb3L7Gfu8BE5mIgXYmfR4AcxQA8DW
	qKNqbNJgv7YNoFO7OWKU5g30RfQpe6wfpBliMlCOqRghGG0DTf246I4MtPVMmUQS4iphlGi6UFT
	VQWJXMObIKGOt6XmwfFLOKVsjrI8PbCD7RhKheWKqkbiGVxKJpdZgGcOo8hw8XiPQsSePqLUjcd
	s1Lnn4yHLLk8uCptFngS7cNz1cPYm9lXNZJgg0OJ+roCzQuxoPGHpmOjhIvchmjdN6LZg+X+dRJ
	md4xXer1eKhQCpCli7nuZFPUaHe386t1ppeoicHH1NG1/brADa08Y0HusDPd+fYvhEp05q+MiYx
	Xw/fFUBkGYc6OBDUvvJewAYKRs96rGscnwxmPAsJWdK3Tf1fFqfa1Z2kiiXalfmBcC7hkw2J7EC
	xpQaYvrpQ24nAdqASIzLjgHLcZ5/03wsGL6rZCnJm9b3jp6snFFiWwlk9xVtu+XB12c4GZMYfxt
	4qENe1ozgof0pMYt7z6j7umsVsaaAxL5bMRSuHMgLb2yukWrcn2k0IJ3Hq8nUWG0K/YYt5jWm8
X-Received: by 2002:a05:6820:2302:b0:717:da:ba2d with SMTP id 006d021491bc7-71ab510b260mr5669988eaf.42.1794810614091;
        Sun, 15 Nov 2026 22:30:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:37 -0700
Subject: [PATCH v5 22/58] mtd: rawnand: pasemi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-22-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063018_461615_6B930ADD 
X-CRM114-Status: GOOD (  13.43  )
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

Release the LPC region and NAND mapping after disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index b497e84636c1..0a2d5e5bae07 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -122,8 +122,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, ddata);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +138,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +176,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_lifetime(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +198,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +215,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
