Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C7CCD195
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mu8npHtieAifx4dvsm78iDd9AGDXbl4dtYwfbsF2nq0=; b=X++i8QvVlq7Tm5
	/bHH1eCzX5765fJ5+ALfFzkVYB8BwDD8AKu9ZGoQD58nWrhFbFR1tcJIsYpRiDGlSsMJhMUy8sf/8
	PT3TR7SacNaibHzGNC0p1JA6QF2da43I3AG41WXcDNVFB8g/Z1armohHO0QvGEXXX3LMxmMqdTbFb
	G0vT8B9vzzcMrQIswH8Y6Ysf8tzosf0sl+MKfW2E/tmXWMVkUjwGmhO1V74yI9woeBBF297bCQtCe
	p0Qyfgk+bcw0bIEitPP+pVvWl5YOWeDdRkKBYOw8VLC1G3cLo7vDAvbSYG0mkIMJt9DMYCnDHdg0B
	ERsJu2SGxbva+9xDCYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqu-00000002R0A-2o14;
	Wed, 22 Oct 2025 10:13:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVqp-00000002Qxm-33vo
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 10:13:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-33e27cda4d7so587705a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2025 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761128031; x=1761732831; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P7bvsK2sVwN9lA/uy3EC8ga40hp3/IFLOS4kvysOKE=;
        b=m294ClvAtat9kj3ris4kGjyIfGbWUfcShpDA2NyeMTid4+PiPaHZnuKv67lFTXyqIA
         q0Bd6CdrOO9uBkWLKjz0fdgJ+cSpkRhFqPaJSnPc5CfbdJ9jz67DLeQbRspbP0Jwj/O0
         zBfPwB2qpKeVBZwgBmvS/x3CaQGkD9GuS0Ro9hAS+zszt0YJvcDjeNj9aCCwT6c/ifyH
         BFJgQXO3LocGCgNtrKv3UiGF9mL1ewtqDc0o+xUKVU456wejvNaAfPOm+MAuYMJTBmF+
         kwu62hdW8ArRdCGPOYpm/eYWoyUWZjPwI6kuF31vUHiO9yJT0Ym9BUTgHS9y/06pxOzc
         S3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128031; x=1761732831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P7bvsK2sVwN9lA/uy3EC8ga40hp3/IFLOS4kvysOKE=;
        b=B/aeQ9kCkkxKhCjg12IrZljNRVFYizcmtLnFSAk4A8DyfhSXBr4xs4FEQI37xrFpof
         Vfya+SZMhpevwWK5wcCSRcGw5+iB6AfXE16AEk2a+vODERFv2hIFzTPG/1a6PxMh/DNO
         Q8rr/sjcmA2UIq0Sxtf2NOsHa14biH6IyvbDzce6e5BM2eImDvMkt0u6rXzMvIDRRGJD
         HcB8KZcaERKTUewsK8phOH0woZkavf6TA0QnenCy1DpBNYhQeAslB8Zj/BvHjOCPoYTm
         pyQxLj7wtgAKaOrWqHR/Eta9XsJ38/xAHvVSA+FTgzz1J6jLHfgnhUOFCQkdVPsFYd1G
         kEyA==
X-Forwarded-Encrypted: i=1; AJvYcCVzSsTgaHibwNsBKGw7ALhJQO+ABrNN5M6PIuHc3twem2ssn3rIYDS5NNLdnfXuZZDrX61NhWxvf/g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2LPyG9/NXgmWJziMgCGTMimtJJMFTFoWh5vya3H8lQLnfL/kh
	Fo82KNy5bOKs0phXWcwRR1XvGOz/PQjdDdiK2MDE0H63m1S+NeAtuWH5
X-Gm-Gg: ASbGnct2kx8tpH8auAlUjNQAhOHCBLXunGVW/Ya2Z42fD93qmKQhEdTAQG1n2ab9+py
	1gl3UmBlUMAppYJ4Z0Z1g6lyNeTAn+OVj6vqeBxmHnyVE+7dFp1AkFQpXjvSnBp7Xw8aRonL/xp
	vY3nPjdHOp7j0K8+hFSjqryfqoO8RF1W+RGWL25KvaxaN9tJdPKDQKAjd13YSSANGHdyfcKwHN/
	cZZucTjxVG3qMVbRCeklJQpxvpeOyg+8CUKiupWbfDrcXFcMPbg3cj6Sk5Octb2w8LdA9VKJP+n
	Yg8qm+Jh37gbwL4k42l2oqragWW37dNL04Tztxhh74wiMCZKDPUGS52LOdL3HPF5aPlIlvoSTTT
	y6R/7lZ31arAEEhqEWfgdZNRG0zT1FIZNN6MG8Q1q+/f9MBDSgOELs3Cwevk4A9XotTP3SJRd/q
	b5PExVSNy/Z39OhM3F14qg4PWgaCUi08fx5COOiTO7NSTXT8TjGw==
