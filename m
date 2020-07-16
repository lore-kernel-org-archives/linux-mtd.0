Return-Path: <SRS0=qv8i=A3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13277C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 02:08:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1B5220775
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2020 02:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWCFAfxU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ma8QjARB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1B5220775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89pNQ36AxvGUnEQJJFP1PUhRES1ZpuC1Vtz3A2hAdcQ=; b=UWCFAfxUMqpa1xyOp3hki8g8KD
	x2TrdKUcSEy7EeHUq5S9Ra0Z+iybR2IkwyGNDx+mDX34mEaUMYZ2zii8PmU7srLWZNvEnKPjohdNF
	aWjo9xvO5GxQKhEPuC+6g0o9h816DHF6HvERMWfi6sdQfj/1WWxNEuMaVJCJ8JfS/wFiAATS/u7S5
	NUh9c7iiNaPjLDKdbKb7f6gH2JkYg9kf4PhbI6jnaM2mvJci04F/OLed5AeXY84OLycMhVixJqlOu
	UFxhJbDRKFHp2j3UEuOHy2654w6YEpuWmL1XMSZFbuEi8IzRlmXF6LAIJab0OKBkL3LStq/loMmCc
	7Qx+E5RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvtIL-00034H-8q; Thu, 16 Jul 2020 02:06:45 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvtIH-00033b-8V
 for linux-mtd@lists.infradead.org; Thu, 16 Jul 2020 02:06:41 +0000
Received: by mail-io1-xd42.google.com with SMTP id p205so4397868iod.8
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jul 2020 19:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FOFfkbobGg6o74yUtg+GpVdBpEP1uElkw+cppMwZR7k=;
 b=ma8QjARB0iSRwI9er0kSwTjfwc3spXIQNuWNDJ6oI0EW1gNwSey2FpBwj2iVlVMLVT
 /bwARlJyvuL0qEZuz5VJ65u3q0vHcEaIsGX+rnD9efJXA1CyV6kR1GTZXUgGJQRgyjG8
 BE8jCPW2rEmNOUJjJ9uoKfDSFiiebJiAZZlRJ6vKyFKEJFTXSonjhLIfjfWzHJMhm4tv
 R004gt3S86PoqO62CXRydsAMvb5k+8Fg60qBKjkvCpsf4Ovx5N3q8lF8Buw2kQMfPvz3
 6IpgIOszMffGtQ/o/SEGpxThw187E88wcl//mNbtdcioTdEdOOrkHUrgGq1ZiPCTaN8/
 T30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOFfkbobGg6o74yUtg+GpVdBpEP1uElkw+cppMwZR7k=;
 b=b7o0yXHB9FiZjM9goyAJlcveQZpHqVW1rBUi/zvStWbLsmIFXcmjLcF5PHGj3kPYiG
 5meRnx38//OiIJT3rpszRLK35qCiDpUvZ+RMBhTcY6CA39KgAVLll0+F5beAJHjbXavW
 7+epI4uYeksk3Lhnc/FJwtl4exRX9x2BbiP2BNROO5Q4V3Wp8tJhGvYGuwgKCFKe0UlX
 Q7jqC13cUcmrJtRum8pBq1CsDrjaZhhbRMeEwLcSvdW+tMzgRIisIjbMPktArMKHov7R
 QYy1cOXNNfG3VEsJ8x51dB2A9sDSYy/iNwloWqf06fi9MdKt2yDREVqeFUV0UQKddNGy
 OPpQ==
X-Gm-Message-State: AOAM533N++1sCYDHn2/D81bunKoACFsAEkAyTc/ioMJdCFOTNqacc1Hf
 HcB/mU7nXKMX5FEU3n8IgJA=
X-Google-Smtp-Source: ABdhPJwG/4hHh8neeWnn3b9U6pCgicHFlVfwG/Gy3qfJYVFYYyV4Jm8q6GNT4ulycXdduRnRmCiGYg==
X-Received: by 2002:a6b:3b46:: with SMTP id i67mr2167337ioa.205.1594865199127; 
 Wed, 15 Jul 2020 19:06:39 -0700 (PDT)
