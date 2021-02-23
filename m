Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC552C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 12:17:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B4F6601FF
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 12:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B4F6601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sZjvjNqMLR4iqb31fWlaeVe4hLmNZDSkTw/3YlC41/c=; b=Dbjbpmp29dc2Igyf/2jhx1BaT
	7aj90zSZmOsp1B+XnesnfdaNxDU0GGZuQvSE0BjZSePDPyRBepvqOPmpFZWBe0n6noXBWmfqyc3tp
	SOxzGvhnWKFSVJeedxx8D78gWJ1j8Fnhnfx+U6B8LZeIY8uIBNzwRc+V/Jac8EQo3y4ngdn3bi4RZ
	zNx0C6/7Ap6QqxiQKDO+qdikxMMH9uoAcTJIXd7RSOafe25wBrLTDh//OcEgyOo759mB6211cw98Y
	bfwxXrW2cOHf6Rs2Dz2XDgaEoCYFvO7a9N2xIVJ700raKIYAYVbQA71UC5Dka5hnUquLxDsMym8B0
	vYI9MkAHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEWcD-0001L3-8T; Tue, 23 Feb 2021 12:16:33 +0000
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEWcB-0001Kb-0G
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 12:16:31 +0000
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 56EBE440861;
 Tue, 23 Feb 2021 14:16:29 +0200 (IST)
References: <7f558e888a41c5b1fd4ca0427b3976531c51a876.1614080824.git.baruch@tkos.co.il>
 <20210223120717.GA9724@work>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: parsers: extend Qcom SMEM parser to SPI flash
In-reply-to: <20210223120717.GA9724@work>
Date: Tue, 23 Feb 2021 14:16:29 +0200
Message-ID: <875z2jj7xe.fsf@tarshish>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_071631_245513_7F96874F 
X-CRM114-Status: GOOD (  22.10  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Manivannan,

On Tue, Feb 23 2021, Manivannan Sadhasivam wrote:
> On Tue, Feb 23, 2021 at 01:47:04PM +0200, Baruch Siach wrote:
>> The Qcom MIBIB partition might be stored on SPI flash devices, and the
>> parser works in this case just as well:
>
> Nice!
>
>> [    1.404229] spi_qup 78b5000.spi: IN:block:16, fifo:64, OUT:block:16, fifo:64
>> [    1.408078] spi-nor spi0.0: found mx25u6435f, expected n25q128a11
>> [    1.415016] spi-nor spi0.0: mx25u6435f (8192 Kbytes)
>> [    1.420756] 12 qcomsmem partitions found on MTD device spi0.0
>> [    1.425739] Creating 12 MTD partitions on "spi0.0":
>> [    1.431381] 0x000000000000-0x00000000c000 : "0:sbl1"
>> [    1.437058] 0x00000000c000-0x00000000d000 : "0:mibib"
>> [    1.442143] 0x00000000d000-0x000000027000 : "0:qsee"
>> [    1.447057] 0x000000027000-0x000000028000 : "0:devcfg"
>> [    1.452088] 0x000000028000-0x00000002a000 : "0:rpm"
>> [    1.457065] 0x00000002a000-0x00000002b000 : "0:cdt"
>> [    1.461832] 0x00000002b000-0x00000002c000 : "0:appsblenv"
>> [    1.466736] 0x00000002c000-0x000000036000 : "0:appsbl"
>> [    1.472248] 0x000000036000-0x00000003a000 : "0:art"
>> [    1.477297] 0x00000003a000-0x00000003e000 : "config"
>> [    1.482047] 0x00000003e000-0x00000004e000 : "data"
>> [    1.487257] 0x00000004e000-0x000000200000 : "0:hlos"
>> 
>> Remove dependency on MTD_NAND_QCOM. Update the Kconfig prompt and help
>> text accordingly.
>> 
>> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  drivers/mtd/parsers/Kconfig | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
>> index d90c30229052..96d5716db544 100644
>> --- a/drivers/mtd/parsers/Kconfig
>> +++ b/drivers/mtd/parsers/Kconfig
>> @@ -162,9 +162,8 @@ config MTD_REDBOOT_PARTS_READONLY
>>  endif # MTD_REDBOOT_PARTS
>>  
>>  config MTD_QCOMSMEM_PARTS
>> -	tristate "Qualcomm SMEM NAND flash partition parser"
>> -	depends on MTD_NAND_QCOM || COMPILE_TEST
>
> Can we keep COMPILE_TEST below?

The code will not build without QCOM_SMEM, I believe.

Thanks for your review,
baruch

> With that,
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Thanks,
> Mani
>
>> +	tristate "Qualcomm SMEM flash partition parser"
>>  	depends on QCOM_SMEM
>>  	help
>>  	  This provides support for parsing partitions from Shared Memory (SMEM)
>> -	  for NAND flash on Qualcomm platforms.
>> +	  for NAND and SPI flash on Qualcomm platforms.
>> -- 
>> 2.30.0

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
