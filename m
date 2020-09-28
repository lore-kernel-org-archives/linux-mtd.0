Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F47C2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 16:22:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F080206DB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 16:22:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDVlisfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F080206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G9opSd61ty/VosgsmffeU4c88yLd/nQq8VAEEy4i8vY=; b=TDVlisfbrHYrtkU9ZMHdK1dWA
	w7XxrGOQMqoor2AcK8Wx8wBUUX+yY8ybVZHwlq36GNTJfqtGycjtQpqT+1dyzCu3l5hW6EihgIkd+
	+ExS7WhG1SQ3IVCbf5QEkztWOcdAaEo6y5sqn8GaTnXkfy3aQUdOb4JZooFLAnC+20oP526QDZQtV
	F9ZHKfS30sq1Eb9/d8b3eSK6+qnyTla5w98f+kSfNJbRyMCLtuwYB1BVrJ5tVfEH6Lh6WbA0XLW5E
	NGMgb+Hr+QveUpoBolN+7PUkkplkpQNj3RLvU/Io3M47KQP8mz9ajZCVEtfScwndi2iZQIwjTonpa
	Ep0/bfbPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMvuh-0006qN-3R; Mon, 28 Sep 2020 16:22:07 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMvue-0006pf-EK
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 16:22:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 656301C000B;
 Mon, 28 Sep 2020 16:22:00 +0000 (UTC)
Date: Mon, 28 Sep 2020 18:21:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function
 and structure names
Message-ID: <20200928182159.5a6cf46a@xps13>
In-Reply-To: <20200928180343.4c5302a5@collabora.com>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
 <20200913161533.10655-2-nthirumalesha7@gmail.com>
 <20200915101321.1afa5033@xps13>
 <CALKVOUomKLZ5GEHmXb+VfEq8UiNUpCN-Vqkx3N+yykEnCrHkDA@mail.gmail.com>
 <20200928165528.54e5db6e@xps13>
 <20200928174505.75fda272@collabora.com>
 <20200928175005.48783b61@xps13>
 <20200928180343.4c5302a5@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_122204_590121_1D50552A 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Thirumalesha N <nthirumalesha7@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBNb24sIDI4IFNlcAoyMDIwIDE4OjAzOjQzICswMjAwOgoKPiBPbiBNb24sIDI4
IFNlcCAyMDIwIDE3OjUwOjA1ICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiA+ID4gVGhlIHdheSBPT0IKPiA+ID4gPiBieXRlcyBh
cmUgb3JnYW5pemVkIGRvIG5vdCBzZWVtIHJlbGV2YW50IHRvIG1lLCBJIHRoaW5rIGkgcHJlZmVy
IHRoZQo+ID4gPiA+ICJfNF8vXzhfIiBuYW1pbmcsZXZlbiBpZiBpdCdzIG5vdCB2ZXJ5IGV4cGxp
Y2l0LiAgICAgIAo+ID4gPiAKPiA+ID4gVGhlIEVDQyBzdHJlbmd0aCBkb2Vzbid0IHNheSBhbnl0
aGluZyBhYm91dCB0aGUgc2NoZW1lIHVzZWQgZm9yIEVDQwo+ID4gPiBieXRlcyBwbGFjZW1lbnQs
IGFuZCB5b3UgbWlnaHQgZW5kIHVwIHdpdGggMiBkaWZmZXJlbnQgc2NoZW1lcwo+ID4gPiBwcm92
aWRpbmcgdGhlIHNhbWUgc3RyZW5ndGgsIG9yIHRoZSBzYW1lIHNjaGVtZSB1c2VkIGZvciAyIGRp
ZmZlcmVudAo+ID4gPiBzdHJlbmd0aHMuICAgIAo+ID4gCj4gPiBTbyBwZXJoYXBzIGJvdGggc2hv
dWxkIGJlIHByZXNlbnQgaW4gdGhlIG5hbWU/ICAKPiAKPiBObywgdGhlIHBvaW50IHdhcyB0byBy
ZS11c2UgdGhlIHNhbWUgZnVuY3Rpb25zIGZvciB2YXJpb3VzIHN0cmVuZ3RocyBpZgo+IHRoZXkg
dXNlIHRoZSBzYW1lIEVDQyBwbGFjZW1lbnQgc2NoZW1lLgoKSSBnZXQgdGhlIHBvaW50LCBidXQg
aXMgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZ2VuZXJpYyBlbm91Z2g/IEkKc2VlIGhhcmRj
b2RlZCBudW1iZXJzLCBJIGhhdmUgbm8gaWRlYSBpZiB0aGVzZSBudW1iZXJzIGFyZSBjb21tb24g
dG8KYWxsIHN0cmVuZ3RoIGdpdmVuIGEgc3BlY2lmaWMgbGF5b3V0LCBvciBpZiB0aGV5IG9ubHkg
bWF0Y2ggZm9yIGEgZ2l2ZW4Kc3RyZW5ndGg/Cgorc3RhdGljIGludCBtaWNyb25fNF9vb2JsYXlv
dXRfZWNjKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgIHN0cnVjdCBt
dGRfb29iX3JlZ2lvbiAqcmVnaW9uKQoreworCXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFu
ZCA9IG10ZF90b19zcGluYW5kKG10ZCk7CisKKwlpZiAoc2VjdGlvbiA+PSBzcGluYW5kLT5iYXNl
Lm1lbW9yZy5wYWdlc2l6ZSAvCisJCQltdGQtPmVjY19zdGVwX3NpemUpCisJCXJldHVybiAtRVJB
TkdFOworCisJcmVnaW9uLT5vZmZzZXQgPSAoc2VjdGlvbiAqIDE2KSArIDg7CisJcmVnaW9uLT5s
ZW5ndGggPSA4OworCisJcmV0dXJuIDA7Cit9CgpJZiBwb3NzaWJsZSwgSSB3b3VsZCBsaWtlIHRv
IGF2b2lkIHNldmVyYWwgc3VjY2Vzc2l2ZSByZW5hbWluZy4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
