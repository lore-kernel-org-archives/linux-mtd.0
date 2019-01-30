Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA84C282D5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBF5C2087F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+45gnOj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FciL5bLK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBF5C2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jyYSIbFi9p7BRqvZQT998Y85ieFuQcGM2hc9sRY86D8=; b=R+4
	5gnOjLvUBXVhd3+YJD0Jr+G/to3N2qmAfElSVshoTKBEkfErPf2QCjYHAB3UnSBCVKXr4lCDDWVjI
	YYagXetvES51qDc3+TjdfKa+FRfOXLW5mPvq7UvGq7QzIS/YpDESLc/7udSd/G5DHNRguVSLuvHfq
	udLGnKj9Jr5RTMfuG7UDY7nZ4cSeLZZ6oi4uRt/QoorpluDxwNcr7nHtNviVdq5pRagFPoweAbOV9
	Kg6vky13HTDVVLRh8LzlrgcAQ4UL6NhpbVRLRBc6EBoR6YfKgg9EA2//VYnmJeKWBrZEOpVbszQfl
	G1IpYapx1qzVkBQ36/O9M0FS8K2u8BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golhz-0002kG-Q8; Wed, 30 Jan 2019 08:58:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golht-0002jR-Ny
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 08:58:58 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 235862087F;
 Wed, 30 Jan 2019 08:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548838733;
 bh=myyEUTnhx4vD0+QVNDPfocI8er48p8RnKngtTleZi0g=;
 h=From:To:Cc:Subject:Date:From;
 b=FciL5bLK+pp8VX1mM1ektWOc8mg1SkOl/1cAztMSWgUOQC0JeQtippFazBb22BqT0
 LoU4ZCh5Tb2Tf2kPzMU3syxdyydVAiP/3ZCzkSEH7MIX5LSk8InTaePKLhNjwV56Xd
 o/VF778LS7lvC+KFZQUDM3MVwtKPVYOvLozq1sPk=
From: Boris Brezillon <bbrezillon@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] MAINTAINERS: Add the IRC channel to the MTD entry
Date: Wed, 30 Jan 2019 09:58:45 +0100
Message-Id: <20190130085845.6790-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_005855_592108_12FB00E4 
X-CRM114-Status: GOOD (  13.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The #mtd channel (on OFTC servers) is being used to discuss MTD related
topics. Add it to the MTD entry.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51029a425dbe..7b39ba46384a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9805,6 +9805,7 @@ M:	Richard Weinberger <richard@nod.at>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
+C:	irc://irc.oftc.net/mtd
 T:	git git://git.infradead.org/linux-mtd.git master
 T:	git git://git.infradead.org/linux-mtd.git mtd/next
 S:	Maintained
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
