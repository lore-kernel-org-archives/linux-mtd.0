Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DCCC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1c3ZNP2qv0vC4M7vfzYIhdqIeNcGrRfS/Wgw4xWOKVg=; b=Ya5TfeZCcKkHvo
	iqJ9FOT/YjnQgIOxgruICy0MnYBP9fDNSSjMCXmuXLOEuY1dP79dvCqLJLR6DbJZmfGiO8zfvb+M7
	e1APJJIaeHWqz/KRdN8YxHf28U6vXJu4repWCg9AGNebZl48g8GCZmBi5TKSpmnq5/80RPgcvbIYR
	P5ELfSgda6TmR1cZNjywDYXX3nZ5t436X8Z6jNX6ARVhlZaxvaUGn/YvdOLacjLXpA4MG42MClzGO
	D4/yfNvcQq/TIjYEnRYaH5dAfstN1HVDpgfL6PUj6A3vxowXO81q7Sq+v9rqzLygeO5fSkqG9l0fk
	x0/wIysn7rptOsTkxhzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovj3m-00GTAn-W8; Thu, 17 Nov 2022 17:52:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovj3c-00GT0i-Kf; Thu, 17 Nov 2022 17:52:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 075C76219E;
	Thu, 17 Nov 2022 17:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4C2C433D7;
	Thu, 17 Nov 2022 17:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668707531;
	bh=wVcYKV9ryyiDH/YHL+yzTatasapLPFcACLj99oy49LE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7sDmIc+MIiyHVMXaBusQ6SkTG7PgwM/a0EJ4zKHIvOVy6oKK6b3AT7G6BL7IAhyb
	 tQrGOQ8EZryz0g9CPyeova2t7BapHsbt5mf3emi2EuVCeQXhXqwUn+kqAW/vkW3pTf
	 Kd3saMsh3WvsIsW95EjyysGP+2g6w6bUubvY77zS2JNX3hodGbWwqnkeOfkUkv44d1
	 wVdNvSyfxUXTwGs/CxfcJu1R/YNgmbTF9P0hHUecae9laDee6pIqWGqoCswKxWBQ7e
	 3D8Kmq02sXbN6LrlSaw20+B84srvuF3HVurawDtGLsPyRommshzXNIKHm27diMG12K
	 Io+tfOlGUFb/g==
Date: Thu, 17 Nov 2022 17:52:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-can@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <Y3Z0w6JH1f5zgwvW@spud>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_095212_773945_765E5DE3 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, Nov 17, 2022 at 01:38:42PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".


> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 1ab416c83c8d..d2de3d128b73 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Global Clock & Reset Controller Common Bindings
> +title: Qualcomm Global Clock & Reset Controller common parts
>  
>  maintainers:
>    - Stephen Boyd <sboyd@kernel.org>


> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> index cf9c2f7bddc2..20ac432dc683 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic OPP (Operating Performance Points) Common Binding
> +title: Generic OPP (Operating Performance Points) common parts
>  
>  maintainers:
>    - Viresh Kumar <viresh.kumar@linaro.org>

Hey Krzysztof,

Hopefully I've not overlooked something obvious, but it wasnt noted in
the commit message - how come these two are "parts" rather than
"properties"? The opp one at least don't seem to have much more than
properties and patterProperties in it.

Thanks,
Conor.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
