Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A46C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3178560F9E
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3178560F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Nsb3uWPW/O2WUlzzEc2np7Mu9CuofeJ7CyB4FNvAA=; b=vHnd8Dr3v7R1bz
	KWCfXIrzmZeBUX27F+dy98ZpjysGP29Nf4TFLPqnG5hRUGi/1Zur3kqwsFOfgQYgG/4idlje5Kc1V
	OUgy/Sr7H4PmVbLqPYBsoaAoxkavdl1uF8NlyeF7O/u5XAMfRp1EKPqrnci7eyVMh7CnadEwTD+Ss
	XjatvpALDpAN1tlmSzgiYMdQakyNWR3ASJk3q+JVUAO5W5IsITwDHzDMiGHud43fMyhovBjyC5ItI
	wmwwNgxITlJJqdfrCI74lpJWmUPTWCRzrCVQhlUBlzdJ3INF/v4V7G8SSZxOldGvloDWF4AlsFJds
	GVl9GhJEYqYikh4g9KWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKVK-006UeL-Nk; Fri, 15 Oct 2021 10:31:58 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKUs-006UXs-2M
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 10:31:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C423DC000A;
 Fri, 15 Oct 2021 10:31:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Joern Engel <joern@lazybastard.org>
Subject: Re: [PATCH v3 1/2] mtd: block2mtd: minor refactor to avoid hard coded
 constant
Date: Fri, 15 Oct 2021 12:31:25 +0200
Message-Id: <20211015103125.949063-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211009060955.552636-2-troglobit@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a04e96537cc64b63fbeb300df2503167bb54f2a1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033130_281368_33800B8E 
X-CRM114-Status: UNSURE (   3.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2021-10-09 at 06:09:54 UTC, Joachim Wiberg wrote:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
