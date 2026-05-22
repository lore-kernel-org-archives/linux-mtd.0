Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96958CD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KhyTv1pVnt4vGVTmx1fgXKYiI8HT91m1lEUcEpbCdA=; b=wrU4TB/Dh8tCNg
	bLjgVqGcpLewAjxn4MLtpS5DJjRJWh+GEx7Us2DNJiLazNbJuOJ8IOMtypb8DU56BQAIHVi5y1z7B
	YfIXNulXtxAONZjpG7w5UzVq5nkeY2iGK1yGd7Q/a46Z3QPAH6JSKGFyue1AfrS30jXxkqNixQhhw
	FEfE0wlWWOOb3/YARDtjRPgu1ubSG7tr8TCqa0CUEGw8wsgBCE/Cwffo8MnPbgE9DGYfvfnoXQ9lg
	8+79OaFljI1nmi3N32kDIiEBOPXmQpvl9AxKchb6Ug22JpYhXMU8FMHDXLmevAaCvGG5WpQ9stC3i
	T1qBp1LboQq/NwDMaXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSPo-0000000BNIW-3RlY;
	Fri, 22 May 2026 16:08:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSPn-0000000BNHh-0YgS
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 16:08:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso78980565e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 May 2026 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779466077; x=1780070877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKfMNH2kUd3DMgQ8XsJCvcvLB0TOMk+MaTvVWRLAx/Q=;
        b=NF8NqPAYGHolA+mpXE+/zJbhzXk6i2v7YFAT3/RZMwFNoODHbmxFTHwsuRFvuqJPJJ
         +XJR4Q7cuWHGkkNuRi612B+KIXkVk/fmwU529cXUDuENVnIyHHTTi6EGgZgT9CBWOeH3
         VPyyekYs0wfuakcDanNyWb+D59qA5kCwtbNU22tpSNMiOKezIqKmyhkw6TRNW2QHDeID
         qazGOR3nu9Mb2maXAGFrdaaRW/SYPwdPj6xfcifU9B5JBI5RoWKUxEdjYJKicTWBZ1w8
         eEklpa1O83fyOqovd2zvJcXkDua+BuGiDV6F0xOyp7Rhfa0nY9MbTGpH26p5wAIXCP23
         17VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466077; x=1780070877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKfMNH2kUd3DMgQ8XsJCvcvLB0TOMk+MaTvVWRLAx/Q=;
        b=Q1bgtqku739AybMTHERG5Pbw64M42pP5vO4m2QHT0+FHCbHrprShrUDGm8v9fQBz3a
         v6LO6UvtQiSMOn7Ega1vJ4mXJEofPP25q2e2RV5tza61ifRuFGjjw0mV+AwNG6NA/KRg
         DNLdHFpX+dhDBYsjyvYiacybf4XMosfTXjMfo9X6Oa0UiAub64UbemU0Np0S058Ug27H
         tkCOx5tyw0j6FcJ0lS8qW+RrkulYZS6jIhSMiZKBI/Gf9M60GXU7vu3+4DnwMD1l5llZ
         QAU/QvwjPtpDw+sctyR2HaQ1D559rmylf8BcHYFx+wUDDFm0vuMMjyUiYCHBMLgJ3C4k
         Uwzw==
X-Forwarded-Encrypted: i=1; AFNElJ/EtUPGIH895xzbSGtR4C7kLUqU1LLyMor5j/UBd8aqYkJUGZNElE5jkLfYVW2IW5L+UJi+OGTZ144=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNDCJkWmcbruuXced8TKbZEleas3GJweuoUqBju2Kw1cj3omPY
	slQm+prHz1s1mQ3G2n2PMN+b66J45McVfKE6uYsDZT7TxCOmFBxh0tpxQ9tW6iNzFRM=
X-Gm-Gg: Acq92OFeduUF2H/vjzOL+hnxalgQzH+8W6zlsD2fTdJfFthi6+R+mzAcYqJ8QDanxir
	P3SSjUG1RRkDmY6i37IXWArJKV8ZjAQ2vot8+6NsDZab4HBr2vQi7QnxopfKhbKgWpWpjnyLKs2
	m+JmUOl2+wgohtTQg/JMwCYRvHRQfi327T5tEosWX/4v6XwmBio/2wqIDj8VMsMlIX+p35B9nMz
	bVxCZu4eShPNHt/xo2aEMmjFqxym60iplHa9ohWZm4QLwr5Yhtk8G60XzGSoMQKHYRf8FM6am+V
	5Maes7qE9JDKJhvWQwzSm1HIdOcxsmOSy3isGNRXdm504r/6ypjOb0Je4CFAzzF8M4W7q1iYaeS
	WVyesAR5l2ZdzFw+E1Jn45if5SvE/JbJFp11tFUxic5Now6bpK4c3CGQBaBboixt4nCtGsduDds
	I+I6+6LFSFbZmkmALP3+CRVT/sP92IFkR0E+e8GZ3N7w==
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr62133915e9.27.1779466076932;
        Fri, 22 May 2026 09:07:56 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm52915925e9.3.2026.05.22.09.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 09:07:56 -0700 (PDT)
Message-ID: <779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
Date: Fri, 22 May 2026 19:07:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Sean Anderson <sean.anderson@linux.dev>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
 <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
 <9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
 <875x4fphgr.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <875x4fphgr.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_090759_193910_B2616AA4 
X-CRM114-Status: GOOD (  15.08  )
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



On 5/22/26 6:55 PM, Miquel Raynal wrote:
> On 22/05/2026 at 12:10:45 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>>> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
>>> Cc: stable@kernel.org
>> Fixes shall be the first patches in the set.
> 
> Technically speaking all four first patches are fixes, except I don't
> ask the first one to be backported. The reason why we ask fixes to be
> first in the series is because we want them to be as independent as
> possible from previous cleanups/changes. Here each four first patch are
> targeting completely different places and should not interact with each
> other. Anyway, I will re-shuffle the patches.

you don't need to resend just for that I think. Pratyush or Michael can
re-shuffle when applying.

> 
> As for Sashiko's feedback, the AI raises the same point as our previous
> discussion: the QE bit handling is really bad, and I am working on

I forgot what we talked about, sorry.

> improving this, in another series which waits for this one to land.
> 
> However the other warning it raises is IMO wrong: mixed-modes chips
> (either read or write working in quad mode, and the other in single

that's good to know, thanks. It assures people that the AI feedback was
considered.

> mode) should enable their QE bit anyway. Please raise a warning if you
> think this assumption is wrong.

Not sure if I'll be able to allocate time to review it. No blockers from
my side.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
