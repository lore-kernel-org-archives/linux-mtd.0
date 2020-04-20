Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F949C54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1435120724
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 11:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8CAipHB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="gOAfQejf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1435120724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B+gmXekl3n8Nyr89yZg+iM1R31apZVzY7ctFuEiBjUA=; b=E8CAipHB2CN4XRsiojH9eFiZM
	yZOIH/YcRbVpgw0BBUFVqCSjWqkDQTd+pkyrESCO+hwxmyd4sf7JS2zy6m26S3s5OTXNZAEQSx2VQ
	Xj4zKxE24mh57Dtwc2hXSCkZidKluXKcWT4W2yoEaiMskInRAKi0eIrZoKKKadW+KcyLbBRDVrnd0
	UenMp2zI4QoGfhvoXPm1e+pqK/nvsmx4LvIYfImmCI1dJFqgm9dP1ICkfwkFDBE/cIZBSpbqfG3/p
	eKT7Yr4CnVDTYb6/QbUJEFrg+inyb7Rg2zOVIq2MYCcePslctBSGd0X9XMb7bsx1DFLbLJ3+ROzob
	EciNo2vlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQUFB-0002zg-Ro; Mon, 20 Apr 2020 11:05:41 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQUF7-0002y9-Oh
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 11:05:40 +0000
Received: by mail-lj1-x242.google.com with SMTP id w20so3144166ljj.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2020 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J/OtsZTuKudPA8uOd/PZ8sDUkZL6/na7Ch6hNmEVXI4=;
 b=gOAfQejfT36IM0/2yazsRlnc+VreIjWHqD0P5lqJbf9b867wxrZlVdAGsqah4GqXim
 Mhn2rSuliJ2OND6rhJAywiNks7RFWY3HzgPl71sLV8Rwf8YY5jZGFQq/cKBTTXX06HMM
 qdxsfdvqenpp1FQx8qBjkrLvQd0v6Dt15fSojYav+t84+QnArcsHjwRpMfkMkt7OleDC
 /3F14Zjhjw1W2lUtYLqpX2ia2Kb8bfG/VhJbkwK5sb3KQWHniIPFPGhBFTHZme5bMrL8
 4pOuNUaadr+l1vh+a3Od1QZeiPeaGzp6bDWdOxXfspS/ZwrO5jW4jv4YS2LqhRZdjKWA
 /h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J/OtsZTuKudPA8uOd/PZ8sDUkZL6/na7Ch6hNmEVXI4=;
 b=WnRhTlQEMixYFE7FnfSZxwSAbxZAeBl8DFE1kGxGqYEW5f8/3l1X186xJWhbRiY6fJ
 +KjtAJVxcv5rWoFwgSER2egNrVMp2AxK/wskmBMRZ3GOdIBwzyyRzsB0Jm76aXx5j0AN
 xyEsKmUmnua60BVqe5WzgNwcbTjAklnNu9t4ktNzItPTYaDnI/8y1TJUNZgEe6y05WC1
 iaQewlOEJSVSKem7Ls15C7gWHYkSSOiNNMp6I01J9MJgOVYKNPwIA0znKOz1nm6XYFtD
 hartcYNNNi9GjCjay3Rsatv7TSywVP9LjpP9q1NbXxv+tn1XWZio9rOvw8ebPEq0qr2r
 ZcCg==
X-Gm-Message-State: AGi0PuapF5o3Lb6Hw3VrTaevhcI7HRcin4cVxP/eegftxb1iajMCHLdk
 OO6PbS/lshWMIandNXqL0Vxziw==
X-Google-Smtp-Source: APiQypKXj/GJHbxybduU9k9URrWr7a62yyQAVgU26UPUva1jUlTdvyDFbPhaJ4+VJRf44EhQERKcXQ==
X-Received: by 2002:a2e:553:: with SMTP id 80mr9659770ljf.147.1587380734961;
 Mon, 20 Apr 2020 04:05:34 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:25e:8f26:1014:e519:2b4e:4734?
 ([2a00:1fa0:25e:8f26:1014:e519:2b4e:4734])
 by smtp.gmail.com with ESMTPSA id m193sm547521lfa.39.2020.04.20.04.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 04:05:34 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
To: Tudor.Ambarus@microchip.com, yangyicong@hisilicon.com
References: <1586939433-20861-1-git-send-email-yangyicong@hisilicon.com>
 <3664588.JgWbhVaYgF@192.168.0.120>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7a8b4b41-66d1-afd6-b8a4-b591a7fa36d4@cogentembedded.com>
Date: Mon, 20 Apr 2020 14:05:29 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3664588.JgWbhVaYgF@192.168.0.120>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_040537_870575_960AE3D4 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linuxarm@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20.04.2020 13:18, Tudor.Ambarus@microchip.com wrote:

>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
>> content is safe

    Hm?

>> Add support for Cypress s25fs128s flash. Previously the flash is
>> decoded as s25fl129p1 by mistake.
>>
>> Add it in the flash info list to correctly decode. No functional
>> changes. Further capability of the flash will be parsed from bfpt.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>> Change since v1:
>> - rebase the patch on v5.7 rc1
>>
>>   drivers/mtd/spi-nor/spansion.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 6756202..01640c1 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -29,6 +29,8 @@ static const struct flash_info spansion_parts[] = {
>>          { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
>>                                SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                                SPI_NOR_HAS_LOCK | USE_CLSR) },
>> +       { "s25fs128s",  INFO6(0x012018, 0x4d0181, 64 * 1024, 256,
>> +               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> 
> The flash should be named "s25fs128s1" - this would be the flavor with uniform
> 64kB sectors. One should add a "s25fs128s0" entry for the flavor with uniform
> 256kB sectors.
> 
> We usually don't add new flashes if they are not tested. Please specify in the
> commit message with which controller you tested the flash. The minimal test is
> a read, erase, read back, write and read back. This sequence should verify if
> read, erase and pp work fine.

    This chip (as part of the S25FS-S family) most probably requires a 
post-BFPT fixup to make the writes work. I was going to post the patch adding 
this fixup for S25FS512S chip.

> Cheers,
> ta

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
