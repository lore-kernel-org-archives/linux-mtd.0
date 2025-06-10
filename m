Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08664C61CE8
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 00:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ksg2JuXrAWp0t12WtcNSBuhH8086PJr5W0zJa1eKRmw=; b=zkDJFb9wadYSNt
	zl+j4iBryTBgZnLcYjwwMgiRqBpSFRRHxhT7kdyLeiyLgoGsHiqXusmAwFR+eFRKmuxZKisYFrodN
	KHWfv4eAaykxpCkCKLilD2DwS7lZhZiEd3bnfmiZaoo4HxIZrNsCyMXh0QqyIqworOGVastQxD27L
	F+6lx7GVT34asQfUvaFefUuEPQwicbXgwwEpdGwEjpLD64U+keIeHTjh+7GCb8srlc1zhoKve47aH
	qs6Gzri2HtZkyKjsUMdKVzsMzBHiNRz2wq9KxSdIC7568kcsRAlLAODvAeaiNKK0gfTr37AifdJ3X
	NU39A1EdP0vYmIGAu1QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmd4-00000005UVg-0o2b;
	Tue, 10 Jun 2025 00:14:14 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmd0-00000005UVL-2yPj
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 00:14:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3636541b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2025 17:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749514450; x=1750119250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SDmh2pXZKhDSuGnDO4AbRoLGbD8cViZkr2cVpnN67Tk=;
        b=luFSmd8isfcmqGvjYt3CVtU7sE6zy4aTCN0DFam0PkRpuKbFjJ9w1m1yyHYxnDuA2f
         76YlG6zMDiCZix6xy4hO56UB8dO1S+1ryg9r+THhesU7gdRbeYoLGQe57UJdYxbSQ8hj
         cMq2+g69Sp5tWaH0Bxs2Mg8oUxbv0D26vpoyb2wrv/hRolpg1KIURShjLXf2075ZrNn8
         9GoF02TV1fE0N6PM7D6b3W5GkC7c6ZbZfe/3Iq4z5fODmL1LQ/bHEFvqktQU4LCtKzdI
         SsaVwWQq6pYPaQkO25E/8wR3JDcE/vNfRv7K9dn+D7F0TZ5WlYZX4aU5oJj2u91XuFP6
         FvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749514450; x=1750119250;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDmh2pXZKhDSuGnDO4AbRoLGbD8cViZkr2cVpnN67Tk=;
        b=gmuWkfJTAPIo6pDgwF0TQfZX6gy7wq/YAfqfDpwDxp2PpRYtBFrFo11FOOrxiUGk9z
         HJx7as/7V1c0sFfdd4mKFO9Sfe4Gy1JKoKhIFkgkY1ENq7RkxSZLH3+1Nndq0IVN/MbT
         Zckwzytl3zTuudOlQdaFpC+aAcZCuyZGKWg60bhLmcSpryKsc7bQmP62PdTJM9gPp+fR
         tBV7x9Md4TN1/bqrInK3xPPGQrBQzwceY676lxNrYwVNo9STBmz2uVoHaE2eUM0O/xaA
         sQ9a8+380lR4yoHvN2+/+FiXgbBNRGR6PvL9vWpw6P+MiSOoJsRW5xQ8sds+dnvc5/mM
         L2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUFsOVNlP0GtluftcAMtogERV80EFsKaTMerTPSig6c2Jg4aMnAwY/gvOeXwnKoHfQSKkZXET+U4KU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ejmSmhnU0WQk6U2vqUAr3xcGKYc5Wov7kg180OvfmCzmPkv+
	fBshnAJpvsn6mbLS2DVMM+CK1rL4DPQDadJFSsl/F1jPHwLzYzgUxL3i
X-Gm-Gg: ASbGncvp4BSSTix5RpPjeTAlyRd5WBZY7BP45EKoeKYlZBUeXdsCYSfKHrZ6phFkV1L
	rm5KZlfzx/TpHLQkIGz9EWYvMeXF/nRuMlvf8TvdQuKgk9xSZG8H3jgEsmQvj5pRudIn/78Jlf0
	AK0b7/rSxrD62FheO0lNsPpPKgisNN4w5RCZmu2RjG7P59W96d6Scs/UQ2JFH10N74c8iSV+XoQ
	3qIYUyGNMOTOkqCUTH88M89J+YoeIlr/EEClOBGximUMdIO8HW+Nop1F7qKB5KI6NkeyQZGviX+
	bzo5zGlcuKHzmWC759AIcnd/t+6YiANxQ80IK12ttq9AllVPQZNrBUmZuQMPBExfYyhnLoBLKhM
	oxIa2XRHqz6qTq/EmaVt3n/I1JOyYShySo/g=
X-Google-Smtp-Source: AGHT+IE6bz0S2Zgw0EqTcXjTqoWNvsI9FyWPVFtwQDc8KiOypngCKu278OAjAOmX+xfaMWqaMGwNng==
X-Received: by 2002:a05:6a00:1822:b0:736:5969:2b6f with SMTP id d2e1a72fcca58-7485ea624c9mr1759998b3a.6.1749514449904;
        Mon, 09 Jun 2025 17:14:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af382fcsm6339982b3a.28.2025.06.09.17.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 17:14:09 -0700 (PDT)
Message-ID: <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
Date: Mon, 9 Jun 2025 17:14:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
From: Guenter Roeck <linux@roeck-us.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, tudor.ambarus@linaro.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_171410_793764_0EB7CDE8 
X-CRM114-Status: GOOD (  17.48  )
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

On 6/8/25 18:13, Guenter Roeck wrote:
> On 6/8/25 05:53, Pratyush Yadav wrote:
>> On Sat, Jun 07 2025, Guenter Roeck wrote:
>>
>>> Hi,
>>>
>>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>>
>>>> Many flash devices share the same ID but have different part numbers.
>>>> To avoid confusion, the part number field is removed.
>>>>
>>>> Additionally, since SFDP already provides size information and
>>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>>
>>>> Furthermore, when 4-byte address instruction table is available,
>>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>>
>>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>
>>> With this patch in place, some of my qemu tests no longer recognize the
>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>> this other than avoiding Macronix flash chips when working with qemu ?
>>
>> Could you share some logs? Does the flash fail to detect, or does the
>> SFDP-based probing fail? Since this is qemu, it would be even better if
>> you can share a setup/reproduction guide. I have been meaning to set up
>> qemu for SPI NOR testing for some time now, but never got around to
>> figuring it out.
>>
> 
> I suspect that the SFDP data for the affected flashes is incorrect in qemu.
> Since this is very likely a qemu problem, I'll just configure different flash
> chips when running affected tests.
> 

I was able to confirm the above. This is from the kernel log:

[    4.500000] spi-nor spi0.0: BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash
[    4.500000] spi-nor spi0.0: probe with driver spi-nor failed with error -22

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
