Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB8DC05027
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Feb 2023 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXUNtw/UU/LatrACeZGK97EAN00kBBo2l86rjWPVbN4=; b=BrRW/Y3hEiRvVt
	RA4RwlYeSDX/Pb0OyUsuWEhxAWVvMzfN3SrrCNZ/nIrYvWDRDMFSqXxHe3jD3i79TRf9UXYV96PrU
	wqTntS6o6PboNr6GLzRpftAEW7cns5ferpeOB9Y9j2AYF9SzIb60uuefvxIxWR5rli8CJovSgJenR
	Xiwl4JpoeGFc3zetLZ7JWBeMVvP92tk8biWcGR007+tCr9wBKGiNDBdMaYPGOYfe7eDLX5aOlRYZx
	mXYP2nZNhEVKLY7610ucazQBMmUCcMXmVHe377KUAV15csOYR+tWFQoKknQgX1tHTKV5l4RiEvRDw
	ksntUH03QScztiW910dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTA8F-00Fx6Y-4h; Fri, 17 Feb 2023 23:27:11 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTA8A-00Fx5p-Gp
	for linux-mtd@lists.infradead.org; Fri, 17 Feb 2023 23:27:07 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-170c8a8e206so3268743fac.10
        for <linux-mtd@lists.infradead.org>; Fri, 17 Feb 2023 15:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKUc5pbw1yazGVhBpNKjeMy/4FeHfZzgptlXZ0pQics=;
        b=Ht1QmumTeJeO3ttQ8dga0G6nTxIsqvvUz2BLeit3ydun5Z6GFKKtowEB4Ope1o+Do8
         EDUCyQPWPkORi+5sJKs6q7zXOyOFUDYmowS+AomXP+eQTZ7uCyWi/Y9xUkTOx12rhxlA
         VIDkYHjii42I6ZTOVMcijYZKesDQjEIf08/IcYoHkq6MZVQXQs6H+DZRtQE0ZSsDoz9R
         LdohswWbcaj2Y6tnGuAbXFFCeCimgwPrk2M4GGdkdqDgYSBRf/JWl9jLgA++RBzqFT08
         UUGSLsnlwTHOjsp7k9zy1z/JxU8Xy7N2RI5veIjzH4jzCT/DER2ZLEhTptqetaqFsKdB
         sxNw==
X-Gm-Message-State: AO0yUKUrYj0nzakd79Sq1RaLq2SHbMK2HltGHbZj/M5Zh5mrmP0ne48X
	sfFzvjjEN/6gO7IM0EKcHg==
X-Google-Smtp-Source: AK7set+mj3tCBmniQ4Vc/uuMNYw3VzuxafpQVmLbG/0nKq0jLJoNNkhvc7DvBjP86Zs2XAxRPe2WTA==
X-Received: by 2002:a05:6870:b150:b0:169:dcba:1ec9 with SMTP id a16-20020a056870b15000b00169dcba1ec9mr1615221oal.41.1676676423521;
        Fri, 17 Feb 2023 15:27:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870e28100b0015f4d1b195bsm2194520oad.36.2023.02.17.15.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 15:27:03 -0800 (PST)
Received: (nullmailer pid 2260551 invoked by uid 1000);
	Fri, 17 Feb 2023 23:27:02 -0000
Date: Fri, 17 Feb 2023 17:27:02 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA
 support
Message-ID: <20230217232702.GA2257281-robh@kernel.org>
References: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
 <20230214154433.6a421c51@xps-13>
 <CAMuHMdVK7vOTNMF53SvHn8LtiHX7MSN-Fp80jngSsosYBhhrHQ@mail.gmail.com>
 <20230214165637.56102b18@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230214165637.56102b18@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_152706_610864_186583D7 
X-CRM114-Status: GOOD (  30.31  )
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

On Tue, Feb 14, 2023 at 04:56:37PM +0100, Miquel Raynal wrote:
> Hi Geert,
> 
> geert@linux-m68k.org wrote on Tue, 14 Feb 2023 16:22:15 +0100:
> 
> > Hi Miquel,
> > 
> > On Tue, Feb 14, 2023 at 3:44 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > > geert+renesas@glider.be wrote on Tue, 14 Feb 2023 15:26:43 +0100:  
> > > > SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
> > > > (CPOL=CPHA=1).  However, using the latter is currently flagged as an
> > > > error by "make dtbs_check", e.g.:
> > > >
> > > >     arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
> > > >           From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > >
> > > > Fix this by documenting support for CPOL=CPHA=1.
> > > >
> > > > Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > index f86255ce13af0871..bb62ac4585822982 100644
> > > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > > @@ -76,6 +76,13 @@ properties:
> > > >        If "broken-flash-reset" is present then having this property does not
> > > >        make any difference.
> > > >
> > > > +  spi-cpol: true
> > > > +  spi-cpha: true  
> > >
> > > I see that spi-cpol and spi-cpha are described in spi-controller.yaml
> > > which references spi-peripheral-props.yaml, but jedec,spi-nor.yaml
> > > only references spi-peripheral-props.yaml leading to spi-cpol and
> > > spi-cpha not being recognized as valid properties.
> > >
> > > Wouldn't it be cleaner to to have these two properties defined in
> > > spi-peripheral-props.yaml instead?  
> > 
> > They were moved out of that file by the commit referenced in the
> > Fixes: tag above, because they are not supported by all SPI targets.
> > It's the responsibility of the SPI target bindings to list what is supported.
> 
> Oops, I overlooked that line.
> 
> I actually see no point in constraining device trees on that regard,
> but, well, Krzysztof is the author, I believe he knows his stuff, so
> let's go for it.

It's a feature of the specific device as to what modes it supports. For 
most cases where there is only one choice it should be implied from the 
compatible, but there's some exceptions like this one. 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
