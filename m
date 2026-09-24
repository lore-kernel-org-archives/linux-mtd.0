Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C37C98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UyCt0l4iXUsyMd+2ZBylR3DzqZw3jtpC8lPhTi15Mgs=; b=WIuWU71LA3JgWC
	ep/VfVysf+L52q+PmGkS90dxRNaagjaBFga9aA3iTetb5CIs+UlqkMcC8LSyJo53ULXesVN5GlGh+
	PiemeoGXvbQi23SNh3bO0qe0hebTVL+xvLfPpObjycSibzE4Ix+0ecA7lXYqcP0p08gmdvXOpbqmN
	HO7NAWkM4uNGChzSeuxD01lqklB0u8n7UCUYfvDxjpYqJWLaHw4V007WNFTh6PNaio639MXa1dIoO
	XCAfzMLdNJUOVWiSC/TS/eeJQci4kCr4chGId4YwCqV4CEyeNBAHcGyTXjOvQZ7WyzAsomeSVLvNT
	JCe7PWNad2x45t/zYJ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9plU-0000000C73B-1Bqp;
	Thu, 24 Sep 2026 20:09:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9plS-0000000C72D-1dE4
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA1FB43D15;
	Thu, 24 Sep 2026 20:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D471F00893;
	Thu, 24 Sep 2026 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280593;
	bh=CQu78KLwTEVbiYZbpFLBvZknwpDQdFRkcZnlV1T0Nwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PRJLWZoV8qL+VhzPZsgQJTFScwTpVqZihRhIWsHyuu5iPluTcbDLsxqfOMk2bgoZq
	 epFbXSrzFFXHShYIxIbEYNn2xCDkEHCfAwhu/dsA9O39zM0Pyqz7KVMu9aGhyY5z2m
	 Zldy0tBEeyl4e7v6zNxs+M+c8f97w7Kal0wwraVQE2JEBZ4vvKbzfQRlQ2sqgJX5mI
	 gt7TQXK51wbjODnvqMlMIbVtv43gkCLZChEhF2zeWeX0amr0FYY/qR2oxYmr2wUCLj
	 N52x/I4SdJmhxNNS+RgB4OU9dSaqW5VUf5lDLzEZxNJLc2QlsvpEC3rhLBW3A/q7p2
	 4CZgiUpZrky2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] mtd: rawnand: qcom: make nandc_set_read_loc_last()
 more generic
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Gabor Juhos" <j4g8y7@gmail.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md Sadre
 Alam" <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-6-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:09:53 +0000
Message-Id: <20260924200953.63D471F00893@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBjb21taXQg
bWVzc2FnZSBpbmNvcnJlY3RseSBjbGFpbXMgJ3FwaWNfbmFuZGMnIHByZWZpeCBpcyB1c2VkCi0t
Cgpjb21taXQgNjQwZThiMDEyMTUwN2Q5OTVjY2EzODQ5NGMxN2Y4YTQ0ZmNkYjc1MApBdXRob3I6
IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29tPgoKbXRkOiByYXduYW5kOiBxY29tOiBtYWtl
IG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KCkgbW9yZSBnZW5lcmljCgpUaGlzIGNvbW1pdCBtb2Rp
ZmllcyBuYW5kY19zZXRfcmVhZF9sb2NfbGFzdCgpIHRvIHRha2UgYSBxY29tX25hbmRfY29udHJv
bGxlcgpwb2ludGVyIGRpcmVjdGx5IGluc3RlYWQgb2YgYSBuYW5kX2NoaXAgcG9pbnRlciwgYWlt
aW5nIHRvIG1ha2UgaXQgbW9yZQpnZW5lcmljLiBJdCBhbHNvIHJlbmFtZXMgdGhlIGZ1bmN0aW9u
IGFzIHBhcnQgb2YgYSBwcmVwYXJhdGlvbiB0byBtb3ZlIGl0CmludG8gY29tbW9uIGNvZGUuCgo+
ICAgICBJbiBvcmRlciB0byBtYWtlIHRoZSBmdW5jdGlvbiBtb3JlIGdlbmVyaWMsIGNoYW5nZSB0
aGUgZGVjbGFyYXRpb24KPiAgICAgdG8gZ2V0IGEgJ3Fjb21fbmFuZGNfY29udHJvbGxlcicgcG9p
bnRlciBkaXJlY3RseSwgYW5kIHVwZGF0ZSB0aGUKPiAgICAgY2FsbGVycyBhY2NvcmRpbmdseS4g
V2hpbGUgYXQgaXQsIGFsc28gY2hhbmdlIHRoZSBmdW5jdGlvbiBuYW1lIHRvCj4gICAgIHVzZSBh
ICdxcGljX25hbmRjJyBwcmVmaXguCgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGUgY29tbWl0
IG1lc3NhZ2UgYWNjdXJhdGVseSByZWZsZWN0IHRoZSBuZXcgZnVuY3Rpb24gbmFtZT8gVGhlIG1l
c3NhZ2UKc3RhdGVzIHRoZSBmdW5jdGlvbiBpcyByZW5hbWVkIHVzaW5nIGEgJ3FwaWNfbmFuZGMn
IHByZWZpeCwgYnV0IGxvb2tpbmcgYXQKdGhlIGNoYW5nZXMgdG8gZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jLCB0aGUgZnVuY3Rpb24gaXMgYWN0dWFsbHkKcmVuYW1lZCB0byB1c2Ug
YSAncWNvbV9uYW5kYycgcHJlZml4OgoKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKClsgLi4u
IF0KCj4gLXN0YXRpYyB2b2lkIG5hbmRjX3NldF9yZWFkX2xvY19sYXN0KHN0cnVjdCBuYW5kX2No
aXAgKmNoaXAsCj4gLQkJCQkgICAgaW50IHJlZ19iYXNlLCB1MzIgY3dfb2Zmc2V0LAo+IC0JCQkJ
ICAgIHUzMiByZWFkX3NpemUsIHUzMiBpc19sYXN0X3JlYWRfbG9jKQo+ICtzdGF0aWMgdm9pZCBx
Y29tX25hbmRjX3NldF9yZWFkX2xvY19sYXN0KHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAq
bmFuZGMsCj4gKwkJCQkJIGludCByZWdfYmFzZSwgdTMyIGN3X29mZnNldCwKPiArCQkJCQkgdTMy
IHJlYWRfc2l6ZSwgdTMyIGlzX2xhc3RfcmVhZF9sb2MpCgpTaG91bGQgdGhlIGNvbW1pdCBtZXNz
YWdlIGJlIHVwZGF0ZWQgdG8gbWVudGlvbiAncWNvbV9uYW5kYycgaW5zdGVhZCwgb3Igd2FzCnRo
ZSBmdW5jdGlvbiBpbnRlbmRlZCB0byBiZSBuYW1lZCBxcGljX25hbmRjX3NldF9yZWFkX2xvY19s
YXN0KCk/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwOTI0LXFjb21fbmFuZGMtc2hhcmUtbW9yZS1jb2RlLXYxLTAtZjMwMTIxOTli
MTYxQGdtYWlsLmNvbT9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
