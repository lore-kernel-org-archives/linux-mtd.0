Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2585C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 20:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF1261131
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 20:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABF1261131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEUAs0vZ6tg8q/cLXUHtBA4jc+sfJXFT46BDwB+33Es=; b=2EJTqT3ftdMBnC
	kEWboqqoTHdLde0x5oCU67nzKTOXshi3M3gzHi/9KRr5An0nwpENAhBhBeCjuTWSpFrY+DOYs3seH
	vbZ0lo2kd6RmeJOvrWjnynT+mebKnwJIq9MEPFMfBdHfMh8tIgorkUrDpHlOFELvFdF+vC4rdvRR4
	mHg2DpMI0rp/4Yk7W5Y4Dy084yAVfBDVKxagSLCpP28X9eV9O1eeejwJGMNQdxts5cnnexmV0/MX9
	geL0YR4zLYOU7eQq4SnwIxtRPlKEiFfMms8R6XjHu+W+kaMI+u68HjVNBX+gp6Vzdz8Jwu7u6alRJ
	Q/sfh1x0mObuehXgbByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLtBi-00ARW4-51; Thu, 02 Sep 2021 20:19:54 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLtBe-00ARUs-OT
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 20:19:52 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so4112739otc.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 Sep 2021 13:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zc4Bka7Z27BGz/FwvwBav+oDcWlZ03tv3Oc8DdWUZWI=;
 b=lqTjnrlDYVsKXP9sR/diltIrcYnGXxJaFybxAnP499iGCrRSUnYQPCR2VwIRyQL/uA
 WC/OlYSuDOTXbdbxzPNS/UciKsqufMP9KIkL4teKz1oPa2FwRFnLpRDr1dM3UEnHLk+5
 9wf8PbFDs1EpIZr7UmSXpEJ+i5SQB7eaW5vkPPIIjNX0NTKx/Z0AxHABNIUxFfp5LiR/
 6Aa0r+gQ+0NSObxOfPW3vcjZMUND87gJrltEYMmbreh4lgLuaHmX/DvgASIOd/ojO6X6
 1p7oRzyp2htCt71F5wjsWONl6ZOTmetY5fbLtEwnaHoFHzhhSGJfBRuON0SOlGbIKqiC
 k8tQ==
X-Gm-Message-State: AOAM532zRGFcgjMxrA8OniabI1mfzFOtO2Le9RIOz3rz+3parHjx9j7n
 6gQC4CVrXQdaKgX0fh5f4A==
X-Google-Smtp-Source: ABdhPJw04aku2y1a3SMsnpZ4nOCM6NowBUS6YDQcqSvrA7ax/OabLLpjd1UAk6sQK81rJWoJ0YGwIQ==
X-Received: by 2002:a9d:705d:: with SMTP id x29mr53896otj.260.1630613989387;
 Thu, 02 Sep 2021 13:19:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c7sm536107otm.27.2021.09.02.13.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 13:19:48 -0700 (PDT)
Received: (nullmailer pid 1341550 invoked by uid 1000);
 Thu, 02 Sep 2021 20:19:47 -0000
Date: Thu, 2 Sep 2021 15:19:47 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: tony@atomide.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, nm@ti.com, lokeshvutla@ti.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
Message-ID: <YTEx44lPKf0jaIU3@robh.at.kernel.org>
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210902095609.16583-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_131950_901413_FD4F1FAB 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Sep 02, 2021 at 12:56:05PM +0300, Roger Quadros wrote:
> Convert omap-gpmc.txt to ti,gpmc.yaml.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>  6 files changed, 370 insertions(+), 163 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml

Also, please install yamllint and fix all the warnings:

../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:97:6: [warning] wrong indentation: expected 4 but found 5 (indentation)                                                                                                      
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:135:9: [warning] wrong indentation: expected 10 but found 8 (indentation)                                                                                                    
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:190:27: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:193:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:199:23: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:202:34: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:205:32: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:208:32: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:211:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:214:23: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:217:26: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:220:25: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:226:28: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:229:29: [warning] too many spaces after colon (colons)                                                                                                                       
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:242:29: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:245:29: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:248:22: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:270:25: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:274:27: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:277:27: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:280:26: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:314:25: [warning] too many spaces after colon (colons)
../Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml:317:24: [warning] too many spaces after colon (colons)

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
