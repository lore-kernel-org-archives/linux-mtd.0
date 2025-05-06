Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E060DC3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFqqO1dVZOI+JRNcj90Ns2njU8pjygQorcgtkmC0xUs=; b=dqvXAtKTdb97de
	Jnl0VwQQjpR6TB92wyt5gr1qeAbuJ/ZslzziuWlZzvmuk1L1R8jxbD9PIx7HPOznpiEU8vt31vsOb
	Y2Q3LEZ3uiTIhyNP3mV8tj4aRvxzRt9y6BLByD1UyaznE+14ghkVDGHCk9pFnPCZTY8Rb6U8mhdvI
	lml1oeR0siTmzh9xI0rBSy7rWPoI6e0xV26szKzLeqvWNmIxFXzqH4Uc3xQXEoB+f2YuviwLdrtO3
	OSnqGScTCgAKcW8wklYjMuk/C7q6KOSBguZqhDybgvFrxTH6rBc5mDqGUplIrf89xED1cHK6xQwbf
	q1qpxAJXM9lXuZN5uKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGhX-0000000Bmao-3E0Z;
	Tue, 06 May 2025 11:43:07 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCF7b-0000000BUvu-3xqW
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 10:01:57 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54addb5a139so6167229e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 May 2025 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746525714; x=1747130514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbTMYRXxjWwDv34DNkvnpHKQi/e+RgRDGWrhgBctL18=;
        b=ROlDevSjhnRp0G0DgFYTyQRomUruPaB1waBCElO58cpUx2fdbKCPxvTLvAoGhAxlpd
         qzOyagSQJpCPOUiVnBgWdWxCXX30+kCvpPUHMqffgOJaV7q4Dsg0x/iCBcsotOBC2Ffi
         b+54vghJ1+SSfbJ3sQ+F6+TNgH/lncJgjLfWnqT7HE8XUpQIzxfti0wC223ncDT4e7jW
         35kt20g9BpenMPY9xC37IaCaHQT+ucRpjK5paDetjSLcMZxvFRWLDufDRxJsoSM8FxeH
         s+B1Ag+sD5t0NtdwXA9CpIZDsQY9noQWskp8sSryihU43OrEDA5IGmsJ5fJz+9b/FAaX
         wLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525714; x=1747130514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbTMYRXxjWwDv34DNkvnpHKQi/e+RgRDGWrhgBctL18=;
        b=PDCRy+9qnWdlyUtLwFlx6vp6fpKeLflC7Lh1rre7FaYkWGhyxfcgU7G5Wbq8x4oZap
         6Emt03eIOWQNZLxUBdrvgLmX6TEdlRqiITu3GNQeaBfoQs3t13RsgqpFGCvscJYhUd0P
         q5KXL0tGVhSgKwu56aYxKEpXldhRDb6pErCyUh6zzCa+wLLiTiiDNTdPycluNaZiZKBB
         ORAAR0EO/IgtticHwsR0ist40TjEX6/eV2QcIdf3BrNgYK9+g0unzQOlEMvDASTiHvBY
         Y4C3HPxAWHBXEE2/BNF9vx69VfEOvlGvD0pQ4SfQOh5khFDlPSXicysyW/sTfardpdMw
         hkYg==
X-Forwarded-Encrypted: i=1; AJvYcCUiRVAPgRHlExCd7h1HiYUSvB0y8uy2YWGqRXxFgyT3mr95GtugZoQm93NN7gcomqHpRgPsEcFitfU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxofGneka6UCKH3dTy/sXoPcF6eDm/SQl8+m8+7vKtVJjL1CflX
	ovv7X8ZIJOJDVquEhtM1WfWvnG0nuZwXL6mlm/MEprros/XUPRfHFmnXWOdyq3Ldfgxd7T04IAo
	4qxPS1RDa0M8iFy9GgTX4T6/EcSE=
X-Gm-Gg: ASbGncsNdM3lV7/d5VQU/74IO4tLsReNaPcTuD6m+KMW0EqoreXrP/Dt8MSOX41GbF5
	NVdCz4Wz2F1ejq2X8U0Dmpc/d8sFKDeGe1sZAnIxngld2bD73hTps5inpBLYnpo2rvqt5qKaMZ3
	cEAZcX78Ly4eGMJyY6NdIWzFQ=
X-Google-Smtp-Source: AGHT+IGv0RdCR9/f9UfmoOB9YYGS3ew7syQiCP7mmHmSMLskA/JEOQ42E6LtkmFRgOw2dMJXoDe5ainLTW0mtckViVE=
X-Received: by 2002:a05:6512:31c8:b0:54d:65e8:31b8 with SMTP id
 2adb3069b0e04-54f9efb759fmr3022300e87.5.1746525713807; Tue, 06 May 2025
 03:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <aBSEwag_ducqOwy7@stanley.mountain> <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
In-Reply-To: <aBnXPYLSNJASR51f@stanley.mountain>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 6 May 2025 18:01:15 +0800
X-Gm-Features: ATxdqUFgHZm6UcwG7A_xWG4kv2LDq7RKrYskxuQhJqrp2afgGaTv65Pp7s5MCYs
Message-ID: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in ls1x_nand_dma_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030155_980869_7485B6B9 
X-CRM114-Status: GOOD (  28.10  )
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

