Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BC4C48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A316136D
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 19:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A316136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6pr74qNS9JLJUM8RCHtkRpba6UZp5poYHr4OxyQEUQ=; b=dYs4g2iqIVDZWZ
	UhnF3depTerXDt88OINJbhEg2HGtkh3nd45y6v4enb5J8r9RQMK4yvQLOfHHLInOO13nSQj33EzWJ
	pluyAyQFKd2GbzHwWKaj4rCob7DEguhp9et7u6AHxO/YGBRfh5GVzgdh4A3O5OBzQiVwm5EK+RwCP
	qLQzv+OMYt1FsDRXCQalJ0SNMhjoSDvUQlRlqJEY0fSxCsyfrzVbHmn3Cev8bn1oLkH7XHmItU1Hu
	Slz4ObmLSx/hQfoBzR0tNDCjcmEcYm+3EUWMGCud9Al+dVVgJMJOQAijw2G9KTXRYAekd0eaVl29+
	x3rUhufCscA6U2Zu9qiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr40X-00FiNa-D5; Wed, 09 Jun 2021 19:36:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr40H-00FiK8-0t; Wed, 09 Jun 2021 19:36:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B77726136D;
 Wed,  9 Jun 2021 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623267400;
 bh=X5BBnmOIxZn8P1yRC4oksYkdkEDawoP4AuyY71hEDd4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WXGx5uuAJOpUBhJlE/ivrDiVSqhgqT+IwVW1K8dsBY9BegGDZz+SZGy3BD5+BGSYq
 vJstnn71bT0oVWdNBiiS9bXKuRGHYzhG4z4MLL3BoGiXXAtdLueBa3THeuP7XR8Enr
 Dk+r5+ykHjNyEvIigxkGg+zdu0owAlA5E+lJ7UQVsxxbIjo7M7U7iUTLW940dtxSsb
 MbOsTc9BSNm5GeIwN1kMZW8N1YEcoKHSou85jeNja1AKprPW2vV5UsXSCne77l/NF7
 YZ3ysr4NldFp66MIv8PJpjfenALcaX4SmkLvrDW2s74GQsetbqfoT9LQmqDzc6mGFz
 vPUVjo+R7W6Ow==
Received: by mail-ed1-f44.google.com with SMTP id u24so29842622edy.11;
 Wed, 09 Jun 2021 12:36:40 -0700 (PDT)
X-Gm-Message-State: AOAM532/ldzLKWJI1Ff6/c7OyNPyVngO9zXNZgsHp7ypp6LgI4Xb/oSt
 ijwmZ5RXKL0727wKUwv40eHTTgfxef9dBp7R3Q==
X-Google-Smtp-Source: ABdhPJzgNI2+5vEERakKrzf95MkI2PUaocE5cKoGnU8i9q8tWEHPlwI5flHI9jk/IHPLd/GIYm3Kvs8mL1aNefrwNnA=
X-Received: by 2002:a05:6402:31eb:: with SMTP id
 dy11mr976983edb.165.1623267399325; 
 Wed, 09 Jun 2021 12:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210609080112.1753221-1-miquel.raynal@bootlin.com>
 <20210609080112.1753221-18-miquel.raynal@bootlin.com>
 <1623255403.668043.3763305.nullmailer@robh.at.kernel.org>
In-Reply-To: <1623255403.668043.3763305.nullmailer@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 9 Jun 2021 14:36:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJT6Wks=ChNis06fhYqpKfxoApr6g1u9cAZLOnHevLnQw@mail.gmail.com>
Message-ID: <CAL_JsqJT6Wks=ChNis06fhYqpKfxoApr6g1u9cAZLOnHevLnQw@mail.gmail.com>
Subject: Re: [PATCH v22 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Helmut Grohne <helmut.grohne@intenta.de>, 
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Srinivas Goud <sgoud@xilinx.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michal Simek <monstr@monstr.eu>, 
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_123641_102123_3ABAA6A9 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Jun 9, 2021 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 09 Jun 2021 10:01:11 +0200, Miquel Raynal wrote:
> > Add a yaml description of this NAND controller which is described as a
> > subnode of the SMC bus.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.example.dt.yaml:0:0: /example-0/memory-controller@e000e000: failed to match any schema with compatible: ['arm,pl353-smc-r2p1', 'arm,primecell']

Ignore these errors.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
