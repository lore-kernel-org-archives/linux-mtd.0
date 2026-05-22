Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7642CD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB8yo/o1OS7UrVcIUXMbz5SIwt6eRaq+1quJb5eTEbE=; b=uk90XIsKWTBaZX
	0aYhpQxa+t8lMSXRTt5EIeR9gyBCA1yzpalN8ixTTtDAFBHWGCCJuSyULPHtaE6UeMpteiPOE7J5u
	YWXwEesMQb39yviDyDjwTBQWJul3meQtpHaErlaVhR31DgvwQd84Udwz6+AVKiDbLzSlrdGrUnG7r
	OsVpd3xwhhklWW2rg+xkFcMG9D+5dzu2zkBoqFF9uROZtm2vENoFGwicMTPLNSWmPJd7d4ufyMrI1
	7R1UPZdDLG+Ow+B2fBp+oHOiVt4SLfh0/KiBYeE0tFRix2Ht9iwZUCaIwewQ2fT2Rp+wDTHafIt/7
	tM2inw0k3whOQcewnKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSat-0000000BPTi-2oap;
	Fri, 22 May 2026 16:19:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSaq-0000000BPTA-3qL0
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 16:19:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso54747845e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779466763; x=1780071563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khURmgI8xAljbpClwOX73v/ypCL2TwOkHn4DqsHmwrI=;
        b=sXnuZAUVwnvoeA7NkEqU1lw7tmgf7mPPhDcbiee+M+Z3I8ijnghODSJxWj6Qmc4kve
         4uxeT81oDq3boGQrbp08AyRo7FIOH0jWUK23R4f68WYbH1NcWgE8i/HLPFuQpv3Br0LT
         p30mcjqQtOe6nhxC0+xPnplvackQl3zq3GySKkuQ+6MS0/ReFH9dYFQ3HZoPnJKwzk6X
         FZNxf1AiLmZgUY2PoJy7ePu0QDpq5NJFSAU2w8hZbuE+u5qmwDKuIb79lzBrroOax49i
         NXVk22biiW8JBWNPFjPw8DYu+6b00zeJavzLgxvTjZxSVOOlRipoJGdq/Votol4Ehk4k
         mZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466763; x=1780071563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khURmgI8xAljbpClwOX73v/ypCL2TwOkHn4DqsHmwrI=;
        b=LMMtkx7CxtnA3W5QJy0Q/VTjYvlnLCsomxG+EN+AI1JawORNQk4V32Vhlpa7R/7AN6
         RjwhVSv8ydM59QiJ0v2ik3KEhp2reG7b9kloQzch0KVuuKmbTnFofl+cYAMPd/GJDJUu
         61T+PsyqnQSmhK2ydXmpsJoLowOiHMjDT5Pan9IjK4h33k1E6ER+IAnEP9Iy74RCqEav
         ZMdB07rDxPfnZKXMGtKCj6Cg1iySn2jAY/2zJ3NDkR230szJ36xfzuprS0piNz1CdRP6
         V6qcdvUicEP5Ll0TGM28s9rzjxLIEB9hbIBFwAx7zHQmQhdVHO7/8d3OsZ32k50k2q/l
         bTjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bkVvx/80DNROfYevzZL4765NPgRQL7fsu3H8AajTv2xBsnsYuarmdNSITisRtjSHIz3dISqDHsKw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0x0HIo2euDAYJSRlL2QFkf1Rl8f5Tfv/gcfHGWjAMqxJTgGRe
	RgfEoFdnbFyKj9Ycy3GxEVQff+HvZX25qnXyEZ1QrIjivhAoQXZi9+b2IqKoZaKPbUQ=
X-Gm-Gg: Acq92OHbAG4PIKgbrD7WyX36k7y2RUn/gSiOZSgBZAe34kjz70EmegAwIDUKhHAzjSO
	YyVqQsbPoRy9xJkQgnaJ0RydogTf1C++k/tBzQQIWYOMEEqzOVWq54aj1pPSM16h0I2NSdlVMoY
	FGFreMRDnq5ByPxPkNOdGqBo57qhdv9Ec8II8k2tprQHXdACyX/KNWVxrPc3OUYW5UMr4sJRR2u
	Hwkyyuso/f9QTNh+FY6TdmQF2aR4iqGIwqTi2OY7a8RrxSVP6egZ1xfIE63AaG/UgxfZboqwIx4
	niaK92c8bysyZdfaxAG4GUEybTqmPt1lbYXPPT5uNjuy7rej9mdLyUuaR5Fl5+oWrQWAX6QaJ0Q
	bVM9i7w85+IeFu8tf12uR/IAKzCzJkDBzJe+ioGJTdvc5xgR8EWone1yIa/afUh1wIuIgZ2v19h
	hJ2EOhi9S1SZm2ldKIdvhlWE2cQUMSj2kcLP9goz2WvA==
X-Received: by 2002:a05:600c:8484:b0:490:3b87:be0e with SMTP id 5b1f17b1804b1-490428e3362mr60457495e9.29.1779466762913;
        Fri, 22 May 2026 09:19:22 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f598sm5363185f8f.6.2026.05.22.09.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:19:22 -0700 (PDT)
Message-ID: <456a7b82-0d53-4c83-b17d-5361bd1f4a47@linaro.org>
Date: Fri, 22 May 2026 19:19:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
 <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
 <87zf1ro2dt.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87zf1ro2dt.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091924_984383_2FE132AA 
X-CRM114-Status: GOOD (  14.05  )
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



On 5/22/26 7:06 PM, Miquel Raynal wrote:
> 
> On 22/05/2026 at 12:39:48 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>>> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
>>> intermediate variable.
>>
>> Please squash this in the patch that needs it.
> 
> The problem with CMP addition is that it touches all functions all over
> the place. I want people to be able to focus on the CMP addition, not
> all the side changes which have nothing to do with the CMP addition by
> itself. Most of the preparation patches are just steps in that
> direction, they could also be squashed, but overall they make the final
> diff much simpler. I believe every small change making that last step a
> little bit easier to read goes into the right direction?

I was looking where was this particular bool used and couldn't find it.
Fine by me to keep as dedicated patch if you think a 3 line change
distracts the reader of the bigger scope.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
