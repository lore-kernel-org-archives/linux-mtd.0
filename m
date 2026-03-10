Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C31DEB1069
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f07jBdKWaOAsAbjLP2OyDd0tt4NaLBFLbSO0nPU3d0M=; b=kmI4MVNTQI5oUJ
	n3FazEUkvJBlgRWFdOuFnqF13BUMKniYxou6cSf23QJwvUci9/o2lYMlTRvIX55aSN2isB4GeYAh4
	4VqkF1szr7tzl1sS1+018hJ4GuujXOT+bLVqKKM8vn5O4iPgr1EiUqrRaSDpTeLvYsLT6rTCiJTVs
	p8LXbd+bfoDeMR/PjDPw9+prHXR3KlGkvjb3PzMBi3m28mBifYiXKsiLukpNKKQhfcbMumMW9BYzY
	5I5gWGxaM/dzbL7undIu/Sj1SUGaBh7xnh1Qh0DjY7Xt91SCI6bmvzBZN+e+KXVJaeLUkk+jxKQzC
	LXkuPhKr083+40fh/wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyiP-00000009lNH-0Osf;
	Tue, 10 Mar 2026 15:09:45 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyiM-00000009lMN-2ZL0
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 15:09:43 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-359832fc558so7653517a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773155381; x=1773760181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Mj9BS/i+0Cnv4b38mlO8gz3Wkd76Iaa/CrSPSLBAT4=;
        b=QYWJI7QxH52TntQVWHbejjoiAgoRuYp1Vw/iQjmDUs8uHsEjOA2c2k6ycxPd4XvEmz
         CiAxBYQ1lWBrawdMYedAC1kJZqCZxOoyqCDWK3G/4KYJopcF/2xKNKTNviTZydJtHtfs
         j2FhKpd/UclDD9eAZszM8L5LVI4YnSBUlNs7Kfvr5KfC4NTX5qKxvPOTSneGYZwpY7Bg
         bZhH7bb15p5URDLWu4fLWSlqSrDlz/q337YowgU6AIC8BI9x+NIwB5QctUGlsvPuSW3R
         E4ibahm1WBI72Ue+EvUI9oZyhLRxHR3K55ovy1+9Htx1gPJRAvvZjexi3EMhwV70PdDe
         RlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155381; x=1773760181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Mj9BS/i+0Cnv4b38mlO8gz3Wkd76Iaa/CrSPSLBAT4=;
        b=MX9UhRjY4B4B6BdUz7FsKNSSWX+csUWcVXXmEmZWo/ighQdhh54H8P5iA/J7E35IIp
         VXAeFEVdB3WU4aRwCxt/lD1WOjDInsrHvdZD0+RLSEUcu+htWJjnXPK7+95Nz3wRcORJ
         T4FrApAMVTanzMHXV+G1e09aysUTJbj5NJYm7nNzjzOWB6YU0H6MBp38RYbFVjJEfjrc
         ROqdCORx5Sw0ObbwxMzdzqTgIBvfojZfLIxkgJCST3XP3VB8veAFmCR+u3wHjYF/BAUQ
         ty36m0rYSPSVNnuWC3GLddBGRjuPNKVaD3R18+m9VXyyGM5nt55uuTzsocYBd1aepEaX
         QMIg==
X-Forwarded-Encrypted: i=1; AJvYcCVc1RrKPqhjhhUAM6hZN8HQneXL7kWcQJt0Lts+mCzcvUE+lCfsb7pW408wOdoV8hXtaJy9EpiKzwk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGUMqiD1bz9hd+kcBeaN7ScYEDoE//qHEVO9XJI9GmYfrM3N6A
	1iBTfKB6T9Va/ua/GnCVrSCFfseaxK99cYOL24v3WBf5vCzdIS11EnBg
X-Gm-Gg: ATEYQzyZZy3h1xoTXU9mE5LV9OD3KO/tGP7LRuP9OHCdjGLlDToh0jCm+cPyqT5TMId
	zfk63flW76tTAVE4UvoENFxbw0YyFPGQ3QZ4TuTEDYMh8lmVAIXeUQrFE97mEhvnaLHqsCD891s
	1JkAjIv/efKVIfroGP5rnr46aeJS7rMaSV000ZkVDFxdcw65k8MYO6nwdjqH3QTPsrHKxl93/F/
	SuXhvegF8pzdC3ourGNgQCRQwoueFkQC8bPhRbTxGINFHLTreLiW3nV7Mentc/15St0/fTjCIVI
	sRQGjpC7dB3ZqWQeETqtr6DSInfZzLPwnPfaPUZrPYYTB7bfnWX9d9mGPeexHmGO/CqPbN6VvTm
	K32KiTa3k9PRZNOb8bKWbjoYV45k5I7JrPl8QPS0+FwwtkHR8DJfEMnzGwZ4XOaRsI6kTY6ajI6
	Rxojj/7medLn3gKee2pJJkR6VWYdFbxGBHlCScXb10/u+x2E6kp7XivO5nCYZ9+dvz6UcVm1UAt
	GLG5ZOj
X-Received: by 2002:a17:90b:3dcc:b0:359:8d95:4a4f with SMTP id 98e67ed59e1d1-359be34abc9mr13065777a91.32.1773155381203;
        Tue, 10 Mar 2026 08:09:41 -0700 (PDT)
