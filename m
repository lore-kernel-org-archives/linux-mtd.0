Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E5AC433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 17:38:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B9A6195D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 17:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B9A6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oANY1Qr/eZR7Ri8E8+yAgXfWiJALoMe5Y78BnAupGiw=; b=dK9FWTAWRTgx6lrL4SfJwLejI
	O1eL7fQaAKtXv2Ae2RKW+O8KQ2B3kLZYbNnVNjecbp2eR+Ib5A8X5ncYtHufexOUM7YzrSfpjXfaX
	4CMuJMlcNrvY3eU4LPfqu/CfonPp7RbxLH6opSQEPyV0/Opihg7Ox+hIU5WimEyO93LOQ5ocEBLp5
	Hrig/HFIMRLrY7oNO1WmigSzLhkEzkAxEtMUGOfihA3ZVInHBLclsAmr/WynbU2ZZ0SPY7NhToJC3
	7eTVwFTKsNi3w1g5DF/3Gf6qi8xeE2nvIjKlOKAoqmwkr8IyXE6EJ5msMwhPOhm9OIUzdZ4szfiLU
	Ueduk9ZGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOOTs-00CAi9-I5; Mon, 22 Mar 2021 17:36:45 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOOTo-00CAhH-Ic
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 17:36:42 +0000
Received: by mail-il1-f179.google.com with SMTP id d2so15602149ilm.10
 for <linux-mtd@lists.infradead.org>; Mon, 22 Mar 2021 10:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xQUjNuHYH7XMWAm47YqJRg5aTzrqz/XmeXkLwUmyQa4=;
 b=VEFKFwDpaL8DdL8eXwRXTRPngWM1mYBxdUNTdTg+9KhQ4LSJfWMMiNut6uS7kExi/d
 S0zhq5uMDOVx8gyHRtDkGZYbaQai4N++d1Tgaez+waNA3owjsUBDOVvJlLdyLVTAN/Gb
 KjF5erHt6DWq5UclGRThpHkvtu0YO8yD5KlZbcVEyxqnb8FN8KCTHZVo+s6IBFvxc6Il
 x3FahBRKAQ/FLulkMjFeYOERAJzTJmWm05rAUa8PwqXJfMPay5cAbL2ho+VJjgDbW2zA
 1fj14ovFHFaoUbjZnseSmb6RncDG/IAifiondnhxK2sARIyeF4heoQb74HcaG0MJnU81
 JziA==
X-Gm-Message-State: AOAM5330aVioBXFDXqg7SrC02sk9SSUpnbqxKYpuwWNZBnC3qArQZ97t
 oVVdL/6zpRy1AP5TCYQZuw==
X-Google-Smtp-Source: ABdhPJz0JG49VkPhTiL2TvHFN9lMzCKwmiz4gcgj6j7qQOhQ3jUPxoFkxwEQmOy2s0WF8gnhh5Tufw==
X-Received: by 2002:a92:b003:: with SMTP id x3mr996149ilh.15.1616434599213;
 Mon, 22 Mar 2021 10:36:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m5sm8194929ilq.65.2021.03.22.10.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:36:38 -0700 (PDT)
Received: (nullmailer pid 2885394 invoked by uid 1000);
 Mon, 22 Mar 2021 17:36:36 -0000
Date: Mon, 22 Mar 2021 11:36:36 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v7 2/3] devicetree: nvmem: nvmem: drop $nodename
 restriction
Message-ID: <20210322173636.GA2885364@robh.at.kernel.org>
References: <20210312062830.20548-1-ansuelsmth@gmail.com>
 <20210312062830.20548-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312062830.20548-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_173640_928898_42F9C95F 
X-CRM114-Status: GOOD (  10.19  )
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

On Fri, 12 Mar 2021 07:28:20 +0100, Ansuel Smith wrote:
> Drop $nodename restriction as now mtd partition can also be used as
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
