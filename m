Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF1C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 13:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A5EC6024A
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 13:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A5EC6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gsLl2+pNHUKzt5eiYNy6g5KozcOYqf/K6GdIcff7nZQ=; b=yJFEmEvCdF4xPFkSzpUpcO4Il
	sndiLXyarunniXWnLbRAOfQhWUiRhL9+pbeyORMQUgFpcWYR5V7fAGOnDScgbgBl4Qqbgj2MB+c5o
	q1BUlOFx6fAnqVkGeDXuLKKsNZdajw0tfQEfPeUEz/qexUODoY/VzedydJtTgvzy+nMCC8sw0A47w
	kgLjZleszUoIJEwPAaLi/F6iHBgpkJQWx2tlShTcGYPW0Ywd3tVTcrbp7jfUYMM60lur6lEG8xAHR
	SwnLBYP3FwVijbrFufy83k3G8ICGcfbP3WbiJ2KeYtIgCgdSGTNbcYnw7LVRHFTs/ttec9LcNK32N
	cEbIP5m7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGiir-0001Sd-FM; Mon, 01 Mar 2021 13:36:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGiin-0001SA-Uf
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 13:36:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 121DaNGk046010;
 Mon, 1 Mar 2021 07:36:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614605783;
 bh=ka8rRp0pygHuBZuMFT5+0iUOBUY8Bjs1S5zwi6aH17I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hUC0G4tWwoQihUNh5L+kA41oCfB0ZWGRqAaI8Om9rnTXD74S4p6J7SikfA4w+pvWg
 +JT8fGRED2BV2IhJnMfuzWbrpReTN3iykrynqhL2DPZHCYydITwbNfVm+kGKrj5BcT
 nQ4sn+sHphrafHk6ndOj/08cnBVJikjWxNZ3Z0Fs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 121DaM9I122202
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Mar 2021 07:36:22 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 1 Mar
 2021 07:36:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 1 Mar 2021 07:36:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 121DaKfL104675;
 Mon, 1 Mar 2021 07:36:21 -0600
Date: Mon, 1 Mar 2021 19:06:20 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
Message-ID: <20210301133618.rzs4amh5ujwys277@ti.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_083626_184577_65A9B158 
X-CRM114-Status: GOOD (  34.30  )
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
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw, michael@walle.cc,
 linux-mtd@lists.infradead.org, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/03/21 11:11AM, Tudor.Ambarus@microchip.com wrote:
> On 3/1/21 12:52 PM, Vignesh Raghavendra wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hi,
> > 
> > On 2/28/21 3:22 AM, Heiko Thiery wrote:
> > 
> > [...]
> >>>>> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
> >>>>> +                                        * that share the same JEDEC-ID, but
> >>>>> +                                        * where a flash defines the SFDP tables
> >>>>> +                                        * and the other doesn't.
> >>>>> +                                        */
> >>>>>
> >>>>>         /* Part specific fixup hooks. */
> >>>>>         const struct spi_nor_fixups *fixups;
> >>>>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> >>>>> index 9203abaac229..1ebce775eae4 100644
> >>>>> --- a/drivers/mtd/spi-nor/macronix.c
> >>>>> +++ b/drivers/mtd/spi-nor/macronix.c
> >>>>> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
> >>>>>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> >>>>>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
> >>>>>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> >>>>> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
> >>>>> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
> >>>>> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
> >>>>>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >>>>>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
> >>>>>                               SECT_4K | SPI_NOR_DUAL_READ |
> >>>>
> >>>> I tried your patch and it works like expected. I can now read the
> >>>> whole flash in ~2sec while without that it was ~6sec.
> >>>>
> >>>> # time dd if=/dev/mtd0 of=dump.bin
> >>>> 32768+0 records in
> >>>> 32768+0 records out
> >>>> real 0m 2.08s
> >>>> user 0m 0.01s
> >>>> sys 0m 2.06s
> >>>>
> >>>> vs.
> >>>>
> >>>> # time dd if=/dev/mtd0 of=dump.bin
> >>>> 32768+0 records in
> >>>> 32768+0 records out
> >>>> real 0m 6.16s
> >>>> user 0m 0.05s
> >>>> sys 0m 6.09s
> >>>>
> >>>>
> >>>
> >>> Great, thanks!
> >>>
> >>>> Should I prepare a patch with that change or will you do?
> >>>
> >>> Let's wait for a few days, so others can intervene. I'd like to
> >>> clarify what's happening on mx66l51235l too.
> >>
> >> Since a few days have passed and no one has commented, I would like to
> >> bring up the subject again.
> >>
> >> I can send a patch for the changes you suggested. What do you think?
> >>
> > 
> > Why not have a single entry for mx66l51235l/mx25l12805d with superset
> > capabilities declared. And then use info->fixups->post_sfdp() to fixup
> > capabilities for mx66l51235l based on absence of SFDP tables?

I think printing the correct flash name is somewhat important. Other 
than the handful of people who are reading this thread, few would know 
that SPI NOR calls mx25l12835f as mx25l12805d or vice versa. This can 
cause a lot of confusion among people trying to debug any issues.

So my vote goes for having separate entries for both the flashes and 
then adding a fixup hook to select the correct one by checking if SFDP 
read works.

> 
> do you mean to add SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ flags in order to
> trigger the SFDP parsing and then to undo the read init that is done in
> spi_nor_info_init_params()? Too much hustle.
> 
> > 
> > SPI_NOR_AIM_SFDP seems redundant to me. SPI NOR Framework should anyway
> > be using SFDP for detecting flash capabilities and away from flash_info
> > based static data.
> 
> Yeah, that's what I suggested a bit earlier in the thread. To first try to
> detect the caps by parsing SFDP and then if SFDP not supported then to do
> the static init via the flash flags. I'll have to check the implications,
> it will impact every flash.

I don't think it is a proper fix for this situation because of the 
reasons mentioned above.

I do think it is a good change in general. It makes sense to ask the 
device what it supports before falling back to the hard-coded values. My 
biggest concern is all the things that SFDP _can't_ tell us. We need to 
look at all the flash_info flags and see which ones can be detected from 
SFDP. If there are too many flashes using flags that can't be detected 
via SFDP then all those will have to be activated via fixup hooks. This 
can easily turn into a big maintenance burden.

A quick look at spi_nor_info_init_params() doesn't reveal anything too 
problematic though. There is SPI_NOR_NO_FR but IIUC it is for legacy 
flashes so they won't have SFDP anyway.

There are also SPI_NOR_OCTAL_READ and SPI_NOR_OCTAL_DTR_READ. The former 
can be detected via BFPT dword 17 but the BFPT parser does not support 
it yet. The latter is a bit more complicated. BFPT does not advertise 
it. The presence of the Profile 1.0 table signals this command is 
supported. Not every 8D-8D-8D capable flash needs to have this table but 
then a fixup would be needed anyway to specify the opcode, dummy, etc. 
In short, it should not be too hard to add support for detecting these 
flags.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
