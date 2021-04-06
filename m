Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3AFC433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 16:33:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6A361242
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 16:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6A361242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uvqgZ6Xakr0kQ9byFBDmLeIoXnXIMS+3ogBv2b+r1Do=; b=iZXtUZIJcLNx8raqTTra3rPxq
	929oX6T6YabZpV2imZrmd2d6sS8eq284FRXG1CFMFQHshXdNPYEcjtQ5uIAEcfTlJQ9t7QU0oWfxr
	YagenOY+GcGnasLNhRXOtSnO+bgEzBh73aF2DHqzVWsHsGhsGSfrKu7zsvx2T46RXstc8p3yUGV78
	9+fgsKkQejYzOA6CCLqGeZt8DlGBaz6zJsI395XGApncH1L91nqoC5SwWMlKq9ImN+BdFLoESr3RJ
	c9xeUHR52w6xE0VU4HWD5UIPThmSRLBSQx3AzIJprQYQWCl6z+Ak5gBl6ErIcoYFJegctnIxletTJ
	t/r4i8bJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTocR-0030hS-OM; Tue, 06 Apr 2021 16:31:59 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTocO-0030gx-6X
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 16:31:57 +0000
Received: by mail-oi1-f178.google.com with SMTP id n140so15706575oig.9
 for <linux-mtd@lists.infradead.org>; Tue, 06 Apr 2021 09:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YP3e4a3p21hXudocTBXWvAjnARys/nIu9ypDgjHtU/0=;
 b=m+EkfQVduHVrIcprvycOVL1jAHd4a+ftEzbUTPsri3mD8FWuvmgWUdhFy4Wiehmhwx
 nCbXnnTIOaYSu0I+s3qGck9pr9kQUL+/dFlVnLOHhxlBuPLAa1yDi19jQmvh3gbh/L8t
 oc8VMZaWIF5cR2muVjDbWk2fBy7+1rBggIzMoeYb9Nl4WrrFX7lMBkFIHk5Nn1dV2UP1
 b9dWxRpIGESUwzlwyB5R7Ry1EKCKMIDiUQBxLndr7DNO8q32FRDcbKAkwQLv2SoQKcNi
 uYQLvQidA1qXrpWMZ7hJDJVh1k6bbG+c+JddyWuz8VbzfsBhIM9qe4ek4IqNB4FhPzS8
 C+kw==
X-Gm-Message-State: AOAM531gQtMcj9lmIfK6IiIDDtxWC72DVCK+/ZVnuXfBv5f1SDqrZQWj
 CrYyL8dwOd3uxj2Hto0xWQ==
X-Google-Smtp-Source: ABdhPJwO1ar3Q3AELO4z6vtDhDYzr71jD2j5comjLfYe2J0Q90uxLsBEobt+OhPckaWtee8I7biRzg==
X-Received: by 2002:aca:180c:: with SMTP id h12mr4132885oih.109.1617726714839; 
 Tue, 06 Apr 2021 09:31:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 3sm4276319ood.46.2021.04.06.09.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:31:54 -0700 (PDT)
Received: (nullmailer pid 1920001 invoked by uid 1000);
 Tue, 06 Apr 2021 16:31:52 -0000
Date: Tue, 6 Apr 2021 11:31:52 -0500
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Daniele.Palmas@telit.com, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 devicetree@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH v9 2/4] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210406163152.GA1919684@robh.at.kernel.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
 <20210401151508.143075-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401151508.143075-3-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_173156_300785_47340980 
X-CRM114-Status: GOOD (  15.27  )
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

On Thu, 01 Apr 2021 20:45:06 +0530, Manivannan Sadhasivam wrote:
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


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
