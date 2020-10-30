Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A63EC00A89
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 18:53:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7BCC2075E
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 18:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TnjYVI9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7BCC2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MV2rqyjZZaJQjHH4XL/tWhcysruu7cPKJWC7EI4WNXs=; b=TnjYVI9+cJ1E2yS45Uq/KbhER
	zqs56G6dJK7QlhdSirJSqSnvdGaDanXz/JAxxrxmAkFNqx83VFnnMnrIbgukiezTv/AQM3cc7kKkC
	ASaQ2mokW7Y/fbwaqoXOycIiRFu3ImRTe0jmvkAq0qLTVDH1SuSeHjX5t0sI7y8eqQcrM+I3R4CNi
	fbm+NZVd2Gvo5yt+L+AybY+YlZEBW9lcd8KJTukwVSXclJoJi9gxaZWf4MH9ebk2EoGTget4rDQA2
	+QOPwKCyvmRiLPTbj/d6KO96Tt+BqT8IfozG22n3YCclvQILLfL+1+d1CR3NlaUIChOKe1QgPl9aT
	6kUN7KO0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZWE-00078s-IK; Fri, 30 Oct 2020 18:52:58 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZWB-00078A-Nu
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 18:52:56 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 85FC460004;
 Fri, 30 Oct 2020 18:52:52 +0000 (UTC)
Date: Fri, 30 Oct 2020 19:52:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Message-ID: <20201030195251.687809f7@xps13>
In-Reply-To: <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
 <20201030184736.4ec434f5@xps13>
 <aefef0187e5ebbe315e57e834ff1ba756ba88817.camel@infinera.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_145255_882042_84A040A7 
X-CRM114-Status: GOOD (  16.38  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9ha2ltLAoKSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5j
b20+IHdyb3RlIG9uIEZyaSwgMzAgT2N0CjIwMjAgMTg6Mzk6MzUgKzAwMDA6Cgo+IE9uIEZyaSwg
MjAyMC0xMC0zMCBhdCAxODo0NyArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IAo+ID4g
SGkgSm9ha2ltLCAgCj4gCj4gSGkgTWlxdWVsCj4gCj4gPiAKPiA+IFBsZWFzZSBDYyB0aGUgTVRE
IG1haW50YWluZXJzLCBub3Qgb25seSB0aGUgbGlzdCAoZ2V0X21haW50YWluZXJzLnBsKS4gIAo+
IAo+IEkgZmlndXJlIGFsbCBtYWludGFpbmVycyBhcmUgb24gdGhlIGxpc3QgPwoKSSBwZXJzb25h
bGx5IGRvbid0IGxvb2sgYXQgdGhlIGxpc3QgdmVyeSBvZnRlbi4gSSBleHBlY3QgcGF0Y2hlcyB0
byBiZQpkaXJlY3RlZCB0byBtZSAoaW4gdGhlIGN1cnJlbnQgY2FzZSwgVmlnbmVzaCkgd2hlbiBJ
IGFtIGNvbmNlcm5lZC4KCj4gCj4gPiAKPiA+IEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVy
bmx1bmRAaW5maW5lcmEuY29tPiB3cm90ZSBvbiBUaHUsIDIyIE9jdAo+ID4gMjAyMCAxNzo0NTow
NiArMDIwMDoKPiA+ICAgCj4gPiA+IENvbW1pdCAibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBz
dXBwb3J0IGZvciBwb2xsaW5nIHN0YXR1cyByZWdpc3RlciIKPiA+ID4gYWRkZWQgc3VwcG9ydCBm
b3IgcG9sbGluZyB0aGUgc3RhdHVzIHJhdGhlciB0aGFuIHVzaW5nIERRIHBvbGxpbmcuCj4gPiA+
IEhvd2V2ZXIsIHN0YXR1cyByZWdpc3RlciBpcyB1c2VkIG9ubHkgd2hlbiBEUSBwb2xsaW5nIGlz
IG1pc3NpbmcuCj4gPiA+IExldHMgdXNlIHN0YXR1cyByZWdpc3RlciB3aGVuIGF2YWlsYWJsZSBh
cyBpdCBpcyBzdXBlcmlvciB0byBEUSBwb2xsaW5nLgo+ID4gPiAgIAo+ID4gCj4gPiBJIHdpbGwg
bGV0IHZpZ25lc2ggY29tbWVudCBhYm91dCB0aGUgY29udGVudCAobG9va3MgZmluZSBieSBtZSkg
YnV0IHlvdSB3aWxsCj4gPiBuZWVkIGEgRml4ZXMgdGFnIGhlcmUuICAKPiAKPiBUaGlzIGlzIG5v
dCBhIEZpeGVzIHNpdHVhdGlvbiwgbm8gYnVnIGp1c3QgYSBodyBlbmFibGluZyB0aGluZy4KPiBB
bHNvLCBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoZSBTdGF0dXMgcGF0Y2hlcyBiZSBiYWNrcG9ydGVk
IHRvIDQuMTkgYXMgd2VsbC4KCkJhY2twb3J0aW5nIGZlYXR1cmVzIGlzIElNSE8gbm90IHJlbGV2
YW50LiBJIGd1ZXNzIHN0YWJsZSBrZXJuZWwgb25seQp0YWtlIGZpeGVzLi4uCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
