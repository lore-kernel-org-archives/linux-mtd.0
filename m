Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A7CC636CA
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 14:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32D2613EE
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 14:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B32D2613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uj0E2t7U88K7Tg4m9E7ojmWEE32Axhfv9kNQwnA6FjU=; b=MHQz8mEEtsoLd5xVpy4os6UJgV
	FNeZNeX3C94O+V4CCSbl3ccc1IELBHCNDhxQOdnmDZJ7cMhncH0uUn0Q6NDyPsGGxRxml0N56vFd5
	2DOuUvDgphJUcHnMlchWtaTHKfT+3/R0+EHMx+xVmpguN6/lWn2uDc5s0JoOKZrFx6B+eBYmHz3pE
	hTO63X2LDJpG32Pb3jDJTNFdpXduWpedq8Pop6YsJIThz92EO4qqo0oFlskOqzxj9sZNCX5PrOVsv
	kDow1Ufx9yLaK3DXJQ6w4Dr4TWugO1gIs0tFj3Nam+OQSLJOM2WjfvIFxDQC+SCN6qs9bGO7l692f
	O8fheGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4P8I-004dQq-MH; Fri, 16 Jul 2021 14:48:06 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050::465:103])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4P8F-004dOp-2v
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 14:48:05 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GRDcb0slLzQk3W;
 Fri, 16 Jul 2021 16:47:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1626446877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+nNtDaQAd1eHbVp0NEslFE7HmmdwK9diT4/RSHiyTw=;
 b=iLTbso4uOmpH7h1+fKe6ufkN/fFZB7MWEaT5OjlBmMvvKOf/syPwWCJug5+L41AaVwpV75
 3YoLQ/BHjth91SM7MjPUXFRnLMppDsr/MopagtTl6EHHQ4Sa+1EGaXtslCdKXN+fB9toiS
 pViLz5/1nqoEaaeGDvOIDWoixuB43SVZaAS7DchQ7c2I2OtRj5NjJfN8qVY/o0fzBHtmMJ
 81zcmXOv/ia1EgwTSai5qOsaxiTpLtvSpJUdg5/SXLAo4PZf4C1Eve1hFDUQYCAX+5C4Mx
 X0BKyb6NL7wcPQ2O5gRpTyEKpShsLRHZL7oND0bxhontRr5UEQrcVZ7pwbb8qg==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id Ft2T4Dgia_dB; Fri, 16 Jul 2021 16:47:52 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: esmt: Add support for F25L16PA
To: Michael Walle <michael@walle.cc>, Jihoon Han <rapid_renard@renard.ga>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20210630175446.17680-1-rapid_renard@renard.ga>
 <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <6529409a-7ede-97a1-4277-616422afc874@gorani.run>
Date: Fri, 16 Jul 2021 23:47:45 +0900
MIME-Version: 1.0
In-Reply-To: <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
Content-Language: en-US
X-Rspamd-Queue-Id: 8653A17F3
X-Rspamd-UID: 2cf602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_074803_369141_20F700E2 
X-CRM114-Status: GOOD (  18.33  )
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

T24gMjAyMS0wNy0wMyAwMDoxMSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPiBBbSAy
MDIxLTA2LTMwIDE5OjU0LCBzY2hyaWViIEppaG9vbiBIYW46Cj4+IEFkZCBzdXBwb3J0IGZvciBG
MjVMMTZQQSB3aGljaCBpcyAyTUIgU1BJLU5PUiBDaGlwIG1hbnVmYWN0dXJlZCBieSBFU01ULgo+
Pgo+PiBUZXN0ZWQgb24gUXVhbGNvbW0gUUNBOTU1NyBiYXNlZCBEVzAyLTQxMkggcm91dGVyLgo+
Pgo+PiBEYXRhc2hlZXQ6Cj4+IGh0dHBzOi8vd3d3LmVzbXQuY29tLnR3L3VwbG9hZC9wZGYvRVNN
VC9kYXRhc2hlZXRzL0YyNUwxNlBBXzEoMlMpLnBkZgo+IAo+IFBsZWFzZSBwdXQgaXQgaW50byBv
bmUgbGluZSBhbmQganVzdCBiZWZvcmUgeW91ciBTaWduZWQtb2ZmLWJ5IHNvIGl0Cj4gd2lsbCBi
ZSB0YWcuCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEppaG9vbiBIYW4gPHJhcGlkX3JlbmFyZEBy
ZW5hcmQuZ2E+Cj4+IC0tLQo+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvZXNtdC5jIHwgMiArKwo+
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvZXNtdC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9lc210LmMKPj4g
aW5kZXggY2ZjOTIxOGMxMDUzLi4yZWJlZWNkNmM5NTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvZXNtdC5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvZXNtdC5jCj4+
IEBAIC0xMCw2ICsxMCw4IEBACj4+Cj4+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZv
IGVzbXRfcGFydHNbXSA9IHsKPj4gwqDCoMKgwqAgLyogRVNNVCAqLwo+PiArwqDCoMKgIHsgImYy
NWwxNnBhIiwgSU5GTygweDhjMjExNSwgMCwgNjQgKiAxMDI0LCAzMiwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgU0VDVF80SyB8IFNQSV9OT1JfSEFTX0xPQ0spIH0sCj4+IMKgwqDC
oMKgIHsgImYyNWwzMnBhIiwgSU5GTygweDhjMjAxNiwgMCwgNjQgKiAxMDI0LCA2NCwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBTUElfTk9SX0hBU19MT0NLIHwg
U1BJX05PUl9TV1BfSVNfVk9MQVRJTEUpIH0sCj4+IMKgwqDCoMKgIHsgImYyNWwzMnFhIiwgSU5G
TygweDhjNDExNiwgMCwgNjQgKiAxMDI0LCA2NCwKPiAKPiBUaGVyZSBpcyBhIEYyNUwxNlBBIHdo
aWNoIGhhcyBhIGRpZmZlcmVudCBJRCAoMHg4YzIwMTUpLiBTbyB3ZSBoYXZlIHRvIAo+IGFncmVl
Cj4gb24gYSBkaWZmZXJlbnQgbmFtZS4KPiAKPiBTZWUgYWxzbwo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC8yMDIxMDYyMDA4NTYzOS4xNDM2OTQtMS1tYW5zMG5AZ29yYW5pLnJ1
bi8gCgpIaSwKClNvLi4uY2FuIEkgYXNzdW1lIG15IGYyNWwzMnFhIHBhdGNoIGlzIGFjY2VwdGVk
IG9yIG5vdD8gSSBoYXZlbid0IGdvdCAKYW55IGV4cGxpY2l0IGZlZWRiYWNrIG9uIGl0LgoKSSB0
aG91Z2h0IGl0IGNvdWxkIGdvIGludG8gNS4xNC4uLmJ1dCBhcHBhcmVudGx5IG5vdC4KCj4gCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
