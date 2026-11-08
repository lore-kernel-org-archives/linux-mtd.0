Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6CD606D80A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DN29jPqW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uQ/Jo+yA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XIsaD/79RBduNl3ckt4x97S4As1x8xcC89d7dqmAdos=; b=DN29jPqWf1cIBm1KyyUir1F+29
	e7ZIvLe8D1Lc5XqCcT+XMwfhoXLyIFICsS/aBoMnzxXMaIn3tHld0w+gYDEsvRxLT6ajyfPo3oUjR
	3XFkmjY3CCDzVzWopc2X2pr8gqz0lTSehjTKSGxo5SmBli+9/zyZDUwYfy0BYMplLMt+/BA3JlTUk
	k25viXtjFwfh+rc7GZ7n2vDCZNrQVR5sp91qkBzJ6m4vR+UOir082Gp4Bsrn9OKrL0gmoWK2sUlTM
	Xmxp0hsI4NzdA6PoECIRlWyFmjLPd21RY8mttGSo8LORfBeHMKCvXcs6GPCPN3jXbbjsVxXOHXX5S
	2Kn+bXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBao-0000000Gr27-4Ak3;
	Sun, 08 Nov 2026 22:42:30 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBal-0000000Gqy4-2QmI
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:42:29 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-4e4a4d77e5bso218056b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177746; x=1794782546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=uQ/Jo+yADs7peBUnTZJuONjPUVttJRRN7/+a7CiympGrDs3tudfqpJlOZ+pGDz0FF6
         fOplK7cXQgN2offFdcPFaNJVsbVFnliTtmJg7ML+C+YlXSr+1SjHI2sllzqb2ixVg8Or
         1mWBmDKyvxT3cBJx06zJNsKOvpx9zrdcXU+xyZZgQJPuVCNuNJj058W9BOwRmlPA01M+
         Gi0ZDfCYMAKXmIYQtGl2J/o8bdvHvE14EgMJVxw7R7e6JqQnk18fc8GttrmdLPlhL5LA
         IpUJ8ChoSd8rrNbY8ZbBXVoSSy0mhRJaZZFrC6mSIWd0nU5RczbGorFsIyM68EiX/cnI
         7lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177746; x=1794782546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=L3JUdDd9DGFx+AyUwincBsKdlhX1I7YmyzZs5FzFgXQdLn7Us6Ayyyh858V/1BzvHf
         vqyauuHz5HkVRoRLZLT3oAbqPxfdP8CI5Ccg9McedF9ca9S3fes8ZoKbzzzapJckPEXu
         VLg2t+LruP0LyglwL0mo5m5vjEofXoNz0T2Cpb+gu6vpi0jGT/gkBKB30r9SAHbNxyYt
         vdrumITT4qpyUe/hDSvANy+b+TWqdN2FTa5IY++BbWuwcMw9Gl6dABM7wjgCLtkNzkj8
         itrO2jJjFrRFGGZAHm/ui/DYOCQEGVJLeXE/MaZLpAPEqQPmLF1YY2zfZsTwfhPKHo3h
         B6HQ==
X-Gm-Message-State: APuU4Z8vA6ZvxLmgzuZ8clTPgl1aaxriFnuDtWaYSGvGtFjW0FYOe68I
	el+4nrulhNmIpVejtdVuvgrxMWQdsA+ERTSSeWhVUmr5Eu/GQpSWCi6g
