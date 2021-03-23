Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0322C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 22:32:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EA4619D7
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 22:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45EA4619D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=77vH81ECS8vvdYXwg8HCD67MT9kXsv8B9WDy5c5CuQ8=; b=B5csNQqlY8ZcgYZ7mkOcSRXIr
	FxKHq/Mx+WB6At5YMi1cYqfEypEqVvJiHW6G/y+QusYsobAUumX/V0Xzkiz6zN0ZsgpAWO3mb+oYn
	NGuOBN26D0f+elc7r0hCbwgTsqE+AB1KN0ZJ63tXUa1fcDnJwFjltR5R8zXnkJtGy8qGbPl843jBF
	9aG/nH1O0ooVlPvVrPVBeXhuhH3nG1xNqyLKHGlTKanT1LAFFMab/BX3SccD1xnrEh5e2ZnERMpNZ
	IZG1jP97JvLo150hPiqUu1+BBs+7h5L9T8nmbTTT2eJ1zihorLXdzL2kguwS8Z6hHf98O6fNKwkST
	M5g6owKuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOpYn-00Ft7Z-G5; Tue, 23 Mar 2021 22:31:37 +0000
Received: from mail-il1-f172.google.com ([209.85.166.172])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOpXE-00Fshw-79
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 22:30:02 +0000
Received: by mail-il1-f172.google.com with SMTP id t6so19673016ilp.11
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 15:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wCODdCR6oRu3u40S/wC2T3hBtUKy4Q9nyQKSqWlvMyQ=;
 b=GUe6AgNNvzxqeXcBUtf4e/3xJPsahjxsbIOyeZ0oQg5XHIFeYD0p4/gsdzkNXBrrrl
 jRZzNdrE/Nx0KdoS06Vn3fyLU4gGtjngVgQqCzaqRtd0uwDgBhy3STEQm89cnKWlRfPI
 lDuQxWjerm8pU3eeCbs9Z6JmU+oFpdBXkk/5tisL1lwVGBk/49YfzxtEJn5G/DY80dHm
 tKC+//9Y3qltF+q98qIfYPb9omlhBBZTqa0l0/k8cTF46W+1668/yM7WOoa/wnqRVAms
 DezSM/IolGFhbyUwXKdqjlRs5p5hl7MJYfxK0niKSkI48dVXwirrcApA8ILm8R0New+4
 lt4g==
X-Gm-Message-State: AOAM531/YGKm/WjkG1CKzOc11AoE3DcG6uc12VR+lFVE2h4ot1QUrXU3
 9b54vGV8/6oDr4y6+aaD7Q==
X-Google-Smtp-Source: ABdhPJzgVzUJHH8xeOtn9yXIWkiP8JxI5S1dOFjNSpIy5iA1J6YZYHYaP17+hJvQFMTDbpcg5rxmhw==
X-Received: by 2002:a92:c102:: with SMTP id p2mr304870ile.227.1616538599244;
 Tue, 23 Mar 2021 15:29:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z10sm115235ilm.19.2021.03.23.15.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:29:58 -0700 (PDT)
Received: (nullmailer pid 1461925 invoked by uid 1000);
 Tue, 23 Mar 2021 22:29:55 -0000
Date: Tue, 23 Mar 2021 16:29:55 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: vigneshr@ti.com, linux-kernel@vger.kernel.org, richard@nod.at,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 boris.brezillon@collabora.com, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, robh+dt@kernel.org, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210323222955.GA1461867@robh.at.kernel.org>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
 <20210323073930.89754-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323073930.89754-3-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_223000_548833_B2827AAC 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, 23 Mar 2021 13:09:29 +0530, Manivannan Sadhasivam wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> drivers can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
