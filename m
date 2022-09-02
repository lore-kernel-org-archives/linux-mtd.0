Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDA0C38145
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Sep 2022 14:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOHaiKAZ23MhXvleJOiZKxg2DM8U2HY0MRhmqVUH/8M=; b=HxPzw2JjI5dHz3
	4lkZ5aOBkDiaeVoTLzw+AaMqWC+O9hdwHncO7ZDmmh+ivo91isi3OqypLv/VYLvcm+XmV+GowEYS2
	eskh/GpEukcEqGUCuifhzx+TYDTJQqH5qPF4QsjdB7PcH6pRKheLq8Uq6pmyPdpN0oGY0fSyXGrgn
	YJKPtlFpjqF8oJh2GV4p7FW1AjUoEyu3cNUHc0iJ2icEbJSob1UG65zfZcc9GnnMbBkDn12g/R5dk
	9yxmpAcKd9rolrC+/nBmR3jTdPxrpKAMdjbFevSTWicIXaycpAFHsg7d2s21nGgl+jrcg9H46Y3rP
	Pbta6qSXi+49YZS1/VCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7wR-005jQ7-QQ; Fri, 02 Sep 2022 14:46:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7wF-005jJm-Jv; Fri, 02 Sep 2022 14:46:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C807616A0;
	Fri,  2 Sep 2022 14:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C26C43149;
	Fri,  2 Sep 2022 14:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662129989;
	bh=twCq4L5d3vlzAeCsNCl4PJSXLjKOaJZ0A4O4iMXSBpo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dMg4a4KMo+iHy1mOVMxe1pxd4INzedd3EJHWfWCuLtDIi7OQczgSBWgspdACa0dqL
	 uuCwCNkaEzR4O6aUADzYVuISOlWz1TGhGbKTfauoJ5pX87mqUgfNqlBP6+AOlbwjzP
	 9lSxWVv7uc8uh4MWBU3HkU2Q4/dY41MpUVTTdUWICpwY+wxNunuf5JL8era8+OyBDe
	 D0A9krV8ySP+8c4aU75Y53eX7wwR74P+53s42L7riUFIcs93K89FVAKWZweV6YoEkM
	 TyLzeGJJRLMgqNDj+GJ8iq8doXQgC4fnWqrKKmgOU8Jp3yI+kmQCL6FuY6WQTLBeJn
	 DC6aKQ0Zcp/CA==
Received: by mail-ua1-f53.google.com with SMTP id s5so888989uar.1;
        Fri, 02 Sep 2022 07:46:29 -0700 (PDT)
X-Gm-Message-State: ACgBeo0doDfPdVC0e6v1sL0NCpQs9bubDwdyrG/5y2sHlrbF9qoRuryI
	TvC1e5tCojwLPGivok0+lb7VaaZmcTJe0aZ9VA==
X-Google-Smtp-Source: AA6agR52Kh0Dbhi3VztuJbeK42EbCe4sUJNFg+rKAUbLSf4r+sTjrEN5l2h5PdQUIkLNHkfWz735OBuroaDYeDSvV2k=
X-Received: by 2002:ab0:32d1:0:b0:3ab:7f86:2121 with SMTP id
 f17-20020ab032d1000000b003ab7f862121mr267135uao.86.1662129988100; Fri, 02 Sep
 2022 07:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220825214423.903672-1-michael@walle.cc> <20220825214423.903672-9-michael@walle.cc>
 <20220831214809.GA282739-robh@kernel.org> <60308ba420cdd072ea19e11e2e5e7d4b@walle.cc>
In-Reply-To: <60308ba420cdd072ea19e11e2e5e7d4b@walle.cc>
From: Rob Herring <robh@kernel.org>
Date: Fri, 2 Sep 2022 09:46:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFf4Op-4X0_4CF9xKSCLwrWBEYQ6oe3MgAKs6rRRUDng@mail.gmail.com>
Message-ID: <CAL_JsqKFf4Op-4X0_4CF9xKSCLwrWBEYQ6oe3MgAKs6rRRUDng@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] dt-bindings: mtd: relax the nvmem compatible string
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Li Yang <leoyang.li@nxp.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Frank Rowand <frowand.list@gmail.com>, MTD Maling List <linux-mtd@lists.infradead.org>, 
	devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_074631_744320_0F74A038 
X-CRM114-Status: GOOD (  25.85  )
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

On Wed, Aug 31, 2022 at 5:30 PM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-08-31 23:48, schrieb Rob Herring:
> > On Thu, Aug 25, 2022 at 11:44:17PM +0200, Michael Walle wrote:
> >> The "user-otp" and "factory-otp" compatible string just depicts a
> >> generic NVMEM device. But an actual device tree node might as well
> >> contain a more specific compatible string. Make it possible to add
> >> more specific binding elsewere and just match part of the compatibles
> >> here.
> >>
> >> Signed-off-by: Michael Walle <michael@walle.cc>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/mtd.yaml | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > In hindsight it looks like we are mixing 2 different purposes of 'which
> > instance is this' and 'what is this'. 'compatible' is supposed to be
> > the
> > latter.
> >
> > Maybe there's a better way to handle user/factory? There's a similar
> > need with partitions for A/B or factory/update.
>
> I'm not sure I understand what you mean. It has nothing to with
> user and factory provisionings.
>
> SPI flashes have a user programmable and a factory programmable
> area, some have just one of them. Whereas with A/B you (as in the
> user or the board manufacturer) defines an area within a memory device
> to be either slot A or slot B. But here the flash dictates what's
> factory and what's user storage. It's in the datasheet.

Ah, right. Nevermind...

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
