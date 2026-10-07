Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8E8CA5FF1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2026 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMDKIrbUlUEINpNYb4alMv+Pp76VzpXmycnH+4j1r2o=; b=tcPkDlfpSACkUs
	7poDuY4y5WIXloXrWjsyCGPkmQjJl6Pp3ERB78WXDSE1AsKDA0tjzIWVHOgwFEKpOYkczhbLIF07W
	Xopq0ZDMwKhn4vxJ3Om+viojC+AlfGhFx/6W2MmKtYAkzqcvDm4849pCWAtF0sAnsilifJly8T2aC
	9YWXS18SMHMQgi7L17apqew1/VPc7PDYpdGc88gbtLYPS54k3ouVByS2HaRT4S7Eo9pI+yoaptOZG
	7o1H1e4UCduUpahINKBKG2K5GAjLVPL1ObbATzdeKb6PMgYH8wi0BdvW/ra+Frb/8sP6OMhL4rYm+
	ncMucpIpoW97nttis/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERHj-00000002Uqf-1iUH;
	Wed, 07 Oct 2026 13:02:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERHg-00000002UpM-3uyG
	for linux-mtd@lists.infradead.org;
	Wed, 07 Oct 2026 13:02:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so12960835e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2026 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791378130; x=1791982930; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oh5rIR08i4TyY7lq8CLJGXNhWlRCuOT//IfseSCZrK0=;
        b=HOGprLq+jGEjOQOkcPj0kkCZIHyPbMtG9EONzofzRdOtNBjA2RthdesxPCoPJcTxhi
         rMLOoG3VCW/ooGjI1tcGIaDcKbYaUXkV7w9b1/IzfMgwbmPnmDj/lyp0KkQgKTHkSHPI
         7PrRV2MlQdNvmiEIsxuq8KZ9yB5dMmHYn3Sgy0Mv4llchdWSt+VNp59r1S3zteiXcG3f
         AmEJBiH4HKL6X5Or6WQdnuhgNUtPmUi4HkZ+PNoAODJPkmUbvdHzIZf0pbDQs4zpnSok
         vY2q8/XVPjALMmD0T5VvXsUrIG3RoHkLdA51Mg5aUN71puNq7pTUBpKiMZO+1BHMeOuD
         NqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791378130; x=1791982930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh5rIR08i4TyY7lq8CLJGXNhWlRCuOT//IfseSCZrK0=;
        b=v0CztOE2oy0wbkaB/w6FloUkeQJtu6/vgUswFXrwJfdOAtWcMNghmrghUVKA+VOhDX
         Cpaf7rK2B9cBegk1KWilwY8KzJI8sZcDbPkN0UfPXzpWgs1g/wkL/J0q8S7NpYjdvE4+
         aROKOVfr32AohT5v+E/F8uW3Uvgtxvhaxl6i1DD6yulpE89FPHGiXeFy32CvTKyzNQVJ
         5KmBSJu/BI+kJQXRWZypFqa5JECt9oL3X2LdR+xp+3v3H9N+FKy0DoSjA8s4/IGVgwxH
         IETUKYilQvyML7VXSMqGyROn7BksVlTnM1gbVMyHyL8CGGqUVYljjkqdxeVGIN29kMFk
         fVcg==
X-Forwarded-Encrypted: i=1; AKwUvBzh5yzJkAzOOLXlRFortx8vh4E0N4+kNS9yoAFRdbhcdh/eCfI1avwxbExWCHlS3cjBEIGqOMZ0778=@lists.infradead.org
X-Gm-Message-State: AFuF++kz7SZI0TJz9JLBhXGfTr7cpDeA1kbarS8APKIcq295Cq8y96zh
	q0RoUy16YHTTLTrc9jJ9c6w59yauqUWtfxbf/+HRVt9uQeCrwWptNc3Wd4inB/RVVa8=
X-Gm-Gg: AYBFou0KxGi1NcQJMsypMYf6ft6rHh/TPaKkomYs1qWz+094Vk/lPZcfmdnmFlFKu8f
	Lj7Dl2x3wxi/8wOF6i5syHaxTdXQ846hKIamk8+AXLMAI4ucYtCaL7g1iQMYWFsN88HhO5uZNjt
	9OwcI0VWJVl9t0QcsFSfELNs54xionX2N0DPNfLrC6FyaYdx0bEPavumrElDeG5sT82m80AEu4v
	uCEgLAw1Ofnu+eq5rKkiQTXkJiuDjzzty+tnnXdnmJBYHKBUET91CyY1c9fuAdMUF4sYOsFOjan
	kKH0O+ogB5bI9sIyWdK1ahFYeNwJA9Ro2rGq1jbpVrFcBALF0+Ity5i0GvNXjzKhF115BFqyYcR
	3E4SDBTQhAJ73E+fuxwi8pWVPRSEDJ4P1kC/UDEQcWzwlMwz5r2QpKgWYaZ8iAR/iWZKILW0rTC
	br35/EVpoKGAeL6BfKlT9pGdy+N/AGXIEYi47ZWy5Il1zXcIhHSOVt8aMH5KWeCMqUPe/VGgpWz
	TKsi0vN
X-Received: by 2002:a05:600c:3b0a:b0:4a0:276e:9efb with SMTP id 5b1f17b1804b1-4a1800ca1dcmr33410955e9.4.1791378129799;
        Wed, 07 Oct 2026 06:02:09 -0700 (PDT)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm248055555e9.11.2026.10.07.06.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 06:02:07 -0700 (PDT)
Message-ID: <867bf9d7-f69d-4538-8de7-3a772015b486@linaro.org>
Date: Wed, 7 Oct 2026 16:02:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in spi_nor_parse_sfdp()
To: Michael Walle <mwalle@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, HyeongJun An <sammiee5311@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
 <20260921114111.525a2257@pumpkin> <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_060213_004611_E5F2E21C 
X-CRM114-Status: GOOD (  12.27  )
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



On 10/7/26 3:57 PM, Michael Walle wrote:
> Hi Arnd,
> 
>>>> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:  
>>>>> From: Arnd Bergmann <arnd@arndb.de>
>>>>>
>>>>> Two large spi_nor_flash_parameter structures on a function stack
>>>>> is really too much, and this can exceed an otherwise reasonable
>>>>> frame limit:
>>>>>
>>>>> drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>>>>> drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> Will you resend a v2 with Davids proposal? I'd like to get this
> fixed in this cycle. I could also take your patch and add Davids
> proposal on top.
> 

Hi, Michael,

Arnd is probably busy at lpc. If no answer from him you can always take
his patch, do the necessary amends and describe them in a [mw: blablah]
section above your S-o-b line.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
