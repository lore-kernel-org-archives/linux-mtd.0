Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9B9C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:24:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1807A61053
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 11:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1807A61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+UJbDnKfMB8W7EvDPahuXzsOD6NfiV+bwTaKFUi2Y4=; b=bJIpEWxulstMZxXO2wUSM/mHMn
	Ik/Y1T8eSLO9MtScCCKx5ZveO/L2umZGQ2/NyTa4H7eE3Fry6ysSxTAEC1EolbIKlnE4HVwU8OHOT
	ybMDJ5h9Y9i3EUvZfCsH+FUqiBc7/flnZ1J3sND6eXAtLZbRkAVRpSuPJVvbkiOg3ZbF7w8m+gYNE
	LCOG3gLnp3pQOTaGk97u5RdieZH37W27T3jGJzo1hkqMteOGqhplHn3f4zVHHidhgkv0+2/tigues
	ev3pbhGS8OuAzHmCneTyRpuM5PliaCRsN1yOF0bE4ibuVPg5Robcb9iA8kSuRGkTakV+Vy4JkXGPr
	RJaQDPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOLO-005Yx7-Mu; Wed, 01 Sep 2021 11:23:50 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLNtp-005MxJ-Ey
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 10:55:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630493719; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=i/rV9eRMsBXO4MHz9MLGdRubgAKJZJUODTtpd0gk+CQ=;
 b=RNgg7LyHCb/5tU1sPwOh2cMH5IVhLptFr1hsFBQQlYOWoB8r1HyQS+tM9b1Hu9sd8nyKpzd3
 n33Dly0w56tJkUpEyHEL3CdA+DOD7j0Pu1QusMa3Rv5o8juZHKJhO759mSQuT/t1kVFAsYJC
 QEDxTYxJwawMk0a8WiVtS7JTkgg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 612f5c15825e13c54abde00c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Sep 2021 10:55:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 84A24C43619; Wed,  1 Sep 2021 10:55:16 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B8945C43460;
 Wed,  1 Sep 2021 10:55:15 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 01 Sep 2021 16:25:15 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V2] mtd: rawnand: qcom: Update code word value for raw read
In-Reply-To: <20210831134231.14413a4f@xps13>
References: <1630400200-2522-1-git-send-email-mdalam@codeaurora.org>
 <20210831134231.14413a4f@xps13>
Message-ID: <114bc85cdd51cb6c885b00d4d2819df9@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_035521_632873_B9B582D3 
X-CRM114-Status: GOOD (  21.52  )
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

