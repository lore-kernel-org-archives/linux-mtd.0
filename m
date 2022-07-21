Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EDEC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 03:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T36NPQo1sJvYPapjNCL1Z6rueMKPkDi3pSFBkQLyEk4=; b=gNJGavQi+iOYyw
	jEdCzWcqHR10knSwaL4ai4ITFqzjU/YFw8J/Gfw3zUNJg0Qr/Mk/MG45oohwlr1TolafTpKGvuWes
	DpqaqTOA//kE1zRVGXSa4enNAXDSMRHqOX+RKJks3pdMMR+7YmpyC3ePQJR5N3T0C8DHp2KY2mwy5
	GOLqxIBFFYHFjYGwIMInUCEnYw3HPDCEqmp+yUFPfXmiAy8/8FUps4kbDPhVXmwfEZKODe9iw1RjL
	ih/EDA0b8DQ9IVpM5kv5S7yTnh03Bxa9BM8Ole6h/Ee2iRVi3SLY8DL6DyO5V1VtgR2ZB9CNSiB11
	yYuR/HjCv3G5tdjTravQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMwI-00FiNO-47; Thu, 21 Jul 2022 03:33:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEMw4-00FiAq-0V; Thu, 21 Jul 2022 03:33:13 +0000
Received: by mail-pj1-x102c.google.com with SMTP id f3-20020a17090ac28300b001f22d62bfbcso601728pjt.0;
        Wed, 20 Jul 2022 20:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=9LvvtodZE4lnsgetaSvcmgRimwxuWALnezRS08pYm0k=;
        b=TmVs+1guzNg30xg3VprA99agrAp38CB+N1VaRhKq1i8qMFROXoTVk1DwtdB106MEU7
         tsyjL4fxs05MTr1LUJAg0PorfBrsszb4zJnP0I+urfRzymxp0Tk/E33okda82Fdk+ua3
         7qxSL+5R6eVHAOXcxsYb4xFH3UNUlTcS1BN+CyQxLzU/BAspVKxsPYeWi7KJuvlj1X9h
         AaGqY7t1dEo5kuLkqm3/TlZwipOoU4m28b3Bj8JP66iw/EKERRYd1lSN0X35BqTLh7aB
         RyZPGq3KwgUnnoTE/qQn+IVg4O+69OkLItKJEgfLP9dc4fht5MiEN/hUeGaqs00WcWAR
         KJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=9LvvtodZE4lnsgetaSvcmgRimwxuWALnezRS08pYm0k=;
        b=w/n/f1W4jwOAR9UJW9pn0kgrPqaq/JNoEd4TIiHb2JjSte5kJP/lWAnSqHScx3vh9p
         omI2T9jTs5/xo5ckXbfm23SkQxuM7cmVM5ALegGocUsdY3pMXz9Ot3FAdywi+6z1THvh
         jL/XWdinwfqr3SkrgY95NgzR3ZTL1VQQ4YOSA1Jef1rHU7AtZA923HotuCIJ1UMJ0QZB
         yclz1EfYDC8KOGLiZqCuTqtNlM5fbqxJszsIZE3zN90a/RaUIRT9+VcPq/TBDviXo21Z
         ZPT9UUiOBuu+h5PPn0OARZ3maJ1CgDwbtxAW9QcvtA5M53NUDYd1dngCqNjBcVLj0MdI
         3zSw==
X-Gm-Message-State: AJIora8oqqHNc1FgUmE6hYUaWjwX8ideGMSofCgttN8ZernDheHht1Sr
	jOLPBEkOwNnZ6K3+ST/1B4o=
X-Google-Smtp-Source: AGRyM1vCo1UIUGLQA7xTplZMs5jbkpZuKvy7nkBmZlb5W6wFr3tbtgJkLURE8BVLbTSfLc2SJRn1sQ==
X-Received: by 2002:a17:90b:1b0c:b0:1f0:1c:1f8a with SMTP id nu12-20020a17090b1b0c00b001f0001c1f8amr9030659pjb.77.1658374390425;
        Wed, 20 Jul 2022 20:33:10 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id f26-20020a631f1a000000b00415320bc31dsm266836pgf.32.2022.07.20.20.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 20:33:09 -0700 (PDT)
Message-ID: <2492407a-49a8-4672-b117-4e027db09400@gmail.com>
Date: Wed, 20 Jul 2022 20:33:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [RESEND PATCH 0/9] arm64: bcmbca: Move BCM4908 SoC support under
 ARCH_BCMBCA
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
To: William Zhang <william.zhang@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: joel.peshkin@broadcom.com, dan.beygelman@broadcom.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY DEVICES (MTD)" <linux-mtd@lists.infradead.org>,
 "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:BROADCOM BMIPS MIPS ARCHITECTURE" <linux-mips@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220721000626.29497-1-william.zhang@broadcom.com>
 <40cec207-9463-d999-5fc9-8a7514e24b91@gmail.com>
In-Reply-To: <40cec207-9463-d999-5fc9-8a7514e24b91@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_203312_084032_DC56943A 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 7/20/2022 8:32 PM, Florian Fainelli wrote:
> 
> 
> On 7/20/2022 5:06 PM, William Zhang wrote:
>> RESEND to include linux arm kernel mailing list.
>>
>> Now that Broadcom Broadband arch ARCH_BCMBCA is in the kernel, this 
>> change
>> set migrates the existing broadband chip BCM4908 support to ARCH_BCMBCA.
> 
> Looks like only 1, 2 4 and 5 made it to bcm-kernel-feedback-list meaning 
> that our patchwork instance did not pick them all up.
> 
> Did you use patman to send these patches? If so, you might still need to 
> make sure that the final CC list includes the now (ex) BCM4908 
> maintainer and the ARM SoC maintainer for Broadcom changes.

And the threading was broken because the patches 1-9 were not in 
response to your cover letter.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
