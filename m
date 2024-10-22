Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E9D2CDE6
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Oct 2024 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0TZvqPknSf/LITjuQCumxoXYkKF5pJM/UyGAK5mzr4=; b=fEBMzJuwPXivwy
	bCac7mJWWlTJIYTcOoz/B8Q4u/V+3SMZdxpmj6lUJ6TPT2wnEZPDWvk6aev7D1ZAVDc0/kynUk/XH
	2i1KNmnq83oUud/UfkZJcmouTbgfvIWlSWqvcv9Z6GZ8lGI1SN9QbrqeOWrOj2WcsyzA20E1l+evo
	TzJrGlsoPgQtBZ/iFES+2a5fnngQNXoj8Mh/XyyA6O99YlM6WKuNnVzTnwN1oQWqzc1ogsrqAnm/a
	tr3+hdWfQ4F8jWvf+OJIrKDVX2+Z3HAwknmxDvphJgG4yrkxUGJucI9gFPI1A6l6H2Qt6wH0CPTip
	Y83gtgs1Z3jAyhBFCb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3H8p-0000000BJ88-1PSJ;
	Tue, 22 Oct 2024 15:49:51 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3H8m-0000000BJ7T-31C6
	for linux-mtd@lists.infradead.org;
	Tue, 22 Oct 2024 15:49:49 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-6cbf0e6414aso28661546d6.1
        for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2024 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612186; x=1730216986; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMdO6AsGe7iShQZi1qiH62nM0byX9f8GrxeRuVyQXDo=;
        b=IyPjJni+soF+K9yD5PJhHmzVTkcfVmMCfPPJESRlOBEgUYQEDG/qpKD/6ptTY6zngA
         LGQjm3a7P7lXG37Bh+gCxtBW5KL7dfzsQ14IFYPx15Zr6g3mE1zCH5P3IuhpPySL9xsV
         b0lvhhuEv0XZcWLtl9BEHeRZnPqKbh7RT+56WSU8xj15wWQbpnPGtaIkRn8Mtxm0wZcM
         t/TKWwhmZ/ZXZZRZLEWsPVNA+0W4HWOQEJH4ymsRnDSiuRH/6CW6tq0Dmb8T76j3CPe+
         VQj6AA5sXMMoPJhUA4XgBhguES6E1KaXztHWfufY4nX5XNFzBuBPrqS5BxRq/AALWKUd
         0sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612186; x=1730216986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMdO6AsGe7iShQZi1qiH62nM0byX9f8GrxeRuVyQXDo=;
        b=tiSi9XpTuI/vrXUJSDU1WW3abhRV/Ov2XcgyU09qOYanGCloNG0XX79zBUacf3fJNs
         xnGtsZ8mg9a7nIvBn/TRuR4FZ2efA+pNi7+DYRW+xcj8Q2RW7l6goyczh6SYWCewJYrr
         1m9lkcKrKZLyJXsFUK6c0sFZD3PdvUG92+OKLvSRfOlTjDkGx07BDQoYkhjNZPH1Dbc4
         xuc09xmIfctGusC5wWCAjj4DR/2hllkZw5wHvwDkAKvJoBixX+daIvSw21DqAH6JjBa3
         M9Obj2dvl8nD50HOoy6OPZbxl7VmPLj6fPsyNXM6nLxN88xlWl2YzDmkHVQ6rZIgFua4
         reAA==
X-Forwarded-Encrypted: i=1; AJvYcCXqKkIeaUD6iSIsReLYlpfOR80g05mTroAxOPgC3E1+QeO9M44h+4co9kpAM6tx99QmKAKbuLLofWA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqfXsFglcxIeyWjsvQDqEwDBb80oHbYHk3G1+5J95ZyaUELiTK
	OvMs5Kh4Go1D+i3SmiebnBnoR8BieCp26EOmjgYaTDYM5t9aezmS
X-Google-Smtp-Source: AGHT+IES6ASkVAhTN9RqoBx97M4zHOlkTlpePDqsbIn7FGvd2Vm7RAoNc1U4DFoZyvtr9w6IVdC5nw==
X-Received: by 2002:a05:6214:4904:b0:6c1:6e3a:6d17 with SMTP id 6a1803df08f44-6cde14c280cmr217435266d6.6.1729612186212;
        Tue, 22 Oct 2024 08:49:46 -0700 (PDT)
