Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D5EC77B78
	for <linux-mtd@archiver.kernel.org>; Thu,  4 May 2023 20:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaNal0bvmvo3QiAn35UD/fSWj4WIltlyr0UqruVyBtQ=; b=dNrK1XX/4SmC+l
	u0wi+OdS6VVSGVFEBBopatqB5/kC2TVqiYboI4cO/MkQowSlyQo1TiLuMwUakpn08rLsUwdzU5j3y
	8YROl+2KRNi2+jHLS7wmTVnPI7VoXQ/3dNXPESZanRGGkMYyIY+IkyKN9tXfZPNsct0MSigXaMTv+
	IAYKu7MGfamAH00vSsYZ0VCl2URuCA1MoRwtqu6sTZUAwNb9T+uGKpc3H5BSViFkyFl2gCbHz74vr
	9LQk2RJwSRs2NXjGD0eU5EN95q95s5cHuofEYSptfp8OZCUWOim6+6QaV4/vkYJnVupRIuf13m+JE
	JJqMub3fzaWv3SgWlAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pufKO-008u0Q-21;
	Thu, 04 May 2023 20:13:24 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pufKK-008tzK-1P;
	Thu, 04 May 2023 20:13:22 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1927718b240so636969fac.1;
        Thu, 04 May 2023 13:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683231197; x=1685823197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmGFO1ls8mvzZ2qitW1HiZvAeEBGZVDV30N8xTg86N8=;
        b=gUEzWs8dj4dH4LpzJZUOGq76DdhoCJPXW+a8bSpOXKJUbiD+sq6Za/ezTkNq/cL2Wx
         CWUyo5EtcVf820zQ9kDIpBzoGqcFts7Qkpmmd/xkJcAHwB+c0Z9+LeO8vtZAS7NeBQzy
         0Gg8EXxCjHAT2edVOlbH+Vb9JMGqDKGQwzLYex1t/bOllDSSl429gITPSvuICx1I5opM
         jxmr2XCNuA4UaxNsC640JWsuUyu6qV5oCG/MaGrzYeUXm42EYry7BfwBCVpCK5Aa6miq
         uXiZFVE71P9V5roxDypa8peVmft87/+cj+QviuMZ0Q3pvIoKTOwnG1d8XbcPRH0TmljP
         KK+A==
X-Gm-Message-State: AC+VfDzTMx5TCYyn7z7kYcYxP3U/IUNsdB4uaR4/1X9vL5BXUUFoI099
	yu8t+JBfXAQxaOLE33wmJw==
X-Google-Smtp-Source: ACHHUZ5aCv1z/4rVPGyRr+R5ZqjX+p/gM8IRCJt/kBRMkNPFLsx2aGTwceNqGw0i8ceO0k5bw7HZZA==
X-Received: by 2002:a05:6870:93d3:b0:17e:da48:b65f with SMTP id c19-20020a05687093d300b0017eda48b65fmr1464119oal.22.1683231196361;
        Thu, 04 May 2023 13:13:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e2-20020a056870450200b0017f84f81f3csm1003986oao.52.2023.05.04.13.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 13:13:15 -0700 (PDT)
Received: (nullmailer pid 252340 invoked by uid 1000);
	Thu, 04 May 2023 20:13:14 -0000
Date: Thu, 4 May 2023 15:13:14 -0500
From: Rob Herring <robh@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, git@xilinx.com, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, Naga Sureshkumar Relli <nagasure@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] dt-bindings: xilinx: Remove Naga from memory and mtd
 bindings
Message-ID: <168323119248.252262.3704807391594267570.robh@kernel.org>
References: <6b4cdc7158599b4a38409a03eda56e38975b6233.1683103250.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b4cdc7158599b4a38409a03eda56e38975b6233.1683103250.git.michal.simek@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_131320_472170_64FEF44C 
X-CRM114-Status: GOOD (  13.21  )
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


On Wed, 03 May 2023 10:40:55 +0200, Michal Simek wrote:
> Naga is no longer works for AMD/Xilinx and there is no activity from him to
> continue to maintain Xilinx related drivers. Two drivers have Miquel as
> maintainer and for the last one add myself instead to be kept in a loop if
> there is any change required.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  .../devicetree/bindings/memory-controllers/arm,pl35x-smc.yaml   | 1 -
>  .../devicetree/bindings/mtd/arasan,nand-controller.yaml         | 2 +-
>  Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml  | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
