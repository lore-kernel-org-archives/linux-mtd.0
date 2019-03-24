Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B26C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEACF2148D
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 16:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="af1NeICY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="IQwS18ZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEACF2148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ePyVG11qn9kC/r7cpmRXKrvt/I2QMCu+CbL1Bm7WJY=; b=af1NeICYSMiiNp
	2y5lEkrbF1Kreel5kLdV9G2KP8e4LEU0OVxCj7ieg05LcDJEwaUJVkjqu3gkuWNLrpCpi4xhWaglh
	bRHpwh1/Jrvx5vIpbN/IT13T9djUMWSaCDsyYEFqgkVU+TgZH6l3Y/vvv317G2cpNQky7dPuch9EP
	idlXsWUvTeNpIR21RUyzegHwSiLfTsgsgqR+uOwTbKGUoWUS3Rk89rvzLexx6QZ1lb7T5WjV/DHY3
	pWWE0H5On2UBN8ipCLUqM5S3cqKerXTgRuiFTnWgGSeIzloSyLaHDL0hrEB1SMJlY0mYW1K2SkkHK
	gMc7y4IawuRlZrBVJytA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h85q2-0007eb-KP; Sun, 24 Mar 2019 16:19:10 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h85px-0007dD-3l
 for linux-mtd@lists.infradead.org; Sun, 24 Mar 2019 16:19:06 +0000
Received: by mail-lf1-x143.google.com with SMTP id d18so4366045lfn.3
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2019 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UyqVDhLC4OHpuBtwhSQ0ZuhPa8nU+D6SzGMHE1FiNTs=;
 b=IQwS18ZI7crnnbpYRF1xocEaHklD2D+PukRRZT1HnGmT23Ho34stCYUAqVnZmWrpYS
 LeC8djYJrGiiVGUPHuQZKiG4sVYmpLw9PlETADEmNtv0h+vQDaAKL6DS//CwDJs6vHEK
 dhDQ6yLxTMawIfy+Mr11A2JSj0kQRAgMxDGamA5bKvW87eeX93wzuep0FnqJou+9b6Xq
 KFz/D3WpG595WX1BMyClnktSiGMmPZu7b5VGSgSOao8zcCJOC7wNshtyyRGZZPq5bvvj
 HgwSD3D+Oc/we3vCc5VqEN4T8PYWvrft+GEi2LTdUSHy53u7lAeZQ3zYPTTt4Zs7kBqx
 Y9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=UyqVDhLC4OHpuBtwhSQ0ZuhPa8nU+D6SzGMHE1FiNTs=;
 b=gZnY8LRGqSZcRkVOVwZd1MusqYxnNdk2OlgL3eu1TAALJfH5LyWQSkz3P9Z4CYPo/w
 8v3w8d5efEl2Z86gu1MGWpGCeoc4nreDECQJ+i7hKnd77cVOGrZhw7+9cty9GdlxzScC
 /Bai4M+SN4ZISsGyKrXHrNb6x/vRGJwosIzgaEus7175vkGdkip3dU/NK1EAI3F4lq1Q
 oWv4x4qmLh21YzHRgHj4mCczGLdVfd4y5hYvLJxTwwgIwbx7/+BbJJBpTC8ZiLD1j8vp
 WTynjk0jo7Ax8ez+4nuGcBR8uOMgs2ERsNqf1v8fVlMeMKgVWT+6MJc015mwh2zFGy+E
 lnCg==
X-Gm-Message-State: APjAAAW+/Q+8Pu/5vVifFyGCTJ3YjP3wuLqDLNR8PizbjtSmwwsz4iwd
 Htea2rEhXbDjWM/mpdvGiuw0Aw==
X-Google-Smtp-Source: APXvYqwaqRFeeg5cMADmKN0HFpWflJH8cDWRvMWVzAbZ5tlzYUg0lBd+5ttgyFeD7jeKzZl+Fsw5Rw==
X-Received: by 2002:a19:c90a:: with SMTP id z10mr9993966lff.40.1553444340176; 
 Sun, 24 Mar 2019 09:19:00 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.147])
 by smtp.gmail.com with ESMTPSA id u1sm3016475lfm.4.2019.03.24.09.18.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 09:18:58 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: mtd: Add binding documentation
 for Hyperbus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-3-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ca3326cb-1b37-cf9a-f196-3288a539d064@cogentembedded.com>
Date: Sun, 24 Mar 2019 19:18:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190321174548.9288-3-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_091905_365679_71949A67 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 03/21/2019 08:45 PM, Vignesh Raghavendra wrote:

> Add DT binding documentation for Hyperbus memory devices. Only
> Hyperflash is supported at the moment.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
> new file mode 100644
> index 000000000000..cb408f80b868
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
> @@ -0,0 +1,6 @@
> +Bindings for Hyperflash NOR flash chips compliant with Cypress Hyperbus
> +specification and supports Cypress CFI specification 1.5 command set.
> +
> +Required properties:
> +- compatible : "cypress,hyperflash" for Hyperflash NOR chips

   What about "cfi-flash", shouldn't it be also specified?

> +- reg : Address where flash's memory mapped space

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