X-Google-Smtp-Source: AGHT+IH5o7Y8lzLyBnCro6lbcAsLtmI2D6CLO+EFPq8WhZqx0C8KzjC0TEtoYNySI4TY/LcAfrkQmw==
X-Received: by 2002:a17:90b:1c06:b0:31c:39c2:b027 with SMTP id 98e67ed59e1d1-33e21ef1205mr4504235a91.7.1761128030798;
        Wed, 22 Oct 2025 03:13:50 -0700 (PDT)
Received: from [192.168.0.5] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm14398008b3a.7.2025.10.22.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:13:50 -0700 (PDT)
Message-ID: <53b6f061-d8b1-4228-b647-9d229f03b999@gmail.com>
Date: Wed, 22 Oct 2025 19:13:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-renesas-soc@vger.kernel.org
References: <20240914220859.128540-1-marek.vasut+renesas@mailbox.org>
 <0e0f1195-fd08-4d8b-a247-3c94b5628081@linaro.org>
 <c0cd93b5-4e94-4e4b-9b84-c96e024bcc3e@mailbox.org>
 <ee1d4085-df65-4e77-844f-c49658cd0713@linaro.org>
 <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
 <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
 <6426cb80-249b-4ebd-9826-91c87299f7b6@mailbox.org>
 <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <31d9c086-4a5e-4f0c-b7b0-b948ac465aae@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_031351_780503_EE351549 
X-CRM114-Status: GOOD (  20.13  )
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

