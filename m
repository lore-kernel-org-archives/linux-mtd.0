Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7B0C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDsqt/uBKBqeMtuanhuH+Fo+CooRUD7OWWc+bpjoWKU=; b=a3uOvxFX361+9W
	HlCv7dwnK7w0+nQnXB45tnjAa7FP73IGLZQ8egs/m6aGKDAqRow2s2FO96AXvkz80COwOtOApwOT0
	mh7qvpB0UpDTW7PP/T2riWPy3oTwxTPSo6FXAGqbEioDlWW2albis7ir9xCNnB4xLAB95ZbnFxtz1
	WnWvwHlARo+wg2QytudfbBs7SQtr1+Pyp9S672rOlRIwZfXzUc0eGh9fTiGuPeEWmO9N3B8MK/o0a
	eaMEQEsmUgU/HyLqcNAT/77f5oLL8DbYzsgf3C3ZtKyr849ekcSzpfkpMjmKgOe3YT60UKSVDS9M3
	5Hq5/1X/ckVjdbjYyZoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAC-000000009RT-0MVh;
	Fri, 23 Aug 2024 17:33:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYA8-000000009Os-2F57
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:33:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD232E0004;
	Fri, 23 Aug 2024 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ilACbOsegEYw+lBMnWMXh1/9ZyigT+kDzQKGVXWORHI=;
	b=DvpcqYDe0fQuJYt4lytCQxrM0MQnDnY3KrQ7NX2eiRJP0We4t1QemGU38UdLhRXIxxYobi
	CrMJCXNWSO/Ftqk7gG1mdbilpZJvIDCy7dWhHTtuAO8vpBlCqvCNoRVt8lSY6m53xB9Mzb
	e6jmm3rqPBe8rvpuZgYiDNhrBRnaTeHL59Mmj0fpeVwkpkXEYEi1WKwkYxCE+nuynVjUTc
	y2jyJmM9w8z25hKKcC2V1GLUgfCAj1YG7NzR5MSjIL/+eBnRTkZsUFMFdYXD0cc/qjvo4f
	4AtcMagb36jY1XJHh/4OB1RyySPX0wkokZEWAYewI/t2I5il73Jgjd3iPt/xuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yan Zhen <yanzhen@vivo.com>,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v2] mtd: concat: Use kmemdup_array instead of kmemdup for multiple allocation
Date: Fri, 23 Aug 2024 19:33:20 +0200
Message-ID: <20240823173320.441765-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823110824.3895787-1-yanzhen@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'175086cf4acdf4ccd3d7a6bb5c5231ececd6656b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103324_904037_81FB8D98 
X-CRM114-Status: UNSURE (   6.38  )
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

On Fri, 2024-08-23 at 11:08:24 UTC, Yan Zhen wrote:
> When we are allocating an array, using kmemdup_array() to take care about
> multiplication and possible overflows.
> 
> Also it makes auditing the code easier.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