X-Gm-Gg: AYBFou10swvXbLjez8ddCjrHSVBAbMloepcqr/BNI3ZdJBauVi+6BvgNqL0RLGA8Bw/
	jPhsa1SHLS0dDkJuW9fZ3TTcB+dwIIvkGBQP3hdGWIq9NxUiyBMoWmqiA9R7gSTtbenBHH8pwkn
	F99gDU6Taz7T48Kp4zMNqGlkQvz5SYWBRIFLrLf1k6OOuTNVbI1Cbhuxx3mlItfUeDXnXaq3qET
	fzHDwUUpuKvCZKsuQE2ZUyDkENw2xXmaVLvkIVIFKXokOIf6wmxqAhIF8/1W4QmDlMF/N2KJTUW
	ww/TGe8ExFyrNlieNPNLiDsUXiD3Ql5wtL+iC3FQFs6I0xZO+ejllKC7NoafvZWNNUZya5kIIFB
	mMT09vSmYMWzyfeoPRIFHtGeOHioXCAnyIb5SJUJlVgfebZLd2EUqQWklrCfq+00vYyhyvLIyy7
	W/jzf+MZLU9UkDSVbvG18jh3tJgSF8YyleHJ7OrWIFW79pLBgxOjvCrzN0nQZRfRw9XrvR07fl+
	B4BIPkKaaCYbc8RClp+OctDrHAV/avn5yn8FDUeRfq6O0g634pMWFzBixIOCyRKamzA2vmFzNUe
	2cabgXBOV3s0v/gbXC3Y7gpjEhn4X6qBA5qoeBcD3qA0UHPzMt3OTaqTEOOq3nX2onBaRtb8UpV
	tWm0Q/ZYZFmRFsvMoqtzySM1fB/LKQCXcz7Dfn4Bz9/LHvb6u+AbMKgq9cjGYoFHPUnVy2K/kDI
	aJ78gprbOxCxBmZfIp1APg14IDRcsvVfxMD317xmKuy+wzenI2Vkxb
X-Received: by 2002:a05:6808:181d:b0:53f:b2f9:1220 with SMTP id 5614622812f47-568144741edmr1029934b6e.5.1794177746301;
        Sun, 08 Nov 2026 14:42:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:11 -0700
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: scan all chips before
 registering MTD devices
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-4-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144227_679985_3D91DC1E 
X-CRM114-Status: GOOD (  16.77  )
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

Each NAND child is registered before the next child is scanned. Once a
chip is published, its MTD operations can run concurrently with the next
nand_scan(), which does not hold the controller lock. Both paths use
controller-wide command buffers, and attaching another chip can replace
the BAM transaction underneath an active transfer.

Initialize and scan every child before registering any MTD devices. Track
which chips have been registered so probe failure unregisters only those
devices while cleaning up every successfully scanned chip.

Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204074@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 14bb7f3d6c36..978fa84f051d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -89,6 +89,7 @@ struct qcom_op {
  * @use_ecc:			request the controller to use ECC for the
  *				upcoming read/write
  * @bch_enabled:		flag to tell whether BCH ECC mode is used
+ * @registered:		whether the MTD device has been registered
  */
 struct qcom_nand_host {
 	struct qcom_nand_boot_partition *boot_partitions;
@@ -118,6 +119,7 @@ struct qcom_nand_host {
 	bool codeword_fixup;
 	bool use_ecc;
 	bool bch_enabled;
+	bool registered;
 };
 
 static struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
@@ -2008,9 +2010,9 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
-static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
-					    struct qcom_nand_host *host,
-					    struct device_node *dn)
+static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
+			       struct qcom_nand_host *host,
+			       struct device_node *dn)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -2059,10 +2061,6 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	return 0;
 
 err:
@@ -2082,7 +2080,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		if (!host)
 			return -ENOMEM;
 
-		ret = qcom_nand_host_init_and_register(nandc, host, child);
+		ret = qcom_nand_host_init(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
 			return ret;
@@ -2091,6 +2089,14 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
+	list_for_each_entry(host, &nandc->host_list, node) {
+		ret = mtd_device_parse_register(nand_to_mtd(&host->chip),
+						probes, NULL, NULL, 0);
+		if (ret)
+			return ret;
+		host->registered = true;
+	}
+
 	return ret;
 }
 
@@ -2100,8 +2106,10 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
-		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
-		WARN_ON(ret);
+		if (host->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(&host->chip);
 		list_del(&host->node);
 	}

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
