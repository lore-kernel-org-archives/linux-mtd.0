Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86B8F3381B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/p80iczK1sIuAkggvaM5QSG2gemHKzdr4aOY0Qiqyk=; b=pkNsdCGyO89zHZ
	zdmHtHie90MjYOQ7JFbgi1OZR9IJRLVRUXsvWSFSubeO/vDceoB1A5zEmkWH5ERIoY2AkHrNZOaCb
	+WUWCdtdQpDLTfzuyiZBg3aYQge9q18zk925ubVZ2yH/ZqCZcrCBcQmqJkAs/DRAIXH8Eyz3jiKsu
	Kz+zncurlOjB/MrDA0nfSF0hpXOczLHd/uwmchQpjrJBUHmcVRoFm6rKDN65xp+88uUtjTu5N4cB2
	UINbZcL9rVCiFmw37RwSwzg6+asU4H7UjyvjsqPqi5ptwySOwOFbOsY1s0lW4qTZZp8i4+Hfpn+IX
	G4oBOAiM41l4J0YNK/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qg2-00000005rlK-1kxK;
	Tue, 17 Mar 2026 09:25:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qg0-00000005rkv-0Zjf
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 09:25:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so65750025e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2026 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773739522; x=1774344322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcdiRk+bs1+AXSwIsLx2oy292KXyZSJEBZGYB1AO3hs=;
        b=NVihdQcsDoy24ciBnh4Xtgbbilo7mWopAuP+yLZd5FowNQAnYXICfEbw9iS/qlwt/8
         X67bZXq0QmPqaSVlw+xaq/rCG2kgb4S8XnAGytYqt546odPaKzDXoFj3lk5fWDfXNM66
         WOk5ml5QZbGoazmOojjpPZy82XKcKBd36YWBjeNg1MgK5BTr8tReAG8gC/xWgcC9zDHC
         c0fTTtw3MIQwhC9vRRXFO7LdoS1oO6+Hukiy7RI67f6+5cMjn3uufbOMIipiocbfFtla
         ZVdZPOvpZ2rK0SszCqbrH0rdRXwtoIQDThHklO+nx9pc6p8NJzqzO9NFHGSBywqAgoCO
         PTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773739522; x=1774344322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcdiRk+bs1+AXSwIsLx2oy292KXyZSJEBZGYB1AO3hs=;
        b=F0NRjECYRjNcFtxu90ITN5lSWWS+VOomQeavv+9TrRIkm7DlEWnBryC09Y+hoeSohI
         rjaP9fzSOrmzlZld1C6SQAuTOOtjB32+hd1OjBdVg58Lhr22uxsLc9fY0z/JUZsIrlhe
         oTfwSsyKqwMjTE2QkkUgorn/tGprbnZXCwCknRoy/wVOMmwekzWEnk3GrLg5s/NpT9pS
         G1tCp0zN1Ex7dUlgSTSJlF5o75W72ETHHmZHgiYJKz4wT9D7qKRIOCnZ/RLmprHHY5fZ
         XFdgdLMPR93x/Q+C7R69VScUvVj+8nnv2xqecpLo5YBHZALI8FyO5cqR9FmgUcJTZjrU
         THGw==
X-Forwarded-Encrypted: i=1; AJvYcCUfGUorcK1hGgDySGEgWRdpmi1wI983eng5luJTSRToeduYqEOkDdsQ1OnWCscyywOf47wM3UYQzX0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyALj7s8MVccH8+mFj99Hfrh3kOn9H98T7VjFC7W7Ns98zqlzLe
	/zF+41CqKtdxs+el0Y09W8RrhBZxxhlkOuLw9kQyg3WNlHlZQz0u7Xz1aB7yfpe+G8w=
X-Gm-Gg: ATEYQzx5KBw30zfcj0XL6OpiIBBgA6pZqg0T9iwV5O7IUT+poQI1QxtZ2w/FtAHXGeO
	REtyhUGdukz8h+OjPawPLowaU3LsGvg39Wbve3LMDqbo9Kk8MayKcPIe4SGlSDypcLfz1c09G1Q
	KdbshHIdW3LnG5jr5jeZDx2cRZ+w4yNsnnRMRM31YjTnsXewNWf7n8QQWOBmvWPoFDALvNlgxH3
	y635tZbalgtSll1WDpi8OtSAGvbahm9tQOiLNwivMWieFoQPvV+RKXOhmdw3IWh5zWACdkDTCuG
	RZtuVI6ShljrVRTJnB7MDxWUJjApmsTk/UNWMp6DARH5Dv61xrxhxWtaqrlP5cyFtOGat7xwyRn
	ke8SkuYYoXkuAU/u5lY84qRYfQrGrtdjmjMUncblZEpON1NrnlrHTexZK/KSEAkxkYa8MD4tyu9
	oYbWh0mfdeycFoCGIlBO1bAuhzfAFdCQc=
X-Received: by 2002:a05:600c:8486:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48556702d64mr275643915e9.19.1773739521643;
        Tue, 17 Mar 2026 02:25:21 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac2csm22466485e9.1.2026.03.17.02.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 02:25:21 -0700 (PDT)
Message-ID: <78e0c44d-e799-487c-9381-fa0fe18a92ac@linaro.org>
Date: Tue, 17 Mar 2026 11:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Jakub Czapiga <czapiga@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <873429oxwf.fsf@bootlin.com>
 <acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
 <87y0jqerrh.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87y0jqerrh.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_022524_200337_AB5047C2 
X-CRM114-Status: GOOD (  11.82  )
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



On 3/17/26 11:20 AM, Miquel Raynal wrote:
> Hello,
> 
>>>> These will always fail because there
>>>> is now an inconsistency: the address cycles are forced to 4 (then 3)
>>>> bytes, but the bus width during the address cycles rightfully remains 0:
>>>> impossible, the operation is invalid.
>>
>> I like Cheng's details on how it's failing. Would you please add what he
>> detailed there?
>> ```
>> This modified operation is then rejected by spi_mem_check_op() in the
>> core spi-mem.c because it has a non-zero address length but a zero address
>> buswidth, which is an invalid combination.
>> ```
> 
> I've added the precision about the invalid combination of non-zero
> address length and zero bus width. I feel like it's a repetition of my

oh, yes, I missed that.

> previous sentence, but I'm fine with it if it clarifies.

I'm fine either way. Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
