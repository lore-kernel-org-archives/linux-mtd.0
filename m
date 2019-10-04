Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F52C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 17:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12F6B2084D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 17:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2EZ0bF2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uEuWIAjm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12F6B2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bY+nEfX16U+TNHzKuMI/m67JV+nk0Ony8ln6HIpZ8IY=; b=u2EZ0bF2zGZKFx4nOytsyD8wzU
	HNP6Rs2OiOmFFWoeZT2gixY7KXRb2GA46oiOCyxgMzNjsb9ZKSmLvbq2eafv2ygPwjyWGxmeYx0tE
	DU/HZDKCrnF5cPe+ei3+XUZlREYQeYfA6BA3b5lboPOAjJdd1/zCWm3ZFymejBn10v96rWGu6G7FG
	2ej3ql97P/96Kz2gyr5ED2zSDME6PkhLynMLRQv9wQcqiiuLTYxPseHuuZr0D7HOMAv/5ffvKc2XY
	h7lsidPLcrDT8hZvNHCyCOyGEEr160lTgnGduP+AIiLrJ89VTN29lUVzEV7B4SsId8usYkEF7/eMt
	hl9Yt2Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGREj-0000TX-Lr; Fri, 04 Oct 2019 17:19:25 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGREh-0000TC-9H
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 17:19:24 +0000
Received: by mail-io1-xd41.google.com with SMTP id h144so15127963iof.7
 for <linux-mtd@lists.infradead.org>; Fri, 04 Oct 2019 10:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jtoSVXtrhkJf1hDDCpHF8eGDYq27zVP1O774BwN2yFA=;
 b=uEuWIAjmWZC2lobpMCOJTDjl/s5815lvaflCenIocA8vV0nW425V5dnH+6mZPkd4Vz
 XUxuSFBxRAoNyjtPDEthhP3MdPmPJ+j+UF7q+diD1gOch5U0gI3ACLE2oU+Fs+XJ/23g
 0eClghImRh8A2lRcvMd+dTegBcIb4mymqkub+xittk11wLhax/0+iubbD6YGCPhlJUpe
 +A9FZUJQ0gynepj89NG85hfqV5egfEp0SQ02NeHJMqqH3bmzHuDSEVSFeeBXxkNQ/2o3
 9HNqPQwaklpxPDsSiEHhQGmCCQslyyD6KgD33YfUubmNugxfGji7IorwH3hvzJQmA0k5
 bIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jtoSVXtrhkJf1hDDCpHF8eGDYq27zVP1O774BwN2yFA=;
 b=FvWm/9U8UkkcvT974ym97F7xus5L3ucaMxw4jca0kKFxkCLAp3fCvbreeqJK5H297w
 WCHydmLaSWmW/QxX4YiAAY5uG8ULsAjvkR3PZybv1KhAyMm1FeRf7xi3bOsYiBZHYbi8
 WH+da1xB0N1VNjDkHl67riLvsBFG3nqAEmzxGtdnMd1mDFmip5T74loqKK93mhsw3wGP
 drEwMW4KCOd2MgiLYc2fbUykuN+1txPUx33hbEg2ohW1MjZWMaqWJZ81eF+dB+C4C7V7
 YrAZOSAdrabPZLLly1joEclhmBgga+u1SEKsOF+F5aGUVpkAr7sk8hGnhi/rlJffaD/Q
 eTxw==
X-Gm-Message-State: APjAAAUUBexTUb10Wl9UbbNLB1+gm1fADmTLRG11I1LyRla1Kqkz90fh
 ukFN+kQ0+QvXhJzONWoykis=
X-Google-Smtp-Source: APXvYqxF0fH1FHeLeb/+4F7Sw9KcP3cCcMmpy0s8scdkUAgLYnFwYQd2ajU1J1M/tSF1hZskuCrn2g==
X-Received: by 2002:a02:b782:: with SMTP id f2mr15929972jam.48.1570209562004; 
 Fri, 04 Oct 2019 10:19:22 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id i67sm4018502ilf.84.2019.10.04.10.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 10:19:21 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [PATCH v2] mtd: onenand: prevent memory leak in onenand_scan
Date: Fri,  4 Oct 2019 12:19:05 -0500
Message-Id: <20191004171909.6378-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191004175740.5dd84c38@xps13>
References: <20191004175740.5dd84c38@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_101923_325631_31CE304D 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 emamd001@umn.edu, linux-mtd@lists.infradead.org, smccaman@umn.edu,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In onenand_scan if scan_bbt fails the allocated buffers for oob_buf,
verify_buf, and page_buf should be released.

Fixes: 5988af231978 ("mtd: Flex-OneNAND support")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	-- added release for this->verify_buf (thanks to Miquel Raynal
for the hint).
---
 drivers/mtd/nand/onenand/onenand_base.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 77bd32a683e1..6329ada3f15c 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -3977,8 +3977,14 @@ int onenand_scan(struct mtd_info *mtd, int maxchips)
 	this->badblockpos = ONENAND_BADBLOCK_POS;
 
 	ret = this->scan_bbt(mtd);
-	if ((!FLEXONENAND(this)) || ret)
+	if ((!FLEXONENAND(this)) || ret) {
+		kfree(this->oob_buf);
+#ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
+		kfree(this->verify_buf);
+#endif
+		kfree(this->page_buf);
 		return ret;
+	}
 
 	/* Change Flex-OneNAND boundaries if required */
 	for (i = 0; i < MAX_DIES; i++)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
