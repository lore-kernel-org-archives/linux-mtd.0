Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BABC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C96360F57
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 14:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C96360F57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YRU2r/hNOGOZFKl8wZT8PMyJfn29MQNsVcoJLh53KTI=; b=ErvwQMtSJVOij4bL3y41XyL5Wh
	iBrq436trJFOJ0ctbclZqmxGgYfOd9hPmExSDMWRQBw3C8Tv8eVQ5AZV0Of6uKyB+BwWd/ptTKN0O
	Yn7y/oUc1ruhrhVHCD1Pqym9BGirMmVkDmFbeFEf2OtUalqKDHWlizKRUgzA6iSDmXfneXp8UZ6WO
	Mi51PegjQJ7eWToCzrLzgDZRkkhzESZVdChJTN4uY1piLpU6pSndXevmwu5sVGevcdlOHhRS9/o1R
	R7wjTc/7tN3QKXEeC2s7QGafrTYd0nqabYlLKWOFzOPqRX8RHyGh2/RcCZFmsH1gsRtKXAotX69zt
	ZXsgPelA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZDiY-005iaS-N1; Sat, 09 Oct 2021 14:52:54 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZDiT-005iZE-LS
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 14:52:51 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8CD1840012
 for <linux-mtd@lists.infradead.org>; Sat,  9 Oct 2021 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633791160;
 bh=cUxQy0Bth8q+GCo4vniDh9W7ssLXht20HUqFZATsxok=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=O1cOJHu5S2s5g6CVxWSYXRFuVPLSXrSRx/BhizxvBYFUugeMj/mJzVsz4W+idzW2b
 yFEgw8CN5TaT37d8sSUrM3+65A1OR1p5V7MzbPVpRVtNsFRVCSJojzkqLzQQ1c5h02
 jWAAcCMMJAHpCx7AcRD+kPuCyS8tmf0u5xlFtaaJ9L62y7Fh+zGFyLK8Tg8WhUAoge
 hbfxFWoWo7AGawRzgC1UTJLFjz2ZCs7dyQxZ8Gtpihia2t7KO6rzA9V6u1mxzKxOQA
 9VbC3FJcP4CLqk8zMI/txxkUq5AzP0nsMGQZXo0YljKsvB7JHh6DjhX//reQCpDNUW
 wn/ZJiyZ9t4Tw==
Received: by mail-ed1-f69.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so11719926edj.21
 for <linux-mtd@lists.infradead.org>; Sat, 09 Oct 2021 07:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cUxQy0Bth8q+GCo4vniDh9W7ssLXht20HUqFZATsxok=;
 b=yLLue3d8MUmHs4QfbaR1qgP+wQZS2dUjeHLvFkB1IM6E5NseYtKt8aCTNUWRbleAMv
 x9GzeFTtKegOokOGomEsIP6P2cXCnoTK50VdMHb+Z/tpAKCTZIRxPwp7+jS2TepEdfo2
 xCmXxPWh+ONzfT3+Ya5mDvzN06wm8mBnfeFyaifbRghL8zQP07ibe06iJQGZKqoXehhh
 /vv7EodJGE6EjuHReqIgHj4RfVxHDYHvsR/KUT+aufkcfcyQBaqkeuYl4ALnvZnjJNPV
 eRbETSfzT9npMmmBxW/ctm9iL0vFua1BRMqan2zsOZ1XzUHU94Nuif4R6Jqnf+kpgIPv
 ZQNg==
X-Gm-Message-State: AOAM5303emTWDeODcFjSYsB+lkScx0xMgExfnuI5iEC5X0t0Ck8LzUNN
 mYdG3YVIpDHMkRr7AijHKoof1xzUIGl697HDKtEhEKkZm+LdY1Iyty1+hYIwdmP7V5MoUy2BhnV
 DFYlRdXWXPHzIsGOWEcbTfn9ue2BsxoJFB55mNM8p6H4=
X-Received: by 2002:a17:906:4f96:: with SMTP id
 o22mr12106274eju.169.1633791160217; 
 Sat, 09 Oct 2021 07:52:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQkyKpJO+752VWuzH558+pOz9Vyk2rpYND0quJOBJ3uvzM5hpazCy/T4WFK8NFjQUP0vkb3w==
X-Received: by 2002:a17:906:4f96:: with SMTP id
 o22mr12106249eju.169.1633791160026; 
 Sat, 09 Oct 2021 07:52:40 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id i4sm1307649edt.29.2021.10.09.07.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 07:52:39 -0700 (PDT)
Subject: Re: [PATCH v5 3/8] dt-bindings: memory-controllers: Introduce
 ti,gpmc-child
To: Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <20211007120830.17221-4-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a6478659-cea1-8c5a-287d-acc27b60a898@canonical.com>
Date: Sat, 9 Oct 2021 16:52:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007120830.17221-4-rogerq@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_075249_886342_605EA8EC 
X-CRM114-Status: GOOD (  13.99  )
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

On 07/10/2021 14:08, Roger Quadros wrote:
> This binding is meant for the child nodes of the TI GPMC node. The node
> represents any device connected to the GPMC bus. It may be a Flash chip,
> RAM chip or Ethernet controller, etc. These properties are meant for
> configuring the GPMC settings/timings and will accompany the bindings
> supported by the respective device.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
>  1 file changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
