Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845B9C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJni2EEOmRW8CrtlPR0n5TcP/0lEAUVOp5ZPluPQxTo=; b=vXAWdZUvOr37AM
	z6e39f45w8R9rVzijljDh8DOE8hU7Nr/PLLBja6np4jQ4NR/SehhnG9uTlrWBqImnQskOquJHDfcw
	pCQh9SXspMjy4HIAlF7VobPfplU2iUMmqV6TgIUdt/w1QfjftAme2kKCAK5GTj/s64w/DMANyLhcd
	/nRlTP9lNgcP6uY44lW//x07QAqnsPLToc0U0ica7XauvNAXjf5Yja3g+9UAzAhLPwwi2JCynjVzo
	wtCc56ewc371FmyCj8/BCfjRTmGCeV7+adKfhidAODHsIhJ0HhVD2MQjFvj1Z74xTAppCDPpDrQX5
	IeEe56mA/HIGhDrA2O0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZbY-00B8sk-Rp; Tue, 22 Feb 2022 18:09:40 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZbV-00B8qu-41
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 18:09:38 +0000
Received: by mail-ed1-x534.google.com with SMTP id m3so32945332eda.10
 for <linux-mtd@lists.infradead.org>; Tue, 22 Feb 2022 10:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jtom/U0GwO0Hs63autw48kBu/fshzoa9XBs0OWnJ3L8=;
 b=OmYZ3HIjMD0dUoDhZY8dEMSo1j1yZnkExjcPHkZ0rlsui50L7fmPpJiEQNHCSpO1Ca
 NIkndOKdSBdG0fKvi8kldlrSvZ3ypyBmsmgvayCDF3YHFD6r1/8OFUvqPJslcET4Y2zy
 v6wsyrKhvFI+w8pEjsWjPaTemJPPjC2cQ+kDpz5DuLpxZGazp2l/5rDqOHEate7vXTcf
 0msZttDSXExAsHHr3jSidYG/FZo78mU/WyvA0T91Vhz4PcGzIuhx3vBGHQiPUdwjJxXZ
 i+4YoSl7W7CZXwStAk+YsQi6sn+xNKkoarGVScgKUPV47W6fucJNd/jzSPOh4SuxspoB
 3AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jtom/U0GwO0Hs63autw48kBu/fshzoa9XBs0OWnJ3L8=;
 b=5bet788TaAdFyUO56LmSKlqK0N+0QoCtY1CJLZaHlcdE48Dxy+rGE3BjVXzogDH984
 6hIm+MAPCDU7u7aIyWqGxeFWYmgYArOBw6aRa/L3l6eaHRR4m7AcHNLWlKy55KlMABcK
 +Bub/C1UIJHE1aUeZ78l0hLqy/H1G+3c1hLwq+LiplNUp/NDVrYjQ2kt/w3krkv6AhHx
 QUFI4Y/hnQmNdwvIN9QdYWgWJB3BgzpHXqn5KxbbBvwM5AU1hgJDrvexCTj4BzCyvGlq
 ELkp7kNyA5ADIsIdXlb54JHLOS1pshwup4XwYF4Y3WRB1lgeLnAcHiXI2OPt1J78iQwo
 wY+A==
X-Gm-Message-State: AOAM532CyN/4wvdX/uGKCkujQ+i5067pOyMZuNUmX6w/Wd5U8iexuyaF
 JhwgtJ2S1srVeou7LV5V1Hg=
X-Google-Smtp-Source: ABdhPJzUnAJ/pRNXmC3AHLVojZVz9boRrWUlnT60fBM9wkx7MJFyGhNiP4CJCeIAuPdIWUlXPdmLvw==
X-Received: by 2002:aa7:dd1a:0:b0:410:9bb4:cba4 with SMTP id
 i26-20020aa7dd1a000000b004109bb4cba4mr27208582edv.364.1645553374474; 
 Tue, 22 Feb 2022 10:09:34 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it.
 [93.42.71.246])
 by smtp.gmail.com with ESMTPSA id ew6sm6393886ejc.217.2022.02.22.10.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:09:34 -0800 (PST)
Date: Tue, 22 Feb 2022 19:09:32 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC RFT PATCH v2 1/2] dt-bindings: mtd: partitions: Document
 new partition-dynamic nodes
Message-ID: <YhUm3LDb9Bp+Pn9a@Ansuel-xps.localdomain>
References: <20220220173905.14165-1-ansuelsmth@gmail.com>
 <20220220173905.14165-2-ansuelsmth@gmail.com>
 <1645410969.414517.2041550.nullmailer@robh.at.kernel.org>
 <YhO2dK0eNP9fOeOZ@Ansuel-xps.localdomain>
 <YhUk+3P7g6bigRP3@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhUk+3P7g6bigRP3@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_100937_215220_030AEEB6 
X-CRM114-Status: GOOD (  32.40  )
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

On Tue, Feb 22, 2022 at 12:01:31PM -0600, Rob Herring wrote:
> On Mon, Feb 21, 2022 at 04:57:40PM +0100, Ansuel Smith wrote:
> > On Sun, Feb 20, 2022 at 08:36:09PM -0600, Rob Herring wrote:
> > > On Sun, 20 Feb 2022 18:39:04 +0100, Ansuel Smith wrote:
> > > > Document new partition-dynamic nodes used to provide an OF node for
> > > > partition registred at runtime by parsers. This is required for nvmem
> > > > system to declare and detect nvmem-cells.
> > > > 
> > > > With these special partitions, only the label is required as the parser
> > > > will provide reg and offset of the mtd. NVMEM will use the data from the
> > > > parser and provide the NVMEM cells declared in the DTS, "connecting" the
> > > > dynamic partition with a static declaration of cells in them.
> > > > 
> > > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../mtd/partitions/partition-dynamic.yaml     | 54 +++++++++++++++++++
> > > >  1 file changed, 54 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.yaml
> > > > 
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/partition-dynamic.example.dt.yaml: partitions: '#address-cells', '#size-cells', 'art' do not match any of the regexes: 'pinctrl-[0-9]+'
> > > 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > 
> > > doc reference errors (make refcheckdocs):
> > > 
> > > See https://patchwork.ozlabs.org/patch/1595230
> > > 
> > > This check can fail if there are any dependencies. The base for a patch
> > > series is generally the most recent rc1.
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > > 
> > > pip3 install dtschema --upgrade
> > > 
> > > Please check and re-submit.
> > > 
> > 
> > Considering the idea of this partition-dynamic, should these warning be
> > ignored or the smem-part should include the ref of these new partitions?
> 
> We can't have warnings. 
> 
> > Or should I remove the example?
> 
> Doesn't that just kick the problem to actual users?
> 
> > (or should I add the example to smem-part instead of partition-dynamic)
> 
> That shouldn't matter I think...
> 
> Rob

I mean the problem here is that smem-part doesn't accept partition
subnode... Think I should add a ref there... In theory I should be able
to keep the example... 

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
