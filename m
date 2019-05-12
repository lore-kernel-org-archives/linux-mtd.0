Return-Path: <SRS0=9VLx=TM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C1AC04A6B
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 15:40:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B1420882
	for <linux-mtd@archiver.kernel.org>; Sun, 12 May 2019 15:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ti3V2x6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B1420882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=breakpoint.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LbuNHr3Y5TtL2bV7PXR8cU3FDXF5HQgS2+/dIS04+XM=; b=ti3V2x6L1LXrim
	vEjaXkfg7TBXAJ+4CI2k3QbHCWBPNn4XgyDlvIbSgORhaLQVF91HAxahaZnHDJuvGJ6tlMlGG3vcD
	vx4sW7Irk220h9TW9ADIsGi05Cp1k2xsZuq5W0dYu3BowteDBLk1Pld5wEIshs5Xs7gDeW6uocZdF
	5r/Z+J7U7Cf05R259jUIxQhLTrz+AswLHPy03s5RHJGgP0rSxyUU/+zeEf6ZNL7pslIJmRHCDivXs
	I7/h4Uo0GrHDavB7TY6YDhIksShKar249/Klp+/MlShtoJswWkamZPKZk09KfiFIS1EAHrTMZK/XY
	yPd6m4UVzefnrQ1EeOYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPqai-0004ou-Mq; Sun, 12 May 2019 15:40:44 +0000
Received: from chamillionaire.breakpoint.cc ([2a01:7a0:2:106d:670::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPqaf-0004oa-56
 for linux-mtd@lists.infradead.org; Sun, 12 May 2019 15:40:42 +0000
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
 by Chamillionaire.breakpoint.cc with esmtp (Exim 4.89)
 (envelope-from <sebastian@breakpoint.cc>)
 id 1hPqaa-000492-Eo; Sun, 12 May 2019 17:40:36 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: linux-mtd@lists.infradead.org
Subject: [RFC] mkfs.ubifs: Add ZSTD compression
Date: Sun, 12 May 2019 17:40:29 +0200
Message-Id: <20190512154030.26027-1-sebastian@breakpoint.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Breakpoint-Spam-Score: -1.0
X-Breakpoint-Spam-Level: -
X-Breakpoint-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_084041_340386_9CDE0961 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I was accidentally talking with Richard about ZSTD compression in UBIFS
and we ended up that there is no proof that it makes sense. So I spent
sometime, added support to mkfs.ubifs, bootstraped a tiny Debian RFS and
compared. It looks like adding ZSTD support makes sense into mkfs.ubifs.

I believe Richard has somewhere patches for Kernel. I didn't look into
it even checked if the resulting image can be decompressed again.

Sebastian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
