Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD13C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2SUPwd5ylUmdXksdHMHGx/qHSuRoZl9VEvnd3l6u6k=; b=LTZra3J5efCVxI
	t9d1yyP1XepAp3LZGPWkuwG2wcX0d4lGd0CEChi/6oTe2rMTUXxVB1awI2gHSqcOysPnTCoxyPFQh
	5/gTEhDCMSeCFLhH/w0TnN6c6QINSQNReJMSEupsYXEoHe2sDMuo8qUR5RFcEcJR3A41HAw3p2/at
	uvK5MlbRjEuhf+N6IWUy6ok3gFRvGZe2+hnmTigf66iCLZU7lVE9EiX9rGXiq2k3DaBZvICVaM1es
	jR3B8DRKFTbb7RSL7gLzCNLlCt/YeHMKP04xtjLSQt0nDlg7yy2lgs9ghi96QhT/31r8Pgb2CVSP2
	2rPr4GiVZCzEEjy908Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZTn-00B6vN-Ew; Tue, 22 Feb 2022 18:01:39 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZTi-00B6up-FW
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 18:01:36 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 j9-20020a9d7d89000000b005ad5525ba09so7915163otn.10
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 10:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YuKLz06AZYr8z+0AaROHF1CH113GpD871BS09fSdbV8=;
 b=jt/jDUO3kiDKCsmxY5yAWHpsjyrk5QHcBkzT7XXcZG/yY7lfHpfR9Hd+XK0zDRgZrC
 DTV89JQ29p7I2+cpbPxDLfm16ORyyUdGDT9S6idG1jUe4R2Anc7Hz4v1XMqNU0TKhpm+
 sbYjXvb0wUlDWcXpAPBQQmbfv5PkFhu48vvV9StErGQ/jn3fE6q+Ol76I52YMrugeOPU
 HflnG39X1Jq0ys4hBUoXujH//svb37wtV+dk53opfaX55MGJ/odM2sVQBC7xnKMyQ+eY
 Z9Ciq4wEW3ztoaeNS9ZRzVN8JjO2Y5WfV5/1qmx7xkw2IjHVEvI+F4xeQG7JdVsna24C
 683g==
X-Gm-Message-State: AOAM531kUwGVha/4/IS2rckg/qmw7UZnfd5ZeyFKyZZJMvLzGXFCgZ67
 t9oS+1Tz8t+Fb9tVGryftQ==
X-Google-Smtp-Source: ABdhPJyCpi8WRkHYBg6TUjBZvXk0DpfAaYtR71zU0qpKqMyo7K65bwZg7M03m3vEHNjHT8DVDw1VvQ==
X-Received: by 2002:a05:6830:25cc:b0:5ad:7fe:3bbd with SMTP id
 d12-20020a05683025cc00b005ad07fe3bbdmr8423431otu.354.1645552892877; 
 Tue, 22 Feb 2022 10:01:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d18sm157517otf.50.2022.02.22.10.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:01:32 -0800 (PST)
Received: (nullmailer pid 3314154 invoked by uid 1000);
 Tue, 22 Feb 2022 18:01:31 -0000
Date: Tue, 22 Feb 2022 12:01:31 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document
 new partition-dynamic nodes
Message-ID: <YhUk+3P7g6bigRP3@robh.at.kernel.org>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
 <1645410969.414517.2041550.nullmailer@robh.at.kernel.org>
 <YhO2dK0eNP9fOeOZ@Ansuel-xps.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhO2dK0eNP9fOeOZ@Ansuel-xps.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_100134_540924_C588BDA3 
X-CRM114-Status: GOOD (  27.65  )
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

On Mon, Feb 21, 2022 at 04:57:40PM +0100, Ansuel Smith wrote:
> On Sun, Feb 20, 2022 at 08:36:09PM -0600, Rob Herring wrote:
> > On Sun, 20 Feb 2022 18:39:04 +0100, Ansuel Smith wrote:
> > > Document new partition-dynamic nodes used to provide an OF node for
> > > partition registred at runtime by parsers. This is required for nvmem
> > > system to declare and detect nvmem-cells.
> > > 
> > > With these special partitions, only the label is required as the parser
> > > will provide reg and offset of the mtd. NVMEM will use the data from the
> > > parser and provide the NVMEM cells declared in the DTS, "connecting" the
> > > dynamic partition with a static declaration of cells in them.
> > > 
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> > > 
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.example.dt.yaml: partitions: '#address-cells', '#size-cells', 'art' do not match any of the regexes: 'pinctrl-[0-9]+'
> > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/patch/1595230
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> Considering the idea of this partition-dynamic, should these warning be
> ignored or the smem-part should include the ref of these new partitions?

We can't have warnings. 

> Or should I remove the example?

Doesn't that just kick the problem to actual users?

> (or should I add the example to smem-part instead of partition-dynamic)

That shouldn't matter I think...

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
