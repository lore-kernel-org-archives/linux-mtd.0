Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00034C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GacfLKIhAXfuTqeot+UKQPEumA1xWQDyYxVTvZaNzOE=; b=IdQvXzmiE6YL8icAQa/u2zCzBV
	J8b0dD2uKnt36eT/KTK9IUdN9sV00kAzBKhZKX0ur7mqhTLXfz4+LedOk6VV73Fp8JrZYSlFUwc/L
	70I6DIcGHU1iRE6Qg3N5Qdu9p48dHzneMXQix8bwyBoFBYjrKljLC66pd9gtssa/Ym9zOEJVS0RBN
	XBLcyOZEDFKHrETXn+Kz5WU5Jaaa3WifPndTB6oB4vvV0yBDKWjRsgShehbX7C7HcacrEPeTTNNUy
	koYdwQG4HgAlmzk8gAXZGAy/Ew5S2qaRwfy8pK1mUW50NmhUjYiO6jnsALZxiBjtMkhcVULrsRwev
	kb+rJqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrl2d-001htU-KC; Mon, 29 Nov 2021 18:06:15 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrl2X-001hrs-PP
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 18:06:11 +0000
Received: by mail-lj1-x229.google.com with SMTP id v15so36221167ljc.0
 for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2021 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tAEyj+P1GwPw8t/okpqzCX7GoYf79nGN9WlydqQpImA=;
 b=hpuo+Ib04BIuALv/T1Kc7Tkh0HujgdpvzwOKAy3j/p/Dle9ALLyDeYxz2I8t40D/cL
 Ozf2WysP180g3+ryqjRER41b8Q9Gh0HJKojGcjwdy27hmOswVoVSP5K4DS/9AfV5h8Ni
 HyNid4r3MAqeBPWaSNoPGk1hVzwT/rPAjmKzbPsZ8K37qRHbhBrwxviqUugokKHa0BnP
 uWAvGQz76sLa/8EOSR/vEP97gwa+T24KmUNyPB1FNLBozbbRMb98nSjrLC4hOCeSMx1y
 gQb2xHJcsHZEsBAaJG5SDMLkpq98Q86HpVxTbexI/kwKBOKLRuDH8nhqW9tzSUTZdCa/
 e/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tAEyj+P1GwPw8t/okpqzCX7GoYf79nGN9WlydqQpImA=;
 b=5vKpVuPlEnHeiIO/GezM/iwPYg79iso3gIAQE/9VjfgyKg7Mb5V7YEgDRWmBDX6LJA
 day7ZiDiNcUB5bIHUDKETK3Z3m4d9ed9KotFq1XiWoE7BxLFKWkx78Wo4cSafeBzY8ZE
 X1CilbQblhg/rR9puwl7pWlJXenRZMFT1bZiHHle98vjL5zw9i8w4WPllKCXNik9BfW8
 rKRLRE3awS1JC+hrD2La7JFTwBbufe8aOcOS06ezOCh9SFOPVUknQsXaY3RdxGTMt8eY
 et8qTgbKKLGY2agYIHgxwmEiqMIqfZKx/ReKKBuUwE9z1wT4+bD7iOrvHtVgEBecDdHc
 Q2MA==
X-Gm-Message-State: AOAM533JEug4CNyE9ybxXAJxZIPiWj4T/RencYos1JOD97aqrIT+zN5m
 +5zMTp6AkImsYbdnadeQcPE=
X-Google-Smtp-Source: ABdhPJxuz/PYZhp3MA67amf0adstN770tPQR9dKihRo7Kp6xBNG5Vj82xhQdexSi9PtADeVw4NxgNg==
X-Received: by 2002:a2e:bba1:: with SMTP id y33mr50836072lje.263.1638209167535; 
 Mon, 29 Nov 2021 10:06:07 -0800 (PST)
Received: from [172.16.0.150] ([31.148.138.103])
 by smtp.gmail.com with ESMTPSA id d39sm1422983lfv.78.2021.11.29.10.06.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 10:06:07 -0800 (PST)
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, nagasure@xilinx.com, richard@nod.at,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
References: <20211127180758.30884-1-okitain@gmail.com>
 <20211129095559.01aa63a6@xps13>
From: Olga Kitaina <okitain@gmail.com>
Message-ID: <3da5dff5-53d4-15db-075d-9b195f2f75dd@gmail.com>
Date: Mon, 29 Nov 2021 21:06:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129095559.01aa63a6@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_100609_852729_661A020C 
X-CRM114-Status: GOOD (  29.48  )
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

