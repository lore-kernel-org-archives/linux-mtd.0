Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46465C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fj1y6cX0o/5/+Fh0edPmc3KttaPab3vZXAQEBw4vIWY=; b=nmepoE4t4njkjt
	M0S5dviNq8Wz5vsgwoRySS2guy3Kokbh6o+LJvy7wvP6W+LIX0OPFBQJbnNNFKsyZlQZsDWAFEaf8
	M4B4godPzFZhNiadxYuGi+rE2BoFQpxPJfPIsrNv0oOg2kNM/n4QzTAz0At+/GXSOAY+H6QpoxaLb
	rQdqha5q6i31AU+ShVEGV4srZuGGRGx6xHMlUwy7V1tjsrHulm1/40CGwC12CetGXJFPonB1vCKDI
	yoLCtWnRMYEk9wEUlHm4aVvvkGMcBfKzsL/CkYQhQ/WQ3Ekz8YPcZuzKgJJHfO/5ROWltvf0TD5ux
	2YEeCVj+zltxTUX7Fj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W2s-00BVa0-LE; Wed, 29 Jun 2022 11:39:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W20-00BV7M-6n
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 11:38:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A0C42000E;
	Wed, 29 Jun 2022 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656502725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQXoqYCgE7EIU42/zVADHV9fDPsxC+PutcvlEANepEU=;
	b=SfTLG3E+wEsfzL0Rw0KxGQptxA0ZkMjSeOj50QLWd1IHA+fIQpXH6hqJNcnj4/GdTBfrBY
	rElrXwP3avkncWwuTdDQ/yeJ/hunIJBcNv26lnzjwXQV0qwLA/+p2C66Hx58UWGePGKQFg
	0I/BJvEhy4VCR0NqNVFikj3gkWHpGEOz5/q4Y/LhrU6BjUHmpxH4AdXzHZQunHiOTArtgD
	hi3KgDoFywlbdS3APWu2bt6ckhN9s1AS4GnrCll6c+0GI7Lj/0jMe66kiCnWRF7SksOh9I
	ZlNragQsLwETXTzc60g2FHYlUbYaROG5YzpKXbSKN4jZ4u6JJCiyg239mnAIUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jens Axboe <axboe@kernel.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?b?77+9ZWNraQ==?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] mtd: core: introduce of support for dynamic partitions
Date: Wed, 29 Jun 2022 13:38:43 +0200
Message-Id: <20220629113843.283665-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220622010628.30414-4-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ad9b10d1eaada169bd764abcab58f08538877e26'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_043852_442938_68A78770 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, 2022-06-22 at 01:06:28 UTC, Christian Marangi wrote:
> We have many parser that register mtd partitions at runtime. One example
> is the cmdlinepart or the smem-part parser where the compatible is defined
> in the dts and the partitions gets detected and registered by the
> parser. This is problematic for the NVMEM subsystem that requires an OF
> node to detect NVMEM cells.
> 
> To fix this problem, introduce an additional logic that will try to
> assign an OF node to the MTD if declared.
> 
> On MTD addition, it will be checked if the MTD has an OF node and if
> not declared will check if a partition with the same label / node name is
> declared in DTS. If an exact match is found, the partition dynamically
> allocated by the parser will have a connected OF node.
> 
> The NVMEM subsystem will detect the OF node and register any NVMEM cells
> declared statically in the DTS.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
