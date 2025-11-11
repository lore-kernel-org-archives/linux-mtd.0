Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF127CCF9E3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 06:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emMGAqz7nRWJzFrGxLAhQezgvCIewEkZeet090vB9HY=; b=BPqUuxQcmT/wvW
	PiwumkUk23uq6wzYEz8sBOkcmc7nLXI5QTF3vn+TefeDT/LErShvbLLuXuz1pd7aWD6f2WqAZIWDC
	dV1VygdgTVu/nB8aNiEYqQgzWqKxfng2JNlf+qsDpQWzE/VZysh5hl02caRDaO7quG8vUUCEbeLE3
	nS/YyV/pQr5po+rHuFXSZg8FEKV7wykXRtF1o7YJq4hfHB+nh9W6pu83aN/J2MAJeNdDZlyWo8sAi
	SomyHKtkNRpWwwSFIKjw5+oR8Na8FNQfB92qz4mJ2JbN0hOmS/dFCmNPZLUHwrtX7/9XUBwoYihFy
	F6P/RSB0CgB8rPn0joQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhXr-00000006avh-3nKz;
	Tue, 11 Nov 2025 06:07:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIhXo-00000006avM-49Lt
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 06:07:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-429c7869704so2854955f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2025 22:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762841275; x=1763446075; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FE22nBMsNusJRq+HRsVjaUDZroO9N+NkbAMorS2bqUY=;
        b=xfllLWhPetQbybaT4snTJ216bJPEJT7CBod+Z8mtLJGCwfYhjoiRaPedwqKAjY/pKA
         WpDfcRd3ha+tFuCN1EBSF4SNebaG/E7bwJdv3LdTayDM6t2rjYAJSJSnCpylREtH/u0l
         3IyrltceMyKdAke2kFJHi6sPk0Xjhvh/nu7Ie8pUoRzN8ZgSBH/jmORm8QSlO4LBz8of
         tWJAdVkDP229jsHPJmQRPcsmjng7ze9RRuNjjzOA3ug27t1v2rS4dTJHHEMazGbzpVzE
         LlzGlX203cTcXAviIfQS/RQX41iN/UUNERnYnM9KkDyOGVzb3+47OIBOnCRiPmoqJyO1
         FLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762841275; x=1763446075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE22nBMsNusJRq+HRsVjaUDZroO9N+NkbAMorS2bqUY=;
        b=PM2MloiBbzh4KGtC+rYrKyBxapiCRKRNfE5rdYxEbAEZi3YUfbz4Uw/5c/IHsWGgw2
         sGUMigWhg+ew1x3SH6zSrcNqzLZFCywKcv6ywTWog+446jIHAssXpkIXn0SkHkU3ruH3
         t8CHBqSx39vBuQwbBgsH7yZAaYo+OpHLHxyGw5LlaC1oyLejjGOkYAGxOyMSESPwOpkg
         J3KaFEjSvyFtQ9O88nsmYHzw5epnxOb2hejJ1vOYEBlsJJsJHIRPRglWcSX2hYH2JUYd
         MO9lcWbf3kfwlun+oLGsTXyAVDGHZ/u0ac7lU12R4ECPlCTS7hx/lIxwOathcMjieqRh
         E5wg==
X-Forwarded-Encrypted: i=1; AJvYcCWQqwN7YEknI+EuFH45+VfysodJWNINKS7jLl0FlXqzxQ2MEcKuahCzAGoNj4D0NUFIR2vkYc4Reu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbEs6vtXAQDy3ZyLliyD4xDQaeZakvDrg9NBQbVv2gQJLBCte/
	5kV5yn37Yz5AqcoG2FfCJ6X1zy1s5iwip0CZLfYH38aVvRztSGlGLXGVOgfLxJTIXcc=
X-Gm-Gg: ASbGncuNwosHg+SpjJNNlKSK12u05P6f+bjzA9YJWrayIdWTc9cV+RD8M0xVcswhsfU
	dhfb1Vmj+3xhXfzurM/dBI687+YTugm8qHBOSscU5O1i5DMSpQ5oaVRGKi0Wb4jYHzi6i8nWAz1
	ahkHg7s+p4cFMTEhAgPH9jUfLnRwn77kIR2o5U8W5EUoAITeNJB393g6uUzNYH7oOiWqLfD2F+G
	M0hTeBaN3wc+tcqp4GiYGZLgh9i5JGWJOq30pAFSNaCAw7X79G+5vp//DomNzb3IHb42VMIEWXZ
	Ae7co9c+wVoqgSvVSygCMGPj6TtYbPOGkWCCdkcoFgsycKJyUCgVhdbO96Klmr2djDv37uRLdTx
	L6z55Onys4ZT8erMIOD/PBWCy70AW5WxbJCfT1GiEgAKgwzjBXsnWqtYla55Yc2y/vB3q1Ubi68
	drF7zCNqpUvf6FL2x3
X-Google-Smtp-Source: AGHT+IH/vx3IJ4gFgO3GQrB0wpRgXuIgnYj3bOs7Nv51ZH88KwqwBT+Kt/AB7na4V0rHovb2MNU/pQ==
X-Received: by 2002:a05:6000:2f81:b0:42b:43cc:9830 with SMTP id ffacd0b85a97d-42b43cc9b95mr1352999f8f.41.1762841274900;
        Mon, 10 Nov 2025 22:07:54 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675ca86sm26204201f8f.31.2025.11.10.22.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 22:07:54 -0800 (PST)
Message-ID: <f13ae1c5-17f8-4722-b5fb-07b261d5e637@linaro.org>
Date: Tue, 11 Nov 2025 08:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Sean Anderson <sean.anderson@linux.dev>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
 <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev>
 <31d01667-e80e-423c-bdab-8d05831d575d@linaro.org>
 <76896942-0f84-47d0-90ca-7bfc5d39318c@linux.dev>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <76896942-0f84-47d0-90ca-7bfc5d39318c@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_220757_068400_3841FC17 
X-CRM114-Status: GOOD (  11.36  )
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



On 11/10/25 6:36 PM, Sean Anderson wrote:
> On 11/10/25 02:08, Tudor Ambarus wrote:
>>
>> The locking tests look fine to me:
>>
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
>> Sean, if you care you can extend the documentation on how to test locking.
> 
> I'll take a look.
> 
>> Also, you may drop the non SFDP data from the flash's static definition as
>> a follow up patch.
> 
> I don't understand what you mean by "non SFDP data".
> 

Remove static definitions from the flash entry that can be discovered by SFDP.

For example in your case:

 		.id = SNOR_ID(0x20, 0xbb, 0x21),
 		.name = "n25q00a",
 		.size = SZ_128M,
		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
			 SPI_NOR_BP3_SR_BIT6,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_QUAD_READ,
 		.mfr_flags = USE_FSR,
 		.fixups = &n25q00_fixups,

you can drop size and no_sfdp_flags as this info is discovered when parsing SFDP.

Also, you can drop the name, and add is as a comment.
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
