Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F64C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DFE60231
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DFE60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXycJIigDn9ppf4kJDmTSFH7eS2hsdmtZxm9HpUUCaw=; b=HnKsk1fB0xKUXs
	iavOVXsX9eNg0BTEAbB+L8jLobsAx/IbL6wSx7juoN35AQ4xGuc+nGJq8AZ7lTILmD7GexCwiFR7O
	r2vdLMgkR+i40W6KwjuuIZJE9DtdADkxgBK77zmMaTsVucmui0zt6r5AQ8vMd+XPN8+Ve+1bcdbrs
	FVhF3gG5U44oMDjtUTo8kIQN5dTb7Jv9luiYyCfc7e4d81+Msw84wNYzlYE+O8ryutDPdBBKXzwd3
	uBJv8qvZk7OWTW1Prh61Els+MaL1WTTHMO4P+yp0QVn/StRwJrKyYTB08uz3XUwTGbiwWYe9jaFIQ
	zTw8WhE8rXmV4va/Sd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrMYD-001LZm-MA; Thu, 10 Jun 2021 15:24:57 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMY1-001LXh-Ey
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 15:24:46 +0000
Received: from mail-wr1-f72.google.com ([209.85.221.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrMY0-0007fD-80
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 15:24:44 +0000
Received: by mail-wr1-f72.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so1048894wrs.5
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 08:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukUXcmzHV6X8b0Xkgch2TG03nCCj+8pCGUVjUc6wzSA=;
 b=nd/z9oc9iAp9zHc1SI5xE7xGC8bEicZ3UI/tqzb6ZFKWxwNfquJBId9+XsYFK4qYHO
 nghMFZem2zGeRHFx/UTVWIuoIBrrMRjQTfbuvDqHM4g6QEEJlpuNKes4isroXgd8+aYT
 MucNvt/gOnGWv8emi3dK/T6roh+RG5dRSbXL3wrLGTcmM3ebhMaMVKZn0Q8h91NI8IEo
 3rZ1SBjPplSt3z42lQdB6GXmjdffwBDY0AaGID0KChp+u0M17cFGKYK56ayBdulmU9e/
 tozz8TezwEFNinJKwNnJ4C5dfJcvWjZAve07/vrmF2bIT7oX1Do7jQgUc1FGQf/aFGFR
 9dkg==
X-Gm-Message-State: AOAM530D9rGLBhpYZvjvUasUHprMf+/nyG0OjcPx/dnIPBvx9gfpP7/o
 2GYlqbk+BCtWgoaq8Nu9GYY8UVEHqpzKbp3E+vdcJD5py6w8tbmK4g5AICbLAEFGSPVbJh9zDSc
 oQDsv0MZ5Oc5INFmfXqAHN/nT7BIhbQyogdpYzqykta8=
X-Received: by 2002:adf:ee82:: with SMTP id b2mr2209839wro.360.1623338681366; 
 Thu, 10 Jun 2021 08:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOTv9fulnnwFGbr5bRzeYNUhZzzKxbm+dl148j35vdYWfC9AdIoXBPeqdl9MytPfXH6/lBxQ==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr2209818wro.360.1623338681234; 
 Thu, 10 Jun 2021 08:24:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id d15sm3717637wri.58.2021.06.10.08.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:24:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, Naga Sureshkumar Relli <nagasure@xilinx.com>,
 helmut.grohne@intenta.de, Michal Simek <monstr@monstr.eu>,
 Srinivas Goud <sgoud@xilinx.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v23 00/18] ARM Primecell PL35x support
Date: Thu, 10 Jun 2021 17:24:31 +0200
Message-Id: <162333862777.77538.13169948771709140035.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_082445_509463_2BF11E7B 
X-CRM114-Status: GOOD (  10.62  )
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

On Thu, 10 Jun 2021 10:20:22 +0200, Miquel Raynal wrote:
> I am taking over Naga's series, here are the major changes:
> * Cleaning of the SMC bus binding file (and yaml conversion)
> * Superficial cleaning and great simplification of the SMC bus driver
> * Addition of a yaml file describing the NAND controller
> * Full rework of the NAND controller driver. JFFS2 and UBIFS not tested
>   yet, only bare test tools have been used to proove basic correctness
>   of the helpers.
> * Addition of a couple of MAINTAINERS entries.
> 
> [...]

Applied, thanks!

[01/18] dt-binding: memory: pl353-smc: Rephrase the binding
        commit: a70eb9165e2a0f2867f0eb78f12665893d135ee1
[02/18] dt-binding: memory: pl353-smc: Document the range property
        commit: 386783ea6d9f21374cb11e0e8b8b4bd9770ef485
[03/18] dt-binding: memory: pl353-smc: Drop the partitioning section
        commit: f1d19f7400132b45cab4ee60e974150699fe28b5
[04/18] dt-binding: memory: pl353-smc: Describe the child reg property
        commit: 6c74a55e1d791be9758d9f23b1c5375854949188
[05/18] dt-binding: memory: pl353-smc: Fix the example syntax and style
        commit: 540148ce3455f0dc4fac9414ac12337ae0ab7cf2
[06/18] dt-binding: memory: pl353-smc: Drop unsupported nodes from the example
        commit: 29c6d09f39591eb3ea5e8e64ed42b28b9ae31f99
[07/18] dt-binding: memory: pl353-smc: Fix the NAND controller node in the example
        commit: 9af22e1169dd6b0f498fa8f9bff7c44f721b1b20

8-9: still acks needed

[10/18] memory: pl353-smc: Fix style
        commit: 62584c870cba9c84f08dadc083c6359dc41df678
[11/18] memory: pl353-smc: Rename goto labels
        commit: edd84c4256e2a2c756a241728b8c31e14bbed2f7
[12/18] memory: pl353-smc: Let lower level controller drivers handle inits
        commit: 493db2b05d9217da5889840ee31121856627e3c6
[13/18] memory: pl353-smc: Avoid useless acronyms in descriptions
        commit: 9d7bb4493acfb7a131230e7785e7416de50b28b6
[14/18] memory: pl353-smc: Declare variables following a reverse christmas tree order
        commit: df6c2646d0e459ea6aa1d2caff683cc75df63b31
[15/18] MAINTAINERS: Add PL353 SMC entry
        commit: 813d52799ad28579da3ed5a88c1bacd8069dd172

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
