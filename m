Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D11606B380
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOhsuoz/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oyLEQZng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TR0CuypnC61jELJsl0XF5lPLsPWUkWFMZwCPhmVBl8o=; b=YOhsuoz/DhCdVuSPdzYDduPLgR
	ZrY1W1H/MM2SfZxmFxqss+UBvZvkqeDaL/nCldSBnXit4fUBdrji4LuQLXlAplCaMSI8k17cJdwXG
	ZYAD0/Pg9RSLSMCc2uWK/zRSYRG9rPxz0eTreUAT4ZD9+WyHVH1JeLb9hX2ZrwLEFODi45muKcE8p
	+3VXID5TnXUe9pMJ9xDizr0+VqbqUrOhmfTafepBkVUfavodv+FfL7pGINGQbhOYMTKZAOVZTg1kv
	5M0+T5ZvZ+IaJTIV0qpc6WqpYbxH/uEUURtKgyqMtcNugAwNrJdHO/fhj+L1bcrz/xTYOJ40T9+l3
	VRXyTuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcU-00000008Lgy-3dhX;
	Thu, 12 Nov 2026 01:28:54 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcL-00000008LMR-0IUe
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:48 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-4a76f63b243so338629fac.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446924; x=1795051724; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=oyLEQZngFVvBXy/nDmnFniQfTICiCC0eQG0QMr498f7ooaREQVTbL7OseMkMufWIs9
         KuHqa8VcBsz0Fu8oN1KhVyqNy6ElsrunUdzl3y5NMT9VBcPZjXJsrX/gv+bxIJSYN8/i
         68gyY/K38cmdGsXHwzR/1gR8UR5x5HAo6x0FJJFCSFPCMc5es7o6i5wtEZB9jusgKRVr
         sHZkVKgbbWIMiJolk+P28siQue1EKccHsH/vmIO4Rz7RJW+pP0CgCsEPVxv48pwRQ0R4
         1/QkxTUby0iL5Shj4ZyxysMBBvRow7azRPG6xixurzt3WDdkR6xP5VQI2eYx7zVT8mRB
         98/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446924; x=1795051724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=ekcCAJuTo3ZcdEFgg3REGvX5tGsupp1fJ5PYAbeKcwLDvuhEbnI70YBBNXgT55JDUe
         aDTpJYyjaQRmREY0fbcfIeFb8hyJuEMdkQEBd38RqnQfDobF2B3Mjmo9vFfWsHoRw7bk
         p91V70+ywqI8JcAqM+Y0P0mF3IPbkkUppetUn0+5Tj37sJIjOht09zPJjBDCUBviB+/P
         x1CoIMcPKmCtQwvXI/jTLjRkfWFR2Mmx4iiKMu1MBqeiKQTx/scsZCZGbs7upo69MafG
         w0PcFrHZ0qtywS077AYG3uMhX6lFocpnpAm4zyZqWM4e2Qis0ZcLt6C1V4EJ9jgT37lr
         hQ2A==
X-Gm-Message-State: APuU4Z8uSvFTnRmgYSxsgiTaXFYdJzniWtofohhyD9iRIlxnqpBe4H4j
	aWrFleEvalotsvxqOWRwgQv1dmUnXxYyYL5oaR6AWv+RLbD0noaI8rEI
X-Gm-Gg: AYBFou3dbTMT2oxiBUzRHsmPSB8ffzh21NXwH54+l31eqi2zY73J3H8PtVjr8kVvjyw
	GGHS/mRYGhLkLYwkiE3yXZXqN0UZgCT7+0wInIImKl6KgDF1sshX4qT+DMOunKr3qWSuTgu/fK8
	uJLniWe0riL6/PxPQsNlvvvevm9aQB554Ns+YaaUsKnobB5qfrsPNE+mcFxQJwTt/FxoR9v6k8+
	zfTDOXTP7HFn8YGLf1KAZe+L7mnOfsLustCs1bws3cEzYMSVdLvti0Nks2eiRiAxh4rh1nMZ3Gn
	OLZHG+C8q7s5KYyFqOr+JV2U9GiPOoW5dPl+b2KETvtbpj5aFgETjARWWrFZ4Uo8uH1ecrHoWbU
	SeX0x3x8yMDeGh46q0FHihXqii3eC/LYiZvUvF1tYRdaRTcKOAWn1bpMomj2mmyNUoYVjOgP+jk
	omphykkwcDacHyC2LBVe2TNhcYqEN7puSNnumvVXcaHTJVlSJNsp1hBeDqwaSwCcDXKbT7lYKrI
	E3WVLakoDRNkCE+VnPENwOQG7ZbT576SD2KHl7SqAc7cyRCzLuBHkJdKHSg7mAGsrePjBZPaYFc
	IQliH6rdIqdEc6gDjdHu7Fw0ZTwxjYCQ5D56aeBp+PMx/giKhI3MvzJhKQm1u7z+Y9K4quXPwaU
	FYc3qDq1/kseYtdBjgYtCC0LeqDRBQqb6/I/V5hDOn47LIyrtaYhx2POO/AhauCiSjZDe5A4J42
	+WEZTxyObYtVksPi3TpFtyGrOCAXUGb+DLstdpP4FpAHRLgQeByhbr
X-Received: by 2002:a05:6808:16a6:b0:4f1:7609:3428 with SMTP id 5614622812f47-56cd8ed2df8mr1107159b6e.49.1794446923858;
        Wed, 11 Nov 2026 17:28:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:53 -0700
Subject: [PATCH v3 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-14-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_172845_171287_E97B4595 
X-CRM114-Status: GOOD (  14.36  )
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
