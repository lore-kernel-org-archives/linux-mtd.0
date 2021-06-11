Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080D5C48BD1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 17:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C072F613CF
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 17:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C072F613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEMMPhzFBZjCUfzkVfzQLQtRWV4mKHVYzeTHj6vRIkQ=; b=ldZ+v/Sb/en4ZD
	Ir4TkhYI/fvz6V5BjcYUps3GFNPAu+3nLR/h0W9cabOuxBl16GDIllrXfyQRIk7OO7yT3t/wwBtu1
	xeF3XKN6t2LV0OCXD2gffMM3XFhlEUTiWbAjdCznRG8pVydixEEgJNmL9rP/98OiZAYgrID6jBcoo
	r107FV2ZjTqOdaH5/S3OuqVTjDzdenZkc4eqhv4LffVnUpstZ1kIleQcqL8jR0/wMZC9pWvZ1PnFA
	JPY1et8cdow2TA2RlwESs8gkINC/Kk3eIVFWkOLDlc/552WttMkiPPhQeOxSyzwTtHsygll1IRs4k
	G31UmoavJbesRNPd8yWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrlH3-006MYY-7m; Fri, 11 Jun 2021 17:48:53 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrlGx-006MXp-7n; Fri, 11 Jun 2021 17:48:51 +0000
Received: by mail-il1-f177.google.com with SMTP id j14so3118090ila.6;
 Fri, 11 Jun 2021 10:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7VRKkg+IWhNKzYiVbA9oJxNRuL33AhF4HzAy8pw4zyk=;
 b=HC4tAhoScbiii4KuJr1Maa2CUcR9PVeyKVvOKOs0uRj+a887tCqaMrD5yQQEe5dMef
 VBGm+0EYQB5r9Zfjw5igdtA/XkFoh1wE1gu8CG/MLOPE1cKMAEdSUxERH9Tmm5LGECyd
 0bfbQyXZZ92mLm7gdqzy3PF3YHxPggXCGK9PIEgtcU10SVIHEmOTDYbSTz8H5+8yeVYw
 y4A3MIZHbq88AVRRuxKwD0vaVjUPClnb3Zu/VcoIRWLTJwa+6LqOV5kNNUNIlocUaQk5
 pkrx8lWmV5xzHmHwFhpENC0HTie1QQHVdxfQACuC261jGhaCPUAf7qBW8Sj3UDq0snZN
 0lAA==
X-Gm-Message-State: AOAM533BTBNUBHpwBapm9rHSaYO0aUUs1A2kkxd3/o2iI+u5KPGknEw1
 FLWWEcN0wdpqT9XfnFpclbQSn9I3pQ==
X-Google-Smtp-Source: ABdhPJxul/2vJdNS8fmSXRxb2X29msVliVTOrYEdyYoBvZ3AhICGmrBmzsscBCu8Z1TS9VPRV66jgw==
X-Received: by 2002:a92:a302:: with SMTP id a2mr4052251ili.184.1623433723085; 
 Fri, 11 Jun 2021 10:48:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id p10sm3997411ile.35.2021.06.11.10.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:48:42 -0700 (PDT)
Received: (nullmailer pid 1197960 invoked by uid 1000);
 Fri, 11 Jun 2021 17:48:41 -0000
Date: Fri, 11 Jun 2021 11:48:41 -0600
From: Rob Herring <robh@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: Convert ti,am654-hbmc.txt to YAML
 schema
Message-ID: <20210611174841.GA1194909@robh.at.kernel.org>
References: <20210611053533.16701-1-vigneshr@ti.com>
 <20210611053533.16701-3-vigneshr@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210611053533.16701-3-vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_104847_303902_C6EA5824 
X-CRM114-Status: GOOD (  10.27  )
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

On Fri, Jun 11, 2021 at 11:05:33AM +0530, Vignesh Raghavendra wrote:
> Convert ti,am654-hbmc.txt to YAML schema for better checks and
> validations of DT.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 51 --------------
>  .../bindings/mtd/ti,am654-hbmc.yaml           | 69 +++++++++++++++++++
>  2 files changed, 69 insertions(+), 51 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
