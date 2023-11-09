Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312B4C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i2J6IJGtut2F0TE2ardQma959jgftoxXZCH5CpSjD0=; b=LVsjaTTboi1uX+b29GEHzGvnUB
	ByC0VIbbPH9pycOvcqwWWdIWxUWLsPgbCwfeQCx2ChP1zMyCyOjq/9g8qS5ljXpqDHrR6Wn+8wKHl
	vBi2vY0UD/ZKLxOBh2vRQ1djqcja0JfOTAXpmx/olc70XQ6ZuSilXmnDdhiJezsdT5zSQbCFhnoXA
	qh9gLXxKq+q9I2ykqIyi/31h2NSr3DvEW0aR+rFQPrRRIU7m5pvUbNymC/F/OvnBtX4EmxBSpMbrP
	aIDTIFt7Fm/NpvzAOD1GnVm0m896CxvUimlm4bbjKOLnq4vWS+cxA1sArkhufVeftJvdvKmhSXdpz
	RjupBEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10v1-005hrp-0u;
	Thu, 09 Nov 2023 09:01:43 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10ux-005hoA-1t
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 09:01:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8B23D3D5;
	Thu,  9 Nov 2023 10:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699520493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxMbcY/e1xBdm1kHqpKXU8h0D30T+AAVfHqRvOCfn5Q=;
	b=jPRanmdocpUy+Igu7sQQ0R5rxTsdnpZcqlsPMScXjYE866CZS5STgv4qlQDPLhKDvqCLqG
	5n9kCo/nT2ow3PCTgyxiriqy1LilBZ09dI+WesSJKes0mI0Z4zSNi8g5YyKuBAI/Vg3lQK
	RuRvMEpd79uqTCPQQYPM40JZH+AEojNVtGjz36LlR8rY3qNXoU8PCKWesfeStMMOuoqtsX
	LXzN7dO+SzGII2JFOhEgVV0Qm5SHsqFcuT/5ayU+rxhP8wZsuKi4dddmAVAtPAFrnXgPSE
	uEst/NlxHTm7tihAj6lPtSNVrYdXaqqlAsmJ/K83PoZI23SkqSGpQxeZ9BWCZw==
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 10:01:33 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
Message-ID: <877590a5e3f8c32ec0a032385049a563@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010140_246434_696EB9A2 
X-CRM114-Status: GOOD (  14.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Biju,

> As per section 8.14 on the AT25QL128A hardware manual[1],
> IO0..IO3 must be set to Hi-Z state for this flash for fast read quad 
> IO.
> Snippet from HW manual section 8.14:
> The upper nibble of the Mode(M7-4) controls the length of the next FAST
> Read Quad IO instruction through the inclusion or exclusion of the 
> first
> byte instruction code. The lower nibble bits of the Mode(M3-0) are 
> don't
> care. However, the IO pins must be high-impedance before the falling 
> edge
> of the first data out clock.

I'm still not sure what you are trying to fix here. For any quad I/O 
mode,
the pins of the controller must be in hiZ during the data phase on a 
read
operation. Otherwise the flash couldn't send any data, there would
be two drivers for one signal. So being in hiZ state should be the 
default
and shouldn't depend on any connected flash.

You've mentioned the micron flash which needs a '1' on its hold/reset
pin. I would have expected a fixup for this flash, not for the flash 
which
behaves normal.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
