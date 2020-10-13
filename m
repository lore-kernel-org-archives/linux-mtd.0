Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CD4C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 16:23:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F51325272
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 16:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7Yl8NoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F51325272
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=46/arvZkDpPWMsbSKaL0fRhLCw1G/YbCkFGGFUwlUe8=; b=i7Yl8NoO4HVnaoxkG21xc5N+u
	pCZePTjwOdzTJK9SpiFX9i4C/e70JjchLTnBg2Zg7H5Nz1/vZEUovQm+iCpSuZBVCNhNsiT4i7F9c
	jYxfb+DSgaobJYll51vhD5z6BjbDe0/rf+IOJNPoVIl1JhcoWqbV1pWmGun4YVMOpa33QefeVljnN
	sZPjQcsVp7xjfqYUBwoDidiSioRr7o4AmmgDS0rmAeS7UpJqi1JoFT62k5VMxJIjMgFICbViqNQdI
	EWZ0iHJYXjbudovk6HDC03fsURp3H568U8+ss+NeEnLlXeYU6ztvtrotWQVbeE0FYaJFo5MgqGUe1
	5aQWCUNzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSN3l-00035r-76; Tue, 13 Oct 2020 16:21:57 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSN3e-00033u-1M
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 16:21:51 +0000
Received: by mail-ot1-f68.google.com with SMTP id d28so578092ote.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2020 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IdoZU5IhKB0GQX00X4PaGMQTcXMx5pZQBHr3ZUv7LVE=;
 b=n5JB+6J+DbypQywygUyYxiUXRqnlyYt+38mtbt6zaGJmIUl8hbua+skSGz/ID/TRFB
 51EtMY79hiNfo2En5AsJArHjTQOs5Yd1bHNldk3bvzX/4/blA/JQuhAwFLSILWsYx24N
 zWqrvokWTCn9RSUjDLBvJ76AWbHYVVTdfaAssQ2HZtcp+1fEc+J8cUYb2jq+HuRjEpba
 a4hHiyqZgF7QFFDHoXd16M4VeDNBMebYn9R4XNJvztpvm5+2yjeOhJ2wgDp9gDusW5GI
 KAq1Js9sYAQZ8tZAUmnW1V/klx7PX5DVsEpNiD5sKc9G7M3ikqRS58yxMY582w+0v71+
 x5DA==
X-Gm-Message-State: AOAM533hWq/bkcyhPdv3tF7GmLRQBFae3PDv3rUW7DGbeyz1+zPAwHL/
 ue0krvMQS3qOqogI5eMfQw==
X-Google-Smtp-Source: ABdhPJzmgDK5IcCO0sk/bmk6TyP+WJDVO2wUjLt2zHWTkRQiazEcZTPXdTwPapL4qUzSUtjf91w4bA==
X-Received: by 2002:a05:6830:1d9a:: with SMTP id
 y26mr315140oti.168.1602606106985; 
 Tue, 13 Oct 2020 09:21:46 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m7sm55879otk.74.2020.10.13.09.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 09:21:46 -0700 (PDT)
Received: (nullmailer pid 3632249 invoked by uid 1000);
 Tue, 13 Oct 2020 16:21:45 -0000
Date: Tue, 13 Oct 2020 11:21:45 -0500
From: Rob Herring <robh@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Subject: Re: [PATCH 1/5] dt-bindings: qcom_nandc: IPQ5018 QPIC NAND
 documentation
Message-ID: <20201013162145.GA3632190@bogus>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-2-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602307902-16761-2-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_122150_130902_BCB70399 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 richard@nod.at, agross@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, sricharan@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 10 Oct 2020 11:01:38 +0530, Md Sadre Alam wrote:
> Qualcom IPQ5018 SoC uses QPIC NAND controller version 2.1.1
> which uses BAM DMA Engine and QSPI serial nand interface.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
