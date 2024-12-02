Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9BCE69E93
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 20:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzz2SL2TEPel0xyexMbuLcOEw4P2S9KSmZ14dWoRn0o=; b=2H3GoKRVO3qca8
	7cBG3ZI2SP2jMNNHmEQPq3VaxM39LQPkIkC6TfAEGP2v7kAkNxU0ItMNqXv32CGnNbNryuk8rEBCe
	TuFSVJNGauj6EO35pYJynPITKMnDkklRM5vlf5eUWEF/A1pawHrk0eiFlCJS7gdnNAzdKk1zqE/5M
	BJEG3xMbfg8e0dTN6WXFoEjItqW4QcgW6QP8tLBWV0ty4XeIvFiviSu7JzERgDqdQyjTcH42KspEc
	CBT3onyZMrKKe41+W8uoZ1cceJpMtpFPkUr3lloslOi+cgNEH7W2bP7UmQbDHLwjGUF8E1dQQA9HB
	ehBmTId1gOZ2d++4Xo+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIDVb-00000007TDd-0dxW;
	Mon, 02 Dec 2024 20:59:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIDVY-00000007TD6-3hqK
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 20:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AD8B7A4104B;
	Mon,  2 Dec 2024 20:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47996C4CED1;
	Mon,  2 Dec 2024 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733173143;
	bh=BqWecxSXgQIa8giUNeZ2BAp4YD5tR1OQ3mAJHBxTKik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VTcGLgssR0iDsOKrcFy5f2jhrehoim0WjgkUIfZ8MC74zgng7L60W7kqT3Qa4Zxv1
	 SxUUslZkPERVEJVmZ1tHp7hbkwHZE13h04GK4ZJrhYnMM/TD8I+zMnNT9Q6s9LNHyt
	 ROEQYFd/AsyM8wSwJ4Hxqc5XmvlvnTQi5wGiPkRMMkHbA5FTr6kHBgHiFf4zrhXzyU
	 RdzB1k1PYdJmOvS/MmU9PLcH4kjgHyxOLwlzjbNS1cSpIHH0xxlAo5A0D1TenYClkA
	 xccj0DKwHmuiLL6WRFi33hjhnuSyPqjnKiXBo+MMn6ujpGvigZJ4LbDNXVqodidtkv
	 AHxuqZtLeT8hg==
Date: Mon, 2 Dec 2024 14:59:00 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Jonas Rebmann <jre@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, kernel@pengutronix.de,
	David Jander <david@protonic.nl>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
Message-ID: <20241202205900.GA3155769-robh@kernel.org>
References: <20241202-mb85rs128ty-v1-0-a660b6490dc8@pengutronix.de>
 <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
 <20241202-stereotyped-otter-of-agility-44b71b-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241202-stereotyped-otter-of-agility-44b71b-mkl@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_125905_031418_41E97FCD 
X-CRM114-Status: GOOD (  16.41  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 02, 2024 at 05:53:18PM +0100, Marc Kleine-Budde wrote:
> On 02.12.2024 17:35:21, Jonas Rebmann wrote:
> > Add a compatible string to support Fujitsu MB85RS128TY.
> > =

> > Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > =

> > diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640=
.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> > index 0ff32bd00bf6aee279fa78c624d8d47c6162f7f1..973f06b665dbbcb9ea10904=
18eb18fbe2285acef 100644
> > --- a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      items:
>        ^^^^^
> I think you need to change to "oneOf"

"enum" rather than oneOf plus const entries.

> =

> >        - const: microchip,48l640
> > +      - const: fujitsu,mb85rs128ty
> >  =

> >    reg:
> >      maxItems: 1
> =

> regards,
> Marc
> =

> -- =

> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=FCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