Received: from ?IPV6:2401:4900:88c9:af93:8149:1d0:8df0:b0ab? ([2401:4900:88c9:af93:8149:1d0:8df0:b0ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e3casm3411101a91.11.2026.03.10.08.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:09:40 -0700 (PDT)
Message-ID: <218070f6-4876-45dc-adae-53400519d6de@gmail.com>
Date: Tue, 10 Mar 2026 20:39:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: mtd: st,spear600-smi: convert to DT
 schema
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260225-spear-v2-1-021bcb670601@gmail.com>
 <87bjgxoy2p.fsf@bootlin.com>
Content-Language: en-US
From: Akhila YS <akhilayalmati@gmail.com>
In-Reply-To: <87bjgxoy2p.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_080942_653145_9FF533D1 
X-CRM114-Status: GOOD (  22.96  )
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

Ck9uIDA5LTAzLTIwMjYgMjA6MjEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8gQWtoaWxh
LAo+Cj4gT24gMjUvMDIvMjAyNiBhdCAxNTowMjo1MCBHTVQsIEFraGlsYSBZUyA8YWtoaWxheWFs
bWF0aUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4+IENvbnZlcnQgU1RNaWNyb2VsZWN0cm9uaWNzIFNQ
RUFyNjAwIFNlcmlhbCBNZW1vcnkgSW50ZXJmYWNlIChTTUkpCj4+IENvbnRyb2xsZXIgYmluZGlu
ZyB0byBZQU1MIGZvcm1hdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWtoaWxhIFlTIDxha2hpbGF5
YWxtYXRpQGdtYWlsLmNvbT4KPiBHYXNwIDotKSBHb29kIHRvIHNlZSB0aGF0IHlvdSBhY3R1YWxs
eSBkaWQgZml4IHRoZSBpc3N1ZXMuIFRoYW5rcyBmb3IKPiBkb2luZyB0aGF0LiBCdXQgeW91J3Zl
IGJlZW4gc2VuZGluZyBhIHYyIGZvciBhIHBhdGNoIHRoYXQgaGFzIGFscmVhZHkKPiBsYW5kZWQg
aW4gVG9ydmFsZHMnIHRyZWUuIEluIHRoaXMgY2FzZSwgdGhlcmUgYXJlIG9ubHkgMiBwb3NzaWJp
bGl0aWVzOgo+IC0gc2VuZGluZyBhIHJldmVydCBvZiB0aGUgZm9ybWVyIHBhdGNoIGFuZCB0aGVu
IHRoaXMgb25lCj4gLSBzZW5kaW5nIGZpeGVzIGxpa2UgSSBkaWQKPiBJbiBubyBjYXNlIHdlIGNh
biBqdXN0IGFwcGx5IHRoaXMgb25lIGFzLWlzLgo+Cj4gQXMgaXQncyBiZWVuIHJldmlld2VkIGFs
cmVhZHkgYnkgUm9iLCBJJ2xsIHRha2UgdGhlIDMgZml4ZXMgdGhhdCBJCj4gcHJvcG9zZWQuCgoK
T2theSwgc3VyZSBub3QgYW4gaXNzdWUgbWlxdWVsLgoKPgo+IFsuLi5dCj4KPj4gKyAgY2xvY2st
cmF0ZToKPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzIKPj4gKyAgICBkZXNjcmlwdGlvbjogRnVuY3Rpb25hbCBjbG9jayByYXRlIG9mIHRoZSBTTUkg
Y29udHJvbGxlciBpbiBIei4KPiBUaGlzIGNsb2NrIHByb3BlcnR5ICh3aGljaCBJIGRpZCBub3Qg
YWRkcmVzcyBpbiBteSBzZXJpZXMpIGlzIGFwcGFyZW50bHkKPiBub3QgdXNlZCBhbnl3aGVyZSB1
cHN0cmVhbS4gVGhpcyBpcyBhIHZlcnkgbGVnYWN5IHByb3BlcnR5LCBhbmQgbXkKPiBmZWVsaW5n
IGlzIHRoYXQgaXQgaGFzIG5vdCBiZWVuIHVzZWZ1bCBmb3IgcXVpdGUgc29tZSB0aW1lIGFscmVh
ZHkgKGR1ZQo+IHRvIHRoZSBDQ0YgYmVpbmcgYWJsZSB0byBwcm92aWRlIGEgcHJvcGVyIGNsb2Nr
IHRyZWUgbm93KS4gSGVuY2Ugd2UgaGF2ZQo+IHR3byBjaG9pY2VzOiBjb25zaWRlcmluZyB0aGF0
IGl0IGRvZXMgbm90IG5lZWQgdG8gYmUgZGVzY3JpYmVkIGF0IGFsbCBpbgo+IHRoZSB5YW1sIGJp
bmRpbmdzIGJlY2F1c2UgaXQgaXMgKHZlcnkpIGRlcHJlY2F0ZWQgcHJvcGVydHksIHdlIG1pZ2h0
Cj4gd2FudCB0byBqdXN0IGRyb3AgaXQgb2ZmLiBPdGhlcndpc2UgeW91IG1heSBzZW5kIGEgcGF0
Y2ggc3BlY2lmaWNhbGx5Cj4gZm9yIHRoaXMgYWRkaXRpb24sIGhvd2V2ZXIgaW4gdGhpcyBjYXNl
IHlvdSBuZWVkIHRvIGZsYWcgaXQgZGVwcmVjYXRlZCwKPiBJIGJlbGlldmUuCgoKT2theS4KCj4K
PiBUaGFua3MsCj4gTWlxdcOobAoKLS0gCkJlc3QgUmVnYXJkcywKQWtoaWxhLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
