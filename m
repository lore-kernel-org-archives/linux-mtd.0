Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF104C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 08:51:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AF2207AE
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 08:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73AF2207AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BA+3Elc0d9pBN7j9Dq5ww2cTDvTKmNaD/W6C/OjzKEs=; b=1p7IQVS9PDVwVWJwnCQBEYeLJ
	YB/cyM4gfj0VZ09WqlX3RZMC1CU2HFWBwsULheeoXoxQ94WV0/QwMaLsGYUaLfwc9a3rrbgpLFrZ2
	TUA6lrcnVckrEioewgbiuHRrJdz8JvUkN0k8ixazn9tnQntcqR2qJ7af7osKq4HAVjSZWmb/RW1Bb
	Z8tBhg+XqaulerKG4LaTNyxPOtcr3Yo/jD/VU4oMICh7dYZHfnEK3PW1UYPIx8kKZsPn2/UBuix2x
	l21EF6HiaDTew6Wwy79+flSZc+iHDhIl6ODho91WNAQcDOGsaVxv4MSuCh1ol2W5eIPtgJAQ6GGSi
	hk1eKsF0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwLXv-0006Hi-Mt; Mon, 04 Jan 2021 08:48:59 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwLXs-0006H3-WC
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 08:48:57 +0000
X-Originating-IP: 90.89.98.255
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EF2E3240010;
 Mon,  4 Jan 2021 08:48:50 +0000 (UTC)
Date: Mon, 4 Jan 2021 09:48:49 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] mtd: rawnand: intel: remove broken code
Message-ID: <20210104094849.1850c993@xps13>
In-Reply-To: <20201217221148.2877318-1-martin.blumenstingl@googlemail.com>
References: <20201217221148.2877318-1-martin.blumenstingl@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_034857_133449_4B3F9732 
X-CRM114-Status: GOOD (  18.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vadivel.muruganx.ramuthevar@linux.intel.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org, richard@nod.at
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4gd3JvdGUgb24gVGh1LAoxNyBEZWMgMjAyMCAyMzoxMTo0OCArMDEwMDoKCj4g
RHJvcCB0aGUgY2hlY2sgZm9yIG10ZC0+bmFtZSBhcyBpdCdzIGV4ZWN1dGVkIHdoaWxlIHRoZSBt
dGQgdmFyaWFibGUgaXMKPiBhbHdheXMgTlVMTC4gSWYgc29tZSBNVEQgbmFtZSBpcyBuZWVkZWQg
dGhlbiBpdCBzaG91bGQgYmUgdmFsaWRhdGVkIGJ5Cj4gdGhlIE1URCBjb3JlLgo+IAo+IFdoaWxl
IGhlcmUsIGFsc28gZHJvcCB0aGUgTlVMTCBhc3NpZ25tZW50IHRvIHRoZSBtdGQgdmFyaWFibGUg
YXMgaXQncwo+IG92ZXJ3cml0dGVuIGxhdGVyIG9uIGFueXdheXMgYW5kIHRoZSBOVUxMIHZhbHVl
IGlzIG5ldmVyIHJlYWQuCj4gCj4gRml4ZXM6IDBiMTAzOWYwMTZlOGEzICgibXRkOiByYXduYW5k
OiBBZGQgTkFORCBjb250cm9sbGVyIHN1cHBvcnQgb24gSW50ZWwgTEdNIFNvQyIpCj4gU2lnbmVk
LW9mZi1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KPiAtLS0KPiBJIGZvdW5kIHRoaXMgYnkgbG9va2luZyBhdCB0aGUgbmV3IGRyaXZl
ci4gVGhpcyBwYXRjaCBpcyBjb21waWxlLXRlc3RlZAo+IG9ubHkuCj4gCj4gCj4gIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jIHwgNiArLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jCj4gaW5kZXggZmRiMTEyZThhOTBk
Li4zOThkZTZlYzY4ZDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW50ZWwt
bmFuZC1jb250cm9sbGVyLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlbC1uYW5k
LWNvbnRyb2xsZXIuYwo+IEBAIC01NzksNyArNTc5LDcgQEAgc3RhdGljIGludCBlYnVfbmFuZF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKPiAgCXN0cnVjdCBlYnVfbmFuZF9jb250cm9sbGVyICplYnVfaG9zdDsK
PiAgCXN0cnVjdCBuYW5kX2NoaXAgKm5hbmQ7Cj4gLQlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IE5V
TEw7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKPiAgCXN0cnVjdCByZXNvdXJjZSAqcmVzOwo+
ICAJY2hhciAqcmVzbmFtZTsKPiAgCWludCByZXQ7Cj4gQEAgLTY0NywxMCArNjQ3LDYgQEAgc3Rh
dGljIGludCBlYnVfbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
ICAgICAgIGVidV9ob3N0LT5lYnUgKyBFQlVfQUREUl9TRUwoY3MpKTsKPiAgCj4gIAluYW5kX3Nl
dF9mbGFzaF9ub2RlKCZlYnVfaG9zdC0+Y2hpcCwgZGV2LT5vZl9ub2RlKTsKPiAtCWlmICghbXRk
LT5uYW1lKSB7Cj4gLQkJZGV2X2VycihlYnVfaG9zdC0+ZGV2LCAiTkFORCBsYWJlbCBwcm9wZXJ0
eSBpcyBtYW5kYXRvcnlcbiIpOwo+IC0JCXJldHVybiAtRUlOVkFMOwo+IC0JfQoKVGhpcyBpcyB2
YWxpZCBjb2RlLCBpdCdzIGJlc3QgdG8gdXNlIGEgbGFiZWwgPSAibXktc3RvcmFnZSI7IHByb3Bl
cnR5CmluIHlvdXIgTkFORCBEVCBub2RlLiBUaGVuIG10ZC0+bmFtZSB3aWxsIGJlIHVwZGF0ZWQg
YnkKbmFuZF9zZXRfZmxhc2hfbm9kZSgpLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