SGkgVHVkb3IgYW5kIE1hcmVrLAoKSSBoYXZlIHN1Ym1pdHRlZCBuZXcgc2VyaWVzLgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNTEwMjItczI1ZnMtcy1zbXB0LWZpeHVwLXYx
LTAtY2UyNmQ0MDg0YjJkQGluZmluZW9uLmNvbS9ULyNtMmZhNDFiODllMzZkNjA2MWRmOWU5Nzlm
NDljNTczZTQ2ZmQwZDVjNAoKUGxlYXNlIHJldmlldyBhbmQgdGVzdCB0aGVuIGdpdmUgZmVlZGJh
Y2suCgpUaGFua3MsClRha2FoaXJvCgpPbiAxMC8yMC8yMDI1IDg6MzUgUE0sIFR1ZG9yIEFtYmFy
dXMgd3JvdGU6Cj4gCj4gCj4gT24gMTAvMTcvMjUgNTowNCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6
Cj4+IE9uIDEwLzEzLzI1IDU6NDEgUE0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+Cj4+IEhlbGxv
IFR1ZG9yLAo+IAo+IEhpIQo+IAo+Pgo+Pj4+PiBUaGUgIkluZGV4IFZhbHVlIiBzaGFsbCBiZSB0
aGUgbWFwX2lkIHRoYXQgeW91IHBhc3NlZCBpbiB0aGUgY29kZToKPj4+Pj4gc3BpX25vcl9wb3N0
X3NtcHRfZml4dXBzKG5vciwgJm1hcF9pZCk7Cj4+Pj4+Cj4+Pj4+IENhbiB5b3UgcGxlYXNlIHBy
aW50IHRoZSBtYXBfaWQgdmFsdWUgdGhhdCB5b3Ugb2J0YWluIHdpdGhvdXQgdXBkYXRpbmcgaXQ/
Cj4+Pj4KPj4+PiAweDQKPj4+Cj4+PiBUaGlzIHRyYW5zbGF0ZXMgdG8gQ1IzTlZbM10gPSAxLCBD
UjFOVlsyXSA9IDAswqAgQ1IzTlZbMV0gPSAwLgo+Pj4+Cj4+Pj4+IExldCdzIGFsc28gcHJpbnQg
dGhlIHZhbHVlcyBvZiBDUjNOViBhbmQgQ1IxTlYuCj4+Pj4KPj4+PiBCb3RoIDB4MCBhbmQgMHgw
IC4KPj4+Cj4+PiBCdXQgaGVyZSBDUjNOViBpcyAwLCBpdCBjb250cmFkaWN0cyB0aGUgcmVzdWx0
IGZyb20gYWJvdmUuCj4+Cj4+IE1heWJlIEkgbWVzc2VkIHVwIGFuZCB3YXMgcmVhZGluZyBpdCB0
aGUgd3Jvbmcgd2F5ID8KPj4KPj4+IE1heWJlIGl0J3MgdGhlIHNhbWUgcHJvYmxlbSB0aGF0IFRh
a2FoaXJvIGlkZW50aWZpZWQ6IHRoZSBmbGFzaCBuZWVkcwo+Pj4gOCBkdW1teSBjeWNsZXMsIGJ1
dCB0aGUgY29kZSB1c2VzIHplcm8gZHVtbXkgY3ljbGVzLCByZXN1bHRpbmcgaW4KPj4+IHJlYWRp
bmcgZ2FyYmFnZSBkYXRhLCBkZXBlbmRpbmcgb24gd2hldGhlciB5b3VyIElPIGxpbmVzIGFyZSBw
dWxsZWQgdXAvZG93bgo+Pj4gb3IgZmxvYXRpbmcuCj4+Pgo+Pj4gQ2FuIHlvdSByZWRvIHRoZSB0
ZXN0IHdpdGggdGhlIGZvbGxvd2luZyBwbGVhc2U/Cj4+Cj4+IFN1cmUsIGFsdGhvdWdoIEkgc2F3
IHNvbWUgZnVydGhlciBkaXNjdXNzaW9uIGJldHdlZW4geW91IGFuZCBLdXdhbm8tc2FuICwgaXMg
dGhpcyBzdGlsbCBhcHBsaWNhYmxlID8KPiAKPiBJdCdzIHN0aWxsIGFwcGxpY2FibGUsIGl0IHdp
bGwgY29uZmlybSB3aGF0IEt1d2Fuby1zYW4gZGlzY292ZXJlZDoKPiB0aGUgZmxhc2ggbmVlZHMg
OCBkdW1teSBjeWNsZXMgZm9yIHVzaW5nIHRoYXQgcmVhZCByZWcgY29tbWFuZC4KPiAKPiBXZSds
bCBhbHNvIG5lZWQgYSBob29rIHRvIGFtZW5kIHRoZSBDUjNOVlsxXSB2YWx1ZSAod2hpY2ggaXMg
cmVzZXJ2ZWQsCj4gemVybyBvbiBzb21lIGZsYXZvcnMgb2YgZmxhc2gpIGFuZCByZXBsYWNlIGl0
IHdpdGggMSwgc2ltaWxhciB0byB3aGF0Cj4geW91IGRpZCBpbiB0aGlzIHBhdGNoLgo+IAo+IFlv
dSBjYW4gZWl0aGVyIHRlc3Qgb3IgbGV0IEt1d2Fuby1zYW4gY29tZSB1cCB3aXRoIGEgcGF0Y2gg
YWRkcmVzc2luZwo+IGJvdGggaXNzdWVzIGFuZCB0ZXN0IGhpcyBwYXRjaCBhZnRlcndhcmRzLCBz
eW5jIHVwIHdpdGggaGltIHBsZWFzZS4KPiAKPj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+PiBpbmRleCAy
MTcyN2Y5YTRhYzYuLjg1NDQzYzkwM2U1OSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3Ivc2ZkcC5jCj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+Pj4gQEAg
LTc1Miw3ICs3NTIsNyBAQCBzdGF0aWMgY29uc3QgdTMyICpzcGlfbm9yX2dldF9tYXBfaW5fdXNl
KHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IHUzMiAqc21wdCwKPj4+IMKgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWRfZGF0YV9tYXNrID0gU01QVF9DTURfUkVBRF9EQVRB
KHNtcHRbaV0pOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5hZGRy
X25ieXRlcyA9IHNwaV9ub3Jfc21wdF9hZGRyX25ieXRlcyhub3IsIHNtcHRbaV0pOwo+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5yZWFkX2R1bW15ID0gc3BpX25vcl9zbXB0
X3JlYWRfZHVtbXkobm9yLCBzbXB0W2ldKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5vci0+cmVhZF9kdW1teSA9IDg7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBub3ItPnJlYWRfb3Bjb2RlID0gU01QVF9DTURfT1BDT0RFKHNtcHRbaV0pOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkciA9IHNtcHRbaSArIDFdOwo+Pj4gwqAg
QEAgLTc2Nyw2ICs3NjcsOCBAQCBzdGF0aWMgY29uc3QgdTMyICpzcGlfbm9yX2dldF9tYXBfaW5f
dXNlKHN0cnVjdCBzcGlfbm9yICpub3IsIGNvbnN0IHUzMiAqc21wdCwKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBDb25maWd1cmF0aW9uIHRoYXQgaXMgY3VycmVudGx5
IGluIHVzZS4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcF9pZCA9IG1hcF9pZCA8PCAxIHwgISEo
KmJ1ZiAmIHJlYWRfZGF0YV9tYXNrKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGRldl9lcnIobm9yLT5kZXYsICJpID0gJWQsIGJ1ZiA9ICUwMngsIG1hcF9pZCA9ICUwMnhcbiIs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaSwgYnVm
WzBdLCBtYXBfaWQpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IFNvcnJ5IGZvciB0aGUgbGF0
ZSByZXBseS4KPiB5ZWFoLCBubyB3b3JyaWVzLCBpdCdzIHN0aWxsIGZyZXNoLgo+IAo+IENoZWVy
cywKPiB0YQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