T24gVHVlLCBNYXkgNiwgMjAyNSBhdCA1OjMy4oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDA2LCAyMDI1IGF0IDA1OjE2
OjAzUE0gKzA4MDAsIEtlZ3VhbmcgWmhhbmcgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAyLCAyMDI1
IGF0IDQ6MznigK9QTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+IHdy
b3RlOgo+ID4gPgo+ID4gPiBUaGUgImRlc2MiIHZhcmlhYmxlIGlzIE5VTEwgYW5kIFBUUl9FUlIo
TlVMTCkgaXMgemVyby9zdWNjZXNzLiAgUmV0dXJuCj4gPiA+IGEgbmVnYXRpdmUgZXJyb3IgY29k
ZSBpbnN0ZWFkLgo+ID4gPgo+ID4gPiBGaXhlczogZDJkMTBlZGUwNGIxICgibXRkOiByYXduYW5k
OiBBZGQgTG9vbmdzb24tMSBOQU5EIENvbnRyb2xsZXIgRHJpdmVyIikKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPgo+ID4gPiAtLS0K
PiA+ID4gSXQncyBoYXJkIHRvIGtub3cgd2hhdCB0aGUgcGF0Y2ggcHJlZml4IHNob3VsZCBiZSBo
ZXJlLiAgSWRlYWxseSB3aGVuIHdlCj4gPiA+IGFkZCBhIG5ldyBkcml2ZXIgd2Ugd291bGQgdXNl
IHRoZSBwYXRjaCBwcmVmaXggZm9yIHRoZSBkcml2ZXIuCj4gPiA+Cj4gPiA+IFRpcmVkOiBzdWJz
eXN0ZW06IEFkZCBkcml2ZXIgWFhYCj4gPiA+IFdpcmVkOiBzdWJzeXN0ZW06IFhYWDogQWRkIGRy
aXZlciBmb3IgWFhYCj4gPiA+Cj4gPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3NvbjEt
bmFuZC1jb250cm9sbGVyLmMgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiBpbmRleCA2YTM2OWIxYzdkODYu
Ljg3NTRiYjRmOGI1NiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9v
bmdzb24xLW5hbmQtY29udHJvbGxlci5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2xvb25nc29uMS1uYW5kLWNvbnRyb2xsZXIuYwo+ID4gPiBAQCAtMzcxLDcgKzM3MSw3IEBAIHN0
YXRpYyBpbnQgbHMxeF9uYW5kX2RtYV90cmFuc2ZlcihzdHJ1Y3QgbHMxeF9uYW5kX2hvc3QgKmhv
c3QsIHN0cnVjdCBsczF4X25hbmRfCj4gPiA+ICAgICAgICAgZGVzYyA9IGRtYWVuZ2luZV9wcmVw
X3NsYXZlX3NpbmdsZShjaGFuLCBkbWFfYWRkciwgb3AtPmxlbiwgeGZlcl9kaXIsIERNQV9QUkVQ
X0lOVEVSUlVQVCk7Cj4gPiA+ICAgICAgICAgaWYgKCFkZXNjKSB7Cj4gPiA+ICAgICAgICAgICAg
ICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBwcmVwYXJlIERNQSBkZXNjcmlwdG9yXG4iKTsK
PiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZGVzYyk7Cj4gPiA+ICsgICAgICAg
ICAgICAgICByZXQgPSAtRU5PTUVNOwo+ID4KPiA+IFRoYW5rIHlvdSBmb3IgZml4aW5nIHRoaXMg
aXNzdWUuCj4gPiBIb3dldmVyLCBJIGJlbGlldmUgLUVJTyBpcyBtb3JlIGFwcHJvcHJpYXRlIHRo
YW4gLUVOT01FTSwgc2luY2UKPiA+IGRtYWVuZ2luZV9wcmVwX3NsYXZlX3NpbmdsZSgpIGNhbiBy
ZXR1cm4gZXJyb3JzIG90aGVyIHRoYW4gLUVOT01FTS4KPiA+Cj4KPiBJdCdzIG5vdCBhbiBJL08g
ZXJyb3Igc28gLUVJTyBpc24ndCBjb3JyZWN0Lgo+Cj4gVGhlcmUgYXJlIGEgYnVuY2ggb2YgcmVh
c29ucyBpdCBjb3VsZCBmYWlsIGJ1dCBtb3N0IGxpa2VseQo+IGRtYV9wb29sX2FsbG9jKCkgZmFp
bGVkLiAgSSB0aGluayAtRU5PTUVNIGlzIGNvcnJlY3QuCj4KCkhhdmUgeW91IHJldmlld2VkIHRo
ZSBpbXBsZW1lbnRhdGlvbiBvZiBsczF4X2RtYV9wcmVwX3NsYXZlX3NnKCk/CkVycm9ycyBpbiB0
aGlzIGZ1bmN0aW9uIGNhbiBiZSBjYXVzZWQgbm90IG9ubHkgYnkgLUVOT01FTSwgYnV0IGFsc28g
YnkgLUVJTlZBTC4KTW9yZW92ZXIsIGluIG1vc3QgY2FzZXMsIHRoZSBlcnJvciBoYW5kbGluZyBs
b2dpYyBmb3IKZG1hZW5naW5lX3ByZXBfc2xhdmVfc2luZ2xlKCkgcmV0dXJucyAtRUlPIHdoZW4g
dGhlIGZ1bmN0aW9uIHJldHVybnMKTlVMTC4KCj4gcmVnYXJkcywKPiBkYW4gY2FycGVudGVyCj4K
CgotLSAKQmVzdCByZWdhcmRzLAoKS2VndWFuZyBaaGFuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
