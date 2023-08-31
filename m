Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63138C83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 04:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR83WIhrXB2CpbaJW7iHclENcJLCPKgFtAHFn0fsMg0=; b=uZnnTqZ5u6+IKvhjqrK+nA32PR
	i61AC0PgoHkv7P/U4DSFSFgMLVwp89T3hPV6YLy3G24oyRpogipxVXf6E+5rnysoKxNvUU5+6QW/L
	QPtdEsD/xiY65zVC3M2dGah7+59cKGGYbyjDiYM6DfXlfuZl8TkgHegZ8xOPzAgM3ozglyoqbPcir
	L8HPZsz7ayktYKLuXyvItgSCjwzxiTiiaSsgMg1Z7O9Kc4z835VCWkcDQeDcgv2+uoA700y11k9cW
	UvFZ0YdOVXeIIvp3Bt2fY6CueqZmsbbL660LnbLD17ktxXIzhKkuRHpvOstYtL3YnE1tyN8S3CjuY
	gH6AoEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbZ4E-00EcBu-0I;
	Thu, 31 Aug 2023 04:14:02 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbZ4B-00EcBY-0P
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 04:14:00 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7927611c54bso16481439f.2
        for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2023 21:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693455237; x=1694060037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaJsFxcc54aKDjeZFqWnxCfZZrtvtGhXsmAHrJGXgeE=;
        b=ZTHqJ8kxT0QuDXqa6rCIJyZ7YAlv4pJCExUpsLKJcBCpdBR06ikvpbvt2TvGpSn3nv
         8oPknIMtrGhOq0NA/IIUTzPKhiR4z5cTrpGwxxk3/nXjtOPb9AVpABjgqYrjM7NoEv3g
         ULwFfUXssiwz/4u5D8+wBzUQdNatwBVb4zwFonyejU8d45Jed5RIs/rXYJQe1g/Gj24Z
         EA7SBezVwFv1BD0/JhTnEzJKjkttuXivwF5iLaSOJu3XOnqJJdPMgRWhMQhXjAwU/nEB
         rqdVtgFVFWuGPuMs7gY6pGU+D5P7Pego2MYxcc0+hMCXfHTaz2X1tIHlXKbUJq9u75pZ
         Ua/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693455237; x=1694060037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaJsFxcc54aKDjeZFqWnxCfZZrtvtGhXsmAHrJGXgeE=;
        b=JJIw2FpACN0cQ2GG0EWXC5OKBI0zw16CrCJwbxOIv/NkAdLWZqRRBk/SScMQi8gUuN
         HyQwfeZDe29hvwUtpplZQvM6BKccYBJVY0IXFoZeepLrmb2LnjHDTLGNC3+X2yMH+erC
         sV/QO84kayqaTE+9dIV1xzvh/iivvjT+vbMPNo5oWDbO5145Xt/kUu0QnSnC1xCVso6d
         rA1/muY6BOu4sDJDlRavc+o8OZv73s8mis3GUXlOyeWczN67YrPI5znGt0PaFv/F5u82
         y33ImrzGmMQA70mJ1dQGE5PxJLx2mvEzy87MoBgFwY6eOVkhdC+bzxO6JDZRf6w9LEsd
         vZIA==
X-Gm-Message-State: AOJu0YwyK0R4iRWLvjzpYCPQtfr+0XAuN42Pv3LswT2d6nuQ/AzIsA7E
	NJzejwv55T/nSICPferoRv8=
X-Google-Smtp-Source: AGHT+IHKD1SQoAob/NBLnSIfg33mE2VlPQUCwMmnVJY4dwq+izR7qaPh5vVv6hOFEAJ5YjYCsYgtAQ==
X-Received: by 2002:a05:6602:3b9a:b0:790:6629:b222 with SMTP id dm26-20020a0566023b9a00b007906629b222mr4850561iob.5.1693455237439;
        Wed, 30 Aug 2023 21:13:57 -0700 (PDT)
Received: from sun-virtual-machine.localdomain ([103.149.144.245])
        by smtp.gmail.com with ESMTPSA id i19-20020a5e8513000000b007870289f4fdsm196479ioj.51.2023.08.30.21.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 21:13:56 -0700 (PDT)
From: SSunk <ssunkkan@gmail.com>
To: michael@walle.cc
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	ssunkkan@gmail.com,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH] Add support for more XMC series
Date: Thu, 31 Aug 2023 12:13:44 +0800
Message-Id: <20230831041344.4653-1-ssunkkan@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1c04bbe2a65f13b9815ce465cc8dcdd5@walle.cc>
References: <1c04bbe2a65f13b9815ce465cc8dcdd5@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_211359_187128_DE482C07 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Type: multipart/mixed; boundary="===============8408531241944752635=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8408531241944752635==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

>>> Hi Michael,
>>> Since this is the first time I've submitted code to the Linux 
>>> community, please forgive me for some of the missteps that I've made.
>>> I uploaded the incorrect patch file.
>>> In a previous e-mail you said：
>>> XMC parts seem to have SFDP tables and they should work out of the box
>>> without any patches with the generic spi nor driver [1]. Therefore,
>>> you don't need any entry at all.
>>> 
>>> I think it is related to the PARSE_SFDP flag.
>>> The XMC flash part supports SFDP, so i don’t need to add 
>>> NO_SFDP_FLAGS() macro.
>>> drivers/mtd/spi-nor/xmc.c | 17 +++++++++++++----
>>> 1 file changed, 13 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
>>> index 051411e86339..e78bf11792d9 100644
>>> --- a/drivers/mtd/spi-nor/xmc.c
>>> +++ b/drivers/mtd/spi-nor/xmc.c
>>> @@ -11,11 +11,20 @@
>>> static const struct flash_info xmc_nor_parts[] = {
>>> 	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
>>> 	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128)
>>> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>>> -			      SPI_NOR_QUAD_READ) },
>>> +		PARSE_SFDP },
>>> 	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
>>> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>>> -			      SPI_NOR_QUAD_READ) },
>>> +		PARSE_SFDP },
>>> +	{ "XM25QH128C", INFO(0x204018, 0, 64 * 1024, 256)
>>> +		PARSE_SFDP },
>>> +	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
>>> +		PARSE_SFDP },
>>> +	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
>>> +		PARSE_SFDP },
>>> +	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
>>> +		PARSE_SFDP },
>>> +	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
>>> +		PARSE_SFDP },
>>> +
>>> };
>>> 
>>> const struct spi_nor_manufacturer spi_nor_xmc = {
>>>> Correct. If the flash is working with PARSE_SFDP, it has SFDP and
>>>> all the information of the flash_info table is pulled from the SFDP
>>>> tables, except for the part name. Therefore, you don't need any entry
>>>> at all. The flash should just work out of the box. Are you using the
>>>> latest kernel?
>>>> 
>>>> -michael
>> --
>> Hi Michael,
>> 
>> According to you, does this piece of my code still need to be modified?
>
>You don't need it at all. The flash will work as is - that is without 
>that
>piece of code.
>
>-michael
--
Hi michael,

If these entries are not added, the flash part name is unknown and our customers cannot see our flash part name on the kernel log.
So,I think it's necessary to add these entries.

Thanks


--===============8408531241944752635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8408531241944752635==--
