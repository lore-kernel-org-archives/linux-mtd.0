Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806366070220
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gvuz/scY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kCm8hwIi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EshX2YZ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UNUETX4auAZmQElyhJmwou2/IdjVGGJtLMv8t7Va3Ic=; b=Gvuz/scYmNiUi9hcNsZVqA+Ib3
	S+su7KmJNHhpgrTeS0kgo71JTh88pvcE9JkqtiDrOpQHcb2Hscde5gdMZdX8vM/ZZG4xd/ey43p/2
	vjajg05ciLHGTkPZQSYlcwZQeThJfePBmtXUPl/x+AwXX54ELZsWxNdSKtMjxzJk7kDuMKd1Go0eP
	iOQ8RwIinhHq5FRgZ6XVXoX8ZQ+OC26n9ot+VRDfHl3z7Lk02wfFhIU3k8TR5FjnaG8eYbhobMuml
	CHevAnari0xa760B79odv5naejzibK1jMpCKK+hPDmzCSELZQ4E4wqQ+7x+ogtn/8/CWO8SD2KXKN
	Ho/ZEgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcq-00000008MMe-3mvd;
	Thu, 12 Nov 2026 01:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcW-00000008Lla-3wNI
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:28:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=; b=kCm8hwIi6FUt0H6YdhRxmcuRP6
	KwV1GFjze1yVl+8FWhe5tUaUBRNgQ/tlIAFvI7Y3tyw7b9LNdm+U0AYJYxULlQYMb8nbDKgXwEidi
	xOJWQKBoVX8qvK0SkP17oKIzv+r9Ma5kbIObgePOwbINvbtg6z0jZg7xVwkgA7gIWRqoS9PR5m2AV
	rJkgugER3Cs4C1wdSEEmKfpRmPisnzkAIW11Yc9UryWIffjW7D/0oOksvRSwe6PUnnN4pLDvLXjDM
	WziwkmSjJiSFPRKpBeoHex/r9CLTOjZYaMFsm2gkSJyICazLo04ea3GhUtSv8i0vcJ/ZmpdiT0yzu
	sEjRfFtg==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcT-00000009mkt-0MwX
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:55 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4f55a53898cso1775204b6e.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446931; x=1795051731; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=EshX2YZ9a0CxnRzDD6LhrAr+u6CBKRrhp8Ungq59erFwrN+jk/mlzxWmVBPcWOOThc
         TbmwkGO4yo0Voe9Q2V84UWE/2NLNh8GvC6U7ku6itLzaMqv7VH7wCWt03WMZ6QakqQBa
         RvUnvgIokLnC0Godtgx6Nf2DZM7hBo8tUraN2lvcraeZHCX6Ooxa8etRQuskDTYEfL9h
         3zsI6sV66K40nSfJA25FKR/v82mAPFKBx2s7efkhHobvYXZ0Bjvh83rr8SB0Ry1U0CP3
         +GeiRXZJhk6MtvoBuP4LuQeImI7d9pID3nSJMQ4GugOQa6sfVbFhygsvfyNVYzjjlphc
         TAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446931; x=1795051731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=JOl+wEqKuVuaPQZMSU5mutu97hN6n6rCKh0MGh0+DXxDrWRIxExVhgQpPjqwq9wcGP
         NGV3OqqmlmuT0Jq6ZPnf4nviJQJGJS5wSMbyKUw613Ti3i9IXctB7SBqfWJSv+HIKJ4c
         SX6UPYWuQo4pHLXaKwxFM99+7GAPeeTYuTOl0e+j9bNmqvh7kZIvSSQbI0XHAhdNBf+6
         XCu+0g8YEzmQm9ZmIUfRcRmbUdUhelhHa88Xbfpb9as3ehafrOWY4jkxDpDkZOqPifMq
         eh3zAxE2wJMBsAFi1uKr4RqqTS1P/z5A5t9OkhB93Zx1YfVbuyleEdFRboWEr/RMzdzs
         cdZg==
X-Gm-Message-State: APuU4Z/FdoAOQzmnXKl1lXM9FSjbZe+73zaPiVQyCpJi2i0ZddSfMKhS
	QrenixSKne1WtFmgUsVSZZxWmRIhtJIOJWurd2dK9CisKDzV4zi7mqcT
X-Gm-Gg: AYBFou3n9JUsg5jpijBcMcJjP4kIUEpGggRxc8A9ukJ4DncjthZzdjDi67dmpx0nEVt
	k9Z2W+YmUSZ/ifUCU/femAbwD2cqLtdWH95/oy5h8jMskwHuFscxVW8Wf5yD1UjjoTS0DXy4qxt
	5qp5OcCsLiNDZY3oeVU+AmkcM54uaN1H4d2PLT8+To8jKPdACqG0MJ2EXOgnmPZKtlXKT5zqLzs
	3pZsq3wNIeH79E/+1cw/I2TBFouEBGsZ7e/P+Lb/Zje/gO4adS2seNtY+1UkZwvvO9TZvaUCK1N
	ODsQVzw/JlNhT8O17ZaKpIhzZgFCUCtMs/A2j67ImY9VAM6teuMgaltjm1lkiGLXExLV7O62KnU
	4vZCKcErd1C4VMX4htolYOAlCBkhvbdWoG/3bK/xA+iFg9dmLNTuup+wXdozUqwPk1VP7g2w5Sm
	fo03TA6FxqeTaQ+oWOGNOJEH7K2DLsy48Dq18AtvLEuJ4+JxtEC1gUHa304rqF3vpdRuiS+wsWD
	pzCIu6aiauFOH7xUweVwUJXabD5d/3v6eKeE/S7ZdMHRC9BfO2f+56KL4yRhstOaEB/aAnOl+Ge
	JQBoBZ3jo25Emvi8i7hxRW7nwHwlu9WWMwEWveyoweAlwsP6v2cG2HhUcRLenK3u/uIaMziPQXH
	gNVcgReiJQ1q9bmW7eHh/yFltfEgGX41Da5AhKn5CSYu/Ke6e7XvxX+eEbmGhwS95jPrCHEB4Ok
	7+JdwQOB5Av+xGVoBnTQ80TwxylLXCeDx8PZP9blVEYQDwXMRBKnol
X-Received: by 2002:a05:6808:1817:b0:4f5:e13:95e2 with SMTP id 5614622812f47-56b9344d1c3mr4165492b6e.9.1794446931163;
        Wed, 11 Nov 2026 17:28:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:59 -0700
Subject: [PATCH v3 20/58] mtd: rawnand: socrates: retain open-handle state
 on removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-20-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012854_135679_5E886BBF 
X-CRM114-Status: GOOD (  16.19  )
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
