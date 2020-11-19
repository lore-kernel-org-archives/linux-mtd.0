Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A818DC388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B46A22254
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3foJeMZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B46A22254
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+h7XptOIbHlIkG5Z3Y/lFTNtFFNMFz+GHq7rih/z/PM=; b=3foJeMZvqieCZklyWU233VxHq
	Q1Q9PCHvP7SGwlupA4wmdSeFx+OTENFQ3qPCfqlzdW3sWshCkjpR8tfJ+xBzJWlYOuEfLhsfDJuGT
	wlSXpMh97t+yD5/gzrSFRsKBD3obUQ1Huas+hIIH9+fQKNAHKOidaWKihIE4d+dEjbEiAQ8vEBTVx
	j5Igos/YNJ7dM3qp8SKlXUPD7PDTvqFbh7tlBdp7S4ymzJ/VEYdYsIX4jbxdOqlRiMsQUL5OxMjil
	3E8WVs/nD/0486/DyMOjhbjVBLM0S51+2iUwFiq6ZfqpyAYLd/rV1WMSa6VNwhbeYsKxQ9jc+dv5r
	T74tlQ0iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrG1-0000PM-Vs; Thu, 19 Nov 2020 21:14:22 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrDW-0003mO-3I
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:11:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 8E693FF803;
 Thu, 19 Nov 2020 21:11:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yu Kuai <yukuai3@huawei.com>, paul@crapouillou.net,
 harveyhuntnexus@gmail.com, miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: Re: [PATCH] mtd: rawnand: ingenic: remove redundant get_device() in
 ingenic_ecc_get()
Date: Thu, 19 Nov 2020 22:11:42 +0100
Message-Id: <20201119211142.31720-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201031105439.2304211-1-yukuai3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 9f14bf29d6ba0d18dc5175bbf22a07ec3dc67f23
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_161146_709962_823745D1 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-10-31 at 10:54:39 UTC, Yu Kuai wrote:
> of_find_device_by_node() already takes a reference to the device, and
> ingenic_ecc_release() will drop the reference. So, the get_device() in
> ingenic_ecc_get() is redundand.
> 
> Fixes: 15de8c6efd0e("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Acked-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
