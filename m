Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7blMqh1lB4chPvrE9LlWacQ5dErcTg1lYOxa7D31f0=; b=J/27ylB2eNup7m
	SjU8j75Y2Lbh2VMAbZtzHucGxUpIxW7v7rz9FXnc2JN+tr9X6KD3T6J/ALlBwvhv2yk8/wzdIOg63
	VSvgpd6e3su2eEUMLwbbXEJ8hCaezVd9BH+u4BpkmN9dNBwUVQ2UUDcOZQ9Slpj2N4n4yf4GgfGMM
	2f4AZCh+jj3vi3jtrmVN62daGFLxvxNfYtGtKXyT62WnMDCyIoqPNcVJSGN4VdrGyzQe2xysbTtCI
	RjWvO+cePSJ9DQWGq9fYC+oJH25cZuUdHkJTHN4pD/t5ywQ+epyxHyRX1OF8xa2fniA7PFlch06zW
	1psi8q50r+HfTJ8qYOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoR7-00CscZ-Js; Thu, 02 Dec 2021 15:55:54 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoNQ-00CrKb-4X
 for linux-mtd@lists.infradead.org; Thu, 02 Dec 2021 15:52:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 387F5B82398
 for <linux-mtd@lists.infradead.org>; Thu,  2 Dec 2021 15:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64B4C00446
 for <linux-mtd@lists.infradead.org>; Thu,  2 Dec 2021 15:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638460320;
 bh=g3x2golTGf5LugWWOotMX5nRZX1ofZdncgn84uvvPlw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A/Zn7tNX0Z2bgFVRPPeABOaL8IcelNMd9xCQPdnfJakHY2LNcZJAft8c2+mB36Yvn
 5iUEPj8HlX7d9UtUlqHLRJ/7fIoLg3bgQ6pRGWbA6nBE0IWujiQ8ctrW7RBTV0bbmf
 PB1MRA1+PxrzT/kiZcUxmT6hXIYafHTJmPQ1K8f0cLfVoQelwpv27R6kdadfMusYd6
 Bvpg6LsPv2mNhkKEQQwQpA3iBN2dAX80GIjMLA76bYNW47z/5PiW17djlliQKBGQgp
 LYNd7idwutPdunX1sV3dKtPp+RuouDiuSDdfXpuOralpWwwnQ8cBGJh7dN5CnpFfx9
 nBgf1a4gITWXw==
Received: by mail-ed1-f43.google.com with SMTP id r25so51370222edq.7
 for <linux-mtd@lists.infradead.org>; Thu, 02 Dec 2021 07:52:00 -0800 (PST)
X-Gm-Message-State: AOAM531pDq62zn2iyrORY6mreS11h7VhLk1d8pTu+rIkjAamjeJwWJmg
 GWAS1hkZczvY5X0B1Mo/d95IR3FWr8qJpdVDNg==
X-Google-Smtp-Source: ABdhPJwQBKOUdKbAtcY9buMEqJoescJX1oqIF6R8Pi1NUjzxQDmpidmsR3w6UdwGQEcoQbYSmGssgYFJ11kH/XOXeDU=
X-Received: by 2002:aa7:cc82:: with SMTP id p2mr18177641edt.201.1638460310108; 
 Thu, 02 Dec 2021 07:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-3-miquel.raynal@bootlin.com>
 <YagN1c7/Ltt/mhNp@robh.at.kernel.org>
 <20211202082521.77c2837f@xps13>
In-Reply-To: <20211202082521.77c2837f@xps13>
From: Rob Herring <robh@kernel.org>
Date: Thu, 2 Dec 2021 09:51:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLL3rxA4p7T1girYOJ2cHTWSEJWWvSUpFOfz9ZTjMXAHQ@mail.gmail.com>
Message-ID: <CAL_JsqLL3rxA4p7T1girYOJ2cHTWSEJWWvSUpFOfz9ZTjMXAHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: spi-nor: Allow external
 properties
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_075204_516526_B5C7246B 
X-CRM114-Status: GOOD (  32.65  )
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

On Thu, Dec 2, 2021 at 1:25 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Rob,
>
> robh@kernel.org wrote on Wed, 1 Dec 2021 18:05:41 -0600:
>
> > On Fri, Nov 26, 2021 at 05:34:47PM +0100, Miquel Raynal wrote:
> > > Setting "additionalProperties: false" will refuse any generic SPI
> > > property while they should be of course authorized. In practice it looks
> > > like many people used compatibles different than "jedec,spi-nor" in
> > > order to workaround this limitation because otherwise no SPI property
> > > could be used in the examples. Use "unevaluatedProperties: false"
> > > instead to allow defined properties to be used. It is likely that at the
> > > time of the conversion to yaml of the jedec file, the unevaluated
> > > keyword was not yet introduced.
> > >
> > > Fixes: 3ff9ee2a8890 ("dt-bindings: mtd: spi-nor: Convert to DT schema format")
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > index ed590d7c6e37..81be0620b264 100644
> > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > @@ -88,7 +88,7 @@ patternProperties:
> > >    "^otp(-[0-9]+)?$":
> > >      type: object
> > >
> > > -additionalProperties: false
> > > +unevaluatedProperties: false
> >
> > This has no effect unless you have referenced some other schema here.
> > The series I referenced will solve what your trying to solve I think.
>
> Maybe this is not the right fix indeed, but my understanding of json
> reaches its bounds here.
>
> Without this change, any example in this file that references a
> spi-controller.yaml property (which is correctly defined) will throw an
> error. The fact is, all the examples out there with a spi-nor flash
> using the jedec,spi-nor compatible *cannot* contain any
> spi-controller.yaml property, otherwise the tooling errors out. This is
> a real issue.

That's probably because unevaluatedProperties is unimplemented in the
last dtschema release, but now supported in main branch. I'll be
tagging a release soon. So once the newer version is used, you should
be back to the same error.

> I will give Pratyush's series a try.

Referencing spi-peripheral.yaml with 'unevaluatedProperties: false'
should give you what you need.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
