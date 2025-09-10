Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D09FCA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGvqUVx6y6CN/L4Dfwt8zvsGuWDZcxMjoeti0BmrGMs=; b=m2Or8Ok4oRVPwL
	fmlnc6OMk+H9UNxORHBuWi7glQBPFqSUw3MsNvNW0FwPNeR6/UifQdSZvSM1JEfb8OuelHpHNKW34
	RcVTVEi1hT1cDGHzeWgDvAkTWEy774xBpUusk1aJ/SjfQyEx/BeXkjTYTr2QpipKY0eZEKll97b/4
	t1mbUsyWj9L4p6pUwmilHS2GbhnikGmBSQCQZDW5WF56jl3HbynhkpHbzO0aj37OVZiOp+//J9rnI
	H7AtNRZT0AffvQiAc7EW5WA9W90QJT1BxwilE07sx7yqiwnsj2fcynGDwQ/2v9FrTpOoZGKo/iuUw
	fEsjGo2KNB8rxtO+R0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNoC-0000000FWyg-0cX1;
	Wed, 10 Sep 2025 16:36:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNoA-0000000FWxc-1VBS
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 16:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7104044791;
	Wed, 10 Sep 2025 16:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D85EC4CEEB;
	Wed, 10 Sep 2025 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757522193;
	bh=coJld3U5l8nx5PJCbwdhxAenQ1u3MUhyvC5AMJBni8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKmn/PdSjV9iWFR7rII1N4mvAGEJUx3NDyFtTdUC5vbc68oHhBQ2gStakqn/KKWIZ
	 ApWg2fD+IxhUhqBzi+pizYEDQQ19cd4i3P8+pBBC1ZZ8Iwou0r39LE2G713XuFlw6f
	 qRuWRxgt2zoNMeJRiSdn+id5V9cdwaByFoRHjYTqN8Ykv2o4UlvFGWAFJBbKe7wUV/
	 KDzfp0oxZJ/55oaZmb52ypavPPxTdMoCajkh27dRMZc4hbViokvYTTHON3SYHFQ2Lx
	 QYTllcFNL/Dh0KhTd1E+Acf4W6+fUWEeyHj1ztROEFjo1XpldGHGb0Yu5bE71YInna
	 NRC6DnAlwBucg==
Date: Wed, 10 Sep 2025 11:36:31 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, richard@nod.at,
	vigneshr@ti.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com,
	Takahiro.Kuwano@infineon.com, pratyush@kernel.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
Message-ID: <20250910163631.GA142639-robh@kernel.org>
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-2-linchengming884@gmail.com>
 <87wm66d67k.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wm66d67k.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_093634_415187_69FFED68 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, Sep 10, 2025 at 11:09:35AM +0200, Miquel Raynal wrote:
> Hello Cheng Ming,
> 
> On 10/09/2025 at 11:02:59 +08, Cheng Ming Lin <linchengming884@gmail.com> wrote:
> 
> > From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> >
> > Add a new boolean property "enable-randomizer-otp" to enable the
> > randomizer feature on supported SPI-NAND devices.
> >
> > Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
> > ---
> >  Documentation/devicetree/bindings/mtd/spi-nand.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > index 77a8727c7..432bc79e9 100644
> > --- a/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
> > @@ -21,6 +21,10 @@ properties:
> >      description: Encode the chip-select line on the SPI bus
> >      maxItems: 1
> >  
> > +  enable-randomizer-otp:
> 
> This is a NAND wide feature, so we should probably add a prefix, such as
> "nand,".

'nand' is not a vendor, so no.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
