Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D379FCC9DB
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+dR7mc7UUlVJluwOBB94pJrxAL/+HpRO3B9UXGmuLE=; b=f1y9iYV1bgmzjr
	T4W/20y4x+0OvfatQQ4dj8xXviSL6NYPBGnuCsP5u+4pDSVRrz7SndYWYCOAv3wgo88HVMKjBKiWN
	UCIm5+WIBvC3nvrqvZzIIhIW5GtHRCQWX/2NR8X3SwWLhgSmcLSK9vPkq5nDQUUebBNyGOD/Qmh0U
	Td14f9toDrMxf1EdrAkvlvFf1JHL63wFq7zweCsn3sDHEmhCHiRXwQuEP3C695Gj2EGVrhkNaduO7
	Cv6jSU+lu9eXOlWQOnmaeYvk9f6yfogqE8AYrvmlg+HVuC5efCnt14LkrHbhR0qOqc8Nc56fZAizy
	ITPFob8xG4uXO+KX7Csg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztKq-000000095CB-27Ly;
	Tue, 10 Mar 2026 09:25:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztKm-000000095BB-2fbL
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 09:25:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so28685585e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 02:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773134698; x=1773739498; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWe6vp9ArC6sXunMWpuq4jR/bNHD3AM2kfcp+3lE0p4=;
        b=MdF4FPqhnHAXBR8M9/84RfXq5ayXlDGGq6Ep+Eje/XjXjQpCytxvFF6ka1piJOrG01
         1Q8qCEvkr9jbh5Z23V78iLg3t+tkGUruub+ojpLW7WlGHzAO+nfoRlMjhMZjyUxEM8Ux
         KRl3iXT6ABmZminliN6IfxDQ4TRrBLNTwnn+5OlcjZa0LT01jrDx0Useo0ZAUFY76CWu
         Ls4CX/jdAlelUcUG8/EdPl2thr0otzsc8jle24BcNKhi/ga1ojq/Ovf/NP1WoD0asovB
         QDPY6C17pv1FQ+gx/nidFPcK2TJG8I370c3rzm2MWjnPEobmtEtZ68t9/H+zE3sB/s67
         NU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134698; x=1773739498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWe6vp9ArC6sXunMWpuq4jR/bNHD3AM2kfcp+3lE0p4=;
        b=uj+hiJY2EnFWmFWTcnZ/ZJ8q5HzqYrEvvEkK0HcXPIV4JRp4wJ0RlnQe1Nm3ISccjN
         TKMyfOoIf3SvVBanpDLkE1AC+1e2Tw8FP/gqFoRn8ws/W9wjzCCy7pfE8t/8X9DR1Gbi
         P55EpvqlRJBmSR0NL7V/4BpQqF2BEcKdYBKmKRpglE+eTqxKnOdNslhTKNHGQ5VQemyy
         Yv/7dMUqRP9rjBupalRM7JGfTtdzrNeQT5YH36wi3aLjUI46kqDgXVcLkgju2racwdS2
         ufEf+b6uAjHbzDxHhSHkftI9pY6zHpllh/RR4F4qQ9z1BS1hpmwufxNUVZEGq5xFWp5a
         DRcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5/N2yQ774fYJ6dK6TLNhWOtkzVOuoKkmobw8zJXQ7iCWnjpn/VPHU6IJtaDSGF6LuwZzKJHlNdpk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0xsHR5hoLNYm1qZKdu1mMRCCBSjufKsjoA0HyS+qSuH85sZDl
	0Wh2BqNivsWzqd/TTxvqyvjmc2+OxDAWCenQEBxGLv9TqIHizjlGOpLP4dEbTIYlr7rEiXCWlG+
	wr0Q17yY=
X-Gm-Gg: ATEYQzzjmPHgvDyVJqQVVSacMtwZBMbvrAKLUJhYsX68RVSV/BpfN/h2hh0Gsq4/+fr
	ndxWByHd6vg2OkBsuC7RXtqRz+hJsaeNv9gQ7od8/oY37QPJOX7zXMmdqUkCIaBbyD+q1iv7p0F
	vAfxxjlZUB+/cRXaD0ufYnZQWM5vvdtBqhtjyGMFPrHwGTgwJ45+2Q84RceFp+TvYc7Zm5K5bcC
	3iSQj7GyqWDttJa4GU9/s0+hPcakZYFpqzOyGvYbgIal9xYqSmwdKuJTKNtcRBH+bsOglLLmemD
	vDeWc/U8MohOzreSm//DEWCIU2G9xWkiSZLn4uUUfBk1gCImYEAW+JAyJHjGvXHNhkm5wQvOu5u
	1VdI4kEa01HDClKRjJm/RQ7aKIWygnXQGlAA4Ee3tCn7bT3U14/vr/k2JTrFf5zqahA3SzGYZMC
	/XRz5Ixvu6CiiTNdzoecl9YtEHrJnoFd8=
