Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84780CD6E57
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Cc:Subject:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gye3ruIO/wOd/MtyAuyBhmvioybbBViKlEjECEYAbrQ=; b=JihaR/K8dQNvME
	t+Ysy3KQ6BUPgZtltFd36DzNKSz0p3rADVC7xBoW1zct9zKLIhWmiI+vooUUh0h2p4SaL96SdVuUq
	9Gzzx60VQZwpvqfLIoXFu32UeuqdsYpI3F7dwfysHJ/ixDAagvmsejB0VPJEByXlJ+Hj2kPBBGebi
	UU1WYaKFfMsocoNMh52saFDVMbfIiEF7z/MAzntInwE0q5aUL7ADxplemJomZXGWCb775bc8hAibm
	e3caL8bdEsmCB2BNOwASL5PRMIta2TDNLkrWR4/T2K0cALYMkPVhww+aoLM0FJoBXZKBOBNm5MGva
	uMMEOqH1T0yVuvUvJyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqpA-0000000Fj66-0U4r;
	Wed, 03 Jun 2026 19:00:20 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqp7-0000000Fiyh-1tyc
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 19:00:18 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id EF76B5E1;
	Wed,  3 Jun 2026 21:00:05 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 03 Jun 2026 21:00:05 +0200
Message-Id: <DIZN96NYLDUJ.DS1LFFAS2JH9@kernel.org>
To: "Rob Herring" <robh@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
Cc: "Santhosh Kumar K" <s-k6@ti.com>, <broonie@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <richard@nod.at>,
 <vigneshr@ti.com>, <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
 <20260602164945.GA475455-robh@kernel.org> <87zf1by5oc.fsf@bootlin.com>
 <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJwxgcFOB=kE7bVQYDn740-w4RppMF5W-3Ne9=9qV9OrQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_120017_657780_917233CD 
X-CRM114-Status: UNSURE (   7.36  )
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

On Wed Jun 3, 2026 at 7:38 PM CEST, Rob Herring wrote:
> However, you already have to support using label, so anything else
> is supporting a 2nd way whether it is compatible or a phandle
> property. Is it really worth it here?

Do we? I don't think we have. That was among my very first feedback
on this series. Don't use hardcoded partition names for this, but a
phandle. A compatible sounds even better though.

Also, I don't undestand why this property has a cdns prefix. This
can also be relevant for any other SPI controller.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
