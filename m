Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A18606D29E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYZRxE/u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WLJzZs2D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aVPcw55r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7AIDWG6bO3u66vK/4jp4tDjfZghOX9qRmmd+Gbf6Lp4=; b=VYZRxE/u+43IQEPPuMn2hyAGm/
	9HIO+0Arkg17WgdwmHMMxUKMz3W/DdQU5Zzx1iofyf6flIuJSHyeJYgwBCnP2GAxUuPBhEXt2AxU2
	z02hNVaSF5xNXKDvovfarz6KV3EmZrQ0f3gJyTLVIQVbGXMlDZ7wkPToe1OGfAB8n3h3wHCxAdHcn
	zOD2IdnKSyIx/CTILD/z2sdu8QGbu6q2N7qUc+0wvumKkAvr0Mf4Z7JsL7+7Yr4Z0kiP+KAoW73fM
	4tHmRtcxAeIKt0ZSOQ00Db3K3crVT8nwfSif1U0H+yBv3Hjx1KPQL8IkG65x2Q5nQdKOowTKriY19
	UI0E3QiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXH-00000002wgM-2XvN;
	Tue, 10 Nov 2026 07:44:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXF-00000002wb5-1nPk
	for linux-mtd@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=; b=WLJzZs2D4sZjXPvibH+Gk+o1tw
	Xsk6+5PD8bnreUOdWWBv2HuqC43QoTPimc0l03P31Mb+TXyQ1p1nUOcTB2malIYchCsW1b1whMDwN
	MdFeqK8Uj9GQtiXW5p9CvEq7FyoFuOoZRvgHQtFAKiQqldrggM8JYdnqcPvm3CoPtSWhMpGsgOcTd
	18ucMK+JTN0fRHXAnemdB5eYdu/0Z+QI8W/HK3KJxDJF+C8orjrXwdzGi4zfivMZrCkHJxZ6vyZNI
	kX2pOMdgcKR3FBNYdt2xUNFgDOiIAUV0Yg4/XRdmczia8MddeNkiE4PrPGYtr6s06NJ78+5MCoxvI
	tgqKbT/g==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXA-00000009G1u-2m97
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:50 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6e560e00a86so1053539eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296685; x=1794901485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=aVPcw55rEx5/zTn9xc2RE2/Y/noYTmpKbYchd7yFR4a90IFyOjRGc9rHXdHMd9+U48
         7S8zvqSRWWIlUurUf4KHTdoEflQ+B8qkPJQPBWYkb0Dp2uZiDPPoFKMA0s/eXYvXW0ms
         JVlT+xjZx5ZOrWstsPJoJ5ThHsMm7b3p8m5dNOwmt4SCMKqj579f8+urDKfAgkNWb/qo
         n9YVKP597t9tdR1dS/YFo1QYEOIbc6q3YHQqmLxHpcRviPS0IcuTOk4T2VWvLUhFLu5u
         xXBN1NjEWqclNOXtTDC2IQbR7QyKzmDOn3w0oRga5iacxE+Js2T+K8+ViTepGagKSUNT
         30dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296685; x=1794901485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=fBeTUleYQDUTRbRLYUCJaYm3g28Js2G0llIfym0mXqfvc8u62RH4ADH/IqnKaIiGNg
         Ug4EB8JCXPCG915TNHWM1zAjZPcHXnk3HuWI27LZ+uhMoHWb3IIEY7t/b/r4x6BvQBeM
         n4rUYUVjKnn+WBFQa1QI6KthtpzYJObPkqlZOT7ynXEB/NH5Jk8bpHP9Yb2VmiMKXQm+
         ga5akoUo5DXgDiqCnZwdZ8dDFvTPAysB2C8VxjbZh0YEVAKSkwIip5B0oLHqn0wAtE9O
         BbayAZkEx7Prw+CMdSNZaUmwGI56fZQYPHpCRgdJjPGsTEUBh9ebq0WhMquD+6EVjlwd
         +nCA==
X-Gm-Message-State: APuU4Z+k1bkLJPARlS3m/R/BmKXF3SgE4tDPL6aP4eRqxWgxX6ZZ3afr
	kLIFqvitccACix6QWiUS0RrGPzNMdEqAew1UGc2RvLPx502UqzGei3GS
X-Gm-Gg: AYBFou0SXEEAGmK1w6PCnk0woiOAY1fMaUKISHxc6i9kTivVY1NKgQYIfyzA5ClAaTU
	NYjFOoh+IEVCQZ9Eqn/ZVOSUoHB6p6lVTiuXYxvhHMmrINeHJOr27LcZz+aLSSoaxIFccrU+DMB
	FVO7LgVKPzBGOHg1evVfI2Y2Wv0K4D8H8a3O7ngeFBNFkGCxm7rCuxrcCGfjA+rmDWwrOYtE2Tf
	8e79ZDkWz1LrPcxCyOoNJ6tOaBk2sgEt9fARSWQl0Oc76j5IJOVn/TjK6tU/MB8UKnvwvO0Wamb
	jKmW546gkqRPlmTBc3LMx0O2vlEyBlwnST8IjEj1inW7Spd52+s8XyMESGgAt88ijFQ2UPkFtGv
	872aw+VMoWMIETcUh2MfBC6bbBj7s+W9H/TyvCyiy6TKxme9WoBCfHi1GuMrxzAFbLiLws4PJc/
	zC3SZXQQfSIDvMiWLJjwmcy5fbX107L+bYApPc7/xux9NPo6re8hg8j7ZkQo8LBRcRtA4iK5sqx
	NnWGaihPvOPJz//N4UnQI9cTx26Vmw5TLieBtjStAFhW0LghmeDnOXSefxy7pBFpfM6rpQVJsv1
	5lXf7a089rdm0MakBm8QLUy9s0CvbfeLjTPrwv/wOZc1ozk3kvlx5KBXUEjoPBIQJYuYlKdboBu
	7fhPD60c73HplVrbfvdc0va2jnsYbdG3vtCk8Vi9mOA6Birdo1WnGCHcNoFmDIgaqR056sqOYke
	9nv/19XuOv/dHEId5rSWY6SVQdCMjEe+yLGr03/rhQrnEgq3PbTqU=
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1624292b6e.44.1794296684728;
        Mon, 09 Nov 2026 23:44:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:25 -0700
Subject: [PATCH v2 22/58] mtd: rawnand: pasemi: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-22-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074448_873019_8F9666FE 
X-CRM114-Status: GOOD (  14.13  )
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
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
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
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
