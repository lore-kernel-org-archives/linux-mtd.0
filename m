Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D1CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6B860FDA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC6B860FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkP7kVOpet1696M/AkPk1S7UjP0GCarhK8w8IUGTlsE=; b=oekHb76ouwr+Vf
	5YnOgYc2NevS621Ckw5EzSiE+oiyBrr3w4sQzutbRQcb3ylPp6APY20kBzJCO2rig9cFD9QxRgMCE
	E1fy5zhxOE2eFJEMxjJkENaP0zRQO5enJIGEP5esKkdBp/0/FzAsTDqBA4RAVgXqs64/6cwMvygPh
	UAJ8f7lRVIbBFGvvNyGGQGZE/Sqr17Oc194Kc1IQ2cE/U0HVNA8n7h6aPjc2UZxsLfQuSeCLEOwXz
	HYRleTX9Qv2CZxIDOD4E7rP3jxhDnFVpeKdm8+mc8O4l7MjNN5JpFwVEVLZ8AecpEfkFe9k9zh8rv
	JBLwYAAdnocO0jt7g//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmX6-005iAY-6h; Tue, 21 Sep 2021 20:38:28 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmX2-005i8v-1j
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:38:25 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 67-20020a9d0449000000b00546e5a8062aso236223otc.9
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s0hCVXKHoNUGYO2rOrlkceofb8qBLeKfxXe120uadrM=;
 b=TI2r1AWSznRlXvfjdWfpPm2eYmmwDEtoATudR/Uc2vH2Nr6e9VTRPJ6R05JiSLsZin
 ARExd2oQXGMDqHTFbKl2JW8jW+FF5o2pGqRvIVOyazCpTMWU/gvMfuwDI5+6w0fog8pL
 WWTj/SBx6IlYs3JbkhA2NBi/gPTr0kF/97nrWbtsXSXT3arpZfpuPYcT0VSVg6BpiC8K
 I6s/RWRFK7w82Du+UQzO+fX6I/WkH7oRdL1kT8ftzcdLyJXk6rekUelbnxe4srS1iqvN
 pm/lKIaaurcAUcmIcfzn9/C0bEmqBcuvBNSGuKUVBoWXIjEO42bsn8/bNrNNIf1F7NvV
 Rz6g==
X-Gm-Message-State: AOAM532BDDYhbrcHWGjhZLiVZslvpgWKhdKJ2we5jfv5BCOOmlTMtx7U
 PIXsnq92GVZHRjdDpPrkgw==
X-Google-Smtp-Source: ABdhPJxb8SjwgoWMU0sKmvW7UYVj9lzYNrUbsYB/MFhxnHuQzWDgUPsF943512sRTDwXp8ODWc26TQ==
X-Received: by 2002:a05:6830:34b:: with SMTP id
 h11mr27633636ote.319.1632256703179; 
 Tue, 21 Sep 2021 13:38:23 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id a3sm21559oie.3.2021.09.21.13.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:38:22 -0700 (PDT)
Received: (nullmailer pid 3288151 invoked by uid 1000);
 Tue, 21 Sep 2021 20:38:21 -0000
Date: Tue, 21 Sep 2021 15:38:21 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: krzysztof.kozlowski@canonical.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, linux-omap@vger.kernel.org,
 grygorii.strashko@ti.com, tony@atomide.com, nm@ti.com,
 linux-mtd@lists.infradead.org, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 lokeshvutla@ti.com
Subject: Re: [PATCH v4 3/8] dt-bindings: net: Remove gpmc-eth.txt
Message-ID: <YUpCvdZ+z7P4fZED@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-4-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-4-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_133824_116003_70DDB201 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, 14 Sep 2021 15:27:00 +0300, Roger Quadros wrote:
> There is no GPMC Ethernet compatible or device driver. GPMC is
> just a bus interface over which devices like Ethernet controller
> can be to.
> 
> For SMSC 911x Ethernet chip bindings, please refer to
> Documentation/devicetree/bindings/net/smsc,lan9115.yaml
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/net/gpmc-eth.txt      | 97 -------------------
>  1 file changed, 97 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/gpmc-eth.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
