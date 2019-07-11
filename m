Return-Path: <SRS0=eww+=VI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67947C742A1
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2019 19:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B9E20872
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2019 19:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZ4lak50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="SEuD7woY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B9E20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afj/5PzcmaEjRR6i2Ue6E47SUmkbrAHRIsp9+eggSZ4=; b=dZ4lak506EA3ng
	V2sqDS5kH1o8JfUNBTa72i9sPR4Q/kApOwCu3vYIU+6WIvgUTr2ho6jdIWuIc6snbRFY9x5zpZoAr
	dyqwm0Mt9om5jUSjJxZYwbjjrqT0i8fBMCbD2a73ye30YXUpNqJnlIipCLRu5RKAn39T5Ycmcg3rE
	9s+yBg/eUOrCxwUbjXjhen5PL8mrUNOevk7i5Enhb16kUcqlZU0/Fk/tln2qH3BPBBYco7n7k578j
	uP2hrrnX7BEN88BpTIlx016Rk8lXbsv/APpFvRV+dl1nGBj9E8Yw1uw3Dh2YyNdCM+iCd3WOQYQka
	sFQRISsb9Z5xy1YUrBbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hleiC-0007F9-5j; Thu, 11 Jul 2019 19:26:36 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hlei8-0006wX-LX
 for linux-mtd@lists.infradead.org; Thu, 11 Jul 2019 19:26:34 +0000
Received: by mail-lj1-x241.google.com with SMTP id x25so6973163ljh.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2019 12:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Gj/TpYGciG5OCmfbf2dVn6FNmz3afk+DosbRV4MzoY=;
 b=SEuD7woYh9OiLSQ1qqz/ru6e3z42i2sBTpzp8MOwXfr7/I//sRjs+uMPX7Uo/WUtIs
 +AwJVNrx3GqT2kwzv3pSL+VHr0NLxNPaFkjII1VDIRgs99twXT0eBytNhdx/yFwvy2lN
 hqE6hLa4AwQSyZ5Uq5JGDUvkqjBS3OnLM/mNEAo7yqYb/bJSDeDx1HqZ1OWLN/QIHvJC
 oZc12rA0Jp/ZDSkfpQDwufjD9Zu66J8QqnnlIo5Rk+H3P9eR8IQ0xYVMoO97sTQW4Xbe
 3Ui0eh2fGCWuhxiRNtCiD29GEt8YFc4IsNdQiPVoehP3xpWACHJpaHEn9OCeYUOOlCKE
 mTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1Gj/TpYGciG5OCmfbf2dVn6FNmz3afk+DosbRV4MzoY=;
 b=asJQ2ekGTptsyyE8uSQnPaHSz1hUI1xYFp8qeAmadFIA/YqRtit7a5SNRNAuYcNlwB
 mbBPP2m0zOaoO5FzaT/yr+Mk+S/s0er1a0f5MA12QwuKBU3S7du1TdC7LN0nJK1eCics
 V8enib1VRF5Rdh9gS9ZBDd+YkWXzLA7L6aEl3cyosgoIgLKbJIsgjaARk9v2rXhFignK
 DeKAnDj6IP5SQk1YZxw1YAfVpzMIg5h8OxtyEBqBvPPdCM99xODscEqCh6rSvrm5HUoY
 fghiJO419QYyKhGKgC0j29rsVdHYbZJyiwbKygh2F/cU5KCye870+90G0CFDuUZ/zeJZ
 Ay2g==
X-Gm-Message-State: APjAAAUtAxrJpplAzro0OfyKhMvOZt8STpHKege79fikqNfypXXFPYvd
 CXiVhfKo5yec+yGUxXXWZ/cb0A==
X-Google-Smtp-Source: APXvYqw0NR2+TFc5SfbPRhU4TviTWXjU5RRXRUxYbST9Ry9aqWtbT5Ta93nbQMGF/Y7Ssa+Uh36+Fg==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr3542327lji.75.1562873189537;
 Thu, 11 Jul 2019 12:26:29 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:6a9:2c74:93e5:edca:9c98:290d])
 by smtp.gmail.com with ESMTPSA id j14sm1122764ljc.67.2019.07.11.12.26.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 12:26:28 -0700 (PDT)
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190625075746.10439-1-vigneshr@ti.com>
 <20190625075746.10439-4-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e5a7866d-bc34-887d-31d3-de4f745c8d65@cogentembedded.com>
Date: Thu, 11 Jul 2019 22:26:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190625075746.10439-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_122632_918023_1BF0A9EE 
X-CRM114-Status: GOOD (  23.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 06/25/2019 10:57 AM, Vignesh Raghavendra wrote:

> Cypress' HyperBus is Low Signal Count, High Performance Double Data Rate
> Bus interface between a host system master and one or more slave
> interfaces. HyperBus is used to connect microprocessor, microcontroller,
> or ASIC devices with random access NOR flash memory (called HyperFlash)
> or self refresh DRAM (called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
> 
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since HyperBus is x8 DDR bus,
> its equivalent to x16 parallel NOR flash with respect to bits per clock
> cycle. But HyperBus operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, HyperBus memory controllers seem to abstract implementation details
> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicating with flash.
> 
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller (HBMC) drivers calls hyperbus_register_device() to
> register a single HyperFlash device. HyperFlash core parses MMIO access
> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
> 
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before trying to detect
> flash as part of CFI flash probe.
> 
> HyperRAM is not supported at the moment.
> 
> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
> 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
[...]

> diff --git a/drivers/mtd/hyperbus/hyperbus-core.c b/drivers/mtd/hyperbus/hyperbus-core.c
> new file mode 100644
> index 000000000000..63a9e64895bc
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hyperbus-core.c
> @@ -0,0 +1,154 @@
[...]
> +int hyperbus_register_device(struct hyperbus_device *hbdev)
> +{
[...]
> +	map->name = dev_name(dev);
> +	map->bankwidth = 2;

   I think this should really be 1, judging on the comment to that field (and on
Cogent's own RPC-IF HF driver).

> +	map->device_node = np;

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
