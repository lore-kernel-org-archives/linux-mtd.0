Return-Path: <SRS0=szGg=U7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7615EC06510
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 17:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532602082F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 17:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZw6tAEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="AjJ3nxm/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532602082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jq/GssABvBPEBVH3zk3wBn4ntdoYsAmkpyFpZ7kndXs=; b=jZw6tAEQfPTZqm
	dW2eUdj+uUjCmSy5HBqtDn1Bwux888K3pdv9/7tN1CzhSiCrZqsz5kw44YtZNc7GAq3bOECxz4F6y
	araEDHso8r+FNrB8oBtFAIJxvRRJaABW3gXjFfH8Ov/GUDvw00b0yptUehcOpgUDBIlkX0nwEbn5W
	yyebe/fUMk1EX0rSxzq3RdgJ4y8WHp3BC15xEC99yepRl2IxClgAeRcDP/Ufz9xQh1z3V3qM81p11
	l84DWGItlqaLK4ZYOdwW6BGERymE1heHQ2NXgsVMLbwf6DRkMc+XkBjtQ5iwvPrBbRBl1iT3a+L9l
	Q3AJuIiQc2kRVYH/kCNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiMyF-00053H-4z; Tue, 02 Jul 2019 17:53:35 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiMxl-0004ry-Mi
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2019 17:53:08 +0000
Received: by mail-lj1-x244.google.com with SMTP id v24so17825584ljg.13
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2019 10:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cMEn3za16fAfd/FKzUgXJWhBF6QU4UvnxjnbeEXsMGQ=;
 b=AjJ3nxm/0ds+e2hRRivY37RuUEa4V59EPE1atiQr2SXEYP2cvI8PWEN+FZ9oVOntUT
 XehNOna7XdSk5ef3/jinBVRzP0Zgoq2nXWU3UGYsYB9ehUh1D+3vpTcj0OvQA+seZDU3
 JCrKct+QFMpmJzw4R3IcICYfPlRQ1z1j0MHz+N34dj9P+l1gqNZyUktAudZ07GKlOlak
 joM3F9dzbJiwS1J8pbV/0g+ni/mDtPKuRtxDgvKK6H4TmP8PVNY8odrp5u1fzRFWaBUi
 Kev+nrvUBH6P4kht+SWadQWqeUZhn9Drib2vk3mjXbi89a1I0olyW75z856NBQ1TpbAj
 6QMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cMEn3za16fAfd/FKzUgXJWhBF6QU4UvnxjnbeEXsMGQ=;
 b=NND82u6XdoLaMkOFgX0VZZCwlhwd4bPO/6hEMwztcl/A/u47jwFdcYLRSYMA/jb0AU
 iQjaELR49XATqKcmY8KaPTJzruem3UCisFs7iALsNH5bEWab9LylN8yCFSvqe3hER+6I
 VMjN/UMJXHFmK1vjOlOT5JsfZLFQGCmeCvkdLIUVxtAz9ZtgkmwBSlSKk+kYLeyKegOH
 lEOD+n0AgMqx3QEw5weVf+G9ZtzQ5K319bhBhB1I9Xf/OTkUqPumiRhD32BAW8DV48NM
 ocvQjDoR9CzjTY3upVICyITfCtf55Do71JOLmLz7Q3/dJPumyS272ONgIIfvkA0kH2Pr
 0/nw==
X-Gm-Message-State: APjAAAXP8b5+P27R/W8yIrFWWvrtTpgIUcXJd4oBY9iHfsjyopTeS6IS
 Cp6IrgTpej5qlknDZPH8JecitA==
X-Google-Smtp-Source: APXvYqyHA/Ov/gzsKWtHLKt+DUZw1yLzTQf05oQbnhdSu9EIi9OqdKbPqDmV3siOLcwZvcf9+6nKTA==
X-Received: by 2002:a2e:93cc:: with SMTP id p12mr18387950ljh.11.1562089983427; 
 Tue, 02 Jul 2019 10:53:03 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:48c7:f2be:45b6:c800:b809:e0f2])
 by smtp.gmail.com with ESMTPSA id g76sm3954000lje.43.2019.07.02.10.53.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 10:53:02 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v8 3/5] mtd: Add support for HyperBus memory devices
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190625075746.10439-1-vigneshr@ti.com>
 <20190625075746.10439-4-vigneshr@ti.com>
Organization: Cogent Embedded
Message-ID: <31657fd1-c1c9-7672-14c1-e6f67eee6ac1@cogentembedded.com>
Date: Tue, 2 Jul 2019 20:53:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190625075746.10439-4-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_105305_884384_7FDE2E8A 
X-CRM114-Status: GOOD (  25.06  )
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

   I have at least created my HyperBus driver and unfortunately I'm having serious
issues with the design of the support core (see below)...

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
> +	const struct hyperbus_ops *ops;
> +	struct hyperbus_ctlr *ctlr;
> +	struct device_node *np;
> +	struct map_info *map;
> +	struct resource res;
> +	struct device *dev;
> +	int ret;
> +
> +	if (!hbdev || !hbdev->np || !hbdev->ctlr || !hbdev->ctlr->dev) {
> +		pr_err("hyperbus: please fill all the necessary fields!\n");
> +		return -EINVAL;
> +	}
> +
> +	np = hbdev->np;
> +	ctlr = hbdev->ctlr;
> +	if (!of_device_is_compatible(np, "cypress,hyperflash"))
> +		return -ENODEV;
> +
> +	hbdev->memtype = HYPERFLASH;
> +
> +	ret = of_address_to_resource(np, 0, &res);

   Hm, I doubt that the HB devices are wholly mapped into memory space, that seems
like a property of the HB controller. In my case, the flash device in the DT has
only single-cell "reg" prop (equal to the chip select #). Then this function returns 
-EINVAL and the registration fails. Also, in my case such mapping is R/O, not R/W.

> +	if (ret)
> +		return ret;
> +
> +	dev = ctlr->dev;
> +	map = &hbdev->map;
> +	map->size = resource_size(&res);
> +	map->virt = devm_ioremap_resource(dev, &res);
> +	if (IS_ERR(map->virt))
> +		return PTR_ERR(map->virt);

   Again, I doubt that this should be done here, and not in the HB controller driver...

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
