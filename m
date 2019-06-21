Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19654C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39652083B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 19:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZWaOzLXt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Ew+e7GQy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39652083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTWGVKTls5V8eiue0y+z+af7b7KJiddEGBup651wuP4=; b=ZWaOzLXt2GMO0r
	wcvp6JrTlEeemdFRJn0NpC9JIV5GQLUo6avDR7avaVeLhWXX8YjWHAemXGdnUkzMjWBEiNfa7PKrH
	iVS0qpSNv0NyQkF8J9c2TXyH+kgpnzbfGCdjX5ixXkqjq7ZqjNK2J3FBpALpj9kCbV4haraZVWKKZ
	JjfDiL1GnLegkWIVbAz9LCqFUP3hMJU+vchi6mpqtwZblzyjFrNh13W0IMzk6rkqj8GZtfbm4uiO+
	ROeAUE6AW4wmSlY2FYWmAF4FkwdOBClLzX5uFBOKnw/paEm+VnJNGEgq6Qvjpup8GOVN82yEhe5nU
	m1UDhb9sN+c3ohUnn6AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hePaB-0002rP-VF; Fri, 21 Jun 2019 19:52:23 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hePZx-0002hj-H8
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 19:52:11 +0000
Received: by mail-lf1-x144.google.com with SMTP id a25so5896177lfg.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wso9AT0PLE8YSVz4mFagGPGoqkgjnJ4hhl/knflL07M=;
 b=Ew+e7GQyGGn3VMUMvlmlNk529darBgRUJ/dcJFSuTVhcptTW0Osp8jReJotYp3YmKA
 f6eeGrLRGAbz3L8Of3mQVbcQDLORcn3KXYXhPmuLEmtkhvEZh+lMjKapiefa6/uiNl2W
 sMOLt5EglU5sNbD9GTGtO5A5tcs2ho6YQ53d4IWO8ykmDYB7C1u0OYGN4kKeIMmQbB8t
 sCsUfdPPmodLtBotaF1sfyp3QcvscC+eoN6kkXc3skMo0VaCzrVmg+NLHLSyIaA9tmok
 kdq69iSb8NJ1pNNEYW3c7xUwEyznK+nW7o7MOGRmdKVvN+I8ayYLDei7JYMyJxs3C0XZ
 O92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wso9AT0PLE8YSVz4mFagGPGoqkgjnJ4hhl/knflL07M=;
 b=OZKhvkyTf3k5OEzPIeXteihEjbtugbI5zp3GxUrZvl0NoVyQbBeWJTcuhetWGCpPCD
 d9XRQ51QKLN77ZEh+VzAIR7Us2uSsUOFZac5y8kT55c5T7MlpUC2tdxHh6ToxacBNfGe
 31Hdezd7u0J2pg1mcxCe5cOrSrmXo7qt569Lrl4ngfEjQ3z16eO6+lJc/SWh9LwE6i0O
 FeLPB1CribyUyEi76xXukiXRQ7OMXpyC31YD3e+S+UhynmrRpMwbfwSiNVjvbJTpR/bX
 7t96PBHq61oIUa3NpUHFusklKawCln02nk09OK87zktZcSjtPsQorYuRV5S3FXR1pito
 s7uA==
X-Gm-Message-State: APjAAAUv/RuH/DeM7o/GhsxBqlW0uQrV7DtbwlCS/9VneBiLv8gaAfos
 USBm7z+pI5rVwHLbb5Bv8I0mtg==
X-Google-Smtp-Source: APXvYqx3uKDLsq5HSFMYR5JCV7tpvJVm6zODfloD79xoOac4SxateHkoi4zxVApNcx1Fez+sYLEylg==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr3669450lfg.163.1561146725828; 
 Fri, 21 Jun 2019 12:52:05 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.14])
 by smtp.gmail.com with ESMTPSA id n3sm513817lfh.3.2019.06.21.12.52.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 12:52:05 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v7 3/5] mtd: Add support for HyperBus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190620172250.9102-1-vigneshr@ti.com>
 <20190620172250.9102-4-vigneshr@ti.com>
Organization: Cogent Embedded
Message-ID: <4d17e914-cd1f-c6fe-b70a-6aae02e0cf4e@cogentembedded.com>
Date: Fri, 21 Jun 2019 22:52:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190620172250.9102-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_125209_860035_7302B8BD 
X-CRM114-Status: GOOD (  23.55  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 06/20/2019 08:22 PM, Vignesh Raghavendra wrote:

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
> its equivalent to x16 parallel NOR flash wrt bits per clock cycle. But
> HyperBus operates at >166MHz frequencies.

   s/wrt/WRT/.

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
> diff --git a/include/linux/mtd/hyperbus.h b/include/linux/mtd/hyperbus.h
> new file mode 100644
> index 000000000000..ead969aad35b
> --- /dev/null
> +++ b/include/linux/mtd/hyperbus.h
> @@ -0,0 +1,86 @@
[...]
> +/**
> + * struct hyperbus_ops - struct representing custom HyperBus operations
> + * @read16: read 16 bit of data to flash in a single burst. Used to read

   s/to flash/from flash/.

[...]
> +#endif /* __LINUX_MTD_HYPERBUS_H__ */

   I thought you agreed to add the #defines for the HF commands. Well, I can add them
as well...

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
