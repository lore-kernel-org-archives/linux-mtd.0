Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68203C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:25:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4AFD61151
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4AFD61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3LBVRpqu7MGNC+BVB0WsZebi6cZ5ICADyFC2ihPq/BE=; b=AFbpa9fYVHoGkcVkJf3CM2S0P
	07jF//lz/c1mZPbgKU0YaNvcfdAYbjsREW3hghBhohtyIrD2YnWh13JZHQRQV2RmfTHUpU6ceE1Mg
	a3Y72oBauypzvDnxA48f4t1JNOGat9zc0wYmrj5NIfL6KxaJ1ctkS0saSE5SaobRmpp8Vn420qp2J
	iF9NOrnB569ADrzhtZEguxE+/A+ncmFRfqn0yVi9C5HoNauORYUk1V2vQrimRt1mRO6vRaFPUao4u
	OW0EzXtJ3WwJUBju97VrrS/68ZXWT4By6MQ4T0fhCcTDCVN6ojPEgA1XDPBWSPdCEVwH8QXanAu9f
	bwbeRdJxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhlM-009qLy-Ry; Fri, 09 Apr 2021 03:24:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhlF-009qKH-BV
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 03:24:49 +0000
Received: by mail-pj1-x102d.google.com with SMTP id ha17so2200773pjb.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pPxGKSyaylryRUHoAVhFQ7YbWehLnG7A5VZ86T+XErg=;
 b=GNFKnQIxQSHC+23zeHNVavo+QN6cunxWlvADlQ+C0CYLXEcSM+ACmJ8Xmg789KOb23
 6KGKu2dhf5n5XFV6FEypOTDTHddsUtk2Qz3fJc9v456Di+h0iZYGkkiGZ7guTEDJDBt0
 ia94xtft0JSRHazx3gzySn9iSWpzvbIL8QE8/i0RvE7Zm7WsVQKaSM1QVd83IxOfsSbl
 fHD0TRTjsK2PrOhtbE/eMNz2dLEFFmvjzvntvChIKEOfu73sQ5su3v3vXKU7EKeXW0ng
 9lQTPHznYuLzNAHk90SmgS1voyh4cV7xJNroUWnSM+AH8FJz+e2fI1ms2khA3EqbP2Az
 bnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pPxGKSyaylryRUHoAVhFQ7YbWehLnG7A5VZ86T+XErg=;
 b=F8Ypt1fkkV9qnF5hr1Ul0twHqod8fi5Hif1rkhyS2k5n0/9BDoed80gXbqMxKx7tTr
 /nURsZMyXjQ8njq8UHAFo1tBwharN1cBVPeIQIZcaPGfPDlKkilNSJIH8AoZ8G5xxoWv
 XJG7YTzkuR93ZQRIOxtbj8YX7j5AePQGR+hX63XVMb85KUTM2wsuLHl9yTjCcx4TXFR0
 PMRZfNk/A40FVwI0X8HDUHsRVjTSvSpyOUOwSej3gpxR7JwWQYCet7PlGCljonmUEIr+
 w8enByuShDnNqafuTtPWs7xniPjgQs90hcvIXbmA2/OtxTVR8Vteqys1o7Db22geurrL
 IYLw==
X-Gm-Message-State: AOAM531rRoNkuIfYMjEhIRbqbGUt4HHlSHIbyEnGWDXh1K6GeI3iB5kf
 IFRUVW6mCoT8EcE9jdnyMbU=
X-Google-Smtp-Source: ABdhPJwgCSp75FQKLxYaNOggm2dEfuwXZEyJqyPynTjbtjjVidXz7d2DqWkacXfkhbm71e3NatuskA==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id
 p14-20020a170902e74eb02900e5bde42b80mr10760328plf.44.1617938683581; 
 Thu, 08 Apr 2021 20:24:43 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id d13sm691023pgb.6.2021.04.08.20.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 20:24:43 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
 <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
 <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
 <ec9d4e56-8ace-f55d-a999-54a553b903ed@microchip.com>
 <a5ecdaac-3375-a898-59a1-646da26b5afb@gmail.com>
 <e9d997a1-6d81-bccb-9e40-8030022cb7aa@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <7bd12cff-f814-158f-bccc-de4c6d06f3c1@gmail.com>
Date: Fri, 9 Apr 2021 12:24:40 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e9d997a1-6d81-bccb-9e40-8030022cb7aa@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_042445_769352_B276D355 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Tudor,

On 4/9/2021 11:37 AM, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 4/9/21 5:05 AM, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/8/2021 7:03 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/8/21 11:21 AM, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi Tudor,
>>>>
>>>> On 4/8/2021 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> Hi,
>>>>>
>>>>> On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
>>>>>> +static int
>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>> +                        const struct sfdp_bfpt *bfpt,
>>>>>> +                        struct spi_nor_flash_parameter *params)
>>>>>> +{
>>>>>> +       int ret;
>>>>>> +       u32 addr;
>>>>>> +       u8 cfr3v;
>>>>>> +
>>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>>> +       if (ret)
>>>>>> +               return ret;
>>>>>> +       nor->addr_width = 4;
>>>>>
>>>>> Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
>>>>> will be called at set_4byte_addr_mode() time, resulting in an illegal op?
>>>>>
>>>> Since the spansion_post_sfdp_fixups() adds the SNOR_F_4B_OPCODES flag,
>>>> spansion_set_4byte_addr_mode() is not called actually.
>>>
>>> right. Do we have to undo this somewhere, i.e, call
>>> spi_nor_set_4byte_addr_mode(nor, false); ?
>>>
>> No. The Read/Write Any Register commands take 3 or 4 byte address depending
>> on the Flash's current addr mode. Since the spansion_read/write_any_reg()
>> use nor->addr_width which is always 4, the Flash's addr mode must always be
>> in 4 byte mode.
> 
> If you reboot your board via cmdline, and the flash doesn't have a reset opcode,
> the flash will remain in 4 byte mode when the driver loads again. Wouldn't that
> affect the read sfdp command, since it is sent in 3 byte mode? Can you try a
> "reboot" cmd and check what happens?
> 
The Flash always takes 3 byte address in Read SFDP command regardless of
address mode. I tried reboot and confirmed it's working correctly.

Best Regards,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
