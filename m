Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07B0CCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVLuWv7TOLxKqdziPrk4dZ5c1ql/zfC6fpRiLGDgyXo=; b=BMk+7PyDjqQ22h
	gKLwq2RW8y4Y36/2d47092p0jUGAMYGRWiZyi9o0tfO1GFMVYa6FoQAatgtR5gT4lfcViAVK1hfdZ
	wdGEeJtmeeLnXxWm5jaG1X05AVzeKD4Vrp/ROqxcC24V4j+auvQJBT3DiND4NyHKKOTSXsvf5uEnL
	Wo2WKsXCiWMyvvDWNnyIWf9xZAAyKcNbR6/CcAKwZgktIuhBcJway0xJzUr/iakbjwQEzm6FsAoTb
	eIN8jmR7MAWZ138+Vg5qoD5r7PnWzE06yHkA8dqJRDtXzQzZpnczoAkBIUyeSCewRHrGSL4p6Paes
	rDABDB+mi3jKJP92/yVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KgO-0000000Djls-0j2k;
	Mon, 13 Oct 2025 15:41:56 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KgL-0000000Djl9-39WH
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:41:55 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46b303f755aso37983405e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 13 Oct 2025 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760370111; x=1760974911; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m0cgqSzE/Lkny12oGQRJ+XqTG+cD4gi7Ovvpfz4TdUk=;
        b=CUlc+qrpS/v0cLfVPnBrDIEqFlYzwRpfvn1MIWB+q3vxBk7JhW0Jh5eUkgqCutBThR
         HmYTfVJdeYCdnYg3eAvwUMCK2IR0YrcLvPX1DLhyM0CMIizrCEDPOpbt0jt+u+quoaY7
         rYH+EoCzKn7gG9llDbiReMdjkif3RpmXTc2+4bZkY4Zdbgl8M1Xen45rRxRb5QAWaGGg
         8pKKVtqk2IhTh+sztQV1tx130L5e8lxN90u++FKXu8rgisKsv/+qepEb5cQF5qHw8qkE
         /MGW/n1pSa5JTfwTEFmmGY7mWiln1w0ES0sB/6lbEYhcW33MPr163RNe+It2X5wXU1py
         WASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370111; x=1760974911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0cgqSzE/Lkny12oGQRJ+XqTG+cD4gi7Ovvpfz4TdUk=;
        b=uYAWpEir67G0Ezx4O9xqh3lDx+9KVk1pmpU1XQDC7h9A1C+A5yoa3i/83oKK8wtQ71
         /Uqn1oH09TmePDrVVVOcrrtnAxu3bPt0L643Vsm2l2Fh3EYRz1MoKUceZGsjAFbabdGZ
         h4KnKQi5Ohw7+2zdqbpcV7SY8X+tNQobK+02xbTno7MPo9GmQhK2Nd0+1nKeM2QKti6I
         WYABnKRa8+No+DGi8IbuWJc4quMdeeDSP5c8lZvqXOc2njc8wW4xzRak/JnlGrkhxm1x
         PhXIgrPHkFTo2bvvELX2TgqBP7jxy230at/Q+CAjTJxtvSf3Okup3gGW5MZd79G3oXqJ
         EakQ==
X-Forwarded-Encrypted: i=1; AJvYcCVArlNZ3FK4v1hzm+PQwOSp/TY66T5vTH3R0JzobPgt9IMH7QhAJmof8Smqon8Zq+jGmOAkWFUFe2k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLUs1+LuCAWhnyAYqYQr70ZCzi/by8whefybmaYpaU5Poi+CNo
	IOLuYgWbW2iiFYB6fJb126fUyBozSPejNErRY05NodjQgfG3LAit8uTkJKmNJGsHDoQ=
