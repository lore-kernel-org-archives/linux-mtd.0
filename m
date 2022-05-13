Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DD7C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 08:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wE6+UdiDLn9bjKTTR/RG+54xTfpLp/iYQSNye9BCQYI=; b=dFG9cxVAtANs9U
	T0FV8qsiV2W/XHgVlWq2G6Sm2B96K0VnXYqygLgBPY6KmU9lwHByQIA8MMqPM7UsEJXfKuxWfhtbL
	veaJ2tZPx9oi/HLm68uV3g1M2FnKK67gGLTzig1CRVWdbd5/4fMhBKVOGx+eW9rmjGRY6lhUKI+KD
	gsZ+IgFR3mM0WKmyVCi5p4w1PMXnhcEHw7SjviQRZhrueNnEbwFsNNaqau7OVTLLFKfQio1eyd5Mi
	8Kx+HEMkvTsQ8TbjCE2gnn2r/o+nQfowa/W0PS5JxYMK9b+ml7dqOM+Qh74w3exglHQW8GvkN5BSb
	KMk+dvMD0Q6qopPeYTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQzW-00FBFg-8l; Fri, 13 May 2022 08:49:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQzT-00FBDs-HI
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 08:49:41 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a5so6673335wrp.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2022 01:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hBkxAbKDqNhxMFslE8xDJ6YeUuh818TRTss1RROwWhI=;
 b=gG5O0vlQU4LazHn1JxDIXSb+aQcbB8CF7LVlmQUNOYeK58+wogRDBc6H9bYLMBnj5B
 HVQQBGJYa71KT2xaBt72zW70qvnPEkDJXbBIiGsVPfwXCrY1DgHVsUd7lihpqIsE5Fbg
 tL0AOdv/Uic/vy4MSwqhifLsE9TKySCHrWYgXeEr+GH/ipwkNDLwGdJmvM0SiEBOQZII
 63rbT+YKKIF5tEB1fVeJFBexDQX0As1r7t0RO+5dPdztAGwv0J1wTiGKWL103A1b37js
 PIrDlGXC1W0dDYmCiHAIC00bjgZgi8Yt/1sLfmlgEKuj30RpjKNJfXR/MW+M7Cy5Rtr9
 gHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hBkxAbKDqNhxMFslE8xDJ6YeUuh818TRTss1RROwWhI=;
 b=jt/aTF3k2GMF0YlvRtSI1JqXcPyN0SCZfx9AuieKFrVYFhxcY0c49u3FzEJOkskJyK
 ZJB8rPSNulf/+qmR3mkTtGjnObEJf26Xajjvm0IgOQxn8pynJYtzV4TrzwYDQ6lud3p3
 e6YPbwk22jw/9VqgM1+revOvCBMKpCGpktaoPJA9IU3/J/sRQnlJHiHcWhPJqEqA25dz
 XdAvZkLjOHi/XXnZMZlbA8TSZffzigDV2bLt//XzMhMnlYwX4juYMTVEazGVETmSXn3d
 +RX5yHLLHXRvPBrfqpi8L52rRRoc6T2/O5LY5IlHZrHjXhuBDfihPe8I7bcrvMQB37Br
 BG0w==
X-Gm-Message-State: AOAM530ywk5FlfVoR40BUkbJxW0/emAv124Yw6ZRaM0cadL5p83njAtU
 kc8lPAK6UJYlvx6TkA5oJ8ltN/IJYbXCoQ==
X-Google-Smtp-Source: ABdhPJxqSbr3xhTXHEwWrP1jSAQtKxqx6rwCEXcw+TPBfmqL5ZRF+Z2+l2UC6Tp2nA1ErRYV8Ge63g==
X-Received: by 2002:a05:6000:184d:b0:20c:5a30:1e48 with SMTP id
 c13-20020a056000184d00b0020c5a301e48mr2989306wri.614.1652431776663; 
 Fri, 13 May 2022 01:49:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c42ca00b003942a244ec9sm2073846wme.14.2022.05.13.01.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:49:36 -0700 (PDT)
