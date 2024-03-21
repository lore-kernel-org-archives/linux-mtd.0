Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC370C54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvv6Pb2wUOjRm2oMvwdu/nTyZWxk9Cx2a3hFgh3nL74=; b=IpnYGHPA+5GUQ7
	9hkFF+a7o6vz148ImBicgPDmXMTDdQmuAVRDKN0Qwf2hTkPoGehGoWfyVzvP91eZF3burL3flyYLt
	66EmPebMnVjxYctxr8zK6bDLqpnE0Ckcqc4leuCUWL/0kW9TS41SOMK2pis5OOtEQOQ4/54R+wquW
	X/5HxthOLBKkAXxBwO3ME/JKB/tDJKGRX0Om7E7jwsF6gBmGStEEOHNKO8X0HPLN9tb07/Ku6J2V9
	VOOIyEALvIsxrusEaS6sXbbC1zKGvfHMIw+OKdDcRvyp4ClvD9oljHRyjXLqn3/HpIjvhtz0vCQMz
	P+YqZ8k+tBQGJ8BuwXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfr-000000029SR-2lFj;
	Thu, 21 Mar 2024 07:17:15 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCfo-000000029Qo-2Epf
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 07:17:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3FAD1C0004;
	Thu, 21 Mar 2024 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711005427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnjl8NwZzgPwQjCkcjCjQ+FVN05+Q4op74BaS+FN5Yc=;
	b=HGvn1b/GVl4fpnbQxgNZ/Prs0NyYO5wc1PCRytrdhvGE2nXdpuQI3dkSeqmnisYBExgCTS
	csRHt58eh5FldcAX/GCpFttN4qAyIQlm406ZbwqkD2l/M7KVVTx7dEMo4cyjZAVkleNr3g
	41dkjnWhhz/Nx43/lC9sXuXoK8X5dKRALxgynzk1jYW48aQLc8M8J9/43S4q/0Gyl9p09U
	hJ1GkDbFTxj7wDjjFR8OYHn5DRCl8GUDRGmm9Diwh+iN5bK9fyg/AS0G7YEYel7516m8x0
	XoMw8qBq3BXhsreHvxtxXZKFDp6V2k2Vfi76eaHeuihaY7+tRPxWDaDlwZa4lg==
Date: Thu, 21 Mar 2024 08:17:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: limit OTP NVMEM Cell parse to non Nand devices
Message-ID: <20240321081705.597f72bf@xps-13>
In-Reply-To: <20240320162927.5015-1-ansuelsmth@gmail.com>
References: <20240320162927.5015-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_001712_894003_5B62EEA8 
X-CRM114-Status: GOOD (  25.27  )
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

