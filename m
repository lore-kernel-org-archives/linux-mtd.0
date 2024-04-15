Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B907C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE03uKmleoWcQcWupsT9HMR9k6Tyx8Jt1LhtbC7vU/g=; b=Qzdr94yOU3GZah
	3jsxxFJSi8tzX/0szikvUwa4+aYbmj4meJu7DbCcsNep89jR0v239iF/eYkp/R8KkyV7Nt+Kx3tR+
	uY2xgHrpjB6DhPdMEk9+35sBH47yfHyQtVlJeihHVhZ827quLCnX7vOcXo3cl/dsAO0y0n5YpgHbe
	YYfYdvd72ec+NYTtQBZZiE6mmImyKE5XqpFS5t1u7E/FkQSErBwvvnz7t+oVujzOQjgMcP+fnhuB0
	bkR4IELMphNZjczks4h1ch6EJ+j1gzD0SF7W+iHAnhNHIY8Gqm8BeVlZnt6qWlroo2P+JEElzahAI
	HELTRafQ+aaeovuuoMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJF6-00000007oVU-0Dek;
	Mon, 15 Apr 2024 10:07:16 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEz-00000007oQw-0FKz
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 10:07:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F31B560003;
	Mon, 15 Apr 2024 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713175624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzh6KDR0h3E2eLm0JI3eKxgZxPnuJOrm7c/ie9flbm8=;
	b=VeIeYz1HQNTmCzsI6Fi1bUuBwGsHemZZrrcjz152OK1dAtDiI3UqF1TmPNHbrfFFum4gOL
	skLSAEVI4xYPRc9lIFdoPJmw0VLf+6mtaqEMLAV2yN3LqVzTVeMu+SluWoPdG+pVWME832
	ebZVHsdToNqrys6A6xxzF1GmSkIXLLJ7KFRW+1znKJYYy1+WzcS9zElrnYG6yCYmY1jzGK
	ztkLfRUCkEUQRn+0T/TI9LS8uVA7dq1851e1h0t7PLmmQWi7dHTewFgZKk6AoiR2Snd8im
	JSxUyE6dVKGRJReYEabKOgFmQBLJGuKnziRW3g1CDdYGiQwgGarb/pJ/4cBeaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	linux-mtd@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: fixed-partitions: Add alignment properties
Date: Mon, 15 Apr 2024 12:07:02 +0200
Message-Id: <20240415100702.32115-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412153249.100787-1-sjg@chromium.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd8d42d47a9ff9a997abccab1e4ebffe4fce28f32'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_030709_260451_AB742B31 
X-CRM114-Status: GOOD (  10.65  )
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

On Fri, 2024-04-12 at 15:32:48 UTC, Simon Glass wrote:
> Add three properties for controlling alignment of partitions, aka
> 'entries' in fixed-partition.
> 
> For now there is no explicit mention of hierarchy, so a 'section' is
> just the 'fixed-partitions' node.
> 
> These new properties are inputs to the Binman packaging process, but are
> also needed if the firmware is repacked, to ensure that alignment
> constraints are not violated. Therefore they are provided as part of
> the schema.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
