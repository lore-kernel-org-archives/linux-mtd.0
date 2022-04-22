Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F08C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Apr 2022 09:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vqF81nKUAkdiMWKtgGa1qGKoqWHtf9bSnLSHklUr/s=; b=KiTLxMv3+Kx6D3
	S2jedFfaLD+gLznjh809dnnc3+khZZakxbefmmlwIiFHrSCe3fbPUXLvk8m3vYJvGbFl4UHh9IXO8
	DO4BaKU9KQQtmJg0+QL0zLhcWgTzR1Z2nRx5VNbXVOH2zQpFnrC59OJ9goyMt8MgoRGM9S7KTDJEZ
	AWtoJ9x9hRuOyUG/ziKcfhM46pg1wPFuCEyGnhEMDx31WzFDkR1F9wNOQy8XI9Yg7PU+MSlR5kVad
	TuxkXgHR/GBQ1apuAMZS/xw3YmBzKMhmzady694v1Cb0zDu6HdnpNsXvJU0IT4jJsmxGhrPfNnqDx
	a1TUF0FVuelAXfQplWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhpDg-00HLZc-1B; Fri, 22 Apr 2022 09:04:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhpDd-00HLYg-9m
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2022 09:04:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id k29so6837287pgm.12
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2022 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nOUlwNQM9Fp2buiFZVdpSq81lC/GiNCozckvqhthWdg=;
 b=XZWrWx7Eidj8+g5fGerRAUPwuqlpGIabqr9o1krLsmTkLkkzSy9O1yfH/8LFB+PPCg
 dSdo04GGsO+XV50SeRWzsPJI4sv5zCCw7mKnJlz3ZiYYFTDPYID7SnyOsNNHZQT/xH6o
 ayaODiKiDBelQmvwGAG8TT1m9Rv1kAqgKak7uzgyGQzemQkLsScw79XIJsRhi53hHYHs
 XtgwcKvTBSMsDmvPpkm7DU6ZNtOmLAwsVJnkYXFDG30rq6iZR4rNXFNQVGl1BRV90jf4
 n2YTHl1xvlE623DNNGPPQgNSgyw3u59SaIe9L5KBbqPQcevRbd/gRG33jSaWVvUbH1SW
 9Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nOUlwNQM9Fp2buiFZVdpSq81lC/GiNCozckvqhthWdg=;
 b=3DI4EYeJ+LnQN/SJxvBbFjQ7Quy0Gvl+HEvYJLNChVK5Qni73IW5GPeMNMEexx1V7w
 BXoLrlhphqiOcGVpySNIvHPGXwo+tXVM9cB+K9r0dRzE66QPsA5oEw15TLoBzi26Jj5K
 Jj/qw5XPg0AcZmTTQDp/kvkhIW87+t4MZ87xc76FtwxefIjUF1NFtNP2KLCviD01a/Zk
 9qedMGdhiSoBH+19vKcktdhYrec5NGQl3Atf9iJsv4cLOle/d5cWw+U4WN3SXS82LBye
 ofQTmOMcH47w+oiaRgVjsUc4iRwSYu0b45cyb3qkk8/wIDQGmEN0kESeeqyw26GXJGZo
 BdRg==
X-Gm-Message-State: AOAM532mrLkR2cCV1u3JSvV4wYCflZb+mCjgADf//VwrjU/KyHl+awsI
 nSNCzRSVa9i4v3tyvsOTjybkbQenXuo=
X-Google-Smtp-Source: ABdhPJxuGY6zRckAwzNGPM/UfNl67DIlhK4/ismhiVyLQn8Zvu63yCdCYU12UanH4x5DwLGrpuE83Q==
X-Received: by 2002:a62:d402:0:b0:50a:b621:2e with SMTP id
 a2-20020a62d402000000b0050ab621002emr3809294pfh.49.1650618287244; 
 Fri, 22 Apr 2022 02:04:47 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 bm27-20020a656e9b000000b0039e5d327f78sm1578752pgb.44.2022.04.22.02.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 02:04:46 -0700 (PDT)
