Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250C8C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AFF23770
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 03:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AFF23770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pd0AsFLwgz9RsqKuv9eMmZcGnlGgat9zDmQYGlZXi+k=; b=IVUbcnlDb0TgJVZYLQV2nrYNF
	+RfBpLSLnL9cYT7uOQAgGSeCd3BBeVB30FxD4+bsejMwRNl07dhPC73KSOdwDVS2BiBiriFpHvbUW
	QvTbEYsO3J7HTA9JE1BJrX3k64e6GSeWlkSMPYruTyb1xTtBmvwW/sn0IRDzh432zXA8+oMlPoLBv
	lR31WHe5iFkQpZz7TnsxQYTh0NSX+5p2uwTJic7RDbxFxxHUoP1A0zrX48Vkluxe98tUVRLV+fnzV
	v3z66HgH5wBRMAkK9GkouLHh8Vbm7r+GmrlThwIkDHYiMckudq8Nn0RCmbUT8HIUxr7K95rZKVA5s
	n2D40dvqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZ9u-0004ml-3E; Fri, 11 Dec 2020 03:31:54 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZ9p-0004lX-Ud
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 03:31:51 +0000
Received: by mail-pg1-x544.google.com with SMTP id v29so6201660pgk.12
 for <linux-mtd@lists.infradead.org>; Thu, 10 Dec 2020 19:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y91nmoJ33/DVuxYypisPMf8rbIWy+AIDH8dAhBZDQ1w=;
 b=y0Z8hdWuCcPWIHLD8nGhmLjl6sgFkiiAFpbnABd9ffPeWvaMhXWC0lWy8trhgt50dA
 DDTlwlH4cox4K8dcvzh01RT0bobVAiT/PCmyBMD66caOcSZU8R92/MQzTUyBSfAW/P9s
 b/MCI+0Et5/G+5amGgv9s0VThc8NllwSn0Pya3Ox6q/9QuZHFUzfibQXEglI7tmjlcKd
 eerpJEoIoI2pcENH65KJm30+qVK0DAJgjOTA1CmCmz/E+mipY63Ek5OMjMY5sE94Cl5l
 HVvz2fb0MmZkaOMc8O3vY/yl+jTOLTFxx5J1uamQ/cIKMc3/Eoo0MDAoeLC+4MH9vA1a
 TtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y91nmoJ33/DVuxYypisPMf8rbIWy+AIDH8dAhBZDQ1w=;
 b=ft0ilpi3kiQxX/+8bbcHGys6xCccXRZhGt/50OuTHoy5laTZOFE1JBsEb99qVPDqWw
 5pbYvhDZ1DImX2oMotXwgIWmi/tsPgtbLbksWEDm5yQLevbjwX4P0DZUht9jiPlg4LlJ
 AZ1AdGnhux2tYCu5TjKgcUFxyFviltcfq+8ie/W3mh3UoH+qmQCbHe1eY8hf+hpkLFcX
 cIvX72iEVq1/tHZLlc6O85P676ailnEDIp1XxyVLD6sPt82q5aYXTDekqHTgoOrlPJRJ
 udZNcyR/9OgF4iDoqBFZNSzFN8rxU4N6ZDIv5eI/U062NpK8dDCOvXq7WBMG3bHGaoMg
 VzgA==
X-Gm-Message-State: AOAM532t5fybaH6bAERXSZ835X9ZcDCyKIza/pZwbmqvuQkKl6IhsuZk
 YLGtlusJbTZfXdAtbWWrFcqY
X-Google-Smtp-Source: ABdhPJwmYGB3znEkW5I/5BDEVH4lhxpW/+DkHztLxFxfiyIPh59HV8+xUCkDoBKyNFuQVWgaUsWBQg==
X-Received: by 2002:a65:6253:: with SMTP id q19mr9559894pgv.412.1607657507999; 
 Thu, 10 Dec 2020 19:31:47 -0800 (PST)
Received: from work ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id v19sm8455043pjg.50.2020.12.10.19.31.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Dec 2020 19:31:46 -0800 (PST)
Date: Fri, 11 Dec 2020 09:01:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for
 Qcom SMEM parser
Message-ID: <20201211033140.GA4222@work>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
 <20201207215236.GB892840@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207215236.GB892840@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_223150_466920_523C718F 
X-CRM114-Status: GOOD (  20.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 07, 2020 at 03:52:36PM -0600, Rob Herring wrote:
> On Thu, Nov 19, 2020 at 12:43:05PM +0530, Manivannan Sadhasivam wrote:
> > Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
> > parser.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > new file mode 100644
> > index 000000000000..cf3f8c1e035d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > @@ -0,0 +1,33 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SMEM NAND flash partition parser binding
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +
> > +description: |
> > +  The Qualcomm SoCs supporting the NAND controller interface features a Shared
> > +  Memory (SMEM) based partition table scheme. The maximum partitions supported
> > +  varies between partition table revisions. V3 supports maximum 16 partitions
> > +  and V4 supports 48 partitions.
> 
> V3 vs. V4 (and any other version for that matter) is discoverable?
> 

Yes, it is discoverable based on the partition header and we do that in
the parser.

Thanks,
Mani

> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,smem-part
> > +
> > +required:
> > +  - compatible
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    flash {
> > +        partitions {
> > +            compatible = "qcom,smem-part";
> > +        };
> > +    };
> > -- 
> > 2.17.1
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
