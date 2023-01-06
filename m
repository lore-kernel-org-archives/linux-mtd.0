Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71423C5479D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Jan 2023 09:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v90j4IZ1MxneMxbP45ghFUW3fRU40BzbpqwUJys3JpE=; b=QTZhdNdt6KsnCS
	5ZlEWitV3ErZeLRydkvr0wvf9HIz0QQTzjDLMuxEQTmvaQuNih8dbVX2M+iG/kqbCjp37nG9D8LX5
	IitBcbr/kCsEJPuczq2YJd0jRdIF5kMaHaTH3kRCPTQnMZVSTXz9OnzPFo35M67RZgMwRe2+pBoQL
	PomiN5Gez1usxdWF6bE7BY7CbzNNkl3h0bRGQyrFyWAolxQvJBmR1aiH19cmeFxouK/X2YekKvru8
	ACnVQryaE+aZ0ZT5fnOvVB8W1eBCgr2MRA9KiIUV3i5VHdjMdU53LEBKGl7jITVQmwOuJ9LCe88SM
	TPmWypSrvoV3Uvfo9PQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjSB-007FXI-Hx; Fri, 06 Jan 2023 09:55:59 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDjS8-007FUn-Pf
	for linux-mtd@lists.infradead.org; Fri, 06 Jan 2023 09:55:58 +0000
Received: by mail-ej1-x62c.google.com with SMTP id jo4so2386814ejb.7
        for <linux-mtd@lists.infradead.org>; Fri, 06 Jan 2023 01:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MR+/NWA8p6VYz8uv/82PDoV9JZ8XB9MwZrQb5jkWV0Q=;
        b=Gma/Ht/dQqftf/LiR6DcQta3AYBsESePrvrSgiVzPE2pgxhQdPw/lqfhTD+y8qDejO
         QfSjvkKint4HPGmTKSTRWInv5nFkTbpOWmU0VtnVtzcYpir/ijafCrg951eo15GIAIQY
         GfNYHzacOjUQ2hcgk/wJyUN/izI2rO/zubQQPTgYjz0/YwUjnJAZQUN+Fht00s1KEso4
         v/BqfXIod2yXdwkyDlKGiClUAiYZMZEgncM+H//hJIJAB7brmlSdBw+uPeTUEB0yJzPc
         0tTx9DwXPzKPPfIkOcu4TbowfBY+i8IjFchX53w8SaYcaeO15aIMifhMy9jmyg1Yy8y0
         ltAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MR+/NWA8p6VYz8uv/82PDoV9JZ8XB9MwZrQb5jkWV0Q=;
        b=p/Ba0VtLrxfTQ3a79A+sf9FTIdY71ukt+qvZvlmUMpG2CvWp1o89vk2JlDTN2l+oyc
         rpmquclgH7DZHeH7r2PRfP5Zxvg5ZdO3aTsDa3YJQNVWyeGJ6DrM35cH/lNgzrCW/IV6
         JkBb/QugIoAw8DP+5zBTqfvET7dMK7CBcZG8ZxM26zonY6CT1c6kwiRIKVjQh8Ml98qJ
         7a2aJggZ6v856Wb02koiIHRQbDiy5cGjX46ctzrNyQSmQ9mRVRNwf9AnktwSOOxWZjgA
         WjAk7Mbdww/Rll64okWLNI/LX16taT9UI1/4YMkK87mTANSFnsegs7uwVWe8tZbFvboJ
         ePZQ==
X-Gm-Message-State: AFqh2koVf31a8CPgqUMWZdRRXGfB7IXmFUTl9BuGd0oi8yK19UJQwjMp
	Rok0rUceq+YAeADIJRWjC4oo9Q==
X-Google-Smtp-Source: AMrXdXscYlLtCHAq3/z9+5Df9Wjc/Ll9rYmx2DDunqCMB/61SovKITfnbg0PAHfiDTY+HRdzbnKOLQ==
X-Received: by 2002:a17:907:80ce:b0:7c1:26b9:c556 with SMTP id io14-20020a17090780ce00b007c126b9c556mr50183303ejc.15.1672998953767;
        Fri, 06 Jan 2023 01:55:53 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.242])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709063d2a00b0078db18d7972sm248340ejf.117.2023.01.06.01.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:55:53 -0800 (PST)
Message-ID: <ebfec54e-f82e-4560-9a4a-7c02ed4c841b@linaro.org>
Date: Fri, 6 Jan 2023 11:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mtd: spi-nor: spansion: Keep CFR5V[6] as 1 in Octal DTR
 enable/disable
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, stable@vger.kernel.org
References: <20230106030601.6530-1-Takahiro.Kuwano@infineon.com>
 <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
