Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632BFC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qw1ZLLbCcNeMqlK1mKLDNVM60FmyHZYodPdFPB/Bzgs=; b=IOXuyHyfJPFICx
	0FPW7oGnsGsrcQFvyRIU70H7YYErsLzLR1q2vLOVrlAxawkh5YhRtcT/nR/q/XjweseEJcfPWo5NV
	D58n0UTK+uVIcxN4nS3/xhyCDsDOsCPUZcorWmuVmRNWgRajR3Ekw5VS2X3lYd+X/WAD13sYtSB4+
	LgVgQ1duSGjSRiqNenYyYn7lIFtKeTx6RDw1ceDTgXBqtj0LjDzicwPkcMw/9ksxwP1BnceqnFfcm
	MXNkBNXbUoktDD4/Msr5iawHQw+Rpm7bki5Rn+KmuhXm2ygcUMt+YPeMwFRr0UHkBHWoZadciKsC0
	4SMQ9QKHjs7qD88XD/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhMv-00Ffsh-Sf; Thu, 17 Nov 2022 16:04:02 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhKy-00Fefr-RE; Thu, 17 Nov 2022 16:02:04 +0000
Received: from frapeml100003.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NCl3S1NS9z6H7Rh;
	Thu, 17 Nov 2022 23:59:32 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml100003.china.huawei.com (7.182.85.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 17:01:58 +0100
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 17 Nov
 2022 16:01:57 +0000
Date: Thu, 17 Nov 2022 16:01:56 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-leds@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-can@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>, <linux-watchdog@vger.kernel.org>
Subject: Re: [RFC PATCH 7/9] dt-bindings: drop redundant part of title
 (beginning)
Message-ID: <20221117160156.00004e31@Huawei.com>
In-Reply-To: <20221117123850.368213-8-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
	<20221117123850.368213-8-krzysztof.kozlowski@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_080201_076198_5411E68A 
X-CRM114-Status: UNSURE (   5.39  )
X-CRM114-Notice: Please train this message.
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

On Thu, 17 Nov 2022 13:38:48 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Drop beginning "Devicetree bindings" in various forms:
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD][tT] [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Oh for consistent capitalization though ;)



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
