Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4FAC6FD1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OL+03fk2ms5LsccJ3DmePIGCaa8eyTc0sOH7flYZ0FA=; b=3O/0mmJz+7HHT0
	grvRLEkB/YpPM9uOJrGg5s1m43F5iWq9mm/JPtQUZklSKtnE3SOKYLL+OILPc3z+4LT2hAcdWCW6g
	/CCdJenxrstFuDxWaPXrllhOtXyvJ9W1v3apdRfHRrJw8KigzMVEsbY4M/2MXUiuIHl2Qy3xNS5pL
	zFHgF+op/hbPm33QS78j5XTAtJSEo5HkrB9Wetpd5DVsMnaXvjymCOG4lG9wuCE8VZkICg93byAiq
	zp6oJnWeUBLYWz9smdpjfYjnlr7/TJasonGKR/9nCXny0QhgkgqSDj5JOyX5/y7yy0888mFb9oOGI
	NAAdwC6q46HWBIpP/hUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcuG-002DlU-55; Tue, 07 Mar 2023 19:23:28 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcuC-002Dij-7K
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:23:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AE11D60008;
	Tue,  7 Mar 2023 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2N/abUanCxXFPJMOTJSIDunk7kfGYgL5y7ARujmw8YM=;
	b=iQWBdhNbb6ZtrxYjR54xdhW8CAGAHCTCto2d3goGMIl9SU9Qnls7/rH1nwptMaO/FBe8nA
	Iw5iqsOX4PMuxFY6+9lNB0zzc8Wgvd9sAlo4REdkpJJRBFqDYAO1yQzio3TqeQVyYnxLCE
	jUo76/oEiwV0j6gR+uZaSX9WqvrERWXJ7L/84/KU9CzZXPoTUgJULy4fEGvjbBpcwfJkSn
	YQXbhlXBiI7i2yoHmRcp7FvuTa52oK+3mNpNmq5Ekh054A8/H/hgtWj6j/L5BTip1OXC4S
	2PI5Gwqs50hj/fMmhGe095VbOyQ74I5Xl8AQzsCx/wsOZl1ZFWZZgDnl54SELg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: core: fix nvmem error reporting
Date: Tue,  7 Mar 2023 20:23:20 +0100
Message-Id: <20230307192320.353633-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306125805.678668-2-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e02b3f832618bb0f7d8868b2e73aabe7f61d2a28'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112324_417504_5D300DB9 
X-CRM114-Status: UNSURE (   8.62  )
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

On Mon, 2023-03-06 at 12:58:03 UTC, Michael Walle wrote:
> The master MTD will only have an associated device if
> CONFIG_MTD_PARTITIONED_MASTER is set, thus we cannot use dev_err() on
> mtd->dev. Instead use the parent device which is the physical flash
> memory.
> 
> Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
