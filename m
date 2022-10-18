Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AFFC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=un3kfj/58VIV7ZOGd7PRd4SYFX/YXNWXtys6hx9QpYw=; b=syNJzqdexuQQ30
	wRCF4qVrVs7tehf78wgIb4PQpTKG3q8UmzakSkrT+uafmejur07mQltXgWTW7Tw7RiAPBJgrG2hZi
	QqIjS3PkOHWxV+YEDQwrLggJ26Z7JGxmjVVW33WEupZ3idjDghCm6ocqwsMLYL9Hqzbha0xGxQ54Q
	qQBrNN4RiSEGNfvqHciYC7wpgiJxXkJXPIws89gKx7oT7H0uZ/1L+jHB+OiG8ozhgRwn5xF+RZkAT
	H+OYaztDgYmHdancSRPSoS+E5EFSgD3eaPYLF3wROuhMl4weMFufWwBhJycmbXiyCAAGBrPnazOHA
	ZTb2L7BVoCOFwabPACPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLX-005PWB-TE; Tue, 18 Oct 2022 09:57:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKo-005Ol6-Nq
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:56:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2770240014;
	Tue, 18 Oct 2022 09:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sdgccbpHa+g3zogKwAbu/O/n6bb75oAZ7MRscSW22E=;
	b=JHLcgFzK6YP0A6jWc1XxIo4iH6XiZXHWhE9DbmL8sBS9TT6+zENJBif0SNVaOscqIKAk0d
	WKSPrVSceC7ukr6LCZxa60ATVVZN0y5y7oFCFSMrQybJlyIQNC4cOM+nLz54IYdlDPLSFN
	3zpdocxkCBm7axEvw4J89fbyH2abIIq1EcL8s//6h64xs6QoVuffXgTzQmpbFRekSFmn/k
	F4QxQ73xdTcRt+hNKXV/+NAMRedPuc3YiqZE7glDschYPRwLoTjctSuwmaU7Pcsi71vpUO
	Cgcc9cOdSQbw69CFxhW9/iYfGHyp/JmHc73CsyarVBrG+PYe5AY54igjWQmuSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ray Zhang <sgzhang@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: mtdoops: change printk() to counterpart pr_ functions
Date: Tue, 18 Oct 2022 11:56:24 +0200
Message-Id: <20221018095624.543287-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010045549.2221965-2-sgzhang@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'de963c06fa578cb699505b26d7985fb2894372ab'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025630_933977_8C80A20D 
X-CRM114-Status: UNSURE (   8.18  )
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

On Mon, 2022-10-10 at 04:55:47 UTC, Ray Zhang wrote:
> To comply with latest kernel code requirement, change printk() to
> counterpart pr_ functions in mtdoops driver:
> - change printk(INFO) to pr_info()
> - change printk(DEBUG) to pr_debug()
> - change printk(WARNING) to pr_warn()
> - change printk(ERR) to pr_err()
> 
> Note that only if dynamic debugging is enabled or DEBUG is defined,
> printk(KERN_DEBUG) and pr_debug() are equivalent; Otherwise pr_debug()
> is no-op, causing different behavior.
> 
> Signed-off-by: Ray Zhang <sgzhang@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
