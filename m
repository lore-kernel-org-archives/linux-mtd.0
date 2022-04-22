Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8C8C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c92VntoDkfoGl5B6LpFrrR58FcmVaoPtU0m7vy7osvs=; b=yKqbSzbbvOgZrO
	M8Rq+4yHD27lkBXtO/hm1vZLpQqUoh5inleeUGQagVWnB48WavFcWdF4MLmaD+EkWdqIN1cAs5mgV
	mkNL6H1vFGKomx631zRo9useJo6dwB0eiIRSZcor4bdcRZrAUdZbRJXmn1brjUdYTCK1OvUaokL6k
	WovdkRX50Yx75nskLkFHULOnZC+5K3kSurlURBYNWF8MJrSJLTPRA06OBkXSusHIuxqjbv3bB0SLJ
	JlYYenlUElWbVQ1h7T+T30XhNrT+GGYkX8CjstwNjJzDL7hzoyaImcJ4AIPbog5V5ZRaiVTCAvLXm
	xERuzpUTcTlmMOandz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhz5w-0029NZ-Oo; Fri, 22 Apr 2022 19:37:32 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhz5t-0029Lt-8B
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 19:37:31 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1B567C0004;
 Fri, 22 Apr 2022 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650656245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VfEQnMLQBp5gcbCjnS1m2KT836fiq6O/cfzcdERxXCI=;
 b=j5G6WCpisDyJMaBpdGq55laQYL2EYP0G8+ANfLVS7NbBP95B21QouzhNo7XBFTikfKY9G7
 pG5U9eT+63blfEGRcBnxyDC49YB76QFwN013Lt36pxExh2ArQGEKKUAxGgh4S5/b5uSn4T
 Ni1kN/GIjW44LAlb3UaSN/T2cBZe20+S7bJD7ePfvcYk+7r5gyM2WkL1UDZGzXR0MxXdbX
 6131WBe9v+3LMj6Z7TTzQvXKYbcTRuQrlAnVJv7aY9advLLz69eZsri4By7UxlXW4IOvia
 62rV3xCO013hZLwwY9lhuJE5ovFI5RRxOuQVhY29287MMh0fmfMI36ce/4BkuA==
Date: Fri, 22 Apr 2022 21:37:23 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-rtc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop empty and unreferenced binding .txt
 files
Message-ID: <YmMD84TNCqhkH+Hw@mail.local>
References: <20220422191958.2589318-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422191958.2589318-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_123729_480066_7F94CD01 
X-CRM114-Status: GOOD (  12.72  )
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

On 22/04/2022 14:19:57-0500, Rob Herring wrote:
> Drop a couple of old, empty .txt binding files which are no longer
> referenced.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Documentation/devicetree/bindings/eeprom/at24.txt | 1 -
>  Documentation/devicetree/bindings/mtd/common.txt  | 1 -
>  Documentation/devicetree/bindings/rtc/rtc.txt     | 1 -
>  3 files changed, 3 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/eeprom/at24.txt
>  delete mode 100644 Documentation/devicetree/bindings/mtd/common.txt
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc.txt
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.txt b/Documentation/devicetree/bindings/eeprom/at24.txt
> deleted file mode 100644
> index c94acbb8cb0c..000000000000
> --- a/Documentation/devicetree/bindings/eeprom/at24.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -This file has been moved to at24.yaml.
> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
> deleted file mode 100644
> index ae16f9ea8606..000000000000
> --- a/Documentation/devicetree/bindings/mtd/common.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -This file has been moved to mtd.yaml.
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.txt b/Documentation/devicetree/bindings/rtc/rtc.txt
> deleted file mode 100644
> index b8d36fce5e2d..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -This file has been moved to rtc.yaml.
> -- 
> 2.32.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
