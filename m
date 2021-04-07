Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B21C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 09:05:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B73861205
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 09:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B73861205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d0tHqMPqMl2LGRwnxdSsB0SXSNzuBvoNTdi3BEsjVhY=; b=NHB08fJm+fCPUBMjpvW4fux0O
	zI7VLy09pT2F37aS5uTikOZHaF7enD4qXqJI1ZBEpOWzVHzsVqAXBJykaxjfk5dAijZD41JAmAagT
	BKDZBmlHQfOL+xaSkEc61HaO79Me7E83wb83l7k1A+9YehZfTptI733bd2558ggBnda+Mgilyb8r6
	nx61EFf5G3BzQAUiQgykVlUJrYzCguXbxSdUc9B9U5BszzCGoMIZzmuJCcc4fUoZ/LzJGEJIN4fdd
	5EYbwgHCsY82C6MZF6TFoavVvGwfMpqjNVkGqItNnUounefCwlKJaK79CktV+i1OP6eYvMNkuIx25
	x6qW8XQHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU478-004XpC-Tn; Wed, 07 Apr 2021 09:04:42 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU470-004Xoe-4P
 for linux-mtd@lists.infradead.org; Wed, 07 Apr 2021 09:04:36 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 51ECDFF80F;
 Wed,  7 Apr 2021 09:04:31 +0000 (UTC)
Date: Wed, 7 Apr 2021 11:04:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Fix the issue for clearing status process
Message-ID: <20210407110430.327bc46f@xps13>
In-Reply-To: <e52bf38913c20467e96c66ddf058129a5f063273.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
References: <cover.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
 <e52bf38913c20467e96c66ddf058129a5f063273.1616635406.git.ytc-mb-yfuruyama7@kioxia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_100434_368890_8A281D29 
