Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF3EC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24DA5613D8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24DA5613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zI2GELXfJQhquUjxFJtTQGPmf6SmattSSBc+HCu/8Q=; b=2qwCErqyV2u+xZ
	ajuK0TkBiMeeCWI2ulFjsgZe8vlDzg0K5WY78dWn55C38iRddy9PVbtNBNqGx17HrCkbKGfo+nIIn
	6SYtVoMYVwl5DTAz8B9uPSUWlFFFkbZko9yMcXBAs8SD2VfMXzktmsNcfd0f/ZwOnvp0XFKyutY3k
	MNZ3u4Cw5/ZQBP/0Yl/lguSjrCu59grU++pYZbU+V6dQ5vTx7gfktK+6nz4tLzPIxaTq5O1riilTe
	k0o5i0fAg3EjExgBEXxCWjHvNYLuPKqHKcp3V484IRKGZQ22bGStZng1vZ/i6x9xT3+xEsISKy2S4
	y/hZm6LYrqSVs24HlLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrN0G-001VBG-V6; Thu, 10 Jun 2021 15:53:57 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMvd-001RvB-5c; Thu, 10 Jun 2021 15:49:11 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso149559otj.4; 
 Thu, 10 Jun 2021 08:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jHLGIt6RLM2t7ULN/gWoY1/X6PighK4+59mVA8vx+r8=;
 b=B3F/SlYHQiSfPHjaD8d+YDk5lvSgZtlcg3G7GRlpwrIRB8NHVT/MoGaOnslxF33PK4
 VC9Oj4YnaMs+YBOoZlKpiVBfBrBkwtkey+XvPENVWaW9O4YT/Bru8PykqHXDwSQlGEWX
 ZCgSNB7eLbnO9d535Qh7Vtji6riuV+wTyq05gAH1IhMI6JnlSrsFJ8uPS1Uv2nB13kPu
 GMLUfhRxQsb4Y9sIQtjTG8/hn+DQsrc0JMbSxk9bPH+99Qo4WdXaHcHlY7K72dN54kZX
 G2GJGv+xYCKDEMNs5vH67OGTbWYxKo22A5wKFntB79ZlN76Mq4XcZ2GJKqWCOESHOaSk
 54kw==
X-Gm-Message-State: AOAM530Nz3h3ryoOpK0sAA/mOfafe91rtOUFqqH28k/vs8x526GNipBK
 UU5AMiSLvlLTRbtljFOY9w==
X-Google-Smtp-Source: ABdhPJwZnH/HEVQP9MZceozaTD8X/CkVHBbgq+n0s6TSv58Q9zBYFCo/F+Ma9llLukA882/0GaAySg==
X-Received: by 2002:a9d:4817:: with SMTP id c23mr3105218otf.352.1623340147764; 
 Thu, 10 Jun 2021 08:49:07 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id g25sm680396otn.81.2021.06.10.08.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:49:07 -0700 (PDT)
Received: (nullmailer pid 1868515 invoked by uid 1000);
 Thu, 10 Jun 2021 15:49:04 -0000
Date: Thu, 10 Jun 2021 10:49:04 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 helmut.grohne@intenta.de, Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 linux-arm-kernel@lists.infradead.org, Srinivas Goud <sgoud@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v23 17/18] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Message-ID: <20210610154904.GA1868448@robh.at.kernel.org>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-18-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610082040.2075611-18-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_084909_251744_201A4F01 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On Thu, 10 Jun 2021 10:20:39 +0200, Miquel Raynal wrote:
> Add a yaml description of this NAND controller which is described as a
> subnode of the SMC bus.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
