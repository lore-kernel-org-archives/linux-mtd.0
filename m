Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D26C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bfeyzi/T9q9g/VeXdfJdFEe32MQQCxT0cB9sCM5t5LE=; b=X2VDQna4b8mQ/Q
	6XXwftOm5B3R5QcW4X+5iqcLu8F00Q3gjNd3bNPkd7B+4WTh3PcJS00kbh0CZgqkvvDQxf437wHlC
	kh/Q0iHr0FnPoJkDI3iG0Bfx5qScbENaoeR33J+bwfCyt9eERtqGBVwmjqItQbThM4tgUukysFLmS
	AuQnKztVjjEzfapOa04RwT0y1Oo2ec7QL8ru0kFQUjpHVBEmZgKMvKsfzL5gvj2jDGgrHimlNGjao
	13jVBJfyVdSyQIKfir6pshd7eDMB/FDlz9QuKTDNb07lqH1nbU4JttF094HLxneA8OSC7zW7PPVTd
	kOR8+PyQ4zfaXQ3SBpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY7M-001w9j-2g;
	Wed, 24 Jan 2024 07:56:16 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSY7K-001w8a-0c
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 07:56:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so3633807a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 23:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706082967; x=1706687767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQ7YKmOFf9cBE931SPx5ntSlDGFYTs1MG6zZTsHUZ+U=;
        b=HbyfPI2nndZ7JjsM53bmF4suQvyxhOULrXcSDS6JYghTaJn+XMrLe+jnwkddRNK9nW
         M/q/lo1SVCuHSNfareKw2ZouBmZs563cQCWyc9W8N36G2sUqId6G6OeljHqUfiSIZz/N
         0cY5GaOBSw5XWIYI0h59ammeGQzWAb/gXFvuwX0xL6kxvJxy3gm5EQwL8IkMDBUkt6f+
         C4s6+XtvoKdWbbD5fVLyI6ZKUblK1bOW4P0I9BnOFklgncpi73XnPooqIn3AWwIcbZ6+
         sSmK14jb/Pp0QeH9+as+1g6cc4tr98Qjjlh8S7ugJegJ8fMe4jClT0M6xX0P0CFh+IrZ
         Y5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706082967; x=1706687767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQ7YKmOFf9cBE931SPx5ntSlDGFYTs1MG6zZTsHUZ+U=;
        b=EnG8QYIxPijUktIctA+yL5iAAJvkZIVjOXnkQW9DNem+J78kl9IRHQS3Qun9ZE5NyT
         bSNrjSHEs5g6wU5RucZy+gT8q0ODEMoBzdNJ1iZINPVe75/WDypJpDUEyNGO+9jiUjEx
         3Z7YhSAIik+dIBWLtVcr2sP7refawFBbh/ghd2jk5NHsiorcF7EmcrPUnsx90ppvxJ44
         ezssIAxnpaZS5AwRQ6+3Hcby67pE2K/aeY8DEKEMWQCkMErh8UgNcFnQFPLT+Rn4rEkM
         V+r57322teWG5HYSO6B4QxKRa4vMQWzUZzX+xxgHTsMzNDaEq76db3QKpbWbf0EXgOLk
         n5Og==
X-Gm-Message-State: AOJu0YxQ9iVBHTFJw0WzvQd6v8wQMa5P0M8ZV9Orso79J8jufTHKuRhh
	8p1uhxYX+MdocDmgB5IcDbh+Io0+srMzkRLicR29+qpvyck09qxj
X-Google-Smtp-Source: AGHT+IHtlDGiB9+ZO27jVG0EVo3N85GCcxFQiSjnKIhabTeAKZAY0tkuUNF2RO+MOlpg1WaVfLmIUA==
X-Received: by 2002:a05:6a20:401e:b0:199:fdc0:a180 with SMTP id z30-20020a056a20401e00b00199fdc0a180mr434159pze.63.1706082966859;
        Tue, 23 Jan 2024 23:56:06 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id y137-20020a62ce8f000000b006dd7ae4cd1fsm2841668pfg.49.2024.01.23.23.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 23:56:06 -0800 (PST)
Message-ID: <45eb41f0-8348-4189-bb2c-148798ec50af@gmail.com>
Date: Wed, 24 Jan 2024 16:56:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: hyperbus: Introduce SFDP probe
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1680663252.git.Takahiro.Kuwano@infineon.com>
 <480824dd0f9b1d549ffe08e7a6e2a93a88f6e13d.1680663252.git.Takahiro.Kuwano@infineon.com>
 <9cb99638-b43a-4f4d-b112-77f8d35f74f4@linaro.org>
 <11755c36-ace3-4836-9be9-343e0c73fe63@gmail.com>
 <e4b96eee-1782-49b4-bd67-e318ded4bd04@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <e4b96eee-1782-49b4-bd67-e318ded4bd04@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_235614_230951_72A49A2C 
X-CRM114-Status: GOOD (  11.18  )
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

On 1/24/2024 4:41 PM, Tudor Ambarus wrote:
> 
> 
> On 1/24/24 07:26, Takahiro Kuwano wrote:
>>>> +	 * This is the first time we're called. Set up the CFI stuff accordingly
>>>> +	 * and return
>>>> +	 */
>>>> +	if (!cfi->numchips)
>>>> +		return hyperbus_sfdp_chip_setup(map, cfi);
>>> Ah, I need to study more. Would you please speed me up a little and tell
>>> me more about the multi chip handling? Why is the probe called multiple
>>> times?
>>>
>> For example, we can map 2x 1Gb(128MB) chips in single 256MB memory space.
>> In this case, the probe is called twice. The first call is to set up CFI
>> structure. The second call is to check if another chip really exists or not.
> 
> Do we have any hyperflash multi-chip devices upstreamed? If not, let's
> remove the multi-chip logic and handle it when multi-chip is introduced.
I meant multiple packages of device (different chip-select, in other words)
are mapped to contiguous memory space. Not multi-chip in single package.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
