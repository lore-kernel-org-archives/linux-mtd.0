Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E92DC3DA45
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7jPQDjplPVGWeDPes61YHua/7E0eO1s7oAQZWYVhPc=; b=Ls+If/f26O7p84
	+X8hUA6cUyI1gyFHPGL2R1Y75LVz4f6NTN6co1E0RE9HxZqYn+JJcR+BPRmibdSb7ZXXhNo/2Rhee
	O//6wsWKxvCKE7xF//ViU2fniJJPdByUIyhvf2bvO7g03GILvse6N0TXLV3de0Rl0h4TV6QCMVZqx
	fXvrNXEjuBOMZMFUdGdrgPAXB4spntyyFTaDEwJhVXNy8GLFHCQ8TXUom4uI/gSrkmg/lHAaPuCOn
	nect+5+5a9xqtCSlFRiwgrqwwOPkvKoIpi3xh+s+kHVCHs08qncC2hZp1tbM/sJf0MvZ6re4ACI5x
	syZquwVdmZRttvCmtlig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRzuu-0000000FHVI-1Oql;
	Thu, 11 Jul 2024 19:57:24 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRzur-0000000FHUd-1ock
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 19:57:23 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D28A739F8;
	Thu, 11 Jul 2024 21:57:18 +0200 (CEST)
Mime-Version: 1.0
Date: Thu, 11 Jul 2024 21:57:18 +0200
Message-Id: <D2MZ405LVTN8.3LTVN3KTUD6A3@kernel.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Jaime Liao"
 <jaimeliao@mxic.com.tw>, <leoyu@mxic.com.tw>, "Alvin Zhou"
 <alvinzhou@mxic.com.tw>, "Julien Su" <juliensu@mxic.com.tw>, "Erez Geva"
 <erezgeva@nwtime.org>, <linux-mtd@lists.infradead.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <linux-kernel@vger.kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Erez" <erezgeva2@gmail.com>, "Esben Haabendal" <esben@geanix.com>
X-Mailer: aerc 0.16.0
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-4-erezgeva@nwtime.org>
 <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
 <CANeKEMOODBNZA6efh0E0Ga_KaVs5Y3WLcUftRhNwYHhnXO=GNw@mail.gmail.com>
 <CANeKEMO42rJt5Ob4_HDcZ3eEMvuMOPvRaFaLwL8SA65NtxSV7A@mail.gmail.com>
 <1d56c3b2-7adf-45b9-a509-956340f3f17b@linaro.org>
 <CANeKEMMe-Onpn7xWQHgWz1Ps_uQPEMa7HrKA00HpoKjG+DCJNQ@mail.gmail.com>
 <3bafcbea-6aa5-43ca-9d12-3916be3fe03d@linaro.org>
 <CANeKEMM02-Jvb8Pd0fZJFnRg-hsAW+hckYWm11tZZXNMPSPJ=w@mail.gmail.com>
 <9b45cc73-2251-4085-af95-7ccd00dd6d3b@linaro.org>
 <CANeKEMP+mRefYZNb+TuBmOD7dC6=7Rg7D1EcfnjJoiaeaV28SQ@mail.gmail.com>
 <875xtd48ps.fsf@geanix.com>
 <CANeKEMNJ3_ET5pQo2wg7_GSLX+vE+dqW-CV=v2DnG10xcgSdzQ@mail.gmail.com>
In-Reply-To: <CANeKEMNJ3_ET5pQo2wg7_GSLX+vE+dqW-CV=v2DnG10xcgSdzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_125721_643065_157B38BD 
X-CRM114-Status: UNSURE (   7.20  )
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

Hi Erez,

No top posting please, see also
https://subspace.kernel.org/etiquette.html

On Thu Jul 11, 2024 at 8:57 PM CEST, Erez wrote:
> Yes, I think we should.
>
> Reading the specification provided publicly by Macronix.
> For all the JEDEC IDs with the no SFDP flag in drivers/mtd/spi-nor/macronix.c
> All of them have a new version or a new chip with the same JEDEC ID
> that supports SFDP.
> There are 2 chips that Macronix does not provide spec. in public.
> I can ask Macronix technical support on these 2 chips.

We don't add flashes we cannot test.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
