Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DC4C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:21:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787F520775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F8crTHhA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787F520775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oi1OeTnZsmp/VpdLPEUek6/L3oIrKY97d/wjyU32M3Y=; b=F8crTHhAO63CFF
	8Ix3ywkiPNqn3GobJzWlTGr/iTdH4WzwyXyUZqLXmta9MR5DAjNfE4DOHdV9LeQMauU6fx1FgiqqN
	6Q9XFW6JufvD3sehaVzw6CPx1KH4H4IyamXwjESFiDqJ6yllvy54dUSCuMDcHxCpYd1BC125BUaJ6
	K442KvTbwRSLkVvfcbuEvH8flaIg3WtU5lZiQxJSRnBw/sLnulxWiEmPScQU9Az6fGhS1jfUK9LAS
	KXIFCkcfAYEu8F97dsvz49iE2N4gjs5shL8W55BkwDTXAgfr/PfpkI3EH6HNHHzuJoH3XplhtB1ke
	f91e7HBJnKXKXRAfJnag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT9JW-0003E4-MZ; Mon, 27 Apr 2020 19:21:10 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT9JS-0003CQ-SM
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:21:08 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 276A0240003;
 Mon, 27 Apr 2020 19:21:03 +0000 (UTC)
Date: Mon, 27 Apr 2020 21:21:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 2/3] mtd: lpddr: Replace printk with pr_notice
Message-ID: <20200427212102.2de1105a@xps13>
In-Reply-To: <c324eed2e6c76fd0157969c69e463e7e7b9ba144.camel@perches.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
 <c9684a22b661fdeff9efcd5b18be01653911fc89.1588013366.git.gustavo@embeddedor.com>
 <d036dbad02241fdeb0a6400896f73ff11e98e53b.camel@perches.com>
 <67c4b34d-019d-e4c9-ebd2-3a8477470048@embeddedor.com>
 <c324eed2e6c76fd0157969c69e463e7e7b9ba144.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_122107_052784_2E2F31B8 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLAoKSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gd3JvdGUgb24gTW9uLCAyNyBB
cHIgMjAyMCAxMjoxNTowMiAtMDcwMDoKCj4gT24gTW9uLCAyMDIwLTA0LTI3IGF0IDE0OjEwIC0w
NTAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3RlOgo+ID4gCj4gPiBPbiA0LzI3LzIwIDE0OjAx
LCBKb2UgUGVyY2hlcyB3cm90ZTogIAo+ID4gPiBPbiBNb24sIDIwMjAtMDQtMjcgYXQgMTQ6MDMg
LTA1MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6ICAKPiA+ID4gPiBwcl9ub3RpY2UgaXMg
cHJlZmVycmVkIG92ZXIgcHJpbnRrLiAgCj4gPiA+IAo+ID4gPiBTbyBpcyBjb2FsZXNjaW5nIGZv
cm1hdHMKPiA+ID4gCj4gPiA+ID8gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3Bmb3cu
aCBiL2luY2x1ZGUvbGludXgvbXRkL3Bmb3cuaAo+ID4gPiBbXSAgCj4gPiA+ID4gQEAgLTEyNywz
MSArMTI3LDMxIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwcmludF9kcnNfZXJyb3IodW5zaWduZWQg
ZHNyKQo+ID4gPiA+ICAJaW50IHByb2dfc3RhdHVzID0gKGRzciAmIERTUl9SUFMpID4+IDg7Cj4g
PiA+ID4gIAo+ID4gPiA+ICAJaWYgKCEoZHNyICYgRFNSX0FWQUlMQUJMRSkpCj4gPiA+ID4gLQkJ
cHJpbnRrKEtFUk5fTk9USUNFIkRTUi4xNTogKDApIERldmljZSBub3QgQXZhaWxhYmxlXG4iKTsK
PiA+ID4gPiArCQlwcl9ub3RpY2UoIkRTUi4xNTogKDApIERldmljZSBub3QgQXZhaWxhYmxlXG4i
KTsKPiA+ID4gPiAgCWlmICgocHJvZ19zdGF0dXMgJiAweDAzKSA9PSAweDAzKQo+ID4gPiA+IC0J
CXByaW50ayhLRVJOX05PVElDRSJEU1IuOSw4OiAoMTEpIEF0dGVtcHQgdG8gcHJvZ3JhbSBpbnZh
bGlkICIKPiA+ID4gPiArCQlwcl9ub3RpY2UoIkRTUi45LDg6ICgxMSkgQXR0ZW1wdCB0byBwcm9n
cmFtIGludmFsaWQgIgo+ID4gPiA+ICAJCQkJCQkiaGFsZiB3aXRoIDQxaCBjb21tYW5kXG4iKTsg
IAo+ID4gPiAKPiA+ID4gCQlwcl9ub3RpY2UoIkRTUi45LDg6ICgxMSkgQXR0ZW1wdCB0byBwcm9n
cmFtIGludmFsaWQgaGFsZiB3aXRoIDQxaCBjb21tYW5kXG4iKTsKPiA+ID4gICAKPiA+IAo+ID4g
SSBkaWRuJ3Qgd2FudCB0byBtZXNzIHdpdGggdGhlIHJlc3Qgb2YgZm9ybWF0LCBiZWNhdXNlIHNv
bWUgbWFpbnRhaW5lcnMKPiA+IGRvbid0IGxpa2UgdGhhdC4gSWYgTWlxdWVsIGlzIE9LIHdpdGgg
dGhhdCwgSSBjYW4gZml4IHRoYXQgdXAsIHRvby4gIAo+IAo+IEhlIHNob3VsZC4gIENvYWxlc2Np
bmcgaXMgcGFydCBvZiBjb2Rpbmctc3R5bGUuCj4gCj4gIm5ldmVyIGJyZWFrIHVzZXItdmlzaWJs
ZSBzdHJpbmdzIHN1Y2ggYXMgcHJpbnRrIG1lc3NhZ2VzIgo+IAo+IGNoZWVycywgSm9lCj4gCgpJ
IHN1cHBvc2UgR3VzdGF2byBtZWFudCB0aGF0IHRoZXJlIGFyZSBtYWludGFpbmVycyBpbiB0aGUg
Y29tbXVuaXR5CihhbmQgSSBhbSBwYXJ0IG9mIGl0KSB0aGF0IGRvIG5vdCBsaWtlIHdoZW4gcGVv
cGxlIGZpeCBzdHlsZSBpc3N1ZXMKYXNpZGUgdGhlaXIgb3duIGNoYW5nZXMgLXNwZWNpZmljYWxs
eSB3aXRob3V0IHdyaXRpbmcgaXQgaW4gY29tbWl0CmxvZ3MuIEJ1dCBpbiB0aGlzIHNpdHVhdGlv
biBJIHRoaW5rIHMvcHJpbnRrKEtFTl9OT1RJQ0UvcHJfbm90aWNlKC8KbmVlZHMgdGhlIHNlY29u
ZCBsaW5lIHRvIGJlIHJlLWFsaWduZWQgd2l0aCB0aGUgZmlyc3Qgb25lLiBXaGlsZQp0b3VjaGlu
ZyBpdCwgaXQgc2VlbXMgcmVhc29uYWJsZSB0byBhbHNvIGZpeCB0aGlzIHN0eWxlIGlzc3VlIGFu
ZCBhdm9pZAprZWVwaW5nIGJyb2tlbiBzdHJpbmdzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
