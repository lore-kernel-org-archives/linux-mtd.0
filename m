Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC82EC54EEB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5AD2078C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BpqjHpq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE5AD2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4EI5djH90VX0LKqIDPXycGoEbfq66XwSCByhwjKJAo=; b=BpqjHpq5f1hGiI
	qN9Fw42K7ZlJbgonbEMc1rN8spWm3YW00abH23vh3zegLHAjugLPYwtGKBoP4y9P4UVuYi4Itlqie
	yc7A7kchlqkd2LngsUyv8Fn3PSR/eMUOtRaD4XbLUkXOS7UjbwPkPwJuo4OaNHS8dxKqVc2zkiIWs
	VGmN0GUICs3+HYF51iRWZSXBf7RLPxaSgCcTjgekl8gI/RRNFF9dsSM2noStMBZI1Cli5O88iuURw
	pZfPN+Xu9ImixQ04U5AGG+DtGev9mfBXUCbvZnwhsa45quaewxmU5oiFB3wdanl5bjCTZGd/BphnF
	JPiq9B3RmpWoJvSQaQKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9Jf-0003OS-F6; Mon, 27 Apr 2020 19:21:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9JU-0003Co-H6
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:21:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 19D5C2A0B73;
 Mon, 27 Apr 2020 20:21:07 +0100 (BST)
Date: Mon, 27 Apr 2020 21:21:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
Message-ID: <20200427212104.74d7b9d8@collabora.com>
In-Reply-To: <20200427205636.14f84490@xps13>
References: <CAP6exY+LQ4Cz3Wq3P=MP78HhHCovMYDfwhpVuASp17h3s2sgMw@mail.gmail.com>
 <20200327155608.GM2564@lahna.fi.intel.com>
 <20200327171907.7a7ffc73@xps13>
 <20200327164802.GN2564@lahna.fi.intel.com>
 <20200327175238.784cf47c@xps13>
 <CAP6exYJ4-pBBZKA0z8TKPqh_0tKzJadjXEBZk9dc9ij8BJ9Xew@mail.gmail.com>
 <20200327171619.GO2564@lahna.fi.intel.com>
 <CAP6exYJWWT2SFLjPCdjAEEjmZYwqYuTxd_aRaf=xEELmXqfMpA@mail.gmail.com>
 <CAP6exY+p-Chi2R4Y1H8UvcbE6rvEpMiK3UaX2OyBq=ZO6uULpg@mail.gmail.com>
 <20200330060859.GR2564@lahna.fi.intel.com>
 <20200330092722.2ff41863@xps13>
 <CAP6exY+F2VoEZkwcYp38HNt7NyZucQrdQ8MqQyTQ62U12pAcSw@mail.gmail.com>
 <20200401094148.1786d48a@xps13>
 <20200427111623.5f93842d@collabora.com>
 <20200427114954.4fc0e8fc@collabora.com>
 <20200427164138.05076f3a@xps13>
 <CAP6exYJbpmxQztCOHum-k_CqmCDrJewZaYWk-Bsxy2dsYibbaQ@mail.gmail.com>
 <CAP6exYKtHVZrs=v+g+XU0Rx9qvFZ+xj9St7=ZZV+JLHSQy0BaA@mail.gmail.com>
 <20200427205636.14f84490@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_122108_693799_66AC6AB3 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: ron minnich <rminnich@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyNyBBcHIgMjAyMCAyMDo1NjozNiArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgcm9uLAo+IAo+IHJvbiBtaW5uaWNoIDxy
bWlubmljaEBnbWFpbC5jb20+IHdyb3RlIG9uIE1vbiwgMjcgQXByIDIwMjAgMTE6NTA6NDYKPiAt
MDcwMDoKPiAKPiA+IEkgd2lsbCBhZGQgdGhhdCB0aGUgc3ludGF4IGxvb2tzIGxlc3MgbmljZSB0
byBtZSB0aGFuIHRoZSBbXSBub3RhdGlvbgo+ID4gYnV0IHN0aWxsIC4uLiBpdCBzaG91bGQgd29y
ay4gIAo+IAo+IEkgYWdyZWUsIGJ1dCB3ZSBuZWVkIHRvIGtlZXAgY21kbGluZSBwYXJzaW5nIGlu
IGxpbmUgd2l0aCBib290bG9hZGVycwo+IGFuZCB0aGlzIGlzIG1vcmUgcHJvYmxlbWF0aWMgdG8g
ZG8gdGhhbiB0byBzYXkuCgpOb3RlIHRoYXQgdGhpcyBwYXRjaCBtaWdodCBoYXZlIHRvIGJlIHBv
cnRlZCB0byBib290bG9hZGVycyBhbnl3YXkgKEkKZG9uJ3Qga25vdyBob3cgdGhlIHBhcnNpbmcg
aXMgZG9uZSB0aGVyZSkuCgpIbSwgaWYgeW91IGRvOgoKWzxQQ0ktZGV2LWlkPl06PHBhcnQtZGVm
cz4KCnlvdSBjYW4ga2VlcCB0aGUgUENJIGRldmljZSBpZCBuaWNlbHkgZW5jbG9zZWQgaW4gdGhl
IFtdIGJyYWNrZXRzLiBTbwp0aGF0J3MgdXAgdG8geW91LiBUaGUgbWFpbiBhZHZhbnRhZ2Ugb2Yg
dGhpcyBzaW1wbGUgcGF0Y2ggaXMgdGhhdCBpdApuaWNlbHkgc3VwcG9ydHMgZXhpc3RpbmcgZGV2
aWNlIG5hbWVzIGNvbnRhaW5pbmcgb25lIG9yIG1vcmUgY29sb25zLgoKPiAKPiBXb3VsZCB5b3Ug
bWluZCB0ZXN0aW5nIGlmIGl0IHdvcmtzIGZvciB5b3UsIHRoZW4gcG9zdCBCb3JpcycgZGlmZiB3
aXRoCj4geW91ciBUZXN0ZWQtYnk/Cj4gCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
