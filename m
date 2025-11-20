Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E83CF8558
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q+4ga1PJ/xpD3/QrVO51uS7idxFAsPBJCE0QDbQ7NQ=; b=rnvkepvIVVdEsR
	kp4p6srFx5gccGVg5OT9qEBf1wL092s/tDtZU5eoyijY/xF6C8b8y8q9PsDREDSLuPi9P+ETszV+H
	uzeqdhNrJ1AWCwX8hOpZIyVKuHKH/n2JkfYkhj77va7mGN8HytWV7LFWmf3lIwQCHmUf1wknKIis+
	hOFialhB0CJWPbDv/hWmysb42U/L9u+ntcE9UO9wRYNS5s1SctXdZLRAZ+Wbl8tr2p41FodYOYlJN
	7bSQMkhwSr31xA+1M13pQ5EvjCrv0WmCjiTk9xYK0RZ6Mwumakiyd+tSoWXoQTnma4T/2wyDJW7/1
	O5RVzYnS7IiHXYh02taQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0MJ-00000006NPk-03mf;
	Thu, 20 Nov 2025 08:49:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0MG-00000006NP8-2Skp
	for linux-mtd@lists.infradead.org;
	Thu, 20 Nov 2025 08:49:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4404885e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2025 00:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763628579; x=1764233379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr4vxP+sQBMMwJGPDae6MZt25g996ad6jUynMcaybIQ=;
        b=U+I1hGCjoNTJcWIjIpf+SY5dydQAdLMfAaeAbsIsUeLx9LaYg6bgyBvwRD0t+Y4ujp
         hDaf8BtmOdzhyZpyxy4Tm8oRwl/cNtqjs1AeKWvdHTDu8+D1MWkX72d2amPeCI1lLROL
         QYtBK2XZVN5rso/4MVOPcwynWzrsAC3olS8lgtlWbCHUKHnoi+875AJJfzld4BFBecee
         hT1wV8Tt12htENb988Ki3KfFgVwSFel94YTLwK+vwT61zFqjrWS/f/phGvCVAEcJZQB3
         vyHFTmG9O6XAqsG0MpMtPKWq8CcLkIXv8mW9LvUcrGmwybgG5kgaXD5EISItjXRPxxZc
         6Mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763628579; x=1764233379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tr4vxP+sQBMMwJGPDae6MZt25g996ad6jUynMcaybIQ=;
        b=viaFkShrmbGSrZjdS9PBW7ANBqLT+5qlfQ4moeORjAwm1kQz20tpmu98XPdlCiofG2
         yzNOvfPJB3T7d9qzRvbPuLK5lLZa2WNMXVHSItrNuWyl84qDEvOSFx/QpiBWZmrZHIDW
         OLt08zW+y7giSAvT1fi0XnBnBvBU8RMy9Snbj7A58wwykE7J97gV0Qmlgehcl+NllN2M
         nzok2zAbqoRPXTDVibMle+Z7uZl9E2ChKdfUyve9cVNqsG+yHFq+70iuzU7ys2a8syU+
         2IzxV2LSLpyHjNO3EdjX47W1yrgl8fPndcv5z/myyB8WDKeJ/JubJhU+YhTz4onvHvwN
         YGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUivgyYRI4oZEg5rKtlutXEs78iWi0Zb+NtLSZXAWuJgHhMmuZppFItveWOlor6tgxCAlQaF50bcFs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBTnmRq/6zC1xOF8s8GDxFcZVjQqSRVT1tiQB+6XznfiA/Bsmj
	UjL9UrX3mBbO0FpHo8ZrW7vJ/WgLXLEKnO5slt0ye6EqPHoLNYcchLN0twjI7S4Tm5Y=
