Return-Path: <SRS0=jHjM=OF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF13C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDE0160F26
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Sep 2021 09:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDE0160F26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qdnKMWegYm/NXFpqahECuR+S0kLPXHY9WPKv217/EwE=; b=TwaceeFbD4dNWJ
	Hemqv0MjykvpB2ie2vBdFS+qsCWFA87Eio6EUQdfGFI3PRFfdnIe1WnhWqRnSflwUDju+0LqwiBGy
	RhXOxfAgVRrgberxRsl8hEC7EOWPHK3hG6yKC9W/dOoOczy5H6Z9BVYYUCXYslBQECeNdcT/mQI5/
	vUtiJXrXwSBSeZJ1j3qcgX5trHKEwCEZGQIvDUzd2j9Dfzk5lBhg9QhC6H/J34zosuM7MfNZefZJT
	epHIhpOMuI4skuDvb/cSPFOJ+MxLzmtQH5G511q5cH0YugBZft7f9sFPBpnzCCNOJmLoQCP+pAwy0
	EC7CINnfiDXYAHR40KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQRfr-008kAS-7e; Wed, 15 Sep 2021 09:57:51 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQRfp-008k9P-8x
 for linux-mtd@lists.infradead.org; Wed, 15 Sep 2021 09:57:50 +0000
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 15 Sep 2021 02:57:45 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 15 Sep 2021 02:57:44 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 15 Sep 2021 15:27:35 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id 703CD22353; Wed, 15 Sep 2021 15:27:33 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: miquel.raynal@bootlin.com, mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: mdalam@codeaurora.org,
	sricharan@codeaurora.org
Subject: [PATCH 0/3] Add support for page scope read
Date: Wed, 15 Sep 2021 15:27:28 +0530
Message-Id: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_025749_433321_CC88270C 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These series of patches to support page scope read.

In QPIC v1, SW is needed to write EXEC_CMD register
for each Code word and collect any Status related to
that CW before issueing EXEC_CMD for next CW.

Page scope command, currently supported only for read
commands in bam mode, is truly a page mode command where
SW is required to issue EXEC_CMD only once for a page.
Controller HW takes care of Codeword specific details
and automatically returns status associated with each
CW to BAM pipe, dedicated for status deposition.

Md Sadre Alam (3):
  mtd: rawnand: qcom: Add support for status pipe
  mtd: rawnand: qcom: Add sg list to handle status pipe request
  mtd: rawnand: qcom: Add support for page scope read

 drivers/mtd/nand/raw/qcom_nandc.c | 125 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 6 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
