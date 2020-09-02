Return-Path: <SRS0=vQrn=CL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8651AC433E7
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 10:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 469C12071B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2020 10:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lKoLoNpi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 469C12071B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mUFl21ir+Aq3c1JVwLFv4a1Mc/rSkkkWeQ5aTrc6Mns=; b=lKoLoNpi5Z3AhI8fqqTV0++C8
	o4BHOpJj5MnJMTDhYMXSPaeajVzeILVwQESYo0ASLzZk2RsOnPqQwpTCSlQB52vREKKJ5FDTg7FoK
	rW/lPzENResqztzeY9QKwiR05wucr/NyK82JzdK9TOLvmTZOpvFxleWw56+jYpV3GzNurlAsyyIm1
	ZTBpt4NcXdsx9Bd8lRuOoo/DiCdCMAtU5yeonj1QRw2fSaA8SfKdx60wSkSHhjRe9lV+VfRS+d5nX
	wFtnkjxy4su8CZ42MCyVKOWhVnfq9Q1GSO4+2grMUAoPvb661R3z0+LNbcdjF0KOfkz+BG2uurswV
	SUu0FPOUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDPlF-00053J-I0; Wed, 02 Sep 2020 10:13:01 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDPlB-00051o-Lu
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2020 10:12:59 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 56DD1FF9B9EC3B4E23E8;
 Wed,  2 Sep 2020 18:12:47 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 2 Sep 2020 18:12:38 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Vignesh Raghavendra <vigneshr@ti.com>, =?UTF-8?Q?Matthias_Wei=c3=9fer?=
 <m.weisser.m@gmail.com>, <p.yadav@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <1884fb58-9395-680c-3c10-a17199826026@ti.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <2a1da276-96c6-9b5e-e7f1-563b5d2a1feb@hisilicon.com>
Date: Wed, 2 Sep 2020 18:12:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1884fb58-9395-680c-3c10-a17199826026@ti.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_061258_170076_A4045D45 
X-CRM114-Status: GOOD (  30.04  )
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
Cc: sergei.shtylyov@cogentembedded.com, tudor.ambarus@microchip.com,
 richard@nod.at, me@yadavpratyush.com, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,


On 2020/9/2 15:50, Vignesh Raghavendra wrote:
> Hi Yicong,
>
> On 9/1/20 7:50 PM, Yicong Yang wrote:
>> Hi Mathhias and Pratyush,
>>
>> I've tested the following patch with s25fs128s1.
>> I left the flash quad enabled before managed by spi-nor driver,
>> and it'll stay QE after removed. So I think it'll also address the issue
>> mentioned. Please have a test.
>>
>> Regards,
>> Yicong
>>
>>
>> From 43aa1afa12a10036f722b272a9a39b8c83218f33 Mon Sep 17 00:00:00 2001
>> From: Yicong Yang <yangyicong@hisilicon.com>
>> Date: Tue, 1 Sep 2020 22:09:46 +0800
>> Subject: [PATCH] mtd: spi-nor: don't disable quad mode of flash whose is
>>  originally enabled
>>
>> Currently we'll disable the flash's Quad mode when remove/shutdown in
>> spi_nor_restore(), no matter whether it's Quad enabled or not.
>> For flashes originally in Quad mode, it'll clear the flash's QE bit
>> and restore an incorrect state.
>>
>> Record the flash's original QE state, and don't disable the Quad mode
>> of these originally Quad enabled flash.
>>
> This will break backward compatibility... Imagine a new board being 
> flashed from Kernel. Before this series, QE bit would be set at the end of flashing
> and  ROM/bootloader (such as the one reported by Matthias) would work fine. 
> After this series, QE bit would no longer be set and would most likely
> break boot..
>
> I still am unable to understand what is the underlying problem that is 
> being addressed here?
>
> You mention addressing issue loading the driver in Quad mode first and reload it in
> Standard SPI/Dual mode. But per s25fs128s data sheet:
> "
> Quad Data Width (QUAD) CR1V[1]: When set to 1, this bit switches the data width of the device to 4-bit Quad Mode. That is, WP#
> becomes IO2 and IO3 / RESET# becomes an active I/O signal when CS# is low or the RESET# input when CS# is high. The WP#
> input is not monitored for its normal function and is internally set to high (inactive). The commands for Serial, and Dual I/O Read still
> function normally but, there is no need to drive the WP# input for those commands when switching between commands using
> different data path widths. Similarly, there is no requirement to drive the IO3 / RESET# during those commands (while CS# is low)."
>
> So setting QE bit should have no impact for serial/dual IO modes?

