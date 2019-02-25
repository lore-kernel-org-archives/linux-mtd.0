Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B11C4360F
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 18:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8CC2084D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 18:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJRERGqw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="cnVrZkEa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8CC2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXUIK3o1Kbg1Rc61OT1MG7Wkm0dIsTl1vUKc1dLUdBU=; b=WJRERGqwLxYjdn
	JlewRb65msRJm6abbV9NlOwsgclpU2APHYOqA57FbX9WPzWvyymoWYSyWKR/Uws8GNLyi5i1A74Vl
	G9/EjeEtlQE5dxWPLlHEH5aRXA83K8xl3b3/eScSGdzptAAGzpjATmpGUbvJOV/ruV33IF4uZJ+Jc
	QeCP1IQN75GgXYq8IdejMOLNJZn+yGpsVLVUPJzrOX9Sc7bK4/WJw8g14gXBLdA8FfbBgAw5QNm1a
	ipI7ma+qNI4iJAn0NBLHQoI5eAvqVZo6F7yk8H/aadCrMvxPEyj5Qni5a3mFooTmin5mXxQPhYqQ0
	PG7ycxB1QTvcd5cSGerQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyKxb-0007Yz-MY; Mon, 25 Feb 2019 18:26:39 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyKxR-0007QY-Gy
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 18:26:31 +0000
Received: by mail-lj1-x244.google.com with SMTP id w6so8304014ljd.7
 for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2019 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ykpzer4RBcU0VcCznMZdvt8qKc+1G2JLswY5vEVF8KE=;
 b=cnVrZkEa0+E2BDaBa9Bqu+PZyTg/T7u4ILs8kHP+zOTrFDaY6CjejkKtzzEEs9+41m
 vOFG5x/+cOvsmCEPzFpbmwzfS8YGkytQ0V9jHaNRK+YlguIxVhQhxsdz6wtu7IpcFmOV
 TFGwvuKdNFUFn2lX6lKSWWhjuSYnNdgmMn13s+++3g7cSe3DqeIbQP6s27DVSsDLCUtm
 yV6GIRG3JqhVcYviv7X/pFadwNA8qIhASPBvjxbX52UL1WGej1xpgqkRv/P14viBCgQC
 GL4q/kjMb8xMzz3qlJ36Byy5pMDu4ufxkU/NHX3naueT2/4qVC3F1aCZetbcdj7nX4Ly
 rWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ykpzer4RBcU0VcCznMZdvt8qKc+1G2JLswY5vEVF8KE=;
 b=bosSS5fpSuVX4q0E1UXhUBDFUKfjF1ouO+o1zX4cNJSmYNJS1Vxa58kjFi5WE9NKVQ
 a+8ykSDMyD3gS1kurf52qFhhg8sEuGjQnfzNHpSRjArZHSWPIBKOL/pZuFI24zZMIs9r
 rWrRCZNiOOuqFQOg7G+R5f0mEayUni963bhvq0lUO3Wc0WsDJtetbvz0tuVYt+9ELZCy
 SSyT2WGlMnfS2EBHj9xIq2mUXpq/Om65w/Cm7nK+2HpIi8/xYjxvfUXsjsDwmuXFnBw/
 5mk/+ij1Xx60KEFgbIGuHiep2UXuQfgbKM9Vze+Z3+4XIPPvSRxi0w9tIWhSLEyEJjsA
 ypIg==
X-Gm-Message-State: AHQUAuaS81JIa6YUbZn27LTorKm5W5y90fnZS2WMDpeo1/YTxzSq/yRo
 TizAZLG/aQ+gLUMMRG4X5/FOjg==
X-Google-Smtp-Source: AHgI3IauTkTaG9r94aYfrTbxXRe3SgfuefYMs+7/pOQ/52B+35BeBQd9H6xbT4LLh1M94kT+jd4vug==
X-Received: by 2002:a2e:7806:: with SMTP id t6mr9568859ljc.188.1551119187463; 
 Mon, 25 Feb 2019 10:26:27 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.85])
 by smtp.gmail.com with ESMTPSA id r64sm1608761lff.77.2019.02.25.10.26.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Feb 2019 10:26:26 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] mtd: Add support for Hyperbus memory devices
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)"
 <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-4-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <92bfdbf8-cc78-c691-298d-d2eb6193e1be@cogentembedded.com>
