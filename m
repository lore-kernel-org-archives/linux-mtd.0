Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A6BECAAD2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 19:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GIl8prklcUuhKQlb+/vh5H1+WM00ISajv2i7kvFOkc=; b=XjkWT/QIo4pkvC
	cIH+wfJIqMy2DTPmmmf6UupuRHkZRc9lG78cq7INRtyI34tThINHA0vEzfmg11TiTFnoqiQGXYgqE
	xV/pUYzJcgR1UppTz3HP6i925pFPvFOaayMfC+35ECDb/a+OniNRp8I+DeVh9sDbYL9Ro9MoUtIt/
	DaoDPt+xaZwVephxw+03hy4EJzBvk1WqiKrSScn/oVGS6KY4bb4BwH1Fzuz833m7tb9mJotJP3gxy
	qU0E+XZCU5sNd0mPzhKIVNTxoi6OA6+BnnDXOoMlf3G0Q4BWAHocx8KRpYbf0xSsaqiq0of9LuGw8
	PiSZRByR2Hb0MCfwIyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTqGy-00EN7h-H7; Thu, 01 Sep 2022 19:54:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTqGn-00EN1A-M6; Thu, 01 Sep 2022 19:54:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3076061C2F;
	Thu,  1 Sep 2022 19:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AE0C433D6;
	Thu,  1 Sep 2022 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662062071;
	bh=YH1Y50y+aIWGJPESEAGpE11vQpdK/FiX3f4PxACu/lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e190hmZgGNV2kzXNTjhOh2R6yto1hDszS2MYqhvM6ISoM0OPu9sbZ/iuGKKqgyNya
	 MQcWNnE74qWqj5l3/Pi2imRO4m7CZwKvlxpXfhITNrBKwLhMW7JWqnU/188cyR8NHY
	 /JM/oj6AKmbanv/4zUjhtU3ArZoeyjN8ddZ1T7rQrWq+83wlHMnD1FCQT+IDssDR7N
	 vGyp3L0v2aKmeeiu1iV8lKCw3VMcKLceBJYxNU5Sh5+kmhkcM7tIhDelv6TlOGRJSz
	 b9E1wcKKQbl1OJbrMcEUQxxxlf47tNK/0CziKvOeLe1DCfFJ4PvlqxGtVJoZ7kL6j1
	 Gx2rxo97L+EOg==
Date: Thu, 1 Sep 2022 12:54:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Frank Rowand
 <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v1 01/14] net: add helper eth_addr_add()
Message-ID: <20220901125430.5dd9e586@kernel.org>
In-Reply-To: <1682967feab905d06402d0f8402799a8@walle.cc>
References: <20220825214423.903672-1-michael@walle.cc>
	<20220825214423.903672-2-michael@walle.cc>
	<1682967feab905d06402d0f8402799a8@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_125433_810310_4CEC1320 
X-CRM114-Status: GOOD (  15.83  )
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

On Thu, 01 Sep 2022 18:26:39 +0200 Michael Walle wrote:
> Am 2022-08-25 23:44, schrieb Michael Walle:
> > Add a helper to add an offset to a ethernet address. This comes in 
> > handy
> > if you have a base ethernet address for multiple interfaces.
> > 
> > Signed-off-by: Michael Walle <michael@walle.cc>  
> 
> Would it be possible to get an Ack for this patch, so I don't have
> to repost this large (and still growing) series to netdev every time?
> 
> I guess it would be ok to have this go through another tree?

Andrew's ack is strong enough, but in case there's any doubt:

Acked-by: Jakub Kicinski <kuba@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
