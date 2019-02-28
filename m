Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C11DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 18:25:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14C42070B
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 18:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBn+w5FZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14C42070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tot6TiP8VNAam/yGcJmybl0ydpJNFWNLVrFAZkJ9tsA=; b=JBn+w5FZtPuCdd
	+fD2X63NxaeUwiyz6s2jXYGIudNe1TbJsxZ/sOSO14sHRwMTq3PnrVJk63MTytauUlYllYy6LQ/uw
	mMn4TKPnehm9dyyMGFVrSWcIqu/xO1aJVCMrY2fJMX4Vq6SjJrChcLWzUN1DpFlix+FdpP664C8t6
	MgFD+Sy8wA0sTVwA01AeOIpaDBQ3E3H6zrAq0cySV6/V7sC4SJoTLISwWkVwt1qfCDyZvxAeWxX3q
	+9XnUp5e7FKrNSlF8mvbKeMTEkFPtCYcDBn8Jv8aGSJq4pIlEyiCv1i2cVV04fNqpF0AT/dZoSaQm
	XHZ/beTD+Ce5vXgd3zgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzQMr-0002Pc-15; Thu, 28 Feb 2019 18:25:13 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzQMd-0001QH-DH; Thu, 28 Feb 2019 18:25:00 +0000
Received: by mail-oi1-f193.google.com with SMTP id t82so17248060oie.12;
 Thu, 28 Feb 2019 10:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jSrRIhfTa4WE1XJ9yzCZgw4zBXph8fqSTtiUCoqXHQ=;
 b=myFIRm8+th88LvsMSdarZEUpj1vEZcWem2KNpGj1BQqKxIppSobhC+IalpiMS4Z3l/
 smwOBst4XTk7h81ZKypMygunrH34NWs6AV2xiY9kNKdOeV5rmEZLkGmEv/xFBHogWV6B
 BBTlzdg7N7TJvYK/GFAnzL7e92ykVcluhsGkq1f29V6BD5hnphps/8MR/1h5ik+iChm/
 K+sDxpT6/Y4r5IKXdEHGKJ09yg0WWY8ZkSMwIHa7t+Vr1pIe6V+Bk/BR2UMook2zdscy
 wGWeO94AxWFdaxeKM7LVBIR2miXVBeAw+IDuzyLtFQe+pHMP/mu4MLVTZvMlat+6OagT
 LwOg==
X-Gm-Message-State: APjAAAWQU6dRO5YxZG76I3EJ6i08FX/OtSxY4pTr/bwhFldnRhK0hYuO
 CbAAa7XYm0Unx8hUE2ER1w==
X-Google-Smtp-Source: AHgI3IZYrcZ80ogxEgXeBfTtEYEPD8wg6iGPdBvstlxcFtxKpLv4OFmAa9d2Ws76d5IoI4KCNH1fug==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr735672oib.96.1551378298467;
 Thu, 28 Feb 2019 10:24:58 -0800 (PST)
Received: from localhost (ip-184-203-129-180.hstntx.spcsdns.net.
 [184.203.129.180])
 by smtp.gmail.com with ESMTPSA id q6sm5614273oia.4.2019.02.28.10.24.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 10:24:57 -0800 (PST)
Date: Thu, 28 Feb 2019 12:24:56 -0600
From: Rob Herring <robh@kernel.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH 06/11] dt-bindings: mtd: atmel-nand: add sam9x60 compatible
Message-ID: <20190228182456.GA21460@bogus>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
 <20190213085930.31578-7-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190213085930.31578-7-tudor.ambarus@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_102459_450290_7FE403D9 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
 Tudor.Ambarus@microchip.com, Nicolas.Ferre@microchip.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, lee.jones@linaro.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 09:00:01 +0000, <Tudor.Ambarus@microchip.com> wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Add compatibility string for the sam9x60 nand controller.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