X-Gm-Gg: ASbGncv4qLNFgsppt2SOdgq0IXyEY8H+DbXMgFNyglVCCTcXd/OONahzVA8Nblel1lG
	EAC2MnQ1InK8sE2MKbKF9ZiN8W30ItlQNl5jIoc4cPrgGzGbVD6KcdiIDftDlw5tGSnYiCjEvgS
	HCLwR265KsEHVPt9/tuz8Q7HMOe9b8DnSvttGU/CqtneXwViv2tezi29Ob7G4hMRvm78LPNwS9G
	AFNtBA6aOfIj/Z+0DVVZ4y9dWiUl3mOfWcHqrd+CrE8JDOmoIFbr/4cjaRCCnxFV0WB0CdwTHxI
	UGjCc1CarV8/vQJtigUwlWcosMwnRWINMUpGPBlM6v5qSOpnQxb5jdXSQijR6t6ZQkb6fDiRAaV
	YYJwjsAIKg59SZeMFv/8ik0nKIwJBNufvGOufUHYKigHmFPR9tNnHxZfUhPMUTZJK
X-Google-Smtp-Source: AGHT+IFKYw7QIOx3KawOwzG5qTW3beZOTdk9+jOTSPXwHNds5Qi4tQ8FekRB2sLyFkvKy6W5j9kTDA==
X-Received: by 2002:a05:600c:3f1b:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-46fa9a20793mr152610355e9.0.1760370111512;
        Mon, 13 Oct 2025 08:41:51 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0006sm19059187f8f.34.2025.10.13.08.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:41:50 -0700 (PDT)
Message-ID: <7732351b-bf21-423d-bb70-177001cd24b9@linaro.org>
Date: Mon, 13 Oct 2025 16:41:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add SMPT fixup for S25FS512S
To: Marek Vasut <marek.vasut@mailbox.org>, linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Takahiro Kuwano <tkuw584924@gmail.com>
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <54058c12-3932-4dc1-bc51-6627fb46094a@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_084153_844201_9D2C6602 
X-CRM114-Status: GOOD (  21.91  )
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

