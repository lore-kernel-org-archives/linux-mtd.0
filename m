Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22790C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52A520873
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="clencoXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52A520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1KwdUQWd2ZNiGcgkTYZJFbJB5eae8VlkFgn2DA7J/Y=; b=clencoXqOlaDfg
	gtjfT8ONJ+HDf0oe9M1UxabfRzZPVxZUW9XbflvT6J5eIASEtmuC4mKe5OVEhMO+VcTylTqiLZa91
	CD4UQ59m00jqlaLVyAj7EGomIPaW3dQ4hhwgzGekJFO090Nfkk1pFCdkUwxo4oDXuTdQA4vjbve97
	GuoBjTIAz5+Kxg0sVqKZpTGgPqvJ5x36tWGggoWglgi05CygzGwDJhfoUY6OsB+eVLkL68AKy5Eeh
	8dDjtR247GWFY+SQI6BJV73/AnbRLp3v0cLj3VMDPzrsFnUGxXkZdjvNJDwas2GadUAuwkW5WzFnB
	9Oe6veDuJfG0jGOZBNMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjuX-00064n-OV; Tue, 10 Mar 2020 18:47:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjhe-0006wF-SP
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:34:11 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 33E8B240009;
 Tue, 10 Mar 2020 18:34:03 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Devera <devik@eaxlabs.cz>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: Ensure nand_soft_waitrdy wait period is
 enough
Date: Tue, 10 Mar 2020 19:34:02 +0100
Message-Id: <20200310183402.20212-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116135431.17480-1-devik@eaxlabs.cz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 43d8b6362378913bafbc54690474131568458c42
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113407_068841_8D49A84C 
X-CRM114-Status: UNSURE (   9.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-16 at 13:54:31 UTC, Martin Devera wrote:
> The used way to compute jiffies timeout brokes when
> jiffie difference is 1.
> Assume that nand_soft_waitrdy is called with timeout_ms==1.
> Jiffies are 1000 for example (assume something more like 1000.99
> - just before incrementing to 1001).
> We compute timeout_ms = 1000+msecs_to_jiffies(1) = 1001.
> nand_read_data_op is called for the first time and returns 0.
> During the call jiffies changes to 1001 thus "while loop" ends
> here (wrongly). Notice that routine was called with expected timeout
> 1ms but actual timeout used was something between 0...1ms.
> 
> Fixes STM32MP1 FMC2 NAND controller which sometimes failed
> exactly in this way.
> 
> Signed-off-by: Martin Devera <devik@eaxlabs.cz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