yes. and I reword the commit like below,  as suggested by Tudor and send a v2 patch. This thread is the v1 one.
"If the flash's quad mode is enabled, it'll remain in the quad mode when
it's removed. If we drive the flash next time in Standard/Dual SPI mode,
the QE bit is not cleared and the function of flash's WP# and RESET#/HOLD#
have been switched to IO2 and IO3 and are not restored."

I believe we should restore the state of the flash when it's unloaded from the kernel. In previous code, if we load the flash
in Quad mode (originally in Standard SPI mode) and shutdown, its WP# and RESET# won't be restored correctly. Seems
the patch doesn't consider the condition that the flash has already in Quad mode before loaded and restore the flash
in a wrong state.

Regards
Yicong


>
> Regards
> Vignesh
>
>> Reported-by: Matthias Weisser <m.weisser.m@gmail.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 30 +++++++++++++++++++++++-------
>>  include/linux/mtd/spi-nor.h |  3 +++
>>  2 files changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 65eff4c..b13b3b3 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -1924,8 +1924,11 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
>>      if (ret)
>>          return ret;
>>  
>> -    if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
>> -        (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))
>> +    if (enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) {
>> +        nor->orig_qe_state = true;
>> +        return 0;
>> +    }
>> +    if (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6))
>>          return 0;
>>  
>>      if (enable)
>> @@ -1958,8 +1961,12 @@ int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
>>      if (ret)
>>          return ret;
>>  
>> -    if ((enable && (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)) ||
>> -        (!enable && !(nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)))
>> +    if (enable && (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)) {
>> +        nor->orig_qe_state = true;
>> +        return 0;
>> +    }
>> +
>> +    if (!enable && !(nor->bouncebuf[0] & SR2_QUAD_EN_BIT1))
>>          return 0;
>>  
>>      if (enable)
>> @@ -1993,8 +2000,12 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable)
>>      ret = spi_nor_read_sr2(nor, sr2);
>>      if (ret)
>>          return ret;
>> -    if ((enable && (*sr2 & SR2_QUAD_EN_BIT7)) ||
>> -        (!enable && !(*sr2 & SR2_QUAD_EN_BIT7)))
>> +    if (enable && (*sr2 & SR2_QUAD_EN_BIT7)) {
>> +        nor->orig_qe_state = true;
>> +        return 0;
>> +    }
>> +
>> +    if (!enable && !(*sr2 & SR2_QUAD_EN_BIT7))
>>          return 0;
>>  
>>      /* Update the Quad Enable bit. */
>> @@ -3001,7 +3012,12 @@ void spi_nor_restore(struct spi_nor *nor)
>>          nor->flags & SNOR_F_BROKEN_RESET)
>>          nor->params->set_4byte_addr_mode(nor, false);
>>  
>> -    spi_nor_quad_enable(nor, false);
>> +    /*
>> +     * restore the flash's quad mode. if the flash's quad mode is
>> +     * enabled originally, we'll not disable it.
>> +     */
>> +    if (!nor->orig_qe_state)
>> +        spi_nor_quad_enable(nor, false);
>>  }
>>  EXPORT_SYMBOL_GPL(spi_nor_restore);
>>  
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index 60bac2c..f343416 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -344,6 +344,8 @@ struct spi_nor_flash_parameter;
>>   * @read_dummy:        the dummy needed by the read operation
>>   * @program_opcode:    the program opcode
>>   * @sst_write_second:    used by the SST write operation
>> + * @orig_qe_state:    used to indicate the flash's original Quad mode enable
>> + *                      state. True for enabled and false for disabled.
>>   * @flags:        flag options for the current SPI NOR (SNOR_F_*)
>>   * @read_proto:        the SPI protocol for read operations
>>   * @write_proto:    the SPI protocol for write operations
>> @@ -375,6 +377,7 @@ struct spi_nor {
>>      enum spi_nor_protocol    write_proto;
>>      enum spi_nor_protocol    reg_proto;
>>      bool            sst_write_second;
>> +    bool            orig_qe_state;
>>      u32            flags;
>>  
>>      const struct spi_nor_controller_ops *controller_ops;
>>
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
