Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977FBC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYs4ZjiAn13HFZu9sOTcEGnidK19c2pcZAZWUbwhW/k=; b=KpLP5yrLpfFsgR
	ojV3ssG7yNs9aYpKY9LqLrprBFrX/5TcWJe8UjxSbXsT7qvLJ0k3mEjAC+QsHhfyQO580xumJwZuA
	NZ5dkzdUwClOLmMtGMO8v4LuCV6vOqs9eI/c7NvVeUsLCl/TwUHGTDaqD6onVyUxw0ZOfHkI07Gpt
	tt8rtggIhacz1i86ke2D43RTPUKVS2bIyDnFS9udjLRq0J90TxRp0R5AAa5qmrVAzqrVVUZaRfEp3
	86TT67vhLRYDtOqVp98UKnbLv8DDONj6iRU1znd9D7RxsVwlkQzYw1krP5nmKYGOigKyj6H5xIqqC
	eE7r13t8MpWJErHfnuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZKj-0000000EqoN-2FDc;
	Mon, 27 May 2024 12:20:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJl-0000000EqAv-1GvV;
	Mon, 27 May 2024 12:19:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18FB8C0008;
	Mon, 27 May 2024 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHNpEdPAzLabYPq0SKzj1VaD6s28qVaQXn92xL+zHtk=;
	b=chXcKfC1F14nrThICBClXHAqo6TG3TKiMQu4Vp82sTG/R/e4KEhWbct2POcDlWTucShJdO
	XovJzQzhSTsGTSEKM+O6EI+9fPO0+VuYKcB3DA43S493y2Ld1bg9j6Z6utpafbIci0XAcf
	tfa2c9qewL2WHxqnCL+m+wmwKncTLjVBqIQxy9+6qvr/EQEuxbKOjdmJTF+3EbzON7wM+I
	YZ52a2NBYviI2lFZo8w7ACY4RbslMXqG6nSu0ND7p9lv8b+b5zTTg1b8Hf4ow4DHhzMPgd
	6/LFhFf9kR0C3HHBnLvZNZoef1tQOho4HWMoHIumRh1VoinHtbX+DYhJ5gSEpQ==
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
Subject: Re: [PATCH v6 1/3] dt-bindings: mtd: amlogic,meson-nand: support fields for boot ROM code
Date: Mon, 27 May 2024 14:19:05 +0200
Message-Id: <20240527121905.178683-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507230903.3399594-2-avkrasnov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4e976b1521ca5e19fc2c0ba2bae0b97877ad0ef4'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051909_622598_DC554AED 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, 2024-05-07 at 23:09:01 UTC, Arseniy Krasnov wrote:
> Boot ROM code on Meson requires that some pages on NAND must be written
> in special mode: "short" ECC mode where each block is 384 bytes and
> scrambling mode is on. Such pages are located on the chip in the
> following way (for example):
> 
> [ p0 ][ p1 ][ p2 ][ p3 ][ p4 ][ p5 ][ p6 ][ p7 ] ... [ pN ]
>   ^           ^           ^           ^
> 
> pX is page number "X". "^" means "special" page used by boot ROM - e.g.
> every 2nd page in the range of [0, 7]. Step (2 in example is set by
> 'amlogic,boot-page-step' field. Last page in range (7 in example) is
> set by 'amlogic,boot-pages' field.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