X-Received: by 2002:a05:600c:4752:b0:483:7783:537b with SMTP id 5b1f17b1804b1-4852697a593mr246215875e9.24.1773134698293;
        Tue, 10 Mar 2026 02:24:58 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a900easm72186585e9.9.2026.03.10.02.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:24:58 -0700 (PDT)
Message-ID: <acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
Date: Tue, 10 Mar 2026 11:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Jakub Czapiga <czapiga@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <873429oxwf.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <873429oxwf.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022500_692645_83A1FB36 
X-CRM114-Status: GOOD (  25.31  )
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

CgpPbiAzLzkvMjYgNDo1NSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbyBTUEkgTk9S
IGZvbGtzIDotKQo+IAo+ICsgVGFrYWhpcm8KPiAKPiBPbiAwOC8wMS8yMDI2IGF0IDEzOjE0OjI5
ICswMSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4g
Cj4+IENvbW1pdCA1MDA4YzNlYzNmODkgKCJtdGQ6IHNwaS1ub3I6IGNvcmU6IENoZWNrIHJlYWQg
Q1Igc3VwcG9ydCIpIGFkZHMgYQo+PiBjb250cm9sbGVyIGNoZWNrIHRvIG1ha2Ugc3VyZSB0aGUg
Y29yZSB3aWxsIG5vdCB1c2UgQ1IgcmVhZHMgb24KPj4gY29udHJvbGxlcnMgbm90IHN1cHBvcnRp
bmcgdGhlbS4gVGhlIGFwcHJvYWNoIGlzIHZhbGlkIGJ1dCB0aGUgZml4IGlzCj4+IGluY29ycmVj
dC4gVW5mb3J0dW5hdGVseSwgdGhlIGF1dGhvciBjb3VsZCBub3QgY2F0Y2ggaXQsIGJlY2F1c2Ug
dGhlCj4+IGV4cGVjdGVkIGJlaGF2aW9yIHdhcyBtZXQuIFRoZSBwYXRjaCBpbmRlZWQgZHJvcHMg
dGhlIFJEQ1IgY2FwYWJpbGl0eSwKPj4gYnV0IGl0IGRvZXMgaXQgZm9yIGFsbCBjb250cm9sbGVy
cyEKPj4KPj4gVGhlIGlzc3VlIGNvbWVzIGZyb20gdGhlIHVzZSBvZiBzcGlfbm9yX3NwaW1lbV9j
aGVja19vcCgpIHdoaWNoIGlzIGFuCj4+IGludGVybmFsIGhlbHBlciBkZWRpY2F0ZWQgdG8gY2hl
Y2sgcGFnZSBvcGVyYXRpb25zLCBpZS4gaXQgaXMgb25seSB1c2VkCj4+IGZvciBwYWdlIHJlYWRz
IGFuZCBwYWdlIHByb2dyYW1zIChkZXNwaXRlIGl0cyBnZW5lcmljIG5hbWUpLgo+Pgo+PiBUaGlz
IGhlbHBlciBsb29rcyBmb3IgdGhlIGJpZ2dlc3QgbnVtYmVyIG9mIGFkZHJlc3MgYnl0ZXMgdGhh
dCBjYW4gYmUKPj4gdXNlZCBmb3IgYSBwYWdlIG9wZXJhdGlvbiBhbmQgdHJpZXMgNCB0aGVuIDMu
IEl0IHRoZW4gY2FsbHMgdGhlIHVzdWFsCj4+IHNwaS1tZW0gaGVscGVycyB0byBkbyB0aGUgY2hl
Y2tzLiBUaGVzZSB3aWxsIGFsd2F5cyBmYWlsIGJlY2F1c2UgdGhlcmUKPj4gaXMgbm93IGFuIGlu
Y29uc2lzdGVuY3k6IHRoZSBhZGRyZXNzIGN5Y2xlcyBhcmUgZm9yY2VkIHRvIDQgKHRoZW4gMykK
Pj4gYnl0ZXMsIGJ1dCB0aGUgYnVzIHdpZHRoIGR1cmluZyB0aGUgYWRkcmVzcyBjeWNsZXMgcmln
aHRmdWxseSByZW1haW5zIDA6Cj4+IGltcG9zc2libGUsIHRoZSBvcGVyYXRpb24gaXMgaW52YWxp
ZC4KCkkgbGlrZSBDaGVuZydzIGRldGFpbHMgb24gaG93IGl0J3MgZmFpbGluZy4gV291bGQgeW91
IHBsZWFzZSBhZGQgd2hhdCBoZQpkZXRhaWxlZCB0aGVyZT8KYGBgClRoaXMgbW9kaWZpZWQgb3Bl
cmF0aW9uIGlzIHRoZW4gcmVqZWN0ZWQgYnkgc3BpX21lbV9jaGVja19vcCgpIGluIHRoZQpjb3Jl
IHNwaS1tZW0uYyBiZWNhdXNlIGl0IGhhcyBhIG5vbi16ZXJvIGFkZHJlc3MgbGVuZ3RoIGJ1dCBh
IHplcm8gYWRkcmVzcwpidXN3aWR0aCwgd2hpY2ggaXMgYW4gaW52YWxpZCBjb21iaW5hdGlvbi4K
YGBgCkFja2VkLWJ5OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cgo+
Pgo+PiBUaGUgY29ycmVjdCBjaGVjayBpbiB0aGlzIGNhc2UgaXMgdG8gZGlyZWN0bHkgY2FsbCBz
cGlfbWVtX3N1cHBvcnRzX29wKCkKPj4gd2hpY2ggZG9lc24ndCBtZXNzZXMgdXAgd2l0aCB0aGUg
b3BlcmF0aW9uIGNvbnRlbnQuCj4+Cj4+IEZpeGVzOiA1MDA4YzNlYzNmODkgKCJtdGQ6IHNwaS1u
b3I6IGNvcmU6IENoZWNrIHJlYWQgQ1Igc3VwcG9ydCIpCj4+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gVGhlc2UgdHdvIHBhdGNo
ZXMgYXJlIGZpeGVzIHdoaWNoIG5lZWQgdG8gZ2V0IGluLCBJJ2QgbGlrZSB0byBwaWNrIHRoZW0K
PiBmb3IgdGhlIG5leHQgZml4ZXMgTVREIFBSIHRoYXQgSSBhbSBwcmVwYXJpbmcsIGJ1dCBJIHdh
cyBleHBlY3Rpbmcgc29tZQo+IGtpbmQgb2YgYWNrbm93bGVkZ2VtZW50IG9uIGl0Lgo+IAo+IENo
ZW5nIE1pbmcgYWxyZWFkeSBmYWNlZCB0aGUgc2FtZSBpc3N1ZSBvbiBoaXMgc2lkZSBhbiBpZGVu
dGljYWwgcGF0Y2gKPiBhbHJlYWR5Lgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCj4+IC0tLQo+
PiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gaW5kZXgg
ZDNmOGE3OGVmZDNiLi4xZjJlMzEyZmVlYzcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+IEBAIC0y
NDY2LDcgKzI0NjYsNyBAQCBzcGlfbm9yX3NwaW1lbV9hZGp1c3RfaHdjYXBzKHN0cnVjdCBzcGlf
bm9yICpub3IsIHUzMiAqaHdjYXBzKQo+PiAgCj4+ICAJCXNwaV9ub3Jfc3BpbWVtX3NldHVwX29w
KG5vciwgJm9wLCBub3ItPnJlZ19wcm90byk7Cj4+ICAKPj4gLQkJaWYgKHNwaV9ub3Jfc3BpbWVt
X2NoZWNrX29wKG5vciwgJm9wKSkKPj4gKwkJaWYgKCFzcGlfbWVtX3N1cHBvcnRzX29wKG5vci0+
c3BpbWVtLCAmb3ApKQo+PiAgCQkJbm9yLT5mbGFncyB8PSBTTk9SX0ZfTk9fUkVBRF9DUjsKPj4g
IAl9Cj4+ICB9CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
