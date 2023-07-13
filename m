Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD4EEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWkby1jNosyqNc4dANrpqsMKITPNkj9+DULWcYu0smA=; b=IunbE+iUwMKI4o
	xzLOkAcy03wbqSM1vy6dMp6IHGKYIXifDHeNlFwjXDtU15M5Y8BPiZPfoOqhNlf9tmQ/issXvqyqk
	Sp/F9xnPPTQBW82sQn0P+wKIRl4CC7/jZtuYf+VGzrocdnNRubm+3wUaoUXyOh1IJRvyfrOixnPAS
	c6jS9DdypaTXCo5zM7lQQWcakiR50x5jRkQaQBITl4JcObYbZUptdzQyV6c7CkqCJgv2MLAkOa97M
	LeyW7/TDpa0qW1OnPMDFYBVPKYqj1PS1VPZd8+xoBEUvfvGrE3ntaN21GOwFlvldtt7cs4dulZD7x
	LxvCPNqXoglX0r/oN9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD6-002JU7-2H;
	Thu, 13 Jul 2023 07:58:00 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrD2-002JPm-0t
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:57:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D0C76001A;
	Thu, 13 Jul 2023 07:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E2rrTKML2PGQOGjKRFJnjSlB02Tb+RkYO5UuH5F+OIY=;
	b=o/XTxi1GM5jS2d9tzAqYxdPkYT9V2v/d3KPILatQQ6cN0xfi+gq5zfL493O1NbRZF/NU7w
	A3sfWXZjlrlyyRZYL0yE2w0WPDGi/DYVNsfNp1t6b2n1eDYqrWR7oERaWYTSgcBq8Vv7kB
	WpxlMVMWOcijVUiWZlSDEIMk2ZAvRbAQ5o97XFESzgivgXlq+boYzSpf6WfIse5Y/jfUP6
	hdmWx9+Fjoe52Q9kMMi0PRyNY9wR1kRtGTxnrpVYVVJkdpznHrw5Ub5J6FUy5MHnfI/IGz
	Eu/Dpmg2hvWyh1ZziaKo8jm21xPlf6zeCdsn+ie8MAkjH85eIWoAWqxbdvT08g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/18] mtd: nand: omap: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:57:51 +0200
Message-Id: <20230713075751.486075-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-12-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2ef5fc30ae167056e7d9a92fc854f0741029fa04'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005756_462074_DD5406A5 
X-CRM114-Status: UNSURE (   5.83  )
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

On Fri, 2023-07-07 at 04:06:16 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
