Return-Path: <SRS0=6iW2=DF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E9AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C0B21548
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2020 15:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8bL/kqW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C0B21548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lbt+ptm5yD/ezc6tHeJ6O/s4TZs71NI0Gv7Xo168Auo=; b=D8bL/kqWagtcOc7uHnXHI4CTP
	PDVOoxELHDVt3apY4ATWnsvXUX3JIDLvLf8RGyO25PCFnZ+uQZquhaWMgXouz8EanongTbpXlfmn1
	YbFJKcS73ZkJdoAOWRTJ2lqH6A1yVKWl5QC7acojeN//RgJXNnxEsZnEa9ZKmD1pmLdY64pVq5bjK
	3LyUeHa2ZSVOlrZP4HkfQgiR1j8H4UsycEQUkYoA/A55MlHwRLeGvRJIujcgPMe5ZBDQzjflSpmL4
	2UCpwk2uCO9qMBzuhr4UIGDVnSbY8Djs+u2+MEw4TfkE2p23U+0MCJEZ4IUf3Qeirg4N1Tw50NWPw
	x4GieaokA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMv1u-0001gh-5e; Mon, 28 Sep 2020 15:25:30 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMuwq-0007XC-Tm
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2020 15:20:18 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D3C9920011;
 Mon, 28 Sep 2020 15:20:13 +0000 (UTC)
Date: Mon, 28 Sep 2020 17:20:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20200928172012.712035f8@xps13>
In-Reply-To: <20200921094010.GH21278@pengutronix.de>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_112017_075295_6D3A657B 
X-CRM114-Status: GOOD (  16.20  )
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
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sCgpTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+IHdyb3RlIG9u
IE1vbiwgMjEgU2VwIDIwMjAKMTE6NDA6MTAgKzAyMDA6Cgo+IEhpIEZhYmlvLAo+IAo+IE9uIFdl
ZCwgU2VwIDE2LCAyMDIwIGF0IDEwOjQ5OjAzQU0gLTAzMDAsIEZhYmlvIEVzdGV2YW0gd3JvdGU6
Cj4gPiBIaSBNaXF1ZWwsCj4gPiAKPiA+IE9uIGEgaW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGsg
IGJvYXJkIHJ1bm5pbmcgbGludXgtbmV4dCwgdGhlCj4gPiBmb2xsb3dpbmcgd2FybmluZyBpcyBz
ZWVuOgo+ID4gCj4gPiAxMDoxNToyNi4yMzIwNjkgIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQo+ID4gMTA6MTU6MjYuMjMyODgwICBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0
Cj4gPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYzo1MjQyIG5hbmRfc2Nhbl93aXRo
X2lkcysweDliYy8weDEwMDgKPiA+IDEwOjE1OjI2LjI0MTEzMiAgVW5zdXBwb3J0ZWQgRUNDIGFs
Z29yaXRobSEgIAo+IAo+IFRoYW5rcyBmb3Igc3BvdHRpbmcgdGhpcy4KPiAKPiA+IAo+ID4gSSBi
ZWxpZXZlIGl0IGhhcyBiZWVuIGNhdXNlZCBieSA3NGE4OWQ3ZjllZDcgKCJtdGQ6IHJhd25hbmQ6
IFVzZSB0aGUKPiA+IEVDQyBmcmFtZXdvcmsgdXNlciBpbnB1dCBwYXJzaW5nIGJpdHMiKSAgCj4g
Cj4gSSBiZWxpZXZlIHRoYXQgYXMgd2VsbC4gSSd2ZSBzZW5kIGEgcmVzcG9uc2UgdG8gdGhlIG9y
aWdpbmFsIHBhdGNoIG1haWwKPiBkZXNjcmliaW5nIHdoYXQgZ29lcyB3cm9uZyBoZXJlLgo+IAo+
IFNhc2NoYQo+IAo+IAoKVGhlIGlzc3VlIGlzIG5vdyBhZGRyZXNzZWQgdGhhbmtzIHRvIFNhc2No
YSBmaW5kaW5ncywgaXQgaXMgZml4ZWQgaW4KbmFuZC9uZXh0IGFuZCBzaG91bGQgYmUgaW4gdG9k
YXkncyBsaW51eC1uZXh0IGFzIHdlbGwuIFBsZWFzZSB0ZWxsIG1lCmlmIHRoZSBDSSBzdGlsbCBy
ZXBvcnRzIGFuIGVycm9yIQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
