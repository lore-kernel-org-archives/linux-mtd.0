Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA36C282DE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hby+lWMTiKuuQNoMdKQeXTrVpYCNBPsj182Awiktkks=; b=G+6VMKaMhXyquH
	Tpv6c3hxPGKxWkWvfPMDbKU80PChwShrAZW/OB5YbzzbLLQshyd5rQ4EZMdxLGHDa/XtDT8GsaeeD
	rYGN2vEB67OclFwDs5a/HDeyx5ixEOZ5zfL2UEEDXsd4/Q+dSUF7lR7+SADI/iJkLH0l8QJeGtVwM
	iOvYK8TiRc0+LrMYRGdZEBBzDNJ88WdZ+ujlFRCrvHq+cCFEBCSneYnZKH3MKyU2v/IZq8Eg1ZomA
	lftJF3nUMi9X77abCgrArmyI3zXM4G1k1nCuS4gfAwky06Fbh9QhAoo75T1Xtxx0H1iW8fudJ4bz6
	OxzEVM2fxFkHzx84OFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traDr-00000002Eew-16Rf;
	Mon, 10 Mar 2025 10:18:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tra9C-00000002Day-2vov
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 10:14:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso23033475e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Mar 2025 03:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741601649; x=1742206449; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mb4ZEjkPxTZLwNM/RV2EyY1xOkJQUnNNIIHGYtjQ6vA=;
        b=V1wzr8SJKsRzohg5GpWlUnLlzpmBxksQ6cqlibI+u3KSjWx0OcV68y3wOQ85Uow9ck
         oziqm7zYe8yii4JksxOcPmwGSdGk708urYNbvHnqGnGjfY6g2e+C8jTDBJ3xTAomxNht
         g9V0sRb2QAj7A6HFeQF7p1PzAAxglLyDlFfcv2aTfyac4crhLup+RZPa5gueczy52VaL
         qxIVRBbICJiwdSFBEfXsY3DI8IkMaQKekLPGFempRxDqX+PGyfNwUWDJuWzdDEhHBOtf
         Sq0inmWZwD9Q3nqD0MuEibD4fTNC6WjytTEue0dbMqMF7wS1qNHpjSHdyFAMzs3Cma/a
         GKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741601649; x=1742206449;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb4ZEjkPxTZLwNM/RV2EyY1xOkJQUnNNIIHGYtjQ6vA=;
        b=LYQ1rw33LTc6pnKm1QCQsDiIo7VC0KOBsTylH+mJussuWR/NkdX40hOLsQFGp5Y+IF
         EbCSGX0fnh4W1EtTcRQRj+Shu0KgILJ9ImLgtOvN0V8VRSopxlUdV0Y1zLwTyp/rOtIf
         hKckGjId99olBfVXJHGSwspPkFxoQrYHJ3K4zsecoq4vs/lCYg04ouY0uHpTFzAsqooR
         UCjLK/B94mOm9eISzV5q8MIoZJKLz5nXSRDmRjSDaQ2N1fBOdIPKnvw6zIrxbn2jc5zs
         bX3tzmoVmAZt3EZobcfu09Q6zqx+6t/uyMHLo0o5NE2cqXBV7VcmdVfr3q9NyifLucFY
         PmMw==
X-Forwarded-Encrypted: i=1; AJvYcCURGiRjX4TFhUGcnIgYewdCarQNnPOjE/V5wWGr7Ikya2r7xdPYEokRnop6MNSBhqo4mdWhGIXo3ik=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWJrRF+CifqTOkgDHV808NsVb7MwANnT4UtpL/NkiI7XnTuHOf
	UnDq5OdJxL984BHcY3htRA8X0oCUzwQmc6ZOTY1yWNlsLII08Pwc8GJj5Jd7ih0=
X-Gm-Gg: ASbGnctgiZaOZpS07MhKIIcNFw01bkq1Jo+oIO5iIKEmTqV+JnBQkf4/Y/6fP8F4CBf
	xqGsPFYTOvUbUFvp0kPZ9cS19FQ1M9d7gOAOxbdUimQVLG6/PnVgv20/fhhD9ORTB+tZeojPwKg
	MhqnjEvfeoM/bxW0iWjvAObZkowBkLjnNhwbiBqS1xORsAVZ7lR1pkfRoxL0YRFU50De1M6EIwF
	XkL3X3B9fcfVm3LkQaBTg2+tZEQ+KxB/cYuws75sZjKDv/dFsy6wl+8YKvwVROfjyrYIFkwSvYb
	57B8dIbIJWH2LRgd7GOruisuSuYmlvqUBruxGYTES7+2Rt57/kW3nQ==
