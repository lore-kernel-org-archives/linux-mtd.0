Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBDEECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2eQr225XD8RX0kU4Xd/YNXcQPcn3YmCv1O4ODOCdYo=; b=hWg7sgEagriprVegyHa8DC2JK/
	GawPPaX7J0o5YKlXprycXRrWMgIVjcIeCXmIcfcidK8wFBm6fGIdmZKhAN28vrqnVOtSp8fWET4Uo
	r16QWeidkMl5ESlMJeQ+kH525V/XPkupWAcgs4Q7zi/Up5eb7GdAT3E0qwbHzfcJk9l+8f50nOa8e
	tOvzIMkyeZyjK3gsqbD+QLXdXrO7D9GdUGAzJoj1Q5v4m5J9OdtdjI536eaV1vVyEI5AirUYU0X/K
	DCAboEYBMgBZvXpqK8D+U+QWU/fNR2aFhQwwvwhXg7q+rql50K2WjDYLoeR1SlnskuJsjuFmsI3oq
	Ty6cNJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTn1u-00DKyl-2h; Thu, 01 Sep 2022 16:26:58 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTn1j-00DKoT-AU; Thu, 01 Sep 2022 16:26:48 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B09552010;
	Thu,  1 Sep 2022 18:26:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662049599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gPdcOh3G4Fq/gjmy/s1uDpAvkIPiHNCGi2EGHEAcyY=;
	b=Fofb2XGmbZsoPEktyTm7ZjLRg5BSQN5fYg9SGZPjPaYM3Tk05GsaIIDNquFWhF4hA/Z8g6
	6zId/e4zbLxzIqt6P5s/5YNMRF0gtp4B+/1D2jUVEbj4MM/b7+0fFGcaDgqIENGXRbf7j4
	eDxVq2MNtDbHaPfljkJCVe0c0S9Krnu5y+0SZn+TNuOafbF/sp/Tl1y0be1Y6ofYCz4OyD
	Pjl+ZTgWjpYGVpwBWs5xCbRCn55U/QN/5MQnl/K4UW6EcH6foEKPM3Szkj2i4jasc89jKx
	lLtPodBoFDoh4i5itaaFZsiZ/o2iAPLdHPMI+viYKe+BQgjKyKo/Ys8MrOYpng==
MIME-Version: 1.0
Date: Thu, 01 Sep 2022 18:26:39 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 01/14] net: add helper eth_addr_add()
In-Reply-To: <20220825214423.903672-2-michael@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
 <20220825214423.903672-2-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1682967feab905d06402d0f8402799a8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_092647_584975_D0FD5C79 
X-CRM114-Status: UNSURE (   9.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi netdev maintainers,

Am 2022-08-25 23:44, schrieb Michael Walle:
> Add a helper to add an offset to a ethernet address. This comes in 
> handy
> if you have a base ethernet address for multiple interfaces.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Would it be possible to get an Ack for this patch, so I don't have
to repost this large (and still growing) series to netdev every time?

I guess it would be ok to have this go through another tree?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
