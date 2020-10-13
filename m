Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C169C43457
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B172534F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caZZAXGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B172534F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pbQqqtxgnZ/vxf2sDcm+wpQ0z+R7onQkDhpNMTqvB1w=; b=caZZAXGeYZB9jLib8UlhmJeQW
	SetjBXUIYA+6KJsWdL38kt/4g4/C+gHlg69Pz+jHFwourk+61+yf6xeiyqEaQvhsp6+M6w2PpZSjZ
	dwKeobQLJcG1m+bYi2ZGZZsx2E+0E0PdJpwEYA2xu5T57ndrG18O1XUpA+rjEKh5x8xaBe/30+z2N
	QuMl+pSbu23goUjEJM1OFBEKlfY5jXo91LVDPVDj74euWUL2pmBRAUPo545LiUzSCeqIuLdXZSuoe
	a6rrT4zMHtAH4JiXjytvR1v5Izws8V53A90jOehOylmi4dj2AdohwnJTBuzwJUy3Ok5al6LKR7+HD
	E4W7isr9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSO12-0002p8-Oe; Tue, 13 Oct 2020 17:23:12 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSO0z-0002oM-Rl
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 17:23:10 +0000
Received: by mail-ot1-f67.google.com with SMTP id d28so777998ote.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2020 10:23:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iK2FTKsI0wzDdbNjBagNnP/xaFtyfckNyRqgclbVTWg=;
 b=CnV2FAmW+CY8Bs1+awQdNxtg5hfus6RmcvjNihenMlPLU8/2ayvohZzjQBxtSCKSRT
 NLK4c4b4SiLqw5L3hmz0EcTE2SPvG9YQOlF1gNCMoO5gZYQu2VaXmrE5DP5WoEt/nTjN
 CuVM0Ady38rw5gmEJDw3hM9B8ou2sgZYNK4RjhhmddgHM8+di7fK+ajB+Ml1CkcckXwY
 E2BDsskrfjVpVqK4BwPG13mrgK73OOaW5bPpg5hEyki9itSkConDSa/St1Fx/m23sCom
 joa/1rTcNmh2Rs2ODCx6iOavhtbUAj0ROvWXh/oMTQAtdf9M5oAinrsi1GBi2k65N1XH
 oq6g==
X-Gm-Message-State: AOAM530KCvsDOvnPBAAQYMIdrsj8bYjYJjEGAqjZsrcJ1YmJ633LDnUH
 8XWzw7xtc6ZqmBkLRuTRzTV+63gJazkx
X-Google-Smtp-Source: ABdhPJxkI0Rvsj9nl8pA5tBEGfyLhSNzxuNulv+p19yYc67ogGvyLorOdLtkQDe+h9pS1sQekXnZrA==
X-Received: by 2002:a9d:5547:: with SMTP id h7mr540779oti.248.1602609788809;
 Tue, 13 Oct 2020 10:23:08 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m23sm184639ooq.30.2020.10.13.10.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:23:08 -0700 (PDT)
Received: (nullmailer pid 3727812 invoked by uid 1000);
 Tue, 13 Oct 2020 17:23:07 -0000
Date: Tue, 13 Oct 2020 12:23:07 -0500
From: Rob Herring <robh@kernel.org>
To: Kathiravan T <kathirav@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: qcom_nandc: IPQ6018 QPIC NAND
 documentation
Message-ID: <20201013172307.GA3727764@bogus>
References: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
 <1602566124-13456-2-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602566124-13456-2-git-send-email-kathirav@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_132309_912408_990DAD93 
X-CRM114-Status: GOOD (  11.10  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
 sivaprak@codeaurora.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 peter.ujfalusi@ti.com, richard@nod.at, agross@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 boris.brezillon@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 10:45:22 +0530, Kathiravan T wrote:
> Add the binding for the QPIC NAND used on IPQ6018 SoC.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
