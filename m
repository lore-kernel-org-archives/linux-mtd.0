Return-Path: <SRS0=CH1w=DV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9CFC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 13:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAC2522201
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2020 13:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpJWfxUJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAC2522201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zwTz8gqh/U6HodnsEZaNTN4xyRt2MMnjvLDjlHImo7w=; b=cpJWfxUJUHHqfnFGExOS1dD0v
	/U5OnjO+8jqg3XW1sckutGA5bA4/RN9PibsH79W23j4sw3GoTNiM531KaG7CTpGDHeckLtSkPZhxL
	f9O5f938y3yNo9xByr0PAO+K+Yq4hOgrL7Z9uqrffdkS+vkcndYODfeYRBTtgxOpLzw6uH4jI+O/1
	BeUiECCfy0QM+tNBE8546M4SKX0nGwVhQP0l6SlHmNESq8ijYeSk/4vNxm3dG+/N+ptOFkRmt3P7T
	gyxRVlhKt9kNn/LI5GVlIgTTkchPmKLKugEsC0pXh2qH4yiSaGeaTZkG7N2Do+P3Qi7IaUotLrlEN
	Ig0KsEr8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSgoB-0003zO-0a; Wed, 14 Oct 2020 13:27:11 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgo7-0003xq-4r
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2020 13:27:08 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1B05510001D;
 Wed, 14 Oct 2020 13:27:00 +0000 (UTC)
Date: Wed, 14 Oct 2020 15:26:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
Message-ID: <20201014152659.6ef6a2fc@xps13>
In-Reply-To: <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de>
 <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
 <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_092707_289736_92225073 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRmFiaW8sIFNhc2NoYSwgTHVjYXMsCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+IHdyb3RlIG9uIFdlZCwgMTQgT2N0IDIwMjAgMDk6MjM6MDYKLTAzMDA6Cgo+IEhpIEx1Y2Fz
LAo+IAo+IE9uIFR1ZSwgT2N0IDEzLCAyMDIwIGF0IDI6MTQgUE0gTHVjYXMgU3RhY2ggPGwuc3Rh
Y2hAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+IAo+ID4gSnVzdCBhIGhlYWRzIHVwOiBvdXIgbGFi
IHdhcyBicm9rZW4gZm9yIHNvbWUgdGltZSBkdWUgdG8gYSBsb2NhbCBpc3N1ZS4KPiA+IEl0J3Mg
bm93IGJhY2sgdG8gd29ya2luZyBhbmQgdGhlIGJhY2tsb2cgb2Ygam9icyBpcyBiZWluZyBleGVj
dXRlZCBvbgo+ID4gdGhlIGJvYXJkcyByaWdodCBub3csIHNvIHJlc3VsdHMgc2hvdWxkIHNob3cg
dXAgaW4gdGhlIG5lYXIgZnVydHVyZS4gIAo+IAo+IFRoYW5rcy4ga2VybmVsY2kgcmVzdWx0cyBh
cmUgc2hvd2luZyB1cCBhZ2Fpbi4KPiAKPiBIaSBNaXF1ZWwsCj4gCj4gVGhlIEVDQyBpc3N1ZXMg
YXJlIHN0aWxsIHByZXNlbnQgb24gaW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGs6Cj4gaHR0cHM6
Ly9zdG9yYWdlLmtlcm5lbGNpLm9yZy9uZXh0L21hc3Rlci9uZXh0LTIwMjAxMDEzL2FybS9pbXhf
djRfdjVfZGVmY29uZmlnL2djYy04L2xhYi1wZW5ndXRyb25peC9iYXNlbGluZS1pbXgyNy1waHl0
ZWMtcGh5Y2FyZC1zLXJkay5odG1sCj4gCj4gQlRXLCBFQ0MgZXJyb3JzIGFyZSBhbHNvIHJlcG9y
dGVkIG9uIGEgRnJlZXNjYWxlIExheWVyc2NhcGUgMjA4OEEgUkRCIEJvYXJkOgo+IGh0dHBzOi8v
d3d3LnNwaW5pY3MubmV0L2xpc3RzL2lvbW11L21zZzQ5NzcyLmh0bWwKPiAKCkkgc3VwcG9zZWQg
dGhlIGZhaWxpbmcgZGl2aXNpb24gaXMgdGhpcyBvbmU6CgogICAgICAgIC8qCiAgICAgICAgICog
U2V0IHRoZSBudW1iZXIgb2YgcmVhZCAvIHdyaXRlIHN0ZXBzIGZvciBvbmUgcGFnZSBkZXBlbmRp
bmcgb24gRUNDCiAgICAgICAgICogbW9kZS4KICAgICAgICAgKi8KICAgICAgICBlY2MtPnN0ZXBz
ID0gbXRkLT53cml0ZXNpemUgLyBlY2MtPnNpemU7CiAgICAgICAgaWYgKGVjYy0+c3RlcHMgKiBl
Y2MtPnNpemUgIT0gbXRkLT53cml0ZXNpemUpIHsKICAgICAgICAgICAgICAgIFdBUk4oMSwgIklu
dmFsaWQgRUNDIHBhcmFtZXRlcnNcbiIpOwogICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsK
ICAgICAgICAgICAgICAgIGdvdG8gZXJyX25hbmRfbWFudWZfY2xlYW51cDsKICAgICAgICB9CgpX
aGljaCBwcm9kdWNlcyB0aGUgd2FybmluZyByaWdodCBhZnRlci4gVGhpcyB3b3VsZCBtZWFuIHRo
YXQKCgllY2MtPnNpemUgPT0gMAoKQnV0IHRoaXMgZW50cnkgaXMgc2V0IGJlZm9yZSBjYWxsaW5n
IG5hbmRfc2NhbigpIGluIG14Y25kX3Byb2JlKCkgdG8KNTEyLCBhbmQgdGhhdCBkb2VzIG5vdCBt
YWtlIHNlbnNlLgoKSSBndWVzcyB3ZSBzaG91bGQgYmUgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBl
cnJvciB3aXRoIGFueSBib2FyZCB1c2luZwp0aGUgbXhjIE5BTkQgZHJpdmVyIHdpdGggaGFyZHdh
cmUgY29ycmVjdGlvbiAobm93IGFsc28gY2FsbGVkICJvbgpob3N0IikuIERvIHlvdSBoYXZlIHN1
Y2ggYSBib2FyZCBhdmFpbGFibGUgdG8gYXQgbGVhc3QgdmVyaWZ5IHRoYXQgdGhlCmJlZ2lubmlu
ZyBvZiBteSBsb2dpYyBpcyByaWdodD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