CgpPbiAxMC8xMi8yNSA1OjE5IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBIZWxsbyBUdWRvciwK
CkhlbGxvIQoKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24u
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+Pj4+PiBpbmRleCBkNmM5MjU5NWY2
YmMuLmQ0NDZkMTIzNzFlMSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGFuc2lvbi5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYwo+Pj4+
PiBAQCAtNzU3LDYgKzc1NywzMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBz
IHMyNWZzX3Nfbm9yX2ZpeHVwcyA9IHsKPj4+Pj4gwqDCoMKgwqDCoMKgIC5wb3N0X2JmcHQgPSBz
MjVmc19zX25vcl9wb3N0X2JmcHRfZml4dXBzLAo+Pj4+PiDCoMKgIH07Cj4+Pj4+IMKgwqAgK3N0
YXRpYyBpbnQgczI1ZnM1MTJzX25vcl9wb3N0X3NtcHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpu
b3IsIHU4ICpzbXB0KQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqDCoCAq
IFRoZSBTMjVGUzUxMlMgY2hpcCBkYXRhc2hlZXQgcmV2Lk8gVGFibGUgNzEgb24gcGFnZSAxNTMK
Pj4+Pj4gK8KgwqDCoMKgICogSkVERUMgU2VjdG9yIE1hcCBQYXJhbWV0ZXIgRHdvcmQtNiBDb25m
aWcuIERldGVjdC0zIGRvZXMKPj4+Pj4gK8KgwqDCoMKgICogdXNlIENSM05WIGJpdCAxIHRvIGRp
c2Nlcm4gNjRraUIvMjU2a2lCIHVuaWZvcm0gc2VjdG9ycwo+Pj4+PiArwqDCoMKgwqAgKiBkZXZp
Y2UgY29uZmlndXJhdGlvbiwgaG93ZXZlciBhY2NvcmRpbmcgdG8gc2VjdGlvbiA3LjUuNS4xCj4+
Pj4+ICvCoMKgwqDCoCAqIENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgMyBOb24tdm9sYXRpbGUgKENS
M05WKSBwYWdlIDYxLCB0aGUKPj4+Pj4gK8KgwqDCoMKgICogQ1IzTlYgYml0IDEgaXMgUkZVIFJl
c2VydmVkIGZvciBGdXR1cmUgVXNlLCBhbmQgaXMgc2V0IHRvCj4+Pj4+ICvCoMKgwqDCoCAqIDAg
b24gbmV3bHkgbWFudWZhY3R1cmVkIGRldmljZXMsIHdoaWNoIG1lYW5zIDY0a2lCIHNlY3RvcnMu
Cj4+Pj4+ICvCoMKgwqDCoCAqIFNpbmNlIHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCA2NGtp
QiB1bmlmb3JtIHNlY3RvcnMgaW4KPj4+Pj4gK8KgwqDCoMKgICogYW55IGNvbmZpZ3VyYXRpb24s
IHBhcnNpbmcgU01QVCB0YWJsZSBjYW5ub3QgZmluZCBhIHZhbGlkCj4+Pj4+ICvCoMKgwqDCoCAq
IHNlY3RvciBtYXAgZW50cnkgYW5kIGZhaWxzLiBGaXggdGhpcyB1cCBieSBzZXR0aW5nIFNNUFQK
Pj4+Pj4gK8KgwqDCoMKgICogY29uZmlndXJhdGlvbiBpbmRleCBiaXQgMCwgd2hpY2ggaXMgcG9w
dWxhdGVkIGV4YWN0bHkgYnkKPj4+Pj4gK8KgwqDCoMKgICogdGhlIENSM05WIGJpdCAxIGJlaW5n
IDEuCj4+Pj4+ICvCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgICpzbXB0IHw9IEJJVCgwKTsKPj4+
Pgo+Pj4+IFBsZWFzZSBoZWxwIG1lIHVuZGVyc3RhbmQgdGhpcy4gTWF5YmUgYSBsaW5rIHRvIHlv
dXIgcmV2aXNpb24gb2YKPj4+PiBkYXRhc2hlZXQgd291bGQgaGVscCBtZS4KPj4+Cj4+PiBodHRw
czovL3d3dy5pbmZpbmVvbi5jb20vYXNzZXRzL3Jvdy9wdWJsaWMvZG9jdW1lbnRzLzEwLzQ5L2lu
ZmluZW9uLXMyNWZzNTEycy01MTItbWItMS1kYXRhc2hlZXQtZW4ucGRmCj4+Pgo+Pj4gU01QVCB2
YWx1ZXM6Cj4+Pgo+Pj4gaT0wIHNtcHRbaV09MDhmZjY1ZmMKPj4+IGk9MSBzbXB0W2ldPTAwMDAw
MDA0Cj4+PiBpPTIgc21wdFtpXT0wNGZmNjVmYwo+Pj4gaT0zIHNtcHRbaV09MDAwMDAwMDIKPj4+
IGk9NCBzbXB0W2ldPTAyZmY2NWZkCj4+PiBpPTUgc21wdFtpXT0wMDAwMDAwNAo+Pj4gaT02IHNt
cHRbaV09ZmYwMjAxZmUKPj4+IGk9NyBzbXB0W2ldPTAwMDA3ZmYxCj4+PiBpPTggc21wdFtpXT0w
MDAzN2ZmNAo+Pj4gaT05IHNtcHRbaV09MDNmYmZmZjQKPj4+IGk9MTAgc21wdFtpXT1mZjAyMDNm
ZQo+Pj4gaT0xMSBzbXB0W2ldPTAzZmJmZmY0Cj4+PiBpPTEyIHNtcHRbaV09MDAwMzdmZjQKPj4+
IGk9MTMgc21wdFtpXT0wMDAwN2ZmMQo+Pj4gaT0xNCBzbXB0W2ldPWZmMDAwNWZmCj4+PiBpPTE1
IHNtcHRbaV09MDNmZmZmZjQKPj4+Cj4+Cj4+IHRoYW5rcyEKPj4KPj4+PiBJbiB0aGUgZmxhc2gg
ZGF0YXNoZWV0cyB0aGF0IEkgc2VlLCB0aGVyZSBzaGFsbAo+Pj4+IGJlIGEgIlNlY3RvciBNYXAg
UGFyYW1ldGVyIFRhYmxlIE5vdGVzIiB3aGVyZSBhICJTZWN0b3IgTWFwIFBhcmFtZXRlciIKPj4+
PiB0YWJsZSBpcyBkZXNjcmliZWQgc2hvd2luZyBhbiBJbmRleCBWYWx1ZSBjb25zdHJ1Y3RlZCBi
eSB0aGUgQ1J4TlZbeV0KPj4+PiByZXR1cm4gdmFsdWVzLiBUaGF0IGluZGV4IHZhbHVlIGlzIHRo
ZSBtYXBfaWQgaW4gdGhlIGNvZGUuCj4+Pj4KPj4+PiBCeSByZWFkaW5nIHlvdXIgZGVzY3JpcHRp
b24gSSB1bmRlcnN0YW5kIENSM05WWzFdIGhhcyB2YWx1ZSB6ZXJvIGFzIGl0Cj4+Pj4gaXMgbWFy
a2VkIGFzIFJGVSwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgdGhhdCBiaXQgaXMgZXhwZWN0ZWQgaW4g
U01QVCB0bwo+Pj4+IGFsd2F5cyBoYXZlIHZhbHVlIDEuIFRoYXQncyB3aHkgZGF0YXNoZWV0cyBs
aWtlIHRoaXMgb25lIFsxXSBpbiB0aGVpcgo+Pj4+ICJUYWJsZSA3MC4gU2VjdG9yIE1hcCBQYXJh
bWV0ZXIiIGRvIG5vdCBkZXNjcmliZSBDUjNOVlsxXSBhdCBhbGwsIGFuZAo+Pj4+IGRlZmluZSB0
aGUgaW5kZXggdmFsdWUgYXMgQ1IzTlZbM10gPDwgMiB8IENSMU5WWzJdIDw8IDEgfCAxLgo+Pj4K
Pj4+IFdoZXJlIGRvZXMgdGhpcyBsYXN0IHBhcnQgImRlZmluZSB0aGUgaW5kZXggdmFsdWUgYXMg
Q1IzTlZbM10gPDwgMiB8IENSMU5WWzJdIDw8IDEgfCAxIiBjb21lIGZyb20gPwo+Pgo+PiBJbiB5
b3VyIGRhdGFzaGVldCBmbGF2b3IsIGZyb20gIlRhYmxlIDcwIFNlY3RvciBtYXAgcGFyYW1ldGVy
IiwgcGFnZSAxNTIsCj4+ICJJbmRleCBWYWx1ZSIgY29sdW1uLiBJIGRlZHVjZWQgdGhlIGZvcm11
bGEgYnkgdXNpbmcgdGhlIENSM05WWzNdIGFuZAo+PiBDUjFOVlsyXSB2YWx1ZXMuIFRoZSBkYXRh
c2hlZXQgc2F5czoKPj4KPj4gIldoZW4gbW9yZSB0aGFuIG9uZSBjb25maWd1cmF0aW9uIGJpdCBt
dXN0IGJlIHJlYWQsIGFsbCB0aGUgYml0cyBhcmUKPj4gY29uY2F0ZW5hdGVkIGludG8gYW4gaW5k
ZXggdmFsdWUgdGhhdCBpcyB1c2VkIHRvIHNlbGVjdCB0aGUgY3VycmVudCBhZGRyZXNzIG1hcC4i
Cj4+Cj4+IGFuZCB0aGF0IHRoZSAidGhlIGZvbGxvd2luZyBNU2IgdG8gTFNiIG9yZGVyIHRvIGZv
cm0gdGhlIGNvbmZpZ3VyYXRpb24gbWFwCj4+IGluZGV4IHZhbHVlOgo+PiDigKIgQ1IzTlZbM10g
4oCUIDAgPSBIeWJyaWQgQXJjaGl0ZWN0dXJlLCAxID0gVW5pZm9ybSBBcmNoaXRlY3R1cmUKPj4g
4oCiIENSMU5WWzJdIOKAlCAwID0gNCBLQiBwYXJhbWV0ZXIgc2VjdG9ycyBhdCBib3R0b20sIDEg
PSA0IEtCIHNlY3RvcnMgYXQgdG9wCj4+ICIKPj4KPj4gVGhlICJJbmRleCBWYWx1ZSIgc2hhbGwg
YmUgdGhlIG1hcF9pZCB0aGF0IHlvdSBwYXNzZWQgaW4gdGhlIGNvZGU6Cj4+IHNwaV9ub3JfcG9z
dF9zbXB0X2ZpeHVwcyhub3IsICZtYXBfaWQpOwo+Pgo+PiBDYW4geW91IHBsZWFzZSBwcmludCB0
aGUgbWFwX2lkIHZhbHVlIHRoYXQgeW91IG9idGFpbiB3aXRob3V0IHVwZGF0aW5nIGl0Pwo+IAo+
IDB4NAoKVGhpcyB0cmFuc2xhdGVzIHRvIENSM05WWzNdID0gMSwgQ1IxTlZbMl0gPSAwLCAgQ1Iz
TlZbMV0gPSAwLgo+IAo+PiBMZXQncyBhbHNvIHByaW50IHRoZSB2YWx1ZXMgb2YgQ1IzTlYgYW5k
IENSMU5WLgo+IAo+IEJvdGggMHgwIGFuZCAweDAgLgoKQnV0IGhlcmUgQ1IzTlYgaXMgMCwgaXQg
Y29udHJhZGljdHMgdGhlIHJlc3VsdCBmcm9tIGFib3ZlLgoKTWF5YmUgaXQncyB0aGUgc2FtZSBw
cm9ibGVtIHRoYXQgVGFrYWhpcm8gaWRlbnRpZmllZDogdGhlIGZsYXNoIG5lZWRzCjggZHVtbXkg
Y3ljbGVzLCBidXQgdGhlIGNvZGUgdXNlcyB6ZXJvIGR1bW15IGN5Y2xlcywgcmVzdWx0aW5nIGlu
CnJlYWRpbmcgZ2FyYmFnZSBkYXRhLCBkZXBlbmRpbmcgb24gd2hldGhlciB5b3VyIElPIGxpbmVz
IGFyZSBwdWxsZWQgdXAvZG93bgpvciBmbG9hdGluZy4KCkNhbiB5b3UgcmVkbyB0aGUgdGVzdCB3
aXRoIHRoZSBmb2xsb3dpbmcgcGxlYXNlPwoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1u
b3Ivc2ZkcC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKaW5kZXggMjE3MjdmOWE0YWM2
Li44NTQ0M2M5MDNlNTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCisr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCkBAIC03NTIsNyArNzUyLDcgQEAgc3RhdGlj
IGNvbnN0IHUzMiAqc3BpX25vcl9nZXRfbWFwX2luX3VzZShzdHJ1Y3Qgc3BpX25vciAqbm9yLCBj
b25zdCB1MzIgKnNtcHQsCiAKICAgICAgICAgICAgICAgIHJlYWRfZGF0YV9tYXNrID0gU01QVF9D
TURfUkVBRF9EQVRBKHNtcHRbaV0pOwogICAgICAgICAgICAgICAgbm9yLT5hZGRyX25ieXRlcyA9
IHNwaV9ub3Jfc21wdF9hZGRyX25ieXRlcyhub3IsIHNtcHRbaV0pOwotICAgICAgICAgICAgICAg
bm9yLT5yZWFkX2R1bW15ID0gc3BpX25vcl9zbXB0X3JlYWRfZHVtbXkobm9yLCBzbXB0W2ldKTsK
KyAgICAgICAgICAgICAgIG5vci0+cmVhZF9kdW1teSA9IDg7CiAgICAgICAgICAgICAgICBub3It
PnJlYWRfb3Bjb2RlID0gU01QVF9DTURfT1BDT0RFKHNtcHRbaV0pOwogICAgICAgICAgICAgICAg
YWRkciA9IHNtcHRbaSArIDFdOwogCkBAIC03NjcsNiArNzY3LDggQEAgc3RhdGljIGNvbnN0IHUz
MiAqc3BpX25vcl9nZXRfbWFwX2luX3VzZShzdHJ1Y3Qgc3BpX25vciAqbm9yLCBjb25zdCB1MzIg
KnNtcHQsCiAgICAgICAgICAgICAgICAgKiBDb25maWd1cmF0aW9uIHRoYXQgaXMgY3VycmVudGx5
IGluIHVzZS4KICAgICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgICAgbWFwX2lkID0gbWFw
X2lkIDw8IDEgfCAhISgqYnVmICYgcmVhZF9kYXRhX21hc2spOworICAgICAgICAgICAgICAgZGV2
X2Vycihub3ItPmRldiwgImkgPSAlZCwgYnVmID0gJTAyeCwgbWFwX2lkID0gJTAyeFxuIiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgaSwgYnVmWzBdLCBtYXBfaWQpOwogICAgICAgIH0KIApDaGVl
cnMsCnRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
