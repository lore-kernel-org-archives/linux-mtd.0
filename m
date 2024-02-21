Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A039CC48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEPHh22/YQB1ReXZDcISdMInSsHbYeXEQasINwE9+MQ=; b=gCn84exf6bqhH5
	9cEexnaHvvI76AakLhQNf+NFBCIsN/xSMwwN8F1cswO8argP02bKryVSCsKtk+E/W/cuGxiFX1lxs
	f5ZnaP0+NUYccIyaYWpNbIHjAFvhVWahE+G02Zcsgc+52lw50vs15L8JxgMKYYcrjKVl5WdGZuuyN
	BF5lRmWV5bzklKmrMIqNkrg7q4eKHGdoInoQpdkdgDSYBzKTZnBPyljIpDCVCAP+kBLpcY9HxqR4E
	jBNlGrTv16HHm8/5KVcXQl0AXNSlxiWfG5zomYpJEetFjASWcA8AdMENCrE8kGArFxb2zSr3sMmnT
	YmTn1nBh4F0vVPayZYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci2F-000000004uG-47In;
	Wed, 21 Feb 2024 08:32:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rci2B-000000004tN-1ss0;
	Wed, 21 Feb 2024 08:32:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3101A1C0004;
	Wed, 21 Feb 2024 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708504371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/O0u/zSlutQp0nOXmYUgakHqJLFyHa3N/CYJjeJxzeQ=;
	b=R7Z6pgaUldd207hxJfJcnQjh7VprZyrgdZVVzOZbB6x0vAOMbdbRMX70JpaxQ7WoBajaQm
	GyQ72uUlXd41adHhmdtHzkbKyw6AWW/T2PeaENr5cakObB4lGeT1M35rZA+6oU1bbUQY2H
	7YtJ77mRjJrMrzz5wHkcsNfCqmbZECiWhG1yrzYj/lfeau3OEhcbW+IZWcY6tCcZZ1bd06
	iGdbOaIWKAXaU9OGQRS565owEAesrfHayisjP7Q1a/s26fLVd67YNq9zjKiiwSHuhLWYy8
	gU28y8/BHUnUp+BIOdmhxiTQfcgbjutC3eECAUvNtDpv0nGQbYypfRN8VPShHg==
Date: Wed, 21 Feb 2024 09:32:47 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: William Zhang <william.zhang@broadcom.com>, Linux MTD List
 <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v5 11/12] mtd: rawnand: brcmnand: exec_op helper
 functions return type fixes
Message-ID: <20240221093247.5297f1f3@xps-13>
In-Reply-To: <f6e61482-b51a-4970-9257-8db7975148fa@moroto.mountain>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
	<20240207202257.271784-12-william.zhang@broadcom.com>
	<20240220110240.1ad5b995@xps-13>
	<f6e61482-b51a-4970-9257-8db7975148fa@moroto.mountain>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_003255_823170_D7FE8CAC 
X-CRM114-Status: GOOD (  16.54  )
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

SGksCgpkYW4uY2FycGVudGVyQGxpbmFyby5vcmcgd3JvdGUgb24gV2VkLCAyMSBGZWIgMjAyNCAw
OToxNjozMSArMDMwMDoKCj4gT24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTE6MDI6NDBBTSArMDEw
MCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IAo+ID4gd2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5j
b20gd3JvdGUgb24gV2VkLCAgNyBGZWIgMjAyNCAxMjoyMjo1NiAtMDgwMDoKPiA+ICAgCj4gPiA+
IEZyb206IERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRjb20uY29tPgo+ID4gPiAKPiA+ID4gZml4
IHJldHVybiB0eXBlIGZvciBleGVjX29wIHJlc2V0IGFuZCBzdGF0dXMgZGV0ZWN0IGhlbHBlciBm
dW5jdGlvbnMKPiA+ID4gCj4gPiA+IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQGxpbmFyby5vcmc+Cj4gPiA+IENsb3NlczogaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIzLURlY2VtYmVyLzEwMjQyMy5odG1sCj4gPiA+IEZp
eGVzOiAzYzgyNjBjZTc2NjMgKCJtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBleGVjX29wIGltcGxl
bWVudGF0aW9uIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBicm9h
ZGNvbS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gWmhhbmcgPHdpbGxpYW0uemhh
bmdAYnJvYWRjb20uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogV2lsbGlhbSBaaGFuZyA8d2lsbGlh
bS56aGFuZ0Bicm9hZGNvbS5jb20+ICAKPiA+IAo+ID4gQnkgdGhlIHdheSwgYSBDYzogc3RhYmxl
IHRhZyBtaWdodCBiZSB1c2VmdWwgYXMgb3RoZXJ3aXNlIHlvdSBtYXkgbGVhawo+ID4gYW4gZXJy
b3IgY29kZSBpbiBhIHN0YXR1cyB2YWx1ZSAod2hpY2ggaXMgYSBidWcpLiBBbmQgbW92ZSB0aGlz
IHBhdGNoCj4gPiBmaXJzdCBpbiB5b3VyIHNlcmllcyBzbyB3ZSdyZSBzdXJlIGl0IGRvZXMgbm90
IGNvbmZsaWN0IHdpdGggYW55IG9mIHRoZQo+ID4gb3RoZXIgcGF0Y2hlcyBhbmQgY2FuIGJlIGJh
Y2twb3J0ZWQgbW9yZSBlYXNpbHkuICAKPiAKPiBUaGUgb3JpZ2luYWwgY29tbWl0IDNjODI2MGNl
NzY2MyAoIm10ZDogcmF3bmFuZDogYnJjbW5hbmQ6IGV4ZWNfb3AKPiBpbXBsZW1lbnRhdGlvbiIp
IGlzIG5vdCBpbiBzdGFibGUgc28gd2Ugc2hvdWxkIGJlIG9rYXkgb24gdGhpcy4KClJpZ2h0LgoK
SG93ZXZlciBwbGVhc2Ugc2VuZCBhZ2FpbiB0aGlzIHBhdGNoIHF1aWNrbHkgc28gSSBjYW4gcXVl
dWUgaXQgdXAKYmVmb3JlIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