SGkgTWlxdWVsLAoKT24gMjkuMTEuMjAyMSAxMTo1NSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBPbGdhLAo+IAo+IFBsZWFzZSBhZGQgYWxsIHRoZSBNVEQgbWFpbnRhaW5lcnMgaW4gY29weSwg
YXMgcmVxdWVzdGVkIGJ5Cj4gZ2V0X21haW50YWluZXJzLnBsLgo+IAo+IG9raXRhaW5AZ21haWwu
Y29tIHdyb3RlIG9uIFNhdCwgMjcgTm92IDIwMjEgMjE6MDc6NTgKPiArMDMwMDoKPiAKPj4gQWNj
b3JkaW5nIHRvIHRoZSBBcmFzYW4gTkFORCBjb250cm9sbGVyIHNwZWMsCj4+IHRoZSBmbGFzaCBj
bG9jayByYXRlIGZvciBTRFIgbXVzdCBiZSA8PSAxMDAgTUh6LAo+PiB3aGlsZSBmb3IgTlYtRERS
IGl0IG11c3QgYmUgdGhlIHNhbWUgYXMgdGhlIHJhdGUKPj4gb2YgdGhlIENMSyBsaW5lIGZvciB0
aGUgbW9kZS4KPiAKPiBJIGNvbXBsZXRlbHkgbWlzc2VkIHRoYXQsIHdoZXJlIGRpZCB5b3UgZ2V0
IHRoZSBpbmZvcm1hdGlvbj8KClRoZSAiRGF0YSBJbnRlcmZhY2UgVHJhbnNpdGlvbnMiIGNoYXB0
ZXIgb2YgdGhlIHNwZWMgY29udGFpbnMgdGltaW5ncyBmb3IgZmxhc2ggY2xvY2sgc2V0dXAgaW4g
TlYtRERSCmFuZCBOVi1ERFIyIG1vZGVzLiBUaGUgInRpbWUgcGVyaW9kIiBvZiB0aG9zZSBjbG9j
a3MgaXMgZXF1YWwgdG8gdENLIGluIE5WLUREUiBhbmQgdFJDIGluIE5WLUREUjIuCgpUaGUgc2Ft
ZSBjaGFwdGVyIHNob3VsZCBoYXZlIGluZm9ybWF0aW9uIGFib3V0IG5lY2Vzc2FyeSBzdGVwcyB0
byBzd2l0Y2ggZnJvbSBOVi1ERFIgdG8gU0RSLAp3aGljaCBpbmNsdWRlcyBzZXR0aW5nIHRoZSBm
bGFzaCBjbG9jayB0byAxMDAgTUh6LgoKCkp1c3QgdG8gbWFrZSBzdXJlIGknbSBub3Qgc2hvb3Rp
bmcgbXlzZWxmIGluIHRoZSBmb290OiBhbSBJIGNoYW5naW5nIHRoZSByaWdodCBjbG9jaz8KVGhl
IGRvY3VtZW50YXRpb24gcG9pbnRzIG91dCB0aGF0IHdlIGhhdmUgdG8gY2hhbmdlIGZsYXNoX2Ns
aywgd2hpY2ggaSB0aG91Z2h0IHdhcwpuZmMtPmNvbnRyb2xsZXJfY2xrIGFuZCBzZXQgdXAgYnkg
YW5hbmQtPmNsaywgYnV0IGl0IHNlZW1zIGxpa2UgaXQgbWlnaHQgYWN0dWFsbHkgYmUgbmZjLT5i
dXNfY2xrLgoKSW4gdGhhdCBjYXNlLCBkb2VzIHNldHRpbmcgbmZjLT5jb250cm9sbGVyX2NsayB0
byAxMDAgTUh6IGJ5IGRlZmF1bHQgbWFrZSBzZW5zZT8KVGhlcmUgaXNuJ3QgYSBoYXJkIGxpbWl0
IG9uIHdoYXQgdGhlIHN5c3RlbSBjbG9jayBtaWdodCBiZSAoYmV5b25kIGEgc3BlY2lmaWMgU29D
KSwKYnV0IHRoZXJlIGFyZSB0aW1pbmcgcmVxdWlyZW1lbnRzIGZvciB0aGUgZmxhc2ggY2xvY2ss
IGFuZCBzbyBzZXR0aW5nIGEgc3BlY2lmaWMgCnN5c3RlbSBjbG9jayBmcmVxdWVuY3kgc2VlbXMg
dW5uZWNlc3NhcnkgZm9yIG1vc3QgZGV2aWNlcy4KCgoKPj4gVGhlIGRyaXZlciBwcmV2aW91c2x5
IGFsd2F5cyBzZXQgMTAwIE1IeiBmb3IgTlYtRERSLCB3aGljaAo+PiB3b3VsZCByZXN1bHQgaW4g
aW5jb3JyZWN0IGJlaGF2aW9yIGZvciBOVi1ERFIgbW9kZXMgMC00Lgo+Pgo+PiBUaGUgYXBwcm9w
cmlhdGUgY2xvY2sgcmF0ZSBjYW4gYmUgY2FsY3VsYXRlZAo+PiBmcm9tIHRoZSBOVi1ERFIgdGlt
aW5nIHBhcmFtZXRlcnMgYXMgMS90Q0ssIG9yIGZvciByYXRlcwo+PiBtZWFzdXJlZCBpbiBwaWNv
c2Vjb25kcywgMTBeMTIgLyBuYW5kX252ZGRyX3RpbWluZ3MtPnRDS19taW4uCj4+Cj4gCj4gWW91
IG5lZWQgYSBjb3VwbGUgb2YgRml4ZXMgKyBDYzogc3RhYmxlIHRhZ3MgaGVyZSwgb3RoZXJ3aXNl
IHRoZQo+IHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuCj4gCgpXaWxsIGluY2x1ZGUgaW4gdGhlIG5l
eHQgaXRlcmF0aW9uIG9mIHRoZSBwYXRjaCwgdGhhbmsgeW91LgoKPj4gU2lnbmVkLW9mZi1ieTog
T2xnYSBLaXRhaW5hIDxva2l0YWluQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgfCA4ICsrKysrKystCj4+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9hcmFzYW4tbmFuZC1jb250cm9sbGVyLmMKPj4gaW5kZXggNTNiZDEwNzM4
NDE4Li5lZDRlZTk5NDI0NDEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Fy
YXNhbi1uYW5kLWNvbnRyb2xsZXIuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9hcmFz
YW4tbmFuZC1jb250cm9sbGVyLmMKPj4gQEAgLTE4LDYgKzE4LDcgQEAKPj4gICNpbmNsdWRlIDxs
aW51eC9ncGlvL2NvbnN1bWVyLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+
ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbWF0aDY0Lmg+
Cj4+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvbXRkL210
ZC5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4+IEBAIC0xMDQzLDcg
KzEwNDQsMTIgQEAgc3RhdGljIGludCBhbmZjX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCBpbnQgdGFyZ2V0LAo+PiAgCQkJCSBEUVNfQlVGRl9TRUxfT1VUKGRxc19tb2Rl
KTsKPj4gIAl9Cj4+ICAKPj4gLQlhbmFuZC0+Y2xrID0gQU5GQ19YTE5YX1NEUl9ERkxUX0NPUkVf
Q0xLOwo+PiArCWlmIChuYW5kX2ludGVyZmFjZV9pc19zZHIpCj4+ICsJCWFuYW5kLT5jbGsgPSBB
TkZDX1hMTlhfU0RSX0RGTFRfQ09SRV9DTEs7Cj4+ICsJZWxzZQo+PiArCQkvKiBPTkZJIHRpbWlu
Z3MgYXJlIGRlZmluZWQgaW4gcGljb3NlY29uZHMgKi8KPj4gKwkJYW5hbmQtPmNsayA9IGRpdl91
NjQoKHU2NClOU0VDX1BFUl9TRUMgKiAxMDAwLAo+PiArCQkJCSAgICAgY29uZi0+dGltaW5ncy5u
dmRkci50Q0tfbWluKTsKPj4gIAo+PiAgCS8qCj4+ICAJICogRHVlIHRvIGEgaGFyZHdhcmUgYnVn
IGluIHRoZSBaeW5xTVAgU29DLCBTRFIgdGltaW5nIG1vZGVzIDAtMSB3b3JrCj4+Cj4+IGJhc2Ut
Y29tbWl0OiBmNTNkNGMxMDlhNjY2YmYxYTQ4ODNiNDVkNTQ2ZmJhMDc5MjU4NzE3Cj4gCj4gCj4g
VGhhbmtzLAo+IE1pcXXDqGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
