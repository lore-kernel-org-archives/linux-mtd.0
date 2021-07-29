Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9B6C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 20:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD1260ED4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 20:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DD1260ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+BvyyVXj1keQsgzhGvE1pJ+tKnrhRSV4iCsLpX3jgs=; b=YLjYikMZfGLWm9
	GcGBJ5UHDDcGJoVwQpR+vs9eraD8EV59FpQ2gYLfjihBcHVD0l4nsZaD08Wx24JDlslcTorGtVL2n
	0oPPNNqLqpTog26q5Hde4q8iXT72t/vmmIdVMwLMTJVyd10UPeMu/J42lIF0lY9JSHgUBhUGakCiW
	eYfl2axCPH96u9kYHGwCVdo3TuWKdrS0LgrLyAVOGKNHCs5hIV2R8iD6Ckah0jVJWIHPvW84In2tP
	um/AnxYsan1lTecOWtRzucN8JEyE7ioo41Mca1ejsnIb4qI8wc8W27ChXUGoYAnPjXez1iTxK7BvN
	cpdJlfXqTLWLF0wLCczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9CJR-005n1e-HQ; Thu, 29 Jul 2021 20:07:25 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9CJP-005n0a-AZ
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 20:07:24 +0000
Received: by mail-il1-f178.google.com with SMTP id r1so7124754iln.6
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2021 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AjVi3HOc38IAipi+bfXo+kMMpn3RMH+B6clxAHAb76c=;
 b=j6wPgjXO0LjFqxZ5Nn46dTn+KzUyZkbQYLwP+v1tHoM96avEf7awWEmXlKOna9zl6u
 +F2RCCg8d2A1tqpmonieYJx+Bs5jsX9YGcExY/fqTbv7Qa96Y6TMhV4iS02/vClQEgwv
 VpSZanJp45LZkU15UMaPiycbVy+s/ynlth3N6aKwaSGH+eF1t6Zxm3a1T8d9MzipPwZ6
 dHU5GJuy1TSMrXZgtg0N2dy80encRLFduSJLQxBjvZk1BL1RW7QwgnBr7U3ALcXQvoP+
 K6VZ1YhyRyLwwovCusAZygSq6prYzNPYsaZ2fHqzvy3oQYIy1MA4AIo2k6FiIOyQLh/G
 9BxQ==
X-Gm-Message-State: AOAM532shudI27QSMmwAwcAhDULqmMFOWNV+IAuPfaZq3R0qd76fFVWt
 I28mTuRo7OgXP/Iu40ea+Q==
X-Google-Smtp-Source: ABdhPJz76WIWBBBfztDGL8PIe0R0FGSKx3wBqv/ZmLHj4fOZfYzL+kYtnOZ4BZTXgeNN0IKjggBTQg==
X-Received: by 2002:a92:c5c2:: with SMTP id s2mr4986347ilt.180.1627589242144; 
 Thu, 29 Jul 2021 13:07:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id p14sm2400419ilo.6.2021.07.29.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:07:21 -0700 (PDT)
Received: (nullmailer pid 797014 invoked by uid 1000);
 Thu, 29 Jul 2021 20:07:20 -0000
Date: Thu, 29 Jul 2021 14:07:20 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/15] dt-bindings: mtd: update mtd-physmap.yaml reference
Message-ID: <YQMKeA4uO/3Rs01Y@robh.at.kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
 <ab2ff9ee66110c37691b467ec8b4679e9d426416.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab2ff9ee66110c37691b467ec8b4679e9d426416.1626947923.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_130723_405487_6984A419 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, 22 Jul 2021 11:59:58 +0200, Mauro Carvalho Chehab wrote:
> Changeset 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> renamed: Documentation/devicetree/bindings/mtd/mtd-physmap.txt
> to: Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 63f8e9e0ac65 ("dt-bindings: mtd: Convert mtd-physmap to DT schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/gpmc-nor.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
