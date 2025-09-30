Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F6DCCA470
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Sep 2025 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3f1zlf5NCo4tKAd05LdFtqP/Flnb5+XiVQvFF9O3fos=; b=QdC6a+tsvNwbL8
	6Y8vGoYTFklaVdYdhq6lkKlEb3OpWnrH7pa4XXD4FqW0idR6Tvh0IhcjfZqu0+JrYf+vemTizYLIG
	fLTP0RLSIMaphTUtL8h8cL64Rcxa4lG6RNvAlAJjAKg/kKxt57LwuSHpLHqFUJILze7UecnNRrtkq
	+Sm+OR2V3oxPegq6WOK+FW7UBMyONp5BgTr1N2+uunbb6OahVPrcFzY81bzLZokw25VPgGgAC3Xia
	1dt9hZIqnb2I5OzGz0tYNkujXHi0bmX7EEc+HkvDL1zNdsHKK0gGK5K4A65BkfM5TID5C7OvJbH5a
	W/rc1EDgUDkuCLdD8KdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bWK-00000005WTC-420j;
	Tue, 30 Sep 2025 14:40:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bWI-00000005WRR-3b5S
	for linux-mtd@lists.infradead.org;
	Tue, 30 Sep 2025 14:39:59 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7800ff158d5so3955715b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2025 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759243198; x=1759847998; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D6Ghftnwj+NaC3a9sRXMvFD5tjT5PwN7VnTzNH98qws=;
        b=SEVpy6EbndYGjlEcGMed8hxEvWZQ1gFLIvNdTJLVeWQtoag2H8GJ7BanXgDP8qQyWK
         pqlqTDFYf4W+ElKSk3O/AowiWdCoL4pXRoIeyDaxkABr8PsykE0kdLJviyhQ+RwSNKTF
         hkIjBz+fEdJmF+AB7O+81A0EJbAMYGMEcBdCiCK7hLOYlFBHkSxYcJemsYP3rTDH1FnU
         msqbuj/Qktg+i3Ne7dziYox8pt6Fx2ra/JpV72dg5b4s2BGlpLR2bN046MuqjQdfDv7/
         FAfqME8OJ68Fmfk78qWIPNQYEkKubw8gKlQoB+/hxncNcTPpXepfAvoeVetp5Pj0Htr2
         KFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759243198; x=1759847998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6Ghftnwj+NaC3a9sRXMvFD5tjT5PwN7VnTzNH98qws=;
        b=oAZVZcTSiBxrFsg74FF2BQpfQ8M6IF8MIeg0a4ylz9f7m721QeJHE7EaeRhmPahlYX
         i08+n53v64Yt11yJaGvPvsIEY1i59lKU1GsuWm/8GIyqDxGRSnGVAWinI7a3wPm1i7Fo
         Np4AdvnJ1plQnleIahYsRURycnps111vd6qj31XaUe7mnG5m/N0A0MCOauwUvq21xH2c
         x6KeCUf32Qv2Fs8AoHI400bxLoSre88Ly4FdMS73+hxLG84Y+7IwKmyBOIoxxecfEgIR
         wc3n2h2naIr7d/4GiVPBv0T1i3ESqUd3tGYA9UGpogAsoje2Xse64KOE8xpbt8gplwOe
         gJuw==
X-Forwarded-Encrypted: i=1; AJvYcCXSChcMveNWqCePoolhfX0iAd6w1Z5EvZVDTin7mSbjQsd144vN51Hpc6cEMEQkFMNQZ+q3W1V8V5w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2wvH+TGd/yy6Hh5DMS3ZgCKiGLJ7nTDWODoqKTtnAFovf1qTl
	PwiWxUTdS7nyfomVvMPqq9x9QisLyhHsc1VgQeQ8Qmi8b6dJ9pplCMjC