In-Reply-To: <493d9a10-aaf3-70f6-36c3-9a2cf39f0759@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_015556_861342_06AB6254 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNi4wMS4yMDIzIDExOjQ3LCBUdWRvciBBbWJhcnVzIHdyb3RlOgo+IEhleSwgVGFrYWhp
cm8sCj4gCj4gT24gMDYuMDEuMjAyMyAwNTowNiwgdGt1dzU4NDkyNEBnbWFpbC5jb20gd3JvdGU6
Cj4+IEZyb206IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4K
Pj4KPj4gQ0ZSNVZbNl0gaXMgcmVzZXJ2ZWQgYml0IGFuZCBtdXN0IGFsd2F5cyBiZSAxLgo+IAo+
IGhhdmUgeW91IHNlZW4gc29tZSBzdHJhbmdlIGJlaGF2aW9yPwo+Pgo+PiBGaXhlczogYzMyNjZh
ZjEwMWYyICgibXRkOiBzcGktbm9yOiBzcGFuc2lvbjogYWRkIHN1cHBvcnQgZm9yIEN5cHJlc3Mg
Cj4+IFNlbXBlciBmbGFzaCIpCj4+IFNpZ25lZC1vZmYtYnk6IFRha2FoaXJvIEt1d2FubyA8VGFr
YWhpcm8uS3V3YW5vQGluZmluZW9uLmNvbT4KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
Pj4gLS0tCj4+IMKgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyB8IDQgKystLQo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jIAo+PiBiL2RyaXZlcnMv
bXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+PiBpbmRleCBiNjIxY2RmZDUwNmYuLjRlMDk0YTQzMmQy
OSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGFuc2lvbi5jCj4+ICsrKyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+PiBAQCAtMjEsOCArMjEsOCBAQAo+PiDC
oCAjZGVmaW5lIFNQSU5PUl9SRUdfQ1lQUkVTU19DRlIzVsKgwqDCoMKgwqDCoMKgIDB4MDA4MDAw
MDQKPj4gwqAgI2RlZmluZSBTUElOT1JfUkVHX0NZUFJFU1NfQ0ZSM1ZfUEdTWsKgwqDCoMKgwqDC
oMKgIEJJVCg0KSAvKiBQYWdlIHNpemUuICovCj4+IMKgICNkZWZpbmUgU1BJTk9SX1JFR19DWVBS
RVNTX0NGUjVWwqDCoMKgwqDCoMKgwqAgMHgwMDgwMDAwNgo+PiAtI2RlZmluZSBTUElOT1JfUkVH
X0NZUFJFU1NfQ0ZSNVZfT0NUX0RUUl9FTsKgwqDCoCAweDMKPj4gLSNkZWZpbmUgU1BJTk9SX1JF
R19DWVBSRVNTX0NGUjVWX09DVF9EVFJfRFPCoMKgwqAgMAo+PiArI2RlZmluZSBTUElOT1JfUkVH
X0NZUFJFU1NfQ0ZSNVZfT0NUX0RUUl9FTsKgwqDCoCAweDQzCj4+ICsjZGVmaW5lIFNQSU5PUl9S
RUdfQ1lQUkVTU19DRlI1Vl9PQ1RfRFRSX0RTwqDCoMKgIDB4NDAKPiAKPiBObywgdGhpcyBsb29r
cyBiYWQuIEluc3RlYWQgb2Ygb3ZlcndyaXRpbmcgQ0ZSNVYgd2l0aCB3aGF0ZXZlciB2YWx1ZSwg
d2UKPiBzaG91bGQgaW5zdGVhZCBmaXJzdCByZWFkIGl0IGFuZCB0aGVuIHVwZGF0ZSBvbmx5IHRo
ZSBiaXQgdGhhdCB3ZSdyZQo+IGludGVyZXN0ZWQgaW4uIElmIGl0IGhhcHBlbnMgdG8gd3JpdGUg
Q0ZSNVYgYmVmb3JlIG9jdGFsIGVuYWJsZS9kaXNhYmxlLAo+IHlvdSdsbCBvdmVyd3JpdGUgdGhl
IHByZXZpb3VzIHNldCB2YWx1ZXMuCj4gCgpvdGhlciBpZGVhIGlzIHRvIGtlZXAgc29tZSBzb3J0
IG9mIGNhY2hlIHJlZ2lzdGVyIHZhbHVlcyBpbiB0aGUgY29kZSwgdG8KYXZvaWQgcmVhZGluZyBy
ZXBlYXRlZGx5IHJlZ2lzdGVyIHZhbHVlcyBhdCBlYWNoIHVwZGF0ZS4gQnV0IHdlIHByb2JhYmx5
CmRvbid0IGRvIHNvIG1hbnkgdXBkYXRlcyBmb3Igbm93LCBhbmQgbWF5YmUgd2UgY2FuIGxlYXZl
IHRoaXMgZm9yIGxhdGVyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
