Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FF9C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9T3vkdwSw9njbyPSO8fiKDwWxAxNvnCJw+SU5zgjA0=; b=L1Vly0oKQJ6pMM
	9+fhsa+A07BHtFI1uLNNLNSG9k2d7oICkbrkXm4cozbxaMgvK18J11uV31xkojdt3IhYfIU64+47N
	uLgE5jJSYwuvYS6RvrZWpfboJPEEV0yDZYFOh7TcVpFQ5Zehz+G+j5O99ZRdVNE2jFRmf8o2jrBrG
	iGM6F3114z5p4Bh52WatOS+16J8o0O3Ysq9tKio5JUOsjsKzIER+fd2D1OPz8RpRRok7L0yVl83UH
	S3+Ezlo+SUm7YwuLsCW2/KGA6MlRzX4O3g1vDM178/46i++Txr8vzH0pqj3Z3EVfcNDFkToTUcVOt
	yY0YFspVbpuNjycv4UAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSRg-00000008of2-2P41;
	Wed, 26 Mar 2025 15:13:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS00-00000008jQ3-2Eob
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 14:44:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so50802685e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2025 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743000295; x=1743605095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=REtKXp4hi6sgBm+AS7b2V8Aev3l8C+kzOBfn08oN45c=;
        b=jUsjJ1VLggmUcFgL8WPnP8zTfJwPyHUbl1hyHLYbd/XVKwYqb1+3/JsG8JKunYeVIM
         DlzLlskrdOG/uvv46mVnqyusWO7a1hfqQT6fKyJLLGRLfgKhJ585bGkK36xtgdlxsPng
         QcYXnkF7n0PtMwFcAKczS+QFx9aKlxJ+C0we6TWpHwgTpYUvZI3BDXyLindy90MvgUi6
         YAzOjH9TGu5xxEDr5IlLeE62Ebg7VnQtCuCQOzRukEVVRlU5XumR9PLn4GSHMXw14JJ3
         D4OatQr3Spt0TQD1qrX7Rrtx8ybzAggFgs8zQ3JE0Lc4tXBI94ci1jL6GBVpSXAuttZX
         8hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000295; x=1743605095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=REtKXp4hi6sgBm+AS7b2V8Aev3l8C+kzOBfn08oN45c=;
        b=MXFwa85vdErkgwqabk57HYV0m1s9rtw6JbvqF2R97elv3i+oveVJRxxjwqvfIcd5Dr
         bifR9PWsLRCOXMPzo4Kpjt8RlAWCOCyub4NraVqpNmxXxxajWjN5AbXGIPzw+tNOg+IJ
         MG8fJtxS40cgb2Rmp1G/8ixrU97Y8sJ1D2ppAOAnRdkRMDGTHxgBQwkWxuXI+2DqCGEZ
         Jd4EMYLnN4lILN8abNkCH3qtitbhfNxK08SKW67WWFwzZna5YXj0s7K5Vyx0ECvndaSb
         vwU0Hgm83HDl/GNjnpHkc5F9QgSN1eJ3Afub+zqPbFU5NY5xYkgf1+BB2zJQ7bPSiWxv
         E9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUBBHbAqXhizKsb7niNbPRdUQC+l0pfFm7vYx/EY2GwFE4tZVRJRk7knxjcQ9ZKo+bpRRjndRV/OIk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMNTwbNJGa96w2TdavfQX/x13btI77+oBc9HBQ5mHqGQV3zy9g
	LP1U410dz+dSh9I7Ls9rvz1l64+DePaTDZvYJy4IntuZoUOXGycCh+jIk2u7rRM=
X-Gm-Gg: ASbGncs1gXl1GrJCsiQZNnh9bKNDtgX9+4ibWNku9yKKFSN1ZckZdxki2/r/E6fADDv
	qGMEX3zj12Yk0lWizFVOvx5OdhYHXYFpw40BrMJl7smQbGKiREY1geE0bIg9ZaMlCWXYxKu/XwR
	myqXTcLWiFpax7w3SNGWQd+2Nt9HX4TY6DLrgaGcvenyPoAgi6DGI3mP5VvF59LKHn2xs92llsA
	ERHPYPqu6bv+8OBvVu7MQPLo/hmTfbBbGd8WKCIU4vX4SRqixC682ONV29iWDK7BGXnQSa+RKIp
	7q8rSpqRO3SFynnrHLc3M/uiGqyo97TE1aBcIn3/htDJZ8ZSSmlPo0cyluQVs30Xgg==