X-Gm-Gg: ASbGncuMvoyDv1wrstbTKJQmN4z3/qi+wZJnnEhAoOh62to46GNs739kydasFWMNvdE
	LT7Ifbi/+C6KyAeEVq3mjg3bpkPI8i8lAqKvXROywS+XtdIytoHVbCitD2zqpCpWPllEhwnkhVd
	QJDJHlLJx5wmCTqJwIQ8CAAF2aMvX4rNjrzQqE7k2ckRBEn/JICcXfylYPX9sOaTlM6nvKJKAHQ
	PxFQ1/t8mD/jQpo+oHr4KS5pPdkKvz2n6/O9TtbH3x8mG3O+zo4n3ZNhL5HCZq+d79Gnp/t+kc0
	nv4wFrtTJyIuhGbKeoull7AnC6guyHCKzDg41vbLFnsZ4jAUxzrpWqIj63qAy+gso0vpiizTGDg
	A+TSVL37+jlukma8A4hccFPcBe2q5FnJ/LUd33ABLgZlnLdLrR2LWRTy8k9f2cJlNTw+I0FdILw
	4M3ciJYB8Ol9xd2qrwD/G+tAzQEFvicg==
X-Google-Smtp-Source: AGHT+IExSfEkzVaMbV+FOgP+NzxTfw/rdIofSI61Zlupzj6rvjRAxJximmaZ9/psf15TWbTBKn1hCw==
X-Received: by 2002:a05:6a00:18a7:b0:781:2069:1eea with SMTP id d2e1a72fcca58-7812069208emr18132877b3a.24.1759243197825;
        Tue, 30 Sep 2025 07:39:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06e5csm13917492b3a.76.2025.09.30.07.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 07:39:57 -0700 (PDT)
Message-ID: <cfde5583-fcc1-4c08-9893-5a09a148b475@roeck-us.net>
Date: Tue, 30 Sep 2025 07:39:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Pratyush Yadav <pratyush@kernel.org>,
 Cheng Ming Lin <linchengming884@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Maarten Zanders <maarten@zanders.be>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
 <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
 <a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
 <aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
 <CAAyq3SYybDgBvkTKh2ZB4UdKq1XV_nnzx3Tj1P915W5x_7_nNA@mail.gmail.com>
 <DD10QMSJVZ2K.26U45JAXV5EY7@kernel.org>
 <CAAyq3SYyqi-oR8T039Zd0uaF6UieX3SdF9UF2kxOG6+yJqAEUg@mail.gmail.com>
 <mafs01pnoceum.fsf@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <mafs01pnoceum.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_073958_910267_3A66E8AF 
X-CRM114-Status: GOOD (  23.15  )
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

