Return-Path: <SRS0=2WOf=VN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B271C76188
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 08:31:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C72420659
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 08:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbIxoIL4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s6531Fyq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C72420659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srWBwxS1lppxQvTabbx9TdAemaEui3z1+tR/4Z/v02k=; b=fbIxoIL4tNeUHK
	lkWd5EhuuOk1zIn9uM4GGozDBtfUnCQoI5r5gavEnGG6LYPf0vKPocUferHI6UPUhptzBLkLaRyNY
	ApZYjt5OWvEXHcv+yUd9+SMagAbJwO3As4GbV41r0bih5O8XmcPGWAwfeXhgNa31IKPr4wAP1eFzZ
	J/lRVufNKOso2kMRu42ir1m3Sj5U5lSeyqeLahB9V78RRsopz40eeu+7VwZE9R9Wud/8/UEpgz3TV
	VjlDiJiGWeZ7/3D7BcXCn5jbOF67Xvgo/VO1rVzg4SjBbVrq8qpep+jN7ZlOr0eqngH6VEjbNkJed
	n2qZYcT4VwFNYs7WPkLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnIry-0001te-OD; Tue, 16 Jul 2019 08:31:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnIrx-0001st-3B
 for linux-mtd@bombadil.infradead.org; Tue, 16 Jul 2019 08:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Pj6LKdHp+jsfUxBvWgyyV9vcRgxUI4tHNoHEVStMHU=; b=s6531FyqkvG5FaZVxkNGfIJHL
 e+uQ49fwMmf7d3vp5XlSgriZXVSmqEtv+nXgzwSDBui75QEGs2gGx5HqVIDFq5LcFqPqf8bYpLHWO
 79ToEhrikF61I7oVwhnavJIeyfaK5YqdKnIr5ExGdnQy50k3HTr3hVjt3Bavhcw3MeIKl/2ux4hG2
 aXKfuk1f4CJxvrYiu30N8/iTUodLSiqoVLxXeyl2HzlP1kC8RJhmPj+GStQg4FP5G38P/H+ZIbgYz
 MkqFTKIcvkOurwQB6qSNsQSmZ71X6mzaP9enJeHfTfbyt/IT+cIBmHsVCysZKy0S4qSJRm2x64YQy
 bUFE966LA==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnIrs-0000Rc-4i
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2019 08:31:33 +0000
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C1EAD240005;
 Tue, 16 Jul 2019 08:28:21 +0000 (UTC)
Date: Tue, 16 Jul 2019 10:28:21 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
Message-ID: <20190716082821.eafjvqfczxahx4as@flea>
References: <20190715230457.3901-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715230457.3901-1-robh@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_093125_204463_22005DDF 
X-CRM114-Status: GOOD (  13.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-gpio@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 15, 2019 at 05:04:57PM -0600, Rob Herring wrote:
> Properties which are child node definitions need to have an explict
> type. Otherwise, a matching (DT) property can silently match when an
> error is desired. Fix this up tree-wide. Once this is fixed, the
> meta-schema will enforce this on any child node definitions.
>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