X-Gm-Gg: ASbGncs83bWzlzCqBMoiWkxr+IbZmYQWHMgT2xxjGIWOdiUlbznBXGucHu+cInKqqy7
	gz4shGJKshpg8JGVBQfhj87MKWONiRTv/n50ouxLRQ0wGiiUTL+mOrY+jA6J3ymBPC+LHEC5rue
	ljbxHedoZczF6nHrJOB5HFrQTnUzvmF3BC3YNMkPJ6sOIvwougrzmV+eGKYZ4gukZTvX2u1u1Rl
	4m0I36cD4V3bvLOFgSS3lzF+rEdD49P67I49nDo0VDJO5HMlXtLI025zuDhB2QC6dBWtx/D+o0k
	eIlDlHviMDfHeAxR8sTZXSuBzcIQkn0Lg/A1y0Pp417kfZH3LILFs1lipkcRGX9vlpj3CL7t3PU
	/n2xE4VxAD8CuE1WVuMyRLkVrI0kbWfxo4m6VSs0f6lOa2zAaz2zZE/EfWZgK4unzhXCkiXB+8V
	zSZbu9HSoYChuZdkfk
X-Google-Smtp-Source: AGHT+IG08wEeQkKE04km+1877mSVK+vsQ96TT4GEyEbDJFmXtwyb5oX4SsollpOGVesQpgnEz/YLjA==
X-Received: by 2002:a05:600c:458c:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-477b9ea56eemr17323825e9.4.1763628578701;
        Thu, 20 Nov 2025 00:49:38 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b83200f1sm36785945e9.15.2025.11.20.00.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 00:49:37 -0800 (PST)
Message-ID: <a9161234-de04-4090-afb4-7b619cae3c35@linaro.org>
Date: Thu, 20 Nov 2025 10:49:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/28] spi: spi-mem: Create a repeated address operation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
 <20251031-winbond-v6-17-rc1-oddr-v1-2-be42de23ebf1@bootlin.com>
 <0be97b27-4f8b-4d22-a653-154e87ecbc78@linaro.org>
 <871pluc5id.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <871pluc5id.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_004940_653079_31E2729D 
X-CRM114-Status: GOOD (  20.07  )
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



On 11/19/25 7:10 PM, Miquel Raynal wrote:
> Hi Tudor,
> 

Hi, Miquel!

> First, thank you very much for all this precious feedback! I am happy to
> get feedback not only on the spi-mem side, but also on the NAND changes!

yeah, I had a spare window and reviewed as much as I could. The set won't go
in this cycle anyway, I plan to review the rest as well. But not just now :)

> 
> On 05/11/2025 at 16:43:58 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 10/31/25 6:26 PM, Miquel Raynal wrote:
>>> In octal DTR mode, while the command opcode is *always* repeated,
>>
>> this info is wrong: opcode can be repeated, inverted or a dedicated 16bit,
>> so please fix this to not mislead readers
> 
> I didn't know :) But yeah I had SPI NAND mind which was obviously
> wrong. I'll correct.
> 
>>> addresses may either be long enough to cover at least two bytes (in
>>> which case the existing macro works), or otherwise for single byte
>>> addresses, the byte must also be duplicated and sent twice: on each
>>> front of the clock. Create a macro for this common case.
>>>
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>> ---
>>>  include/linux/spi/spi-mem.h | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
>>> index 81c9c7e793b6ab894675e0198d412d84b8525c2e..e4db0924898ce5b17d2b6d4269495bb968db2871 100644
>>> --- a/include/linux/spi/spi-mem.h
>>> +++ b/include/linux/spi/spi-mem.h
>>> @@ -43,6 +43,14 @@
>>>  		.dtr = true,					\
>>>  	}
>>>  
>>> +#define SPI_MEM_DTR_OP_RPT_ADDR(__val, __buswidth)		\
>>
>> I find the name too generic. This is an macro for 1 byte addresses,
>> right?
> 
> Yes it is. The name mimics the "dtr command repeat" macro name. Maybe
> you want to include the info that it is  carrying a single byte? maybe
> "*RPT_SINGLE_BYTE_ADDR"? but that's a big too long IMO. Any other idea?
Let's keep it as you proposed, I see how they are used in patch 27/28 and
it looks alright.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
