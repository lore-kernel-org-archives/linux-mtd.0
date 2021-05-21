Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EBDC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:56:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C85B61363
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C85B61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VRUpb3hIESp+hIxHRF0ZqmrXtp/K99Hlv3UqE+TacI=; b=BegHl2nNF02ouwEC70bVC3YKJp
	MOsMSS8NMmfWqeDed7613zU+Rru6asfQrImzC5/F38fTiCs9QbBCtiT2y2MsXYdLyLSW/pX/h/dP/
	t1WJ6EC6/2Ace1LcME9a9fwZpGucpuILXXdmxKp0FmpOSfFqR08AqcAZ0157sELygpxJ380UZwxFn
	nRoy5RNORkZgr4tncTmaQ7Q+Ctl+H6Ud+YzxAdnb44dXmug5S+oypRKz4KJiL92MWCm5U7VmfaPlw
	qGgRoKGse3gbBr+wMuxi2EH4sbz+52t8tvaShNuipHuqFJKKSC3+WgmSSYmCsGaYrtaNAG5WC3BZJ
	q9ax7ZUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuO7-003OCy-I5; Fri, 21 May 2021 01:55:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuO4-003OAa-Nw
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eE3s3QqZdkbvKfx1bKaiPOzYVck9Xy7IUvgPpJ2b1IE=; b=Nm8BLk14ik1W2cNCW8nQc9JKmd
 SToXooAw5K8WWR0aiZsMQVACoALfX0yGT8uUXxbqkw5Xl8OzAAAs+ETkHqJPODHBddrC+GiFiIsjm
 b9x8dRfmHQ2L4fMLzZLYYkLTpN5GGsT1cL+eml3vXZnmwpsnFxO65LT84fpaFyj51elJNWXrVNSKk
 B5FRZ/cOnRIaipyfLHIiXroQrEKzSh4IFknp2/C7wOV0uSGuizAOs1ZdXDUwW6UrYX1tinWMWrCNr
 T0Li2hoLJhIXR5zDOcJf+VKDoxVcf7nz3mw+FNDtdipc9Rk8q1c805IgdMXTP1vWkCXwosLc+cV16
 8W+a1geg==;
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuO1-00Gl5s-Pr
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:55:39 +0000
Received: by mail-oi1-f173.google.com with SMTP id z3so18266454oib.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eE3s3QqZdkbvKfx1bKaiPOzYVck9Xy7IUvgPpJ2b1IE=;
 b=UMHoHEcNT+AWk6VULnT9XMBTCsd0gp4ORbdKnB0B+wk8Ltoy4fMA2lt5Qe6SYp37Qq
 zFZEdFA2rGGrHKHI/EOa8GlkjQxAkHUgEcTVOFP+GIiV7ypTsi2z37E0xanjJ4n1kZK+
 2vPob8i5N7eCuWA7nrwzwfE0zMU/QWNWP29p+tzkeFnzXOAJz/zTdeeG/v29fhFOtYZv
 PQ9BmvvtP4RRjoY+Ed1hjR3FfM9buoszmdfTn3TSWOQdzxFQ7lU6W+G1kpweRS9FBZiC
 UCI5jeDzaHXwjqwQn1xWL52epwIK1jutKA77DjH8fRnnXe7eFw9pGno4fPixATdrH3Ts
 rsoQ==
X-Gm-Message-State: AOAM530F22+hcy40hiKdcndWCK1XxqG5L467WadU6jJkzr8EKs8xshpR
 y7Tckj/qu1dvgmtqnqf78A==
X-Google-Smtp-Source: ABdhPJyNZfhFR5v7zIS49YqC4T/tmkoHiYxPx1ZbhTAlxhnLxZJBYEZUHzecjTPWui0a3sNgPBgWMg==
X-Received: by 2002:aca:d616:: with SMTP id n22mr326045oig.76.1621562137201;
 Thu, 20 May 2021 18:55:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm919683oij.57.2021.05.20.18.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:55:36 -0700 (PDT)
Received: (nullmailer pid 2490216 invoked by uid 1000);
 Fri, 21 May 2021 01:55:35 -0000
Date: Thu, 20 May 2021 20:55:35 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Helmut Grohne <helmut.grohne@intenta.de>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 08/19] dt-binding: memory: pl353-smc: Fix the reg
 property in the example
Message-ID: <20210521015535.GA2483864@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185537_859280_1B7091A9 
X-CRM114-Status: GOOD (  17.38  )
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

On Wed, May 19, 2021 at 08:26:25PM +0200, Miquel Raynal wrote:
> The reg property should describe the entire accessible zone, not only
> the one the driver wants to access. With this in mind, the example
> should map two regions instead of one to be entirely accurate.

No, not really. The address space is already covered by 'ranges'. Unless 
you need the range in the arm,pl353-smc-r2p1 driver.

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt       | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> index 1335b94291ad..9d220d4cb39d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> +++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> @@ -27,7 +27,8 @@ Example:
>  		compatible = "arm,pl353-smc-r2p1", "arm,primecell";
>  		clock-names = "memclk", "apb_pclk";
>  		clocks = <&clkc 11>, <&clkc 44>;
> -		reg = <0xe000e000 0x1000>;
> +		reg = <0xe000e000 0x0001000>,
> +		      <0xe1000000 0x5000000>;
>  		#address-cells = <2>;
>  		#size-cells = <1>;
>  		ranges = <0x0 0x0 0xe1000000 0x1000000 /* Nand CS region */
> -- 
> 2.27.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