T24gOS8zMC8yNSAwNToxOSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gVHVlLCBTZXAgMzAg
MjAyNSwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gCj4+IEhpIE1pY2hhZWwsCj4+Cj4+IE1pY2hh
ZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNeW5tDnmnIgyNOaXpSDpgLHkuIkg
5LiL5Y2IODoxMeWvq+mBk++8mgo+Pj4KPj4+PiBUaGUgcm9vdCBjYXVzZSBvZiB0aGlzIHByb2Js
ZW0gbGllcyBpbiB0aGUgZmFpbHVyZSBvZiBwYXJzaW5nIHRoZSBTRkRQCj4+Pj4gZGF0YSBmb3Ig
dGhlIGZsYXNoLCByYXRoZXIgdGhhbiBhbiBpc3N1ZSB3aXRoIHRoZSBwYXRjaCBpdHNlbGYuIEkg
YmVsaWV2ZQo+Pj4+IHdlIHNob3VsZCBub3QgcmV2ZXJ0IHRoaXMgcGF0Y2guCj4+Pgo+Pj4gSSBk
aXNhZ3JlZS4gVGhlcmUgYXJlIE1hY3Jvbml4IGZsYXNoZXMgd2l0aCB0aGF0IElEIHdoaWNoIGRv
ZXNuJ3QKPj4+IGhhdmUgU0ZEUC4gIEFuZCB0aGlzIHBhdGNoIGlzIGRyb3BwaW5nIHN1cHBvcnQg
Zm9yIHRoZW0uIFNlZSBhbHNvCj4+PiBbMV0uIE5vdyBJJ20gbm90IHN1cmUgaXQgaXMgd29ydGgg
cmV2ZXJ0aW5nIHRoaXMgY29tbWl0LiBOb2JvZHksCj4+PiBleGNlcHQgR3VlbnRlciBjb21wbGFp
bmVkLCBidXQgb25seSAqc28gZmFyKiAoYW5kIHRoYXQgcGF0Y2ggaXMgaW4KPj4+IHNpbmNlIDYu
MTYpLiBBbnkgb3BpbmlvbnM/Cj4gCj4gV2hlbiBJIHJlYWQgdGhpcyBJIHdhcyBqdXN0IGhvcGlu
ZyBubyBvbmUgY29tcGxhaW5zIGFuZCB3ZSBlbmQgdXAganVzdAo+IGRyb3BwaW5nIHN1cHBvcnQg
Zm9yIHRoZXNlIGZsYXNoZXMgdGhhdCBubyBvbmUgc2VlbXMgdG8gdXNlLi4uCj4gCj4+Cj4+IEkg
YWdyZWUgd2l0aCByZXZlcnRpbmcgdGhpcyBwYXRjaC4gV2hlbiBJIGluaXRpYWxseSB2ZXJpZmll
ZCBpdCwgdGhlCj4+IGRldmljZXMgSSBoYWQgb24gaGFuZCBhbGwgc3VwcG9ydGVkIFNGRFAsIHNv
IEkgZGlkIG5vdCBjYXRjaCB0aGlzIGlzc3VlLgo+PiBBZnRlciBjaGVja2luZyBhZ2FpbiwgSSBj
b25maXJtIHRoYXQgc29tZSBvbGRlciBmbGFzaGVzIHdpdGhvdXQgU0ZEUCBhcmUKPj4gaW5kZWVk
IGFmZmVjdGVkLgo+IAo+IERvIHlvdSBrbm93IGlmIHRoZXNlIGZsYXNoZXMgYXJlIHVzZWQgaW4g
YW55IGRldmljZXMgdGhhdCBhcmUgYWN0aXZlbHkKPiB1c2VkIGFuZCBtYWludGFpbmVkPyBJZiBz
bywgd2Ugc2hvdWxkIHJldmVydC4gSWYgaXQgaXMgbGlrZWx5IHRoZXkKPiBhcmVuJ3QgYWN0aXZl
bHkgdXNlZCwgdGhlbiBtYXliZSB3ZSBqdXN0IGtlZXAgdGhpbmdzIGFzIHRoZXkgYXJlPwo+IER1
bm5vLi4uCj4gCgpxZW11IGVtdWxhdGVzIHRoZSBjaGlwcywgbWVhbmluZyB0aGUgcWVtdSBlbXVs
YXRpb25zIHVzaW5nIHRoZW0gbm8gbG9uZ2VyIHdvcmsuClRoaXMgaXMgaG93IEkgZm91bmQgdGhl
IHByb2JsZW0uCgpJIGNhcnJ5IGEgZG93bnN0cmVhbSBxZW11IGNoYW5nZSB0byBpbnN0YW50aWF0
ZSBkaWZmZXJlbnQgZmxhc2ggdHlwZXMgb24gdGhlCmFmZmVjdGVkIGJvYXJkcywgc28gdGhpcyBp
cyBubyBsb25nZXIgYSBwcm9ibGVtIGZvciBtZS4gSW4gY2FzZSBhbnlvbmUgd29uZGVycwppZi93
aHkgSSBkaWRuJ3Qgc3VibWl0IHRoYXQgaW50byBxZW11IC0gSSBkaWQuIEl0IHdhcyB3YXMgcmVq
ZWN0ZWQuCgpHdWVudGVyCgo+Pgo+PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIG9ubHkgY2hhbmdl
IHRoZSBgLm5hbWVgIGZpZWxkIHRvIHVzZSBhIGNvbW1lbnQsCj4+IHdoaWxlIGtlZXBpbmcgdGhl
IHJlc3QgYXMgaXM/IFRoYXQgd2F5IHdlIGNhbiBzdGlsbCBzdXBwb3J0IGZsYXNoZXMgdGhhdAo+
PiBtYXkgbm90IHByb3ZpZGUgU0ZEUC4KPiAKPiBTdXJlLCB0aGF0IHdvdWxkIGJlIGEgZ29vZCBp
bXByb3ZlbWVudCBvdmVyIGEgcGxhaW4gcmV2ZXJ0LiBNYXliZSBhcyBhCj4gZm9sbG93IHVwIHBh
dGNoIHRvIHRoZSByZXZlcnQ/Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