X-CRM114-Status: GOOD (  22.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9zaGlvLAoKWW9zaGlvIEZ1cnV5YW1hIDx5dGMtbWIteWZ1cnV5YW1hN0BraW94aWEuY29t
PiB3cm90ZSBvbiBUdWUsICA2IEFwcgoyMDIxIDEwOjQ3OjI2ICswOTAwOgoKQ291bGQgeW91IGFk
ZCAibXRkOiBuYW5kOiBiYnQ6IiBhcyBwcmVmaXggZm9yIHRoZSB0aXRsZSAoc2FtZSBmb3IgdGhl
Cm90aGVyIHBhdGNoLCBldmVuIHRob3VnaCB5b3UncmUgbm90IHRoZSBvcmlnaW5hbCBhdXRob3Ip
LgoKPiBJbiB0aGUgdW5saWtlbHkgZXZlbnQgb2YgYmFkIGJsb2NrLAo+IGl0IHNob3VsZCB1cGRh
dGUgaXRzIGJsb2NrIHN0YXR1cyB0byBCQlQsIAo+IEluIHRoaXMgY2FzZSwgdGhlcmUgYXJlIDIg
a2luZCBvZiBpc3N1ZSBmb3IgaGFuZGxpbmcKPiBhKSBNYXJrIGJhZCBibG9jayBzdGF0dXMgdG8g
QkJUOiAgSXQgd2FzIGZpeGVkIGJ5IFBhdHJpYydzIHBhdGNoCj4gYikgQ2xlYXIgc3RhdHVzIHRv
IEJCVDogIEkgcG9zdGVkIHBhdGNoIGZvciB0aGlzIGlzc3VlIAo+IAo+IFBhdGNoOgo+IElzc3Vl
IG9mIGhhbmRpbmcgQkJUIChCYWQgQmxvY2sgVGFibGUpIGZvciAKPiBzb21lIHBhcnRpY3VsYXIg
YmxvY2tzIChFeDoxMCwgMTEpCj4gVXBkYXRpbmcgc3RhdHVzIGlzLCBmaXJzdCBjbGVhciBzdGF0
dXMsIHNlY29uZCBzZXQgYmFkIGJsb2NrIHN0YXR1cy4KPiBQYXRyaWNrJ3MgcGF0Y2ggaXMgb25s
eSBmaXhlZCB0aGUgaXNzdWUgZm9yIHNldHRpbmcgc3RhdHVzIHByb2Nlc3MsCj4gc28gdGhpcyBw
YXRjaCBmaXggdGhlIGNsZWFyaW5nIHN0YXR1cyBwcm9jZXNzLgoKVGhpcyBjb21taXQgbWVzc2Fn
ZSBpcyBub3QgY2xlYXJseSBkZXNjcmliaW5nIHRoZSBzaXR1YXRpb24sIGNvdWxkIHlvdQpwbGVh
c2UgcmV3b3JkIGl0PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaW8gRnVydXlhbWEgPHl0Yy1t
Yi15ZnVydXlhbWE3QGtpb3hpYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvYmJ0LmMg
fCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL2JidC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9iYnQuYwo+IGluZGV4IDY0YWY2ODk4MTMxZC4uMDc4MDg5NmVhYWZlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvYmJ0LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL2JidC5j
Cj4gQEAgLTExMiwxMSArMTEyLDEzIEBAIGludCBuYW5kZGV2X2JidF9zZXRfYmxvY2tfc3RhdHVz
KHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgdW5zaWduZWQgaW50IGVudHJ5LAo+ICAJCQkgICAg
ICgoZW50cnkgKiBiaXRzX3Blcl9ibG9jaykgLyBCSVRTX1BFUl9MT05HKTsKPiAgCXVuc2lnbmVk
IGludCBvZmZzID0gKGVudHJ5ICogYml0c19wZXJfYmxvY2spICUgQklUU19QRVJfTE9ORzsKPiAg
CXVuc2lnbmVkIGxvbmcgdmFsID0gc3RhdHVzICYgR0VOTUFTSyhiaXRzX3Blcl9ibG9jayAtIDEs
IDApOwo+ICsJdW5zaWduZWQgbG9uZyBzaGlmdCA9ICgoYml0c19wZXJfYmxvY2sgKyBvZmZzIDw9
IEJJVFNfUEVSX0xPTkcpID8KPiArCQkJCQkob2ZmcyArIGJpdHNfcGVyX2Jsb2NrIC0gMSkgOiAo
QklUU19QRVJfTE9ORyAtIDEpKTsKCkdpdmVuIHRoZSBmYWN0IHRoYXQgd2UgZG8gYXJpdGhtZXRp
YyBvcGVyYXRpb25zICgmLCB8KSBvbiBhbiB1bnNpZ25lZApsb25nIHZhbHVlIEkgZG9uJ3QgdGhp
bmsgdGhlIG9wZXJhdGlvbiB0YW1wZXJzIHdpdGggdGhlIG5leHQgZW50cnkgaW4KdGhlIHBvcyBh
cnJheS4gCgpJJ20gZmluZSBmaXhpbmcgaXQgYnV0IEkgZG9uJ3QgdGhpbmsgdGhpcyBpbXBsZW1l
bnRhdGlvbiB3b3Jrcy4gSXQgaXMKZmluZSBpZiBvZmZzIGlzIDI5IG9yIDMwIGJ1dCBub3QgaWYg
aXQgaXMgMzEgKGFzc3VtaW5nIDMyLWJpdHMKYXJpdGhtZXRpYywgaXQncyB0aGUgc2FtZSBmb3Ig
dGhlIDY0LWJpdCBjYXNlKS4KCj4gIAo+ICAJaWYgKGVudHJ5ID49IG5hbmRkZXZfbmVyYXNlYmxv
Y2tzKG5hbmQpKQo+ICAJCXJldHVybiAtRVJBTkdFOwo+ICAKPiAtCXBvc1swXSAmPSB+R0VOTUFT
SyhvZmZzICsgYml0c19wZXJfYmxvY2sgLSAxLCBvZmZzKTsKCldvdWxkIHNvbWV0aGluZyBsaWtl
IHRoZSBmb2xsb3dpbmcgd29yaz8KCglwb3NbMF0gJj0gfkdFTk1BU0soTUlOKG9mZnMgKyBiaXRz
X3Blcl9ibG9jayAtIDEsIEJJVFNfUEVSX0xPTkcgLSAxKSwgb2ZmcykKCkFnYWluLCBJIGFtIG5v
dCBjb252aW5jZWQgaXQgaXMgd29ydGggZGFya2VuaW5nIHRoZSBsb2dpYyB1bmxlc3MgSSBhbQpu
b3QgdW5kZXJzdGFuZGluZyBpdCBjb3JyZWN0bHkuCgo+ICsJcG9zWzBdICY9IH5HRU5NQVNLKHNo
aWZ0LCBvZmZzKTsKPiAgCXBvc1swXSB8PSB2YWwgPDwgb2ZmczsKPiAgCj4gIAlpZiAoYml0c19w
ZXJfYmxvY2sgKyBvZmZzID4gQklUU19QRVJfTE9ORykgewoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