Message-ID: <ac68af4c-9453-fd51-680d-cfbccc9dfaa8@gmail.com>
Date: Fri, 22 Apr 2022 18:04:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v13 2/4] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650532121.git.Takahiro.Kuwano@infineon.com>
 <2c04068f34e4dbd25da541062f5309b1d9878c22.1650532121.git.Takahiro.Kuwano@infineon.com>
 <fff074e7-07ca-0334-a6f4-f4c0d57577d8@microchip.com>
 <f96c55f6-8d27-57f2-892d-d4fd922bd2e4@gmail.com>
 <cd0599c2-6099-def1-3cfd-f70ae1545565@microchip.com>
 <381db18c-5e6f-9f39-ae92-7fdc21cc4844@microchip.com>
 <abd25802-8d39-7f5e-4fd2-fef96f85e45a@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <abd25802-8d39-7f5e-4fd2-fef96f85e45a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_020449_392247_1DB2CBCF 
X-CRM114-Status: GOOD (  18.30  )
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

On 4/21/2022 8:48 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 14:36, Tudor.Ambarus@microchip.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/21/22 13:56, Tudor.Ambarus@microchip.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 4/21/22 13:47, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 4/21/2022 7:41 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>>>> [...]
>>>>>> +/**
>>>>>> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
>>>>>> + *                                      register.
>>>>>> + * @nor:       pointer to a 'struct spi_nor'
>>>>>> + *
>>>>>> + * It is recommended to update volatile registers in the field application due
>>>>>> + * to a risk of the non-volatile registers corruption by power interrupt. This
>>>>>> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
>>>>>> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
>>>>>> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
>>>>>> + * also set during Flash power-up.
>>>>>> + *
>>>>>> + * Return: 0 on success, -errno otherwise.
>>>>>> + */
>>>>>> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
>>>>>> +{
>>>>>> +       struct spi_mem_op op;
>>>>>> +       u8 cfr1v_written;
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       op = (struct spi_mem_op)
>>>>>> +               CYPRESS_NOR_RD_ANY_REG_OP(3, SPINOR_REG_CYPRESS_CFR1V,
>>>>> nor->addr_width is 3, isn't it? can we use nor->addr_width instead of 3, please?
>>>>>
>>>> No, at the time this method is called, nor->addr_width is set to 4 by
>>>> spi_nor_set_addr_width().
>>>
>>> I see. Allow me some time to re-read this.
>>
>> Does this help you?
>> https://github.com/ambarus/linux-0day/commit/05f20ab7ee349628f0e2d22a4d3852038a6c8c70
> 
Yes, I have confirmed it's working on my hardware setup. Thanks a lot.

Some typos in commit description.
> commit 05f20ab7ee349628f0e2d22a4d3852038a6c8c70
> Author: Tudor Ambarus <tudor.ambarus@microchip.com>
> Date:   Thu Apr 21 14:15:42 2022 +0300
> 
>     mtd: spi-nor: core: Couple the number of address bytes with the address mode
>     
>     Some of Infineon chips support volatile version of configuration registers
>     and it is recommended to update volatile registers in the field application
>     due to a risk of the non-volatile registers corruption by power interrupt.
>     Such a volatile configuration register is used to enable the Quad mode.
>     The register write sequence requires the number of bytes of address in
>     order to be programmed. As it was before, the nor->addr_width was set to 4
>     before calling the volatile Quad enable method. This was incorrect as the
>     address mode was still at default (3-byte address), which resulted in
>     incorrect register configuration.
>     Move the setting of the number of bytes of adress after the the Quad enable
s/adress/address

>     method to allow reads or writes to registers that reguire the number of
s/reguire/require

>     address bytes to work with the default address mode. Now the number of
>     address bytes and the adress mode are tightly coupled, which is a natural
s/adress/address

Thanks again,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