Received: from [192.168.1.2] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.googlemail.com with ESMTPSA id
 z78sm2071135ilk.72.2020.07.15.19.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 19:06:38 -0700 (PDT)
Subject: Re: [PATCH] bcm963xx_tag.h: fix duplicated word
To: Randy Dunlap <rdunlap@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-mips@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 miquel.raynal@bootlin.com
References: <d30c09a3-fe30-ddf1-3f21-00fc48b16443@infradead.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 a9BQwACgnzGuH1BVeT2J0Ra+ZYgkx7DaPR0=
Message-ID: <847e3e46-2fc2-daea-67f3-3aaf0f2af4ac@gmail.com>
Date: Wed, 15 Jul 2020 19:06:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d30c09a3-fe30-ddf1-3f21-00fc48b16443@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_220641_327983_8039B9FB 
X-CRM114-Status: GOOD (  14.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

TGUgMjAyMC0wNy0xNSDDoCAxODoyOCwgUmFuZHkgRHVubGFwIGEgw6ljcml0wqA6Cj4gRnJvbTog
UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gCj4gQ2hhbmdlIGRvdWJsZWQg
d29yZCAiaXMiIHRvICJpdCBpcyIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+Cj4gQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlA
Z21haWwuY29tPgo+IENjOiBiY20ta2VybmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRjb20uY29tCj4g
Q2M6IGxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCgpBY2tlZC1ieTogRmxvcmlhbiBGYWluZWxs
aSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+CgpUaGlzIHNob3VsZCBwcm9iYWJseSBiZSBtZXJnZWQg
dmlhIGxpbnV4LW1pcHMgb3IgbGludXgtbXRkLCBzaW5jZSB3ZQpoYXZlIGNvbnN1bWVycyBvZiB0
aGlzIGhlYWRlciBvbiBib3RoIHRyZWVzLgoKPiAtLS0KPiAgaW5jbHVkZS9saW51eC9iY205NjN4
eF90YWcuaCB8ICAgIDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gLS0tIGxpbnV4LW5leHQtMjAyMDA3MTQub3JpZy9pbmNsdWRlL2xpbnV4
L2JjbTk2M3h4X3RhZy5oCj4gKysrIGxpbnV4LW5leHQtMjAyMDA3MTQvaW5jbHVkZS9saW51eC9i
Y205NjN4eF90YWcuaAo+IEBAIC04NCw3ICs4NCw3IEBAIHN0cnVjdCBiY21fdGFnIHsKPiAgCWNo
YXIgZmxhc2hfbGF5b3V0X3ZlcltGTEFTSExBWU9VVFZFUl9MRU5dOwo+ICAJLyogMTk2LTE5OTog
a2VybmVsK3Jvb3RmcyBDUkMzMiAqLwo+ICAJX191MzIgZnNrZXJuZWxfY3JjOwo+IC0JLyogMjAw
LTIxNTogVW51c2VkIGV4Y2VwdCBvbiBBbGljZSBHYXRlIHdoZXJlIGlzIGlzIGluZm9ybWF0aW9u
ICovCj4gKwkvKiAyMDAtMjE1OiBVbnVzZWQgZXhjZXB0IG9uIEFsaWNlIEdhdGUgd2hlcmUgaXQg
aXMgaW5mb3JtYXRpb24gKi8KPiAgCWNoYXIgaW5mb3JtYXRpb24yW1RBR0lORk8yX0xFTl07Cj4g
IAkvKiAyMTYtMjE5OiBDUkMzMiBvZiBpbWFnZSBsZXNzIGltYWdldGFnIChrZXJuZWwgZm9yIEFs
aWNlIEdhdGUpICovCj4gIAlfX3UzMiBpbWFnZV9jcmM7Cj4gCgoKLS0gCkZsb3JpYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
