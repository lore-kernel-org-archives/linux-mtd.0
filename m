Return-Path: <SRS0=argm=FP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F6EC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 21:13:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 952AC2225E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Dec 2020 21:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 952AC2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hCpnTmhA+oh7llsx3BKBpav0VrYafqexxLAsDphboAE=; b=qKSAaWFyT72Z7qc42iEV5QC2K
	Y0NESzIh33pQsq0DrhXe0EobRdWd2SEGEXWiXCh5ctBNWz47PHRYKVkyF+ijsKCepUF3ZOCZbwC0U
	AQGYKMmsqTKn7y4kMAqTW6fGzIQpT4gTuXwPNA36sOsXXn84EymMo4HZdzzckw741NBZiAqJSxJaU
	BFLcLqTH5quHBc0dY9P/mhlIEonmb8ajVVGQ17sgf6D32Ahy0orl9+PLX+YkdLgjPrLGzcQcD1uOZ
	mQjOKFdi99W9UT5F3tSL5Vio89V6aIAezCbxZ1WXoobSLBWOzNagL8EZPSnp6F6rIzKk3zx3W1FVB
	9q/a2KudQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knpiw-000509-Hn; Fri, 11 Dec 2020 21:13:10 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knpiu-0004yk-Ru
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2020 21:13:09 +0000
Received: by mail-ot1-f67.google.com with SMTP id b18so9550916ots.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Dec 2020 13:13:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qT7CCI1tZEGzvS2A0x9Rs75/poGHPdnJSJtxrhXJMz4=;
 b=STu3/sy8DCBjXuxQ3BxryfpKyF6RQAoQYwNCH0u3W1mpEDqONgZxqdnuxexCd7fBst
 7z9roZmKms/boT2r7490f6trxcP1Mxe0rcdUe2Okg09aa2hTRo+OHuFLJLAkRe7aEpV+
 IDekfvHuDppl2vBP/6KdWdNfrblCTZ7oK88EEyXE9HYqD4/2WF8jx+KmB5aqKkGN7xLi
 h879onjo+PNP0EgY8RhSJ6tHMUKyfkuDw9uD4Z1JrnGI/niPxSgMd+RVU/MHBd2s3O3l
 YpSba+omwITOnJHACcqkaKR9GWASgEFLMyir9fVXpMeKhL918yZcNEW02qK5AdVoxZkJ
 MMXQ==
X-Gm-Message-State: AOAM532R+zoBBoca9aXG5x/dVWX/zAYQHjNnb7yLtH6X9R/QIa4Jok5P
 m58LleGDy9R80bR4DxV0Og==
X-Google-Smtp-Source: ABdhPJzadab1s51cOEGqHNNoMqzstzxiaT6kBUcKFKOA9xfhw3HsL7xzFL4OlizXiHn+skrGzvBcLQ==
X-Received: by 2002:a9d:4c8d:: with SMTP id m13mr9135456otf.229.1607721187996; 
 Fri, 11 Dec 2020 13:13:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c18sm2090517oib.31.2020.12.11.13.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 13:13:06 -0800 (PST)
Received: (nullmailer pid 957502 invoked by uid 1000);
 Fri, 11 Dec 2020 21:13:05 -0000
Date: Fri, 11 Dec 2020 15:13:05 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for
 Qcom SMEM parser
Message-ID: <20201211211305.GA955193@robh.at.kernel.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
 <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
 <20201207215236.GB892840@robh.at.kernel.org>
 <20201211033140.GA4222@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211033140.GA4222@work>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_161308_938682_35B154D2 
X-CRM114-Status: GOOD (  21.00  )
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

On Fri, Dec 11, 2020 at 09:01:40AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 07, 2020 at 03:52:36PM -0600, Rob Herring wrote:
> > On Thu, Nov 19, 2020 at 12:43:05PM +0530, Manivannan Sadhasivam wrote:
> > > Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
> > > parser.
> > > 
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > new file mode 100644
> > > index 000000000000..cf3f8c1e035d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
> > > @@ -0,0 +1,33 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm SMEM NAND flash partition parser binding
> > > +
> > > +maintainers:
> > > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > +
> > > +description: |
> > > +  The Qualcomm SoCs supporting the NAND controller interface features a Shared
> > > +  Memory (SMEM) based partition table scheme. The maximum partitions supported
> > > +  varies between partition table revisions. V3 supports maximum 16 partitions
> > > +  and V4 supports 48 partitions.
> > 
> > V3 vs. V4 (and any other version for that matter) is discoverable?
> > 
> 
> Yes, it is discoverable based on the partition header and we do that in
> the parser.

Okay,

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> Thanks,
> Mani
> 
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,smem-part
> > > +
> > > +required:
> > > +  - compatible
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    flash {
> > > +        partitions {
> > > +            compatible = "qcom,smem-part";
> > > +        };
> > > +    };
> > > -- 
> > > 2.17.1
> > > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
