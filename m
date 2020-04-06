Return-Path: <SRS0=p/wV=5W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114F7C2BA19
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 09:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D587A206B8
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Apr 2020 09:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ot8XKsfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D587A206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=p3jITD/cQDD4aVmFGZoMyFcsVmA5CUi43KcbmMYQEHM=; b=Ot8
	XKsfiTWAHMaK/0ih0Xs7lL5L6gjRelA0QA+oq2sf7jmqlnlFMv03SGoBP3A3NWg3MrQxfkYgFHSBQ
	mWKo34yPTa0FA7VdcZiPftX+7vyRRpiGC8hFDDsncNnlAGhJWGeDGRslMiGk9KmT9igQ2kP055B3I
	tsd0ocTPgJI3DeSRKlQpBJNS3+F+2DdXhzmA+h2M3wQ9yKcWEQgCOPXBr6vZmiWOu9SRsPoUfM3vk
	4w7EegUuX5RHIGcdbay5Gl+N30AVK+KNnRbGt3Fb7qDXPw9n5vkP3R9cZ+x8YE9LVMBEu7RAs7gH/
	YVCLCXuZ8s4QF3oy4bVyc71XEItYf1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLNcl-00084b-RC; Mon, 06 Apr 2020 09:00:55 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLNci-00083Z-U8
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2020 09:00:54 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id 03690DJh098593;
 Mon, 6 Apr 2020 17:00:13 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH 0/2] mtd: spi-nor: macronix: Add mx25l512/mx25u512 support
Date: Mon,  6 Apr 2020 17:00:09 +0800
Message-Id: <1586163611-4565-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com 03690DJh098593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_020053_231992_7DB10B26 
X-CRM114-Status: UNSURE (   3.65  )
X-CRM114-Notice: Please train this message.
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
Cc: juliensu@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

mx25l51245g/mx25u51245g is a mass production for new design and
replace mx66l51235l/mx66u51235f(phase out).

thanks for your time and review.
Mason

Mason Yang (2):
  mtd: spi-nor: macronix: Add mx25l51245g support
  mtd: spi-nor: macronix: Add mx25u51245g support

 drivers/mtd/spi-nor/macronix.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
