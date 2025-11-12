Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1800DCCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q52wu4nlwwgrGrdZC1BK5OjXuu/FcYipIjV+H54qBsk=; b=j2mhbgbtMDv4ae
	hqbw4fJho9DBmp23dFT5bDUqjg86he7EckCZKHicf5OkIKY+ftxCQaDN0p8Yy8pu/6k3xcIKc2Iwf
	Jgys1Wuy4lTzRjElZ5KWkSpawGxe5YQDaAJ7s+S8Wjv2U5//pXDbBu322+k2vecPYW4WrCGb98AWU
	s0sr2UdEy5SUbpzSIx8VYRF0nzjH6Wjt2jpY6mAxW3F+jqKAu+rXGqcMI38bc5bVyZdlZmrD3SzJX
	qgI3IZr1swoen4V5zW6fZKLS60hWqj0wimmCAt0UegOMtsorGVqcwT+U2AdF0e4db3u7RMdP8BtD9
	DptuFP/NLosZMed+o40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7IO-00000008Tuz-2LGl;
	Wed, 12 Nov 2025 09:37:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7IM-00000008TuP-1Yse
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:37:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42b31507ed8so470778f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762940260; x=1763545060; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kkR3PECBtgg2Ta+T3zNVyfwyQ39/v40ObIhIUJF1Ho=;
        b=DKsq210njwMnuSEfwJYIdA4zVyzPKAtPA857ExuhRgHP6seyhyEfikh5BqNt7ftnj0
         ShSlxHVZI+pgTRYpdgG0RY/EOxl6fUbtlijK25Quc5e7VjTXvf1mXghPPMffUBSw+jMP
         cc0GXuOHFy9Bi42DNi+1g8Q+CprAtKIfhmG18cuHAMsV534nRu4KJ4KT7ueeNtBmkM8/
         UhTciMGEqyKFY2lbtWrdWAWtFCbYaHrVfUVL6SSaX13Z3bLOVSbaOJ/ZhnzgX3dO/yax
         E169hcfW144mCBa6yL8Uvv1Ds7/U+d7fqrQYie8XtYeG10QjJC5lrc/TP1/eEwhJn7bx
         nflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940260; x=1763545060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kkR3PECBtgg2Ta+T3zNVyfwyQ39/v40ObIhIUJF1Ho=;
        b=f8+QJq5RVvPBnUwHG2/VRq/YxsXGpnw2rWbvKjt4EyGbrmBvnVQW+yKtXItSywvDj1
         R4X9Umkx+o7eI5K+hevpV/6QG1krBrYO1K72QWp6DWxGTr60ra6NazRRJXpr03YdlcDh
         kqqAPQq/364PShT7D4WAZpux8VClk613mjpVo6KlB9QtOkLqUA1POOqurPvRouCLk2Fh
         JulIkEwnH3kOVFARg4SkQN8EJGy15zMdgP/mFiHCG68sw7VZOf2jlxg77Lo+9S3Uxxu8
         W20ngtoOvIHecJ/sCRJO6iudl2VYsqE8R89RiKeBwl51KuryTC5o8payBZ85Gh6yY0QB
         5mpg==
X-Forwarded-Encrypted: i=1; AJvYcCVfImmCTsEeuDu005eQn+0lb99dmUEz1stYmy1Tr1w1tjZU540C+zAw/U0Ud1VAtecRLjAa47WYv/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzHeC1yPfIQ/g0sn5KcNEnPahEy0XAYOSx8JlGv1q6vGEX2YPzh
	OCPDXaeVjp4MQvnbkqty9lrcs9sUcq1iG+Mqr0GHmz/m99XQkvQwwwqyF0ARTKMTRiA=
X-Gm-Gg: ASbGnctSRMz7ItYguabHkrlNrwa5DuRurQTBPE0id0UZm0MvyzK3OzS0F+As3vD0JDf
	cQJA/sb7S9zRvIfw16lcGTXnhOKSCY2S66cxB68NhuAinHgp4Z+yenThKx+4DKIdm1CsVVkNTCl
	YC00EdErbGY4C8UY502NDb0e/+5/TS9tM02+XFDiAl9LNokgbBtdoypcQmUMBrEPB18S1QXZeWu
	OfUbbFI5NwHeTDs026CoGfFDhoUth7mQ1ondTH6+k0mjGx66Afysd7sHSQaplhCR4gevij5m8eW
	5xrnzT9X7q8htQwIl9WPSGEFVIFJNtRhgrFTCrrKdBPUWBuuAzK+/O1cA4iXDoPP7pVrJFGO3Nz
	suNnDC1PllhNhVjo7SMweOBN6WgFB6/tpbDZzqYq394nhLfYu1d+gQwKMUt1J2upvffk2ibqi4C
	PF99IOrA==
