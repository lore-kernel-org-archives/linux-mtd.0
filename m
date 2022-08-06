Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBFEC19F2D
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Aug 2022 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjThXGvUB72MWcBCxyIxv0UCIwHcxr9nc7EW4ECA/b4=; b=pA9azBfwl7REOv
	wrh3JuvzlgXJEImHteUiJKQcljjOXMWVyVySmX6eAXpTQJtjoeRx6y5eG3YFixL4suhhbYbTrnydi
	c3a+eesUcKMZ/vjU+e9L8cQFSs8Qpk7xQeZKoX4NvStUn0Ep2GTIEQf5f6SKyK2wcrb8AaA5at+Be
	OdvRP+jNPlUqGWAQBIHgGX/x4Hmi9GOqwxZl5qtu36YBvclmW9nnNMlDTAFto7EHZN2y4SQy465Cr
	glTwwFSbZOG0RuwaYWa8aPqw15oXWdQNeVB7S2+ZpPl+sOJzIhBo73bLVeVK2W3+5UmlnEsyZaj1i
	Cl9iT2RRvA32jr50WHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKLdO-00DzjQ-Mf; Sat, 06 Aug 2022 15:22:38 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKLdL-00Dzcp-DS
	for linux-mtd@lists.infradead.org; Sat, 06 Aug 2022 15:22:37 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B9FDC5C00C6;
	Sat,  6 Aug 2022 11:22:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 06 Aug 2022 11:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	tom-fitzhenry.me.uk; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1659799351; x=1659885751; bh=XPxqbORER+
	pf5AS5qXf2rHLCpeovhwPPoo5hE46MpnM=; b=SEc6iCjHYRcnbdJqr1ydWT+eDl
	KuExI256Lu/DeZQ3fveCyuDlEmCeLg1aISDGO90U1hC3xgRMoik9zKzkkYW3vTZ5
	j/QTtUlFIOaZFsBDtzj7nHGRTawfViZ/+zsfP7IS+NjTWqOX1Alr5zb5Jz9/PAzb
	jWzRYZIaigHpjcVOulLrLCjiaAOV/FcG8ilR4KY6ZNV6h0UE5vLAbD56s8cYMjW6
	mWzaFsDetH1arWaVW6zR78z54ewAL4CdSqMzpiDbDC8tLL9smZtd96qHBVCin24G
	37Yp+OuAy/x/AuR5IKbVGlsqlaBg0GUx5rF3GFSWpwjKtHGYEU+lXdxk0Vng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1659799351; x=
	1659885751; bh=XPxqbORER+pf5AS5qXf2rHLCpeovhwPPoo5hE46MpnM=; b=t
	fmgFpQ+H8P+42rxnfLVpfZjJxRc4T0pzLddRt1RxZQNtORxr91ves4hkuIyOthEI
	MfbBd6GI2beqgS193r8+TO0Nxki+f8vlOQbMure6rknD18A/806KheFE+R+rQf10
	Womvg+sb+qj5Z5t0afnJjG+ZhmvV0qLg9hc4bmY4ef7RDkcSazlGeGk31tQ7d4jm
	c4vNGIdj3c+bZnZzbc0YdHC9jz2Qj3y+H+aBKca9MRymWq3wVNEiV4nV2VHkPKys
	+L8CGwgfSPhLcvDLGJ5UnuagfzJ0r5xc12EVAtSwBRlpD07in3x5mWUspvXldGm1
	v0iX7BbWFhZpshvsj++Yg==
X-ME-Sender: <xms:NofuYs-f7mkHz28doihk4T0V_WiDIPAVcSHmcJ87j6ZfSCJnJsA39Q>
    <xme:NofuYksh-JoPHvwVkzO-0oNXJJKwxpEN3hg3UiHH0Hd1GNAvaNQfeud2U2GNY_PNQ
    KEcpRnb7AGeHrdLMQ>
X-ME-Received: <xmr:NofuYiDnE5wzfwn6owBeDBJ8e9ZoeATVB07DhJj5BIeKhZm8TpF823BA74lx5xqHO37cE0aY5X-EzigZh1JmhQhg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeffedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvvehfhffujggtgfesth
    ejredttdefjeenucfhrhhomhepvfhomhcuhfhithiihhgvnhhrhicuoehtohhmsehtohhm
    qdhfihhtiihhvghnrhihrdhmvgdruhhkqeenucggtffrrghtthgvrhhnpeetudelveejvd
    ffjeevvdelvdffhefgueefgedtffevgeevudfgieegleeikeetudenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohhmsehtohhmqdhfihhtii
    hhvghnrhihrdhmvgdruhhk
X-ME-Proxy: <xmx:NofuYseUg2wPa__MYBoVwy8d39TDQBQI0I093hDQTLd4zI9g6VHWcg>
    <xmx:NofuYhPnaGF4U1AKpudN0WcjqsfMceaQe_c-UFpYRoq-rKVoViMM5g>
    <xmx:NofuYmkRsLlDBFfkXha6Cp77pEKKuAEAhKX3HIgrQTJ6YKSTG3vD1g>
    <xmx:N4fuYiFkc_LHQ9l0OeYJJSpGvJyQZuXBILMhy2y3NwE4YWH0RoAbtQ>
Feedback-ID: iefc945ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Aug 2022 11:22:28 -0400 (EDT)
Message-ID: <8757e6d6-666b-433f-3089-621e7c80cf9e@tom-fitzhenry.me.uk>
Date: Sun, 7 Aug 2022 01:22:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220603141603.145777-1-tom@tom-fitzhenry.me.uk>
 <dd516981-4d1b-acdc-c468-cbb14d34f68c@microchip.com>
From: Tom Fitzhenry <tom@tom-fitzhenry.me.uk>
Subject: Re: [PATCH v2] mtd: spi-nor: siliconkaiser: add support for sk25lp128
In-Reply-To: <dd516981-4d1b-acdc-c468-cbb14d34f68c@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_082235_943718_A078360E 
X-CRM114-Status: UNSURE (   9.82  )
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

On 21/7/22 18:08, Tudor.Ambarus@microchip.com wrote:
> Does this flash implement the manufacturer ID continuation codes?
> Can you read more bytes of manufacturer ID and dump them?

I'm not sure how to do this, but from what I can gather, flash chips 
that implement manufacturer ID continuation codes return >3 bytes in 
response to RDID. Is this correct?

To do this, in tools/spi/spidex_fdx.c I set buf[0] = 0x9F, and then 
executed this with a large recvbuf:

$ sudo ./a.out -m 6 /dev/spidev0.0
/dev/spidev0.0: spi mode 0x0, 8 bits per word, 10000000 Hz max
response( 6,  7):  25 70 18 25 70 18

It looks like the 3-byte response has cycled, suggesting this flash chip 
does not implement continuation codes.

> If the flash does not define the continuation codes, we'll need to
> add this flash in a ID collisions driver.

I will do this in v3.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
