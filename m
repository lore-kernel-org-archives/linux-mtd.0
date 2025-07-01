Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69660C8303F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKU5foO0f9OQy5Ywy76rqX1dLFFSTzhvnNw0JRYJrOU=; b=U8HUnolIoxemfv
	Mg6CpLtfwBQtVxvw7lXgQ8EZgxq3c6YFjsc+1KyDtG5PdNKuMm0TavCRU9i3fvQgkkHXaQUMB5JSL
	LyV27SMFgWi7fvHXERDxnXAkNicVmP6Ecc432fgejTWuD0sFXllQjQ6EeixoHs6HhM02ibEjZs6GQ
	2s8WNuQ8EE7lG/8FNHEdw/B1K/jKULBVb+ufuHtcHpU5HvhmuPIWHuTjAwzT83bmrMRcqcSO2FadV
	NHaMrdWucK8hdGXirqAIKFnIZZJjHMgNatNyA0ABkBOdXjBc73tQQyLOD9+LPLFf8raugWtXfp63c
	wOFl1LbL2FHMMQbwXQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflP-00000006Krz-3P7B;
	Tue, 01 Jul 2025 18:31:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdEG-00000005wFA-3Imf;
	Tue, 01 Jul 2025 15:49:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9475B1595;
	Tue,  1 Jul 2025 08:48:46 -0700 (PDT)
Received: from [10.1.30.206] (e137867.arm.com [10.1.30.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C85D3F66E;
	Tue,  1 Jul 2025 08:48:59 -0700 (PDT)
Message-ID: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
Date: Tue, 1 Jul 2025 16:48:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Zixun LI <admin@hifiphile.com>
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 SoC support' <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_084904_909013_9B9FC92C 
X-CRM114-Status: GOOD (  25.87  )
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

Hi,

I'm not really involved in this part of the kernel or drivers,
but I took some time to look into it. Hopefully I'm not completely
missing something !

On 30/06/2025 15:38, Zixun LI wrote:
> Hi,
>
> After updating our SAM9G25 device from kernel 3.16 to 6.6, we have
> encountered UBIFS failures with ECC errors
>
> [...]
>
> After some diagnostics, I used devmem2 to compare SMC and PMECC
> registers between the two kernels. All values match except for the
> PMECC_CLK register, which is 2 in kernel 3.16 [1] and 0 in kernel 6.6
> [2]. It appears the clock setting is missing since the kernel 4.14
> refactor.
>
> According to the SAM9G25 datasheet this field must be programmed with 2.
>
> Manually setting PMECC_CLK to 2 (devmem2 0xffffe010 w 2) resolves the
> nandtest issue.
>
> Is the clock setting moved to elsewhere after the refactor ?

As far as I can tell, the setting of the *PMECC_CLK* was lost in
f88fc122cc34 (mtd: nand: Cleanup/rework the atmel_nand driver),
which was merged for 4.12.

The register offset and values are  part of the defines it introduces
but are unused, so they might have been forgotten.
I couldn't find another place where this was done, and I think it would
make sense for it to be done here still.

The tricky part is that now the driver handles other PMECCs that do not have
this register at all in their datasheets :
  - SAMA5D2 series[3], page 713, 36.20 Register summary :
      0x80 (0x10 offset) is marked reserved,
  - SAMA5D4 series[4], page 512, Table 30-20 :
      0x080 (0x10 offset) is marked reserved,

So I think it's best not to add this write back for all cases.

I also checked, as some other SoCs' PMECCs are marked compatible with
the one used in your SAM9G25 (`atmel,at91sam9g45-pmecc`) :
  - SAM9x60 series[5], page 256, 21.6 Register Summary :
      0x10 offset has PMECC_CLK present, recommends setting to 2 at 133MHz,
  - SAM9x7 series[6], page 263, 21.6 Register Summary :
      0x10 offset has PMECC_CLK present, reccomends setting to 2 at 133MHz.

So it should be safe to write 2 to this register for all those matching
this /compatible/ string.

The datasheet itself is not clear as to what to do for other MCK frequencies,
though as 133MHz is the highest supported frequency and it worked before,
hopefully it just means a cycle or two of useless delay at worse,
but at least it keeps it simple.

I've written a small patch below that I think should fix the issue, but again
I don't know if that's upstreamable as-is.

> Best regards,
> Zixun LI
>
> [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
> [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
>
Hopefully that can help !
Best regards,
Ada


[3]: https://ww1.microchip.com/downloads/en/DeviceDoc/SAMA5D2-Series-Data-Sheet-DS60001476C.pdf
[4]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA5D4-Series-Data-Sheet-DS60001525.pdf
[5]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X60-Data-Sheet-DS60001579.pdf
[6]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

------------------------ >8 ------------------------

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 3c7dee1be21d..cd96b44f3f30 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -143,6 +143,7 @@ struct atmel_pmecc_caps {
  	int nstrengths;
  	int el_offset;
  	bool correct_erased_chunks;
+	bool need_clk_config;
  };
  
  struct atmel_pmecc {
@@ -787,6 +788,9 @@ int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op)
  	writel(PMECC_CTRL_ENABLE, pmecc->regs.base + ATMEL_PMECC_CTRL);
  	writel(PMECC_CTRL_DATA, pmecc->regs.base + ATMEL_PMECC_CTRL);
  
+	if (pmecc->caps->need_clk_config)
+		writel(PMECC_CLK_133MHZ, pmecc->regs.base + ATMEL_PMECC_CLK);
+
  	return 0;
  }
  EXPORT_SYMBOL_GPL(atmel_pmecc_enable);
@@ -896,6 +900,7 @@ static struct atmel_pmecc_caps at91sam9g45_caps = {
  	.strengths = atmel_pmecc_strengths,
  	.nstrengths = 5,
  	.el_offset = 0x8c,
+	.need_clk_config = true,
  };
  
  static struct atmel_pmecc_caps sama5d4_caps = {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