X-Google-Smtp-Source: AGHT+IE1Ord0Tl8BurkaPnDuV4r4Te8iOeVLYyzC08bi05bzSeYXOW3onsNn3uUNCaQEE8mKnUg7hw==
X-Received: by 2002:a05:600c:45d1:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43c686f96a0mr83815175e9.30.1741601648928;
        Mon, 10 Mar 2025 03:14:08 -0700 (PDT)
Received: from [192.168.0.62] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cfa7e4f36sm22681595e9.40.2025.03.10.03.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:14:08 -0700 (PDT)
Message-ID: <f1111d1b-a111-4171-9467-450d90a14c0a@linaro.org>
Date: Mon, 10 Mar 2025 12:14:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
 <9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
 <87v7skrgjl.fsf@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <87v7skrgjl.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_031410_753930_4AECD8FE 
X-CRM114-Status: GOOD (  20.04  )
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

CgpPbiAwNy4wMy4yMDI1IDE3OjQ1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIFR1ZG9yLAoK
SGkhCgo+IAo+Pj4gLSNkZWZpbmUgU1BJTkFORF9SRVNFVF9PUAkJCQkJCVwKPj4+ICsjZGVmaW5l
IFNQSU5BTkRfUkVTRVRfMVNfMF8wX09QCQkJCQkJXAo+PiBIaSwgTWlxdWVsLAo+Pgo+PiBIYXZl
IHlvdSBzZWVuIGFueSByZXNldCBvcCB3aXRoIGFkZHJlc3Mgb3IgZGF0YT8gSWYgbm90LCBJJ20g
bm90IHJlYWxseQo+PiBzdXJlIHdoZXRoZXIgd2Ugc2hhbGwgY2hhbmdlIHRoZSBuYW1lIGZvciB0
aGVzZSBiYXNpYyBvcGVyYXRpb25zLgo+Pgo+PiBDaGFuZ2luZyB0aGVtIHRvIDFTLTAtMCBtYXkg
YWxzbyBpbmRpY2F0ZSB0aGF0IHRoZXJlIGFyZSByZXNldHMgd2l0aAo+PiBhZGRyZXNzIG9yIGRh
dGEgZmllbGRzLCB3aGljaCBJIGZpbmQgY29uZnVzaW5nLgo+Pgo+PiBJIHRoaW5rIHRoZSBjaGFu
Z2UgaXMgZ29vZCBmb3IgcmVhZHMgYW5kIHdyaXRlcy4gSSdsbCBjaGVjayBmdXJ0aGVyIGluCj4+
IHRoZSBzZXJpZXMgYW5kIGxldCB5b3Uga25vdy4KPiAKPiBJIHdhbnQgdG8gcmVuYW1lIHRoaXMg
bWFjcm8gZm9yIHR3byByZWFzb25zOgo+IC0gV2UgbWlnaHQgc2VlIGluIHRoZSBuZWFyIGZ1dHVy
ZSB0aGUgYWRkaXRpb24gb2YgOEQtMC0wIG9wcyAoSSBwbGFuIG9uCj4gICB3b3JraW5nIG9uIGl0
KS4KPiAtIEkgd291bGQgbGlrZSBzb21lIGtpbmQgb2YgaGFybW9ueSBhbW9uZyB0aGVzZSBtYWNy
b3MuCj4gCj4gTm93LCB3aGV0aGVyIGlzIHNob3VsZCBiZSBuYW1lZCBsaWtlIEkgcHJvcG9zZWQg
b3IganVzdAo+IFNQSU5BTkRfUkVTRVRfT1BfMVMsIEkgaGF2ZSBubyBzdHJvbmcgcHJlZmVyZW5j
ZSBhbmQgSSBjYW4gY2hhbmdlIHRoYXQKPiBpbiBhbiB1cGNvbWluZyB2ZXJzaW9uLgo+IAo+IFdo
aWNoIG9uZSB3b3VsZCB5b3UgcHJlZmVyPwoKSSBkb24ndCBrbm93LiBXaGljaCBvbmUgaXMgYmFj
a2VkIHVwIGJ5IGEgc3RhbmRhcmQ/CgpKRVNEMjE2RiBkZWZpbmVzCiIoQW4tQm4tQ24pOiBDb21t
YW5kIG1vZGUgbm9tZW5jbGF0dXJlIHVzZWQgdG8gaW5kaWNhdGUgdGhlIG51bWJlciBvZgphY3Rp
dmUgcGlucyB1c2VkIGZvciB0aGUgaW5zdHJ1Y3Rpb24gKEEpLCBhZGRyZXNzIChCKSwgYW5kIGRh
dGEgKEMpLCBhbmQKdGhlIGRhdGEgcmF0ZSB1c2VkIGZvciBlYWNoLiBEYXRhIHJhdGVzKG4pIGNh
biBiZSBzaW5nbGUgKFMpIGFuZCBkdWFsIChEKS4iCgpBbHNvLCAiKHgteS16KSBub21lbmNsYXR1
cmUgaXMgZXF1aXZhbGVudCB0byhBUy1CUy1DUykgdW5sZXNzIG90aGVyd2lzZQpub3RlZC4iCgpX
aGF0J3MgYW4gImFjdGl2ZSBwaW4iPwoKVGhlbiBpZiBJIGxvb2sgYXQgSkVTRDI1MS0xLjAxIGFu
ZCBKRVNEMjUxQywgKEFuLUJuLUNuKSBpcyByZWZlcnJlZCB0bwphcyAicHJvdG9jb2wgbW9kZSIu
IFdyaXRlIEVuYWJsZSwgd2hpY2ggaXMganVzdCBhbiBpbnN0cnVjdGlvbiBjb21tYW5kCndpdGgg
bm8gYWRkcmVzcyBvciBkYXRhLCBpcyBzZWVuIGFzIGEgcmVxdWlyZWQgY29tbWFuZCBpbiBib3Ro
IDRELTRELTRECmFuZCA4RC04RC04RCBwcm90b2NvbCBtb2RlcywgYW5kIGl0J3MgZGVmaW5lZCBh
cyBhICIxLkEiIHRyYW5zYWN0aW9uCmZvcm1hdCBjb21tYW5kLiBBbmQgdGhlIHRyYW5zYWN0aW9u
IGZvcm1hdCBpczoKJycnClRoZSBmb2xsb3dpbmcgdHJhbnNhY3Rpb24gZm9ybWF0cyBhcmUgdXNl
ZCBpbiBQcm9maWxlIDEuMCBtb2RlIDhELThELThEOgpGb3JtYXQgMS5BOiBDb21tYW5kIGFuZCBD
b21tYW5kIEV4dGVuc2lvbgpGb3JtYXQgMS5COiBDb21tYW5kLCBDb21tYW5kIEV4dGVuc2lvbiwg
NC1ieXRlIEFkZHJlc3MsIOKAmG7igJkgTGF0ZW5jeQpDeWNsZXMsIGFuZCBSZWFkIERhdGEKRm9y
bWF0IDEuQzogQ29tbWFuZCwgQ29tbWFuZCBFeHRlbnNpb24sIGFuZCA0LWJ5dGUgQWRkcmVzcwpG
b3JtYXQgMS5EOiBDb21tYW5kLCBDb21tYW5kIEV4dGVuc2lvbiwgNC1ieXRlIEFkZHJlc3MsIGFu
ZCBXcml0ZSBEYXRhCicnJwoKU28gYWNjb3JkaW5nIHRvIHRoZXNlIHN0YW5kYXJkcyBtYXliZSB3
ZSBzaGFsbCByZWZlciB0byBpdCBhczoKV1JFTi04RC04RC04RC0xQT8gVGhpcyBzZWVtcyBsZXNz
IGludHVpdGl2ZSB0aGFuIDhELTAtMCwgYnV0IEkgdGhpbmsgaXQKYWxsIGRlcGVuZHMgb24gd2hh
dCdzIGFuICJhY3RpdmUgcGluIi4gSSB0aGluayBpdCBkZXNjcmliZXMgdGhlIHByb3RvY29sCm1v
ZGUsIGFuZCBub3Qgd2hhdCdzIGFjdHVhbGx5IHNlbnQgb24gdGhlIGxpbmUuIEFzIHdlIHNhdywg
V1JFTiBpcwpjb25zaWRlcmVkIGFuIDhELThELThEIGNvbW1hbmQsIGFuZCBub3QgYW4gOEQtMC0w
IGNvbW1hbmQuCgpGb3IgZHVhbCBtb2RlLCB3aGljaCBpcyBub3QgY292ZXJlZCBieSB4U1BJLCBJ
IGd1ZXNzIHdlIGNhbiB1c2UgdGhlCnNpbmdsZSBzcGkgdHJhbnNhY3Rpb24gZm9ybWF0cyAwLntB
LEIsQywuLi59LgoKSG93IGRvIHlvdSBmZWVsIGFib3V0IGEgT1AtQW4tQm4tQ24tdHJhbnNhY3Rp
b24tZm9ybWF0LAoJd2hlcmUgQSwgQiwgQyBpcyB7MSwgMiwgNCwgOH0KCW4gaXMge1MsIER9Cgl0
cmFuc2FjdGlvbiBmb3JtYXQgaXMgezAsMSwyLDN9e0EsQixDLC4uLn0KCkNhcmUgbXVzdCBiZSB0
YWtlbiBjYXJlIG9mIGF0IHRoZSB0cmFuc2FjdGlvbiBmb3JtYXQsIGFzIEkgc2VlIHRoZXJlIGFy
ZQphIGZldywgZGVwZW5kaW5nIG9uIHRoZSB4U1BJIHByb2ZpbGUgYW5kIHByb3RvY29sIG1vZGUu
CgpDaGVlcnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
