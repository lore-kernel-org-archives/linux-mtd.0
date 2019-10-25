Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16917CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 19:12:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E054E21D81
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 19:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i+fi3kf9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E054E21D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08g7+ORey2sIRnUHXKn/+vC1Ipz9wYogMLP0WTxIkW4=; b=i+fi3kf9BFoykh
	0Xlc7XTtCnm5Gs4KEPcg6UI6LTLoS2TIKkaWwwPD7CODj6MCV36cEcbc91f2+vnDWwh/5GJlekgEB
	5PSIlGwCFnjhMU03DjlCziu3NodIh6BQF+om/r4HrZ+LW3oXEcd1rVd/6/cGWCFyFLeCzRQtrg8wZ
	F8ecSrOc3P0YI5HW9R0K3TQHzR0fD/NPrmOFDywa7hFPo8UuLGs1JepVB0JMm20rDXGT4tna1J1FH
	KDgZkCVyx3E/uW736tbGPR9gRBr17V2n8B7G0wpzs13l5xd14mN52PELQtG7iUKaZAr6ZzcAgRc0a
	jcs8kVALPT8T4JJ8aWQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO514-0005RI-2G; Fri, 25 Oct 2019 19:12:54 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO510-0005QN-W0
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 19:12:52 +0000
Received: by mail-oi1-f194.google.com with SMTP id 83so2343950oii.1
 for <linux-mtd@lists.infradead.org>; Fri, 25 Oct 2019 12:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jngMWCIPztnYRQYTQh0CwZua3m9mf2/Z8m7qkZoUWLU=;
 b=rvWLPmHbpySr3AAURuPp93UgTTGPtrA180BJp0RohVmPGIZ2JEwaHAGk2r9kB/BukK
 N+5Cj15Zb0kMvpp+QpL+PXBogH+sEsfYx8PO0B6kZORniM6hfV4XI1wASR4AYruQPUam
 GPB3DjXRK0xVdRjgUkawbPo8FDd/DInmAOk1iXBWMGJWJeY5dSUZfot9GO67Joc9Lye/
 OrnbAdtZRpjRZbd2Obhh3CeCP6W+DpZN+E9m5D9ddOggBe0Af6IUmSGxVnaAdFvVFFdC
 fKUvaxmRXibRBVev8uy+wRWI5Uv57sycefgnyrWCxagNfNxNnXp+GXxpwtc/x+Czk1Rc
 J40A==
X-Gm-Message-State: APjAAAUa+CiZlBOiB/eqU/TsgNqscaMFTJ0YUU7Hx0MbggdU0cjr+sBR
 ZHS1rVRbwnh6Bm3iddpflw==
X-Google-Smtp-Source: APXvYqychJbSk5eJXpbRojc8uKVE2GqcHFj9XB/1X5MHc33e7I4ZD+T/fHo/iam0Sh2IYVxB5WcJpQ==
X-Received: by 2002:aca:e104:: with SMTP id y4mr4461365oig.117.1572030769368; 
 Fri, 25 Oct 2019 12:12:49 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n186sm794340oih.58.2019.10.25.12.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 12:12:48 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:12:47 -0500
From: Rob Herring <robh@kernel.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix NAND device
 bindings
Message-ID: <20191025191247.GA7206@bogus>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
 <1571902807-10388-3-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1571902807-10388-3-git-send-email-masonccyang@mxic.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_121251_028866_D2C8ACAF 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, masonccyang@mxic.com.tw,
 vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 24 Oct 2019 15:40:07 +0800, Mason Yang wrote:
> Document the bindings used by the Macronix NAND device.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/mtd/nand-macronix.txt        | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/nand-macronix.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
