Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1B0CCF9E3
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Nov 2025 02:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp0cx3US06NPmvt81+mtouHhMl3dk/ID/2/2hRogmAA=; b=YVBqoBRirP1lRB
	fya8H/qZHAQu447UOsBkqnurXojraux/iRKzo/q2zu3u0QYhE8S8HNvAP6LgVquFANs/fhhUuO57M
	6xSBecJYaCvKcNY0s9qWroczPpf9ZjPWZ7mpgT/UKReEnUbLTOV5X4P6BXsKpz3C3GLdhaEHMlnjD
	20WZVCG5Jqq+c5SnWU9K2ThBl1t1pM5NOx+zTmDHIXqY59eTIRaoKYCPurrCeZIpTbwQZT24cKZUG
	7lLiONlAPi6jH9Aq/p059syST4QxcBTy2QmpDWC64sXVWu+hy/P3Mn3ldgJ5pDC/kv3fUWYTVohyi
	YmWjlK16eA0cxiwoupKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYMt-000000024N6-3kec;
	Sat, 08 Nov 2025 02:07:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHYMr-000000024Lz-18s9
	for linux-mtd@lists.infradead.org;
	Sat, 08 Nov 2025 02:07:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-ba2450aba80so790972a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Nov 2025 18:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762567671; x=1763172471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejBbUJWKHb/e5O1CFHfEgiz70lDXqNLE4+cjjRbq+18=;
        b=dXJC1jVogBTztf9ThN/Z647dHVzN6lRQC7V1n4dMXbyaAyPefY0iDspz/Hvy+M4Izf
         963uQ8SHTr5sWxw5ti5bejBD23UcRJHEX0rJ4JQ9dnMj7N5a8tWrQPI7kzjS1cwzOrHz
         xGlUh3//0goTgrnMxo8/+G5EAOOfyQGCR5LEgTiaC6Rht26UOsX4u799YOPayteCeTdC
         a3X0bVmy1XmBpGcfpsHA3O3Tdpi1lozialH6hFhnjHHJPfQIhVxwjcvd5/WwVYNB7IAx
         SD07okTXcn1/S7zJ7891D6c04oqjbcbXXyEVq3WffdBlCM0X1e65meSJEoJ7od5D7JmI
         ltSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762567671; x=1763172471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejBbUJWKHb/e5O1CFHfEgiz70lDXqNLE4+cjjRbq+18=;
        b=xHqzgZUT1KubqXiKjVJxT3z0JIOwiE5EyU8qWf7+vRZvGY82sgc7CgV4vyUeIbT/jl
         gKGlbC2zaz/jdjwFfsFRriXMK2L6iv1jd/l1qTHO7GFZ3EDsckloh48ZjCHzs5Xdmv6q
         x4IqA4JHwMuRjI34ySspkRVP+vxqr9vYW/lML5zmMoup6SweoNk+rgOsfiX/FEC0DNQI
         OrFGL2jijAcSY9s07Pzf8iW9SykrH7gT8O73ZdhJgOUsN5EAtIAgZKhQqQGinFYytcc4
         h0utMbeDEX2N+mXtn63XA5shr4SSdIZwSy9TZ+qLFQPAf6eWjereUYutHBzG3ZqV3YBg
         jHpg==
X-Forwarded-Encrypted: i=1; AJvYcCVSZA+AcXYA1bcsVe6vBHMwf5XQFMqB5N8oB5LU82vGyM/ujH31hjSFXjuzVopI9WVhaJBwUHj9eo4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf3xBPBaeo7nbb4ycLZMSqPJ8MQmRckgWve/8cROBT9xkiGxh1
	dB3Q4wDlksaHaUK3RbYhz3+DnrtpxPB+cPlIOFGtHfcobkkuAiTFh+/R
X-Gm-Gg: ASbGncvSrwuDo/A2bWcQvE42OhRUAUFutKm3xMSgmaahuaJnsq5sI5r5VjRYmYaY96t
	B2b3Ke3zqRoVBk07P+LUiBqBzwTpZO1ZaObwUI9yjueAdrspbxFEV14Jpah2AyiNbc2n5wuLJrb
	f41zRD8dz3eE1pYmRcYNSxL+xbqv0hr+YEkBhHJJCOeUh7YJk8TimTRKxTNSteN3iCP6xYBVl/y
	tlIfSFXzgDk4J5ivw2+EaL/cwRn35g3cVvSMhYvMx7FBkUz80UZNN3oNXJz9ullNcJVo6ttUzo0
	icam+FxRMMYGjkd94dQzp6VhCYup3x0cnesKaeYVPjHjFuRFGnsq5PcJp7wF/Z2aq+Qoqg9VcL3
	VLOM/RRILlY8IYchFWrfcojEZx1Pf4MyqYChr1esIbXfDhykWhRXXEBcp4WoiYvaNafjeeZfm6F
	UBhnG9lpIn+HskHzytJHq7VVMZRUJ9NQwkPyGg1xfSVsFnrNAeExlYvui71+9e
X-Google-Smtp-Source: AGHT+IEha2IWEMKociwQltleeD4d+aBEHKy+YULqL0FZO7PKpd6Z1rorWPfIyem0F5mxVcCafcdU8w==
X-Received: by 2002:a17:902:f601:b0:274:3db8:e755 with SMTP id d9443c01a7336-297e56d8dc3mr14123585ad.30.1762567671233;
        Fri, 07 Nov 2025 18:07:51 -0800 (PST)
Received: from [192.168.0.6] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2964f2a9716sm75349765ad.0.2025.11.07.18.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 18:07:50 -0800 (PST)
Message-ID: <e46094b8-911d-4838-8be0-1a085e04685f@gmail.com>
Date: Sat, 8 Nov 2025 11:07:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
 <mafs04ir5bynq.fsf@kernel.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <mafs04ir5bynq.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_180753_327692_B498D046 
X-CRM114-Status: GOOD (  11.99  )
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

Hi Pratyush,

On 11/8/2025 1:22 AM, Pratyush Yadav wrote:
> Hi Takahiro,
> 
> On Wed, Nov 05 2025, Takahiro Kuwano wrote:
> 
>> Suggest new series as the result of discussion in the thread:
>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20240914220859.128540-1-marek.vasut+renesas@mailbox.org/
>>
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Checkpatch complains on all 3 patches:
> 
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Takahiro Kuwano <tkuw584924@gmail.com>' != 'Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>'
> 
> Take a look at why your git-send-email didn't add the extra "From:" in the patch?
> 
Thanks for pointing out. I used 'b4 send' that time.
I will check the settings.

> For this patch series, is it okay if I change the author name to
> Takahiro Kuwano <Takahiro.Kuwano@infineon.com> on all patches?
> 
Yes, please.

Thanks,
Takahiro

> [...]
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