X-Google-Smtp-Source: AGHT+IGZSi7yScfYmi/h+1qIucc+YYMtcUxa9jmazfcfm23PzWB2Va5yBYWI09vRuMxpAqpjCguVyw==
X-Received: by 2002:a05:6000:1847:b0:42b:3dfb:645f with SMTP id ffacd0b85a97d-42b4bdb7d81mr1738754f8f.47.1762940260515;
        Wed, 12 Nov 2025 01:37:40 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63ba87sm33821589f8f.14.2025.11.12.01.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:37:40 -0800 (PST)
Message-ID: <8a370764-e093-4987-9a5f-3a8c1d6d900c@linaro.org>
Date: Wed, 12 Nov 2025 11:37:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Hello,
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sean Anderson <sean.anderson@linux.dev>
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
 <c67466c0-c133-4fac-82d5-b412693f9d30@linaro.org>
 <87seej7fv6.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <87seej7fv6.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013742_438455_09E6CA3A 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8xMi8yNSAxMTozNSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiAxMC8xMS8y
MDI1IGF0IDA4OjU0OjI0ICswMiwgVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8u
b3JnPiB3cm90ZToKPiAKPj4gSGksIE1pcXVlbCwKPj4KPj4gT24gMTEvNS8yNSA3OjI2IFBNLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4gSGVyZSBpcyBhIHNlcmllcyBhZGRpbmcgc3VwcG9ydCBm
b3IgNiBXaW5ib25kIFNQSSBOT1IgY2hpcHMuIERlc2NyaWJpbmcKPj4+IHRoZXNlIGNoaXBzIGlz
IG5lZWRlZCBvdGhlcndpc2UgdGhlIGJsb2NrIHByb3RlY3Rpb24gZmVhdHVyZSBpcyBub3QKPj4+
IGF2YWlsYWJsZS4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUgb3RoZXJ3aXNlLgo+Pgo+PiBJ
J20gZ2xhZCB0byBzZWUgdGhpcywgeW91J3JlIGFuIGxvY2tpbmcgZXhwZXJ0IG5vdyA6KS4gRG8g
eW91IGNhcmUgdG8KPj4gZXh0ZW5kIHRoZSBTUEkgTk9SIHRlc3RpbmcgcmVxdWlyZW1lbnRzIFsx
XSB3aXRoIHN0ZXBzIG9uIGhvdyB0byB0ZXN0IHRoZQo+PiBsb2NraW5nPyBUaGVyZSdzIHNvbWUg
dGVzdGluZyBwcm9wb3NlZCBhdCBbMl0sIHdvdWxkIHlvdSBwbGVhc2UgY2hlY2sgYW5kCj4+IHJl
dmlldyBpdD8KPiAKPiBHb29kIGlkZWEuIExldCBtZSBoYXZlIGEgbG9vdCBhdCB3aGF0IFNlYW4g
cHJvcG9zZWQuCgpJIHByb3Bvc2VkIHRvIGhpbSBhcyB3ZWxsIHRvIHVwZGF0ZSB0aGUgdGVzdGlu
ZyByZXF1aXJlbWVudHMgaWYgaGUgY2FyZXMsCmhlIHNhaWQgaGUnbGwgdGFrZSBhIGxvb2suIFN5
bmMgd2l0aCBoaW0gcGxlYXNlLgoKQ2hlZXJzLAp0YQoKPiAKPj4gWzFdIGh0dHBzOi8vZG9jcy5r
ZXJuZWwub3JnL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IuaHRtbCNtaW5pbXVtLXRlc3RpbmctcmVx
dWlyZW1lbnRzCj4+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvOTJlOTlh
OTYtNTU4Mi00OGE1LWE0ZjktZTliMzNmY2ZmMTcxQGxpbnV4LmRldi8KPiAKPiBUaGFua3MsCj4g
TWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
