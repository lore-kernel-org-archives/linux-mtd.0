Return-Path: <SRS0=prEm=YR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671ACCA9EAF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 07:15:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD9421655
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 07:15:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ad+1U6KV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD9421655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QQ2Q+iFdunzV6YUnnoj0pvymSgjZgRnh6Gkqlr3v35A=; b=ad+
	1U6KVkSVg4CSjtOx55xX9WBe5uSYdPBB/ns0CBw5PPeL5HpGswOL1bmv1Os6g72PTbtVP66hH04kT
	B5Fx0eOFKhJBHI6K37jz68557f9zZMh1Ak5zuhbGCAY250l8kwvCnIDnt4GcVVlfRrePO/53n5tba
	5muHUif75I9H4x46yPu/bTZ7i/JHyy7GnhJozrPyZ9jczDSGKvKphAO/DAKjRbHM33vWEK8YBTs/V
	ZNRRQ+0oXrqhgrHkiEjwcXbu6OrGOltBUNVUrOGJU0dS2s+J1ActVydWHMy4rXdE+LWAu9xSNrjS4
	8aUP2ZkNPsDIpSUkpP3ReYe4YT3sJBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXKy-0003RH-US; Thu, 24 Oct 2019 07:15:12 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXKw-0002AP-9E
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2019 07:15:11 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x9O7E52u080302;
 Thu, 24 Oct 2019 15:14:05 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH v4 0/2] mtd: rawnand: Add support Macronix NAND randomizer 
Date: Thu, 24 Oct 2019 15:40:05 +0800
Message-Id: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG4.macronix.com x9O7E52u080302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_001510_595072_879F5FD8 
X-CRM114-Status: UNSURE (   5.65  )
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
Cc: juliensu@mxic.com.tw, devicetree@vger.kernel.org, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

changelog
v4:
coding patch & add a new DTS for randomizer enabled.

v3:
To enable randomizer by specific DT property in children nodes,
mxic,enable-randomizer-otp;

v2:
To enable randomizer by checking chip options NAND_NO_SUBPAGE_WRITE

v1:
To enable randomizer by sys-fs

thanks for your time & review.
Mason

Mason Yang (2):
  mtd: rawnand: Add support for Macronix NAND randomizer
  dt-bindings: mtd: Document Macronix NAND device bindings

 .../devicetree/bindings/mtd/nand-macronix.txt      | 20 +++++++
 drivers/mtd/nand/raw/nand_macronix.c               | 69 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-macronix.txt

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