Date: Mon, 25 Feb 2019 21:26:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190219063607.29949-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_102629_700292_8A3EB210 
X-CRM114-Status: GOOD (  26.33  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> Cypress HyperBus is Low Signal Count, High Performance Double Data Rate Bus
> interface between a host system master and one or more slave interfaces.
> HyperBus is used to connect microprocessor, microcontroller, or ASIC
> devices with random access NOR flash memory(called HyperFlash) or
> self refresh DRAM(called HyperRAM).
> 
> Its a 8-bit data bus (DQ[7:0]) with  Read-Write Data Strobe (RWDS)
> signal and either Single-ended clock(3.0V parts) or Differential clock
> (1.8V parts). It uses ChipSelect lines to select b/w multiple slaves.
> At bus level, it follows a separate protocol described in HyperBus
> specification[1].
> 
> HyperFlash follows CFI AMD/Fujitsu Extended Command Set (0x0002) similar
> to that of existing parallel NORs. Since Hyperbus is x8 DDR bus,

   HyperBus, please be consistent.

> its equivalent to x16 parallel NOR flash wrt bits per clk. But Hyperbus

   Again...

> operates at >166MHz frequencies.
> HyperRAM provides direct random read/write access to flash memory
> array.
> 
> But, Hyperbus memory controllers seem to abstract implementation details

  And again.

> and expose a simple MMIO interface to access connected flash.
> 
> Add support for registering HyperFlash devices with MTD framework. MTD
> maps framework along with CFI chip support framework are used to support
> communicate with flash.
> 
> Framework is modelled along the lines of spi-nor framework. HyperBus
> memory controller(HBMC) drivers call hb_register_device() to register a
> single HyperFlash device. HyperFlash core parses MMIO access
> information from DT, sets up the map_info struct, probes CFI flash and
> registers it with MTD framework.
> 
> Some HBMC masters need calibration/training sequence[3] to be carried
> out, in order for DLL inside the controller to lock, by reading a known
> string/pattern. This is done by repeatedly reading CFI Query
> Identification String. Calibration needs to be done before try to detect
> flash as part of CFI flash probe.
> 
> HyperRAM is not supported atm.
> 
> HyperBus specification can be found at[1]
> HyperFlash datasheet can be found at[2]
> 
> [1] https://www.cypress.com/file/213356/download
> [2] https://www.cypress.com/file/213346/download
> [3] http://www.ti.com/lit/ug/spruid7b/spruid7b.pdf
>     Table 12-5741. HyperFlash Access Sequence
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
[...]
> diff --git a/drivers/mtd/hyperbus/core.c b/drivers/mtd/hyperbus/core.c
> new file mode 100644
> index 000000000000..d3d44aab7503
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/core.c
> @@ -0,0 +1,167 @@
[...]
> +/* Calibrate HBMC by repeatedly reading "QRY" string from CFI space */
> +static int hb_calibrate(struct hb_device *hbdev)
> +{
> +	struct map_info *map = &hbdev->map;
> +	struct cfi_private cfi;
> +	int count = HB_CALIB_COUNT;
> +	int ret;
> +
> +	cfi.interleave = 1;
> +	cfi.device_type = CFI_DEVICETYPE_X16;
> +	cfi_send_gen_cmd(0xF0, 0, 0, map, &cfi, cfi.device_type, NULL);
> +	cfi_send_gen_cmd(0x98, 0x55, 0, map, &cfi, cfi.device_type, NULL);
> +
> +	while (count--)
> +		cfi_qry_present(map, 0, &cfi);

   Why do all 25 reads if you can encounter valid QRY in less reads than 25?

> +
> +	ret = cfi_qry_present(map, 0, &cfi);
> +	cfi_qry_mode_off(0, map, &cfi);
> +
> +	return ret;
> +}
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