SGkgQ2hyaXN0aWFuLAoKYW5zdWVsc210aEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMCBNYXIg
MjAyNCAxNzoyOToyNSArMDEwMDoKCj4gTVREIE9UUCBsb2dpYyBpcyB2ZXJ5IGZyYWdpbGUgYW5k
IGNhbiBiZSBwcm9ibGVtYXRpYyB3aXRoIHNvbWUgc3BlY2lmaWMKPiBraW5kIG9mIGRldmljZXMu
Cj4gCj4gTlZNRU0gYWNyb3NzIHRoZSB5ZWFycyBoYWQgdmFyaW91cyBpdGVyYXRpb24gb24gaG93
IENlbGxzIGNvdWxkIGJlCj4gZGVjbGFyZWQgaW4gRFQgYW5kIE1URCBPVFAgcHJvYmFibHkgd2Fz
IGxlZnQgYmVoaW5kIGFuZAo+IGFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgd2FzIGVuYWJsZWQg
d2l0aG91dCB0aGlua2luZyBvZiB0aGUgY29uc2VxdWVuY2VzLgo+IAo+IFRoYXQgb3B0aW9uIGVu
YWJsZXMgTlZNRU0gdG8gc2NhbiB0aGUgcHJvdmlkZWQgb2Zfbm9kZSBhbmQgdHJlYXQgZWFjaAo+
IGNoaWxkIGFzIGEgTlZNRU0gQ2VsbCwgdGhpcyB3YXMgdG8gc3VwcG9ydCBsZWdhY3kgTlZNRU0g
aW1wbGVtZW50YXRpb24KPiBhbmQgZG9uJ3QgY2F1c2UgcmVncmVzc2lvbi4KPiAKPiBUaGlzIGlz
IHByb2JsZW1hdGljIGlmIHdlIGhhdmUgZGV2aWNlcyBsaWtlIE5hbmQgd2hlcmUgdGhlIE9UUCBp
cwo+IHRyaWdnZXJlZCBieSBzZXR0aW5nIGEgc3BlY2lhbCBtb2RlIGluIHRoZSBmbGFzaC4gSW4g
dGhpcyBjb250ZXh0IHJlYWwKPiBwYXJ0aXRpb25zIGRlY2xhcmVkIGluIHRoZSBOYW5kIG5vZGUg
YXJlIHJlZ2lzdGVyZWQgYXMgT1RQIENlbGxzIGFuZAo+IHRoaXMgY2F1c2UgcHJvYmUgZmFpbCB3
aXRoIC1FSU5WQUwgZXJyb3IuCj4gCj4gVGhpcyB3YXMgbmV2ZXIgbm90aWNlIGR1ZSB0byB0aGUg
ZmFjdCB0aGF0IHRpbGwgbm93LCBubyBOYW5kIHN1cHBvcnRlZAo+IHRoZSBPVFAgZmVhdHVyZS4g
V2l0aCBjb21taXQgZTg3MTYxMzIxYTQwICgibXRkOiByYXduYW5kOiBtYWNyb25peDogT1RQCj4g
YWNjZXNzIGZvciBNWDMwTEZ4RzE4QUMiKSB0aGlzIGNoYW5nZWQgYW5kIGNvaW5jaWRlbnRhbGx5
IHRoaXMgTmFuZCBpcwo+IHVzZWQgb24gYW4gRnJpdHpCb3ggNzUzMCBzdXBwb3J0ZWQgb24gT3Bl
bldydC4KPiAKPiBBbHRlcm5hdGl2ZSBhbmQgbW9yZSByb2J1c3Qgd2F5IHRvIGRlY2xhcmUgT1RQ
IENlbGxzIGFyZSBhbHJlYWR5Cj4gcHJvc3NpYmxlIGJ5IHVzaW5nIHRoZSBmaXhlZC1sYXlvdXQg
bm9kZSBvciBieSBkZWNsYXJpbmcgYSBjaGlsZCBub2RlCj4gd2l0aCB0aGUgY29tcGF0aWJsZSBz
ZXQgdG8gIm90cC11c2VyIiBvciAib3RwLWZhY3RvcnkiLgo+IAo+IFRvIGZpeCB0aGlzIGFuZCBs
aW1pdCBhbnkgcmVncmVzc2lvbiB3aXRoIG90aGVyIE1URCB0aGF0IG1ha2VzIHVzZSBvZgo+IGRl
Y2xhcmluZyBPVFAgYXMgZGlyZWN0IGNoaWxkIG9mIHRoZSBkZXYgbm9kZSwgZGlzYWJsZQoKVGhl
IGJlYXV0eSBvZiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Li4uCgo+IGFkZF9sZWdhY3lfZml4ZWRf
b2ZfY2VsbHMgaWYgd2UgaGF2ZSBhIG5vZGUgY2FsbGVkIG5hbmQgc2luY2UgaXQncyB0aGUKPiBz
dGFuZGFyZCBwcm9wZXJ0eSBuYW1lIHRvIGlkZW50aWZ5IE5hbmQgZGV2aWNlcyBhdHRhY2hlZCB0
byBhIE5hbmQKPiBDb250cm9sbGVyLgo+IAo+IFdpdGggdGhlIGZvbGxvd2luZyBsb2dpYywgdGhl
IE9UUCBOVk1FTSBlbnRyeSBpcyBjb3JyZWN0bHkgY3JlYXRlZCB3aXRoCj4gbm8gQ2VsbHMgYW5k
IHRoZSBNVEQgTmFuZCBpcyBjb3JyZWN0bHkgcHJvYmVkIGFuZCBwYXJ0aXRpb25zIGFyZQo+IGNv
cnJlY3RseSBleHBvc2VkLgoKVGhhbmtzIGZvciB0aGUgaW52ZXN0aWdhdGlvbiBhbmQgdGhlIGZp
eC4gQW4gaW1wbGVtZW50YXRpb24gZGV0YWlsCmJlbG93LgoKPiAKPiBGaXhlczogMmNjM2IzN2Y1
YjZkICgibnZtZW06IGFkZCBleHBsaWNpdCBjb25maWcgb3B0aW9uIHRvIHJlYWQgb2xkIHN5bnRh
eCBmaXhlZCBPRiBjZWxscyIpCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9tdGQvbXRkY29yZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRk
Y29yZS5jIGIvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gaW5kZXggNTg4N2ZlYjM0N2E0Li42ODcy
NDc3YTUxMjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJp
dmVycy9tdGQvbXRkY29yZS5jCj4gQEAgLTkwMCw3ICs5MDAsNyBAQCBzdGF0aWMgc3RydWN0IG52
bWVtX2RldmljZSAqbXRkX290cF9udm1lbV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwK
PiAgCWNvbmZpZy5uYW1lID0gY29tcGF0aWJsZTsKPiAgCWNvbmZpZy5pZCA9IE5WTUVNX0RFVklE
X0FVVE87Cj4gIAljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsKPiAtCWNvbmZpZy5hZGRfbGVn
YWN5X2ZpeGVkX29mX2NlbGxzID0gdHJ1ZTsKPiArCWNvbmZpZy5hZGRfbGVnYWN5X2ZpeGVkX29m
X2NlbGxzID0gIW9mX25vZGVfbmFtZV9lcShtdGQtPmRldi5vZl9ub2RlLCAibmFuZCIpOwoKQ291
bGQgd2UgdXNlIG10ZF90eXBlX2lzX25hbmQoKSBpbnN0ZWFkPwoKPiAgCWNvbmZpZy50eXBlID0g
TlZNRU1fVFlQRV9PVFA7Cj4gIAljb25maWcucm9vdF9vbmx5ID0gdHJ1ZTsKPiAgCWNvbmZpZy5p
Z25vcmVfd3AgPSB0cnVlOwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