X-Google-Smtp-Source: AGHT+IHDOuf6KYAidi0f/+wH2oPjsGxXXLqRAgkCOSMQfLCi0UZThvqs+OxaqR5hMnEF4EQhlhmaOQ==
X-Received: by 2002:a05:600c:45cf:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-43d508715e4mr191868365e9.0.1743000294919;
        Wed, 26 Mar 2025 07:44:54 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedd03sm4190975e9.3.2025.03.26.07.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 07:44:54 -0700 (PDT)
Message-ID: <be8e5758-8f85-4476-b6c0-4400c8151cbe@linaro.org>
Date: Wed, 26 Mar 2025 14:44:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mtd: spi-nor: use rdid-dummy-ncycles DT property
To: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bacem Daassi <Bacem.Daassi@infineon.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Mark Brown <broonie@kernel.org>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
 <20250319-snor-rdid-dummy-ncycles-v1-2-fbf64e4c226a@infineon.com>
 <20250319233024.GA2625856-robh@kernel.org>
 <a3818477-5a67-43ad-8961-88fa02916968@linaro.org>
 <CAL_JsqKtz5+R1kjEzjo6bVicOX2c=UauC0_STAF0T02rSDqO+w@mail.gmail.com>
 <50de19f7-2021-433e-b8f8-d928ed7d5d57@linaro.org>
 <D8LSAUU0358V.2H1D7QXB9WBOF@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D8LSAUU0358V.2H1D7QXB9WBOF@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074456_593399_9341E054 
X-CRM114-Status: GOOD (  25.89  )
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

Hi, Michael,

Sorry, I somehow missed your replies.

On 3/21/25 8:00 AM, Michael Walle wrote:

cut

>>>> The
>>>> problem that I see with that is that we no longer bind against the
>>>> generic jedec,spi-nor compatible, so people need to update their DT in
>>>> case they use/plug-in a different flash on their board.
>>>
>>> This chip is clearly *not* compatible with a generic chip.
>>
>> I think it is compatible. The chip defines the SFDP (serial flash
>> discoverable parameters) tables. At probe time we parse those tables and
>> initialize the flash based on them.
> 
> I disagree. It's not compatible with "jedec,spi-nor", which is
> defined as
> 

cut

> 
> See my first reply, on how to possibly fix this mess (new
> compatible if accepted, just use RDSFDP sequence which is backed by
> the standard and do some fingerprinting).
>

this won't work unless there's a unique parameter or ID in the sfdp or
vendors tables, which I doubt. Takahiro to confirm.

> FWIW, a new (or rather different) compatible is needed because we
> cannot distinguish between random data returned during the dummy
> cycles and a proper manufacturer id. So there is no way we could fix
> this in the core itself.

Yes, I agree, new compatible it is then.

cut

>> I think the property vs compatible decision resumes at whether we
>> consider that the dummy cycles requirement for Read ID is/will be
>> generic or not.
> 
> It is not generic. Because it will break autodetection. And that is
> the whole purpose of this. Adding that property means, we can just
> autodetect flashes within this 'group'. And personally, I think this
> is a bad precedent.
> 

yes, I agree.

>> I noticed that with higher frequencies or protocol modes (e.g, octal
>> DTR), flashes tend to require more dummy cycles. I think with time,
>> we'll have more flashes with such requirement. Takahiro can jump in and
>> tell if it's already the case with IFX.
> 
> But hopefully not with RDID. Again this doesn't play nice with other
> flashes (or all flashes for now). Instead of adding random delay
> cycles one should rather define a max clock speed for this opcode.

This could work, yes. But not for this flash. Or maybe encourage vendors
to either contribute and enlarge the SFDP database or define their own
vendor tables for all the flash properties that are not covered yet.
It's strange how Block Protection is not yet covered by SFDP after all
these years.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