Message-ID: <13fa1d59-7750-a327-c100-a53823509017@smile.fr>
Date: Fri, 13 May 2022 10:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To: Grygorii Strashko <grygorii.strashko@ti.com>,
 Roger Quadros <rogerq@kernel.org>, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
 <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
 <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <5d8ba4e2-a281-5d0f-d65f-bb0121165b73@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_014939_617118_DDC74398 
X-CRM114-Status: GOOD (  18.43  )
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

SGksCgpMZSAxNS8wNC8yMDIyIMOgIDE1OjA2LCBHcnlnb3JpaSBTdHJhc2hrbyBhIMOpY3JpdMKg
Ogo+IAo+IAo+IE9uIDE1LzA0LzIwMjIgMTE6NTksIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVs
bG8sCj4+Cj4+IExlIDIxLzEyLzIwMjEgw6AgMTQ6MTcsIFJvZ2VyIFF1YWRyb3MgYSDDqWNyaXTC
oDoKPj4+IEhpLAo+Pj4KPj4+IFRJJ3MgQU02NCBTb0MgY29udGFpbnMgb25lIEdQTUMgbW9kdWxl
LiBBZGQgZHJpdmVyIHN1cHBvcnQgZm9yIGl0Lgo+Pgo+PiBXaGF0J3MgdGhlIHN0YXR1cyBvZiB0
aGUgR1BNQyBpbnRlcmZhY2Ugb24gSzMgYXJjaGl0ZWN0dXJlLCBlc3BlY2lhbGx5IGZvciBBTTY1
LAo+PiBBTTYyIGFuZCBvdGhlciBKYWNpbnRvIDcgQ1BVIGRldmljZXMgPwo+Pgo+PiBUSSBjdXJy
ZW50bHkgZG9uJ3QgcmVjb21tZW5kIHRvIHVzZSBpdCBmb3Igbm93IGV2ZW4gaWYgdGhlcmUgYXJl
IHN0aWxsIHNvbWUgR1BNQwo+PiB1c2UgY2FzZSB3aXRoIEZQR0EgZGV2aWNlczoKPj4KPj4gaHR0
cHM6Ly9lMmUudGkuY29tL3N1cHBvcnQvcHJvY2Vzc29ycy1ncm91cC9wcm9jZXNzb3JzL2YvcHJv
Y2Vzc29ycy1mb3J1bS85OTQxOTEvYW02NDQyLWFtNjR4LWdwbWMtc3VwcG9ydAo+Pgo+Pgo+PiBU
aGlzIHBhdGNoIHNlcmllcyBhZGQgb21hcC1ncG1jIHN1cHBvcnQgZm9yIEFNNjQgU29jIGJ1dCBh
cyBvZiBrZXJuZWwgNS4xOC1yYzIsCj4+IHRoZXJlIGlzIG5vIGRldmljZXRyZWUgdXNpbmcgdGks
YW02NC1ncG1jLgo+Pgo+PiBUaGlzIHBhdGNoIHNlZW1zIG1pc3NpbmcgKGF0IGxlYXN0KToKPj4g
aHR0cHM6Ly9naXQudGkuY29tL2NnaXQvdGktbGludXgta2VybmVsL3RpLWxpbnV4LWtlcm5lbC9j
b21taXQvP2g9dGktbGludXgtNS4xMC55JmlkPTU1YzEwMmE3NWQzOTk4OTZjNzM5NjIyOWNkNjg3
YmY5N2FmYjVjZjYKPj4KPiAKPiBJdCdzIG5vdCBob3cgTEtNTCBkZXZlbG9wbWVudCBwcm9jZXNz
IHdvcmtzIC0gZHJpdmVyIGNoYW5nZXMgaGFzIHRvIGJlIHNlbnQgZmlyc3QKPiBhbmQgdGhlbiBE
VCBjaGFuZ2VzwqAgYXMgdGhleSBhY2NlcHRlZCBieSBkaWZmZXJlbnQgbWFpbnRhaW5lcnMgYW5k
IHRocm91Z2gKPiBkaWZmZXJlbnQgdHJlZXMuCgpPaywgSSB1bmRlcnN0YW5kLgoKRFQgY2hhbmdl
cyBhcmUgc3RpbGwgdW5kZXIgcmV2aWV3IFsxXSBhbmQgYXJlIG5vdCB5ZXQgbWVyZ2VkIGluIDUu
MTgtcmM2LgoKU29ycnkgZm9yIHRoZSBub2lzZS4KClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMi8yLzQvMzIwCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4+Cj4+IFRoYW5rcyEKPj4K
Pj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4KPj4+Cj4+PiBjaGVlcnMsCj4+PiAtcm9nZXIK
Pj4+Cj4+PiBDaGFuZ2Vsb2c6Cj4+PiB2NAo+Pj4gLSBtb3ZlIGNvbXBhdGlibGUgbWF0Y2ggdGFi
bGUgdG8gaGVhZGVyIGZpbGUgc28gaXQgY2FuIGJlIHVzZWQgYnkKPj4+IEdQTUMgZHJpdmVyIGV2
ZW4gd2hlbiBOQU5EIGRyaXZlciBpcyBub3QgZW5hYmxlZCBvciBhcyBhIG1vZHVsZS4KPj4+IEdQ
TUMgZHJpdmVyIGlzIGFsd2F5cyBlbmFibGVkIGFzIGJ1aWx0LWluLgo+Pj4gLSBTZWxlY3QgT01B
UF9HUE1DIGRyaXZlciBmcm9tIE1URF9OQU5EX09NQVAyIGRyaXZlciBjb25maWcgYXMKPj4+IE9N
QVBfR1BNQyBpcyBub3QgZXNzZW50aWFsIGZvciBBUkNIX0szIGJvb3QuCj4+Pgo+Pj4gdjMKPj4+
IC0gdXNlIGNvbXBhdGlibGUgbWF0Y2ggdGFibGUgZm9yIGNoZWNraW5nIGZvciBOQU5EIGNvbnRy
b2xsZXIgbm9kZSBpbgo+Pj4gR1BNQyBkcml2ZXIuCj4+Pgo+Pj4gdjIKPj4+IC0gdXBkYXRlIERU
IGJpbmRpbmcgZG9jIHRvIG1ha2UgcmVnLW5hbWVzIGFuZCBwb3dlci1kb21haW5zIHByb3BlcnR5
Cj4+PiByZXF1aXJlZCBvbmx5IGZvciBzcGVjaWZpYyBTb0MuCj4+Pgo+Pj4gUm9nZXIgUXVhZHJv
cyAoNCk6Cj4+PiDCoMKgIGR0LWJpbmRpbmdzOiBtZW1vcnktY29udHJvbGxlcnM6IHRpLGdwbWM6
IEFkZCBjb21wYXRpYmxlIGZvciBBTTY0Cj4+PiDCoMKgIG1lbW9yeTogb21hcC1ncG1jOiBBZGQg
c3VwcG9ydCBmb3IgR1BNQyBvbiBBTTY0IFNvQwo+Pj4gwqDCoCBtZW1vcnk6IG9tYXAtZ3BtYzog
VXNlIGEgY29tcGF0aWJsZSBtYXRjaCB0YWJsZSB3aGVuIGNoZWNraW5nIGZvciBOQU5ECj4+PiDC
oMKgwqDCoCBjb250cm9sbGVyCj4+PiDCoMKgIG10ZDogcmF3bmFuZDogb21hcDI6IFNlbGVjdCBH
UE1DIGRldmljZSBkcml2ZXIgZm9yIEFSQ0hfSzMKPj4+Cj4+PiDCoCAuLi4vYmluZGluZ3MvbWVt
b3J5LWNvbnRyb2xsZXJzL3RpLGdwbWMueWFtbMKgIHwgMjMgKysrKysrKysrLQo+Pj4gwqAgZHJp
dmVycy9tZW1vcnkvb21hcC1ncG1jLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0KPj4+IMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3
L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPj4+IMKg
IGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCA1ICstCj4+PiDCoCBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbXRkLW5h
bmQtb21hcDIuaMKgIHzCoCA5ICsrKy0KPj4+IMKgIDUgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0
aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4+Pgo+Pgo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