Received: from [10.192.166.46] (host-36-27.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce00999abbsm29902636d6.86.2024.10.22.08.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 08:49:45 -0700 (PDT)
Message-ID: <ef69b21f-bf0f-4dba-84fa-c78cff729606@gmail.com>
Date: Tue, 22 Oct 2024 10:49:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: diskonchip: Cast an operand to uint64_t to
 prevent potential uint32_t overflow in inftl_partscan()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, dinghao.liu@zju.edu.cn, arnd@arndb.de,
 scott.bauer@intel.com, kbusch@kernel.org, heinzm@redhat.com,
 snitzer@redhat.com, linux-mtd@lists.infradead.org, zzjas98@gmail.com,
 chenyuan0y@gmail.com
References: <20241021192753.8582-1-zichenxie0106@gmail.com>
 <20241022104138.3f9de009@xps-13>
Content-Language: en-US
From: Zichen Xie <zichenxie0106@gmail.com>
In-Reply-To: <20241022104138.3f9de009@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_084948_778759_EEB693F9 
X-CRM114-Status: GOOD (  12.44  )
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

Ck9uIDIwMjQvMTAvMjIgMzo0MSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPgo+IHppY2hl
bnhpZTAxMDZAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgMjEgT2N0IDIwMjQgMTQ6Mjc6NTQgLTA1
MDA6Cj4KPj4gRnJvbTogWmljaGVuIFhpZSA8emljaGVueGllMDEwNkBnbWFpbC5jb20+Cj4+Cj4+
IFRoaXMgd2FzIGZvdW5kIGJ5IGEgc3RhdGljIGFuYWx5emVyLgo+IFRoaXMgc2hvdWxkIGJlIHRo
ZSBsYXN0IHNlbnRlbmNlLCBub3QgdGhlIGZpcnN0LCBtYXliZT8KSSBzYXcgYSBsb3QgcGF0Y2hl
cyBtYWtpbmcgaXQgYXMgdGhlIGZpcnN0IHNlbnRlbmNlLiBTbywgSSBkaWQgaXQgdG9vLgo+Cj4+
IFRoZXJlIG1heSBiZSBhIHBvdGVudGlhbCBpbnRlZ2VyIG92ZXJmbG93IGlzc3VlIGluCj4+IGlu
ZnRsX3BhcnRzY2FuKCkuIHBhcnRzWzBdLnNpemUgaXMgZGVmaW5lZCBhcyAidWludDY0X3QiCj4+
IHdoaWxlIG10ZC0+ZXJhc2VzaXplIGFuZCBpcC0+Zmlyc3RVbml0IGFyZSBkZWZpbmVkIGFzIDMy
LWJpdAo+PiB1bnNpZ25lZCBpbnRlZ2VyLiBUaGUgcmVzdWx0IG9mIHRoZSBjYWxjdWxhdGlvbiB3
aWxsIGJlIGxpbWl0ZWQKPj4gdG8gMzIgYml0cyB3aXRob3V0IGNvcnJlY3QgY2FzdGluZy4KPj4g
U28sIHdlIHJlY29tbWVuZCBhZGRpbmcgYW4gZXh0cmEgY2FzdCB0byBwcmV2ZW50IHBvdGVudGlh
bAo+PiBpbnRlZ2VyIG92ZXJmbG93Lgo+IFRoZSB3cmFwcGluZyBpcyBvZGQuClNvcnJ5LCBidXQg
Y291bGQgeW91IHBsZWFzZSBwb2ludCBvdXQgd2hlcmUncyBvZGQgc28gSSBjYW4gZml4IGl0Lgo+
Cj4+IEZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikKPj4gU2lnbmVkLW9m
Zi1ieTogWmljaGVuIFhpZSA8emljaGVueGllMDEwNkBnbWFpbC5jb20+Cj4+IC0tLQo+PiB2Mjog
Y29ycmVjdCAiRml4ZXMiIHRhZy4KPiBJZiB5b3Ugd2FudCB0byBwcm92aWRlIGEgZml4LCB5b3Ug
cHJvYmFibHkgd2FudCB0byBDYzogc3RhYmxlIGFzIHdlbGwuCgpZZWFoLCBJIHdpbGwgYWRkIHRo
YXQgdG8gdGhlIG5leHQgdmVyc2lvbi4KCgpCZXN0LAoKWmljaGVuCgo+Cj4gVGhhbmtzLAo+IE1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