T24gMjAyMS0wOC0zMSAxNzoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBNZCwKPiAKPiBN
ZCBTYWRyZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+IHdyb3RlIG9uIFR1ZSwgMzEgQXVn
IDIwMjEKPiAxNDoyNjo0MCArMDUzMDoKPiAKPj4gRnJvbSBRUElDIFYyIG9ud2FyZHMgdGhlcmUg
aXMgYSBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkCj4+IGxhc3QgY29kZSB3b3JkICJRUElDX05B
TkRfUkVBRF9MT0NBVElPTl9MQVNUX0NXX24iLgo+PiAKPj4gcWNvbV9uYW5kY19yZWFkX2N3X3Jh
dygpIGlzIHVzZWQgdG8gcmVhZCBvbmx5IG9uZSBjb2RlIHdvcmQKPj4gYXQgYSB0aW1lLiBJZiB3
ZSB3aWxsIGNvbmZpZ3VyZSBudW1iZXIgb2YgY29kZSB3b3JkcyB0byAxIGluCj4+IGluIFFQSUNf
TkFORF9ERVYwX0NGRzAgcmVnaXN0ZXIgdGhlbiBRUElDIGNvbnRyb2xsZXIgdGhpbmtzCj4+IGl0
cyByZWFkaW5nIHRoZSBsYXN0IGNvZGUgd29yZCwgc2luY2UgZnJvbSBRUElDIFYyIG9ud2FyZHMK
Pj4gd2UgYXJlIGhhdmluZyBzZXBhcmF0ZSByZWdpc3RlciB0byByZWFkIHRoZSBsYXN0IGNvZGUg
d29yZCwKPj4gd2UgaGF2ZSB0byBjb25maWd1cmUgIlFQSUNfTkFORF9SRUFEX0xPQ0FUSU9OX0xB
U1RfQ1dfbiIKPj4gcmVnaXN0ZXIgdG8gZmV0Y2ggZGF0YSBmcm9tIGNvbnRyb2xsZXIgYnVmZmVy
IHRvIHN5c3RlbQo+PiBtZW1vcnkuCj4+IAo+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcKPiAKPiBZ
b3UgbWlzcyB0aGUgRml4ZXMgdGFnIHdoaWNoIGlzIGNlcnRhaW5seSB0aGUgbW9zdCBpbXBvcnRh
bnQuCgogICBVcGRhdGVkIGluIFYzIHBhdGNoLgo+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRy
ZSBBbGFtIDxtZGFsYW1AY29kZWF1cm9yYS5vcmc+Cj4+IAo+PiBbVjJdCj4+ICAqIEFkZGVkIHN0
YWJsZSB0YWdzCj4gCj4gVGhlIGNoYW5nZWxvZyBzaG91bGQgbm90IGJlIHBhcnQgb2YgdGhlIGNv
bW1pdCBtZXNzYWdlLgo+IFlvdSBzaG91bGQgcHV0IGl0Li4uCj4gCiAgIFVwZGF0ZWQgaW4gVjMg
cGF0Y2guCgo+PiAtLS0KPiAKPiAuLi5oZXJlLgo+IAo+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jIHwgOCArKysrKystLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMgCj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4+IGluZGV4IGVmMGJhZGUuLjA0ZTZmN2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3Fjb21fbmFuZGMuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMKPj4gQEAgLTE2NzYsMTMgKzE2NzYsMTcgQEAgcWNvbV9uYW5kY19yZWFkX2N3X3Jhdyhz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgCj4+IHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4+ICAJc3Ry
dWN0IG5hbmRfZWNjX2N0cmwgKmVjYyA9ICZjaGlwLT5lY2M7Cj4+ICAJaW50IGRhdGFfc2l6ZTEs
IGRhdGFfc2l6ZTIsIG9vYl9zaXplMSwgb29iX3NpemUyOwo+PiAgCWludCByZXQsIHJlZ19vZmYg
PSBGTEFTSF9CVUZfQUNDLCByZWFkX2xvYyA9IDA7Cj4+ICsJaW50IHJhd19jdyA9IGN3Owo+PiAK
Pj4gIAluYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBOVUxMLCAwKTsKPj4gIAlob3N0
LT51c2VfZWNjID0gZmFsc2U7Cj4+IAo+PiArCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4+
ICsJCXJhd19jdyA9IGVjYy0+c3RlcHMgLSAxOwo+PiArCj4+ICAJY2xlYXJfYmFtX3RyYW5zYWN0
aW9uKG5hbmRjKTsKPj4gIAlzZXRfYWRkcmVzcyhob3N0LCBob3N0LT5jd19zaXplICogY3csIHBh
Z2UpOwo+PiAtCXVwZGF0ZV9yd19yZWdzKGhvc3QsIDEsIHRydWUsIGN3KTsKPj4gKwl1cGRhdGVf
cndfcmVncyhob3N0LCAxLCB0cnVlLCByYXdfY3cpOwo+PiAgCWNvbmZpZ19uYW5kX3BhZ2VfcmVh
ZChjaGlwKTsKPj4gCj4+ICAJZGF0YV9zaXplMSA9IG10ZC0+d3JpdGVzaXplIC0gaG9zdC0+Y3df
c2l6ZSAqIChlY2MtPnN0ZXBzIC0gMSk7Cj4+IEBAIC0xNzExLDcgKzE3MTUsNyBAQCBxY29tX25h
bmRjX3JlYWRfY3dfcmF3KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCAKPj4gc3RydWN0IG5hbmRfY2hp
cCAqY2hpcCwKPj4gIAkJbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIGN3LCAzLCByZWFkX2xvYywg
b29iX3NpemUyLCAxKTsKPj4gIAl9Cj4+IAo+PiAtCWNvbmZpZ19uYW5kX2N3X3JlYWQoY2hpcCwg
ZmFsc2UsIGN3KTsKPj4gKwljb25maWdfbmFuZF9jd19yZWFkKGNoaXAsIGZhbHNlLCByYXdfY3cp
Owo+PiAKPj4gIAlyZWFkX2RhdGFfZG1hKG5hbmRjLCByZWdfb2ZmLCBkYXRhX2J1ZiwgZGF0YV9z
aXplMSwgMCk7Cj4+ICAJcmVnX29mZiArPSBkYXRhX3NpemUxOwo+IAo+IFRoYW5rcywKPiBNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
