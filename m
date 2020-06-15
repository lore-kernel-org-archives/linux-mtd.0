Return-Path: <SRS0=kpjk=74=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C42BC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF712065F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jun 2020 09:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jt6Keozf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF712065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1x2kXGMuZDTgNrZLneH6tXVe6/n2AJZo4xebPZeAaQ=; b=jt6KeozfT10t13
	YrvYcbqhghD27ZTWSkclb3Zz+/1ey3pVQ3mekvB9QYIboJKIIOdNApsq2Hh6GfMZNXIb8Y3Uu5FZ5
	eeRKNcZzlbvK/o+VBIsPoNPUVPZi8ZnPSlEqV8k4AUEHbkkn6Zyt70EwnIgVrMN//QjlvWwbh0nyv
	y7iRE9aLRfKFDH/P/USt6erxLmEsQCetWj+Aya3EhN1zJWh1tM8qpY7ZB7JYkexIGh29sMnTuCiT5
	SUob+RkIgjkwsXknSrtx6C5dra5szA2AIVzVQm85ERI/di5f0eUGdwgzDwJqu/ZAKocKKUnrP+gSA
	I16zo+4Lgzp6tg/pLNzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkkzL-0006Ek-9w; Mon, 15 Jun 2020 09:01:07 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkkyW-00058X-U6
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2020 09:00:19 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 05A661C000E;
 Mon, 15 Jun 2020 09:00:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 04/17] drivers: mtd: nand: raw: Fix trivial spelling
Date: Mon, 15 Jun 2020 11:00:11 +0200
Message-Id: <20200615090011.22524-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609124610.3445662-5-kieran.bingham+renesas@ideasonboard.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 131096fea780356674ce30c5108431481e553723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_020017_110168_05A380BF 
X-CRM114-Status: UNSURE (   6.54  )
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
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Jiri Kosina <trivial@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-09 at 12:45:57 UTC, Kieran Bingham wrote:
> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
