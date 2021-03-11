Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAFCC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 16:58:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED92364FA0
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 16:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED92364FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QDhTTGk+uj6DVTpU/HeGXOnKx8R2QbK8dkKyJAn8rGI=; b=abaqsoxR4yjVcwfliAQ8mzgly
	pDIAgvQEJbJPMdnAfFUCZxVJ2BY8vcWMlXgkMJSVnMTngIkCHtn2B3JKl6PiTOAOPP32FCtcRNYE0
	T4Macsz/UybTFcl5QrFRFwomZpPtOCCbzjGQk0On4lHCz/gubeuQiZQ+AtPavEGVZhnQ+7/4IXYJY
	z5FIhq9mvr2AeLklfhT83fQh6Bt6IPtkIDkw0+axvobLOVRZPGwMR9wWuv02PTzsH50nw5YRk2xmq
	TQ7BhqmN3F1XawrznELzrEhtnLXv7ZXvQCB8p6zNKPCmcQZBJDzJiM9akNPJ3BPFOKqrTG8lGAj7y
	NkDMOmQ+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOd1-009d0S-TL; Thu, 11 Mar 2021 16:57:40 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOcx-009czn-HJ
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 16:57:37 +0000
Received: by mail-io1-f51.google.com with SMTP id n14so22683025iog.3
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 08:57:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wsccf9tJR91KJ5EzGr3FBpTysn8pH+laeQstroeFNK0=;
 b=QtNm4RW9Qr/gRqIorDvLNOD6NwMWQDek/hA3ez5B2UwAJbE4Acoa3YE2ozKz1vEw7e
 /nQK5AN7dHA+EIk/kpHepS6W6puNxO7ZooKOV2xKptP9qKFsDl5NAEBJyiJA+lOw4m9E
 YvsJbEfEWMcc2hvMk3jSTcuuXYFEiVjUQo52oY5rohhKse4EFsbaNWEitRkdWsvHuEUP
 DYbNqI19fMaQ6K36CnU1y7KOJWHDpBtFGKPOL96ClJbVV+/vPmLY+rlY/PIPWRpberFL
 yw3xojljTLbvSBbRqPE+7zFcu94HuxJ9zZjuxdZBF7MGWdJbji33JiZ0enojBNbOOl6+
 gwBg==
X-Gm-Message-State: AOAM533B59xhD1eodX7QaBxneAjMzp5l9oC/QMRusOJtUZbP+qt67MVm
 LVcvpTanWGZ8KdQHIddnHw==
X-Google-Smtp-Source: ABdhPJzWQc1MQR1xAgqw0T954BKg4oec2Mq0FvSn/lekGONRtwNBJiowKlSxunCHDr2yO6pxc/sCjg==
X-Received: by 2002:a05:6638:144e:: with SMTP id
 l14mr4510651jad.76.1615481854566; 
 Thu, 11 Mar 2021 08:57:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id v19sm1519350ilj.60.2021.03.11.08.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 08:57:33 -0800 (PST)
Received: (nullmailer pid 867948 invoked by uid 1000);
 Thu, 11 Mar 2021 16:57:31 -0000
Date: Thu, 11 Mar 2021 09:57:31 -0700
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <20210311165731.GA866234@robh.at.kernel.org>
References: <20210311051309.16789-1-ansuelsmth@gmail.com>
 <20210311051309.16789-2-ansuelsmth@gmail.com>
 <1615480862.520618.841930.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615480862.520618.841930.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_165735_651932_FD95DF1C 
X-CRM114-Status: GOOD (  17.49  )
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

On Thu, Mar 11, 2021 at 09:41:02AM -0700, Rob Herring wrote:
> On Thu, 11 Mar 2021 06:12:48 +0100, Ansuel Smith wrote:
> > Document nvmem-cells compatible used to treat mtd partitions as a
> > nvmem provider.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
> >  1 file changed, 99 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.example.dt.yaml: art@1200000: $nodename:0: 'art@1200000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.example.dt.yaml: calibration@f00000: $nodename:0: 'calibration@f00000' does not match '^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

Looks like you need to reorder patches.

> 
> See https://patchwork.ozlabs.org/patch/1451109
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
