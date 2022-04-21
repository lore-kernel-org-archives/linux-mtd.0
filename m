Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF68C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 06:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO4fFehmoaqyj6u6C8WJL2N/xE/N671ZSS1oR/hxNXg=; b=RfXZFXxxxES/Lr
	FfMu2iKYUoSh/z8kukv4zC4CbvYquzcp6cBh0yF/a76ApfzdYg/DjY/LpOl558ERd27nR28VzyU++
	8sVt8D3G/EFpl69tvmecig+zYLsGoeP4E6iZlg4LYniRcUmDV/xiqGZik5Rq+P9Dn3AMYd4C02+kl
	XSG6AzOyZmNk43/tcYCDrCqztVDE04fSmeeZvVdKv+HeQITmIuZBy4EdzYtbLjSyWaVXVJeiOB/0V
	sUUe6zForO/Kx7KY5vpqA80evL54CN5FAalq3aKFtSVM2s+9gcv2MHwz0lM88dph8gk1pjyNR/SX5
	tcf+MwRdaCpVnoF/kD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQlb-00Bupn-VB; Thu, 21 Apr 2022 06:58:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQlY-00BunE-Ib
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 06:58:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 2so4135756pjw.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2022 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6/hgK/40/z6/eqh9SEoXSio7H6c4yzMoaIEPtIwkXXA=;
 b=KpYbCmukveZKfprh7iHTFR+lFJWw1z1ukafJqukOAyy32uiVuc4pkfu6a3pi8RFE4x
 sk2jzu/HONecgonEw1+XT7CQThxFx+tynorlLzpvg9qalKaJRb9BjBSt1IMpPb8VCwNg
 dc8aqFC2zPdbBW1JWtglLgat8FFV62MWbd+3EmUDXco9wl2fth+injNIyukO+R7SHqej
 xws8xnoELXo1iqswCZ/vSGH8j948VxBupKNK0Hyyxd9t2SI8T/ImVOquPsJbdC3NGhxY
 CqbDO+KiiI/S+dKf4tvg3xZVOl6Bl/TDf8hzli8cqZkojam2u8Un+wfZqQXO0ESXLZhj
 0a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6/hgK/40/z6/eqh9SEoXSio7H6c4yzMoaIEPtIwkXXA=;
 b=Y4DFlioLy4oKPf/LhESPRfHhib8DqCY18ZZxTPpYF3TaKYFd1y69b0EK/KmWl4dEBh
 nmwmoUo7cusLE/ELcST3y+nY8sjZ6/o6WCXqWUq2raPTd8PjJ0W2NELYoCfJmYYCioZK
 gsPd6GPiwmkS1V3FH9MFLb0VPq3QFnzNvSCIjeHrxWHvdOho59eaHgedXsi/QxzWceRv
 LpYJRkLZu94HSvRfjgMizJ5NK2tUrVdFhxjB5ICmKCH9na1yOUEJATIWW3qRxbQJH2Q7
 oPv9bAkOA4kunmSXwLT5vrBNGmSs9i+lH7QLP5qmhDscQ5gsmii/YHmPXlHDidgddCNE
 s+8A==
X-Gm-Message-State: AOAM533QQJp+jyGfVog20rB/1pxz74mcSZPBcfZ88Zn7JuIx6fNBPf5s
 url9SZPowfvtxRWPwo2Rnc8=
X-Google-Smtp-Source: ABdhPJzp8JYqCaGOB8prwUn77WsacgnOsn1N/Ky1uqN3z/DL+SQ8x8VX6fJ2GQJnJbG/86qs6HHGyA==
X-Received: by 2002:a17:902:eb8d:b0:158:86c7:a44f with SMTP id
 q13-20020a170902eb8d00b0015886c7a44fmr24047879plg.73.1650524289727; 
 Wed, 20 Apr 2022 23:58:09 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a635e41000000b003a9eb7f65absm4692260pgb.85.2022.04.20.23.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 23:58:09 -0700 (PDT)
Message-ID: <837e482b-c7dc-23ce-27fd-33b453b3dce9@gmail.com>
Date: Thu, 21 Apr 2022 15:58:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
 <bb40711b-df58-a951-a5ed-9cb7a6732f6d@microchip.com>
 <c160f59c-1e60-d783-3793-4d91eeacc82d@gmail.com>
 <961eeb6c-9f4e-dbcf-1db7-7eae3c167214@microchip.com>
 <7c70ba65-5d25-8578-a8e7-258d9230df24@gmail.com>
 <3421477a-a3a5-3fec-6e4b-8c0c319aa671@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <3421477a-a3a5-3fec-6e4b-8c0c319aa671@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_235812_697163_054B26B9 
X-CRM114-Status: GOOD (  16.01  )
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



On 4/20/2022 5:46 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/20/22 11:38, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 4/20/2022 5:11 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 4/20/22 10:50, Takahiro Kuwano wrote:
[...]
>>> I agree with Pratyush that we shouldn't change the state of the flash at parsing
>>> time. So to solve this we could introduce nor->params->addr_width to set it at
>>> parsing time, and use the default nor->addr_width for ops at parsing time for
>>> all the parsers.
>>>
>> The default nor->addr_width comes from BFPT parse (no change in BFPT parse).
>> In 4bait parse, nor->params->addr_width is updated instead of nor->addr_width.
>> Then,
>>
>> static int spi_nor_set_addr_width(struct spi_nor *nor)
>> {
>> +       if (nor->params->addr_width)
>> +               nor->addr_width = nor->params->addr_width;
> 
> remove the above and
>>
>>         if (nor->addr_width) {
> replace the if condition with:
> 	if (nor->params->addr_width)
> 		nor->addr_width = nor->params->addr_width;
> 	else if {
> 
> and the behavior should be kept as before
> 
>>                 /* already configured from SFDP */
>>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>>
>> Is this something we are going to do?
> 
> sounds good on a first read, yes

Hi Tudor,

As Pratyush mentioned in that thread, we already have SNOR_F_HAS_4BAIT flag.
Please see new patch in revised series.
https://patchwork.ozlabs.org/project/linux-mtd/patch/d705a2c1fc8d0a59c93454aa05642aafe4fc960b.1650519576.git.Takahiro.Kuwano@infineon.com/

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
