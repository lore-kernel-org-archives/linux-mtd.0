Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D739AC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mcPixPHO3cY02gIxPY/Rrf7gugTR6nnUH77bNMkGMI=; b=spBqT9vi0qWJWG
	3SZr14ZECu7bJRrlFl4kzwi0sw3tjw9NBIdmMvqegbNvEY7ZxTlVfUV0JXnRYefonrX23OJVtGyc+
	eabcAD+EBBGFnIb8nLEsFYL4hhVGq1ppIXt/mlusYvwN/QYlyhwJ6qgaKoYhyCjZRv5+g4q5/i3M3
	ucjn38yKDQIwsyM6laJyrV517VA21WAB+nI6kQyBHNSn/Pk1vDJfJP5HHOERKTdRkpev0aMAe36Ys
	7yaPjUw5vyDNQJ6461ex1/IibsLw37aJlYHuRvvEaWE4ZS+TG6MZ7jRd43o54dHZg8+U//wyflSgP
	DeGGmsIXjHIvzs/Nw/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZKu-0000000EqtO-3E90;
	Mon, 27 May 2024 12:20:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJm-0000000EqCo-3Vyg;
	Mon, 27 May 2024 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H6dIIUfmUc8NO0pZNfG5eRyXQNvs/FWO1RLC4XodFVw=; b=A1kium/sq8zOdPpNUjEfrNApSh
	musOHwWbbFZvY+VAm7I19W3OTFGa8fICRzTTGBgVxX5hWk16Lk2kVXQ02K9T/7mcWCbxzyFNR+gAK
	5tP87JEOAg3gz0Kw2FNXrZyzoOFkP+H877qUBpIC8cgoAe3F8mp3Kn7PTAcbIgWzgdrmtFm7UtpRH
	LPv+FjfDLBqRdXcNKfE2af8ffHRR0cNsfi4UNQnDr7dON1cLcZSdyRbV0bsnH0dAy8bq16hc9ZaOv
	7ewrlA94jQ39Ygin8I9lQ29LoU3Uz4o0ejMQl22VqqCdCWmjOaA2SAcVWgKHG3wx2LALRTWgPnZjT
	CtD7LhLg==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJg-0000000BHZO-1Po4;
	Mon, 27 May 2024 12:19:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41DAD1BF206;
	Mon, 27 May 2024 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6dIIUfmUc8NO0pZNfG5eRyXQNvs/FWO1RLC4XodFVw=;
	b=bTnKYUeJvoYRvmmPBzaCq35Th5ZcUumDCLdE9crX1ZR1o+bgNKbq/2CzR11AFbJvlbcgdm
	MGxCR5SkzP7VnAypaGPl1udU7UaUifdomsSBGDn1cq8Mufx7XRAFeA07vW5WiLeouZoPrK
	DVNCWBqkJAtKex4IBdV+on+xvpmVWLWwDZbFz+H2mXIpFs+tg4O2eo+vnF0XUXAlisLuCn
	G9vqp5YMTQhY9uWPp762N9BDVdiVDJ5WzpTQCKP/hfwBdwaYE1DGi84DoXAAF0D/Gy6jh1
	prbL8hAmFxy5b4+l6rh4QOn3nn+e+TiUtOQgLw3ySZjJrw77pWV+uhrppcEY5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oxffffaa@gmail.com,
	kernel@sberdevices.ru
Subject: Re: [PATCH v6 3/3] mtd: rawnand: meson: read/write access for boot ROM pages
Date: Mon, 27 May 2024 14:18:57 +0200
Message-Id: <20240527121857.178627-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507230903.3399594-4-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'04a81b4f9ba1a473af7715168306c23ca4e15a25'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_131904_585777_F9F68355 
X-CRM114-Status: UNSURE (   8.65  )
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

On Tue, 2024-05-07 at 23:09:03 UTC, Arseniy Krasnov wrote:
> Boot ROM on Meson needs some pages to be read/written in a special mode:
> 384 byte ECC mode (so called "short" by Amlogic) and with scrambling
> enabled. Such pages are located on the chip in the following way (for
> example):
> 
> [ p0 ][ p1 ][ p2 ][ p3 ][ p4 ][ p5 ][ p6 ][ p7 ] ... [ pN ]
>   ^           ^           ^           ^
> 
> pX is page number "X". "^" means "special" page used by boot ROM - e.g.
> every 2nd page in the range of [0, 7]. Step (2 here) and last page in
> range is read from the device tree.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
