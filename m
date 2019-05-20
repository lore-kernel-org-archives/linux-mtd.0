Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0D0C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:34:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CCC208C3
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 17:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOD6q4HI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CCC208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jW1wRZmfQ2c3qmB3MD+hOO3aMS2dt9ITbrxrM5avroI=; b=rOD6q4HIyluFY6
	w+7+ImrWR7xjXC/evQ7lE7TGiS70mIDslClJpBpOzmpndyzQiVYyYO67GzlZsg/EYOwFMN61bPfGp
	eHoYtVSVzfFrYqEGjbayfnfEfYxQuhIRWnYqexCiIWCwX+9f5U6/TAxi56R0DykQ7M+zS8BExaKJL
	gXpH0H857SURQARhbrATz3xZySo1Nl5KUUAuldoqSKpg0nMyk31GGl9Y0Zg6Eq7TQNKqPJjmDZvOZ
	fJ0V5cnIuqsTtMxMrUD822liywbfuxzzo+/DGqpZAYQ1upGt36RH+p/j9TSloS90hZmS51qMd0ULq
	/TKvjy+xQ4gDjYubYnNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSmBY-0006OS-DY; Mon, 20 May 2019 17:34:52 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSmBU-0006O3-3u
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 17:34:50 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E76121C0002;
 Mon, 20 May 2019 17:34:36 +0000 (UTC)
Date: Mon, 20 May 2019 19:34:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: raw: brcmnand: fallback to detected
 ecc-strength, ecc-step-size
Message-ID: <20190520193432.79cf132f@xps13>
In-Reply-To: <CAC=U0a0bZHgM2yQzz5SupRNWcBg7rpqpGh_o9cvSQNNKsSp9Cg@mail.gmail.com>
References: <1558117914-35807-1-git-send-email-kdasu.kdev@gmail.com>
 <1558117914-35807-2-git-send-email-kdasu.kdev@gmail.com>
 <20190520144436.67e42f00@xps13>
 <CAC=U0a0bZHgM2yQzz5SupRNWcBg7rpqpGh_o9cvSQNNKsSp9Cg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_103448_642576_5BAAE0C3 
X-CRM114-Status: GOOD (  26.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9u
LCAyMCBNYXkgMjAxOSAxMzozMTo1MgotMDQwMDoKCj4gV2lsbCBtYWtlIHRoZSBjaGFuZ2VzIGFu
ZCBzZW5kIGEgVjIgcGF0Y2guCj4gCj4gT24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgODo0NCBBTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBI
aSBLYW1hbCwKPiA+Cj4gPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUg
b24gRnJpLCAxNyBNYXkgMjAxOSAxNDoyOTo1NQo+ID4gLTA0MDA6Cj4gPiAgCj4gPiA+IFRoaXMg
Y2hhbmdlIHN1cHBvcnRzIG5hbmQtZWNjLXN0ZXAtc2l6ZSBhbmQgbmFuZC1lY2Mtc3RyZW5naHQg
ZmllbGRzIGluICAKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RyZW5ndGgKPiA+ICAKPiA+ID4gYnJjbW5hbmQgZHQgbm9kZSB0
byBiZSAgb3B0aW9uYWwuICAKPiA+Cj4gPiAgICAgICAgICAgIERUICAgICAgICAgICAgXiBleHRy
YSBzcGFjZQo+ID4gIAo+ID4gPiBzZWU6IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvYnJjbSxicmNtbmFuZC50eHQKPiA+ID4KPiA+ID4gSWYgYm90aCBuYW5kLWVjYy1zdHJl
bmd0aCBhbmQgbmFuZC1lY2Mtc3RlcC1zaXplIGFyZSBub3Qgc3BlY2lmaWVkIGluCj4gPiA+IGRl
dmljZSB0cmVlIG5vZGUgZm9yIE5BTkQsIG5hbmRfYmFzZSBkcml2ZXIgZG9lcyBkZXRlY3Qgb25m
aSBleHQgZWNjICAKPiA+Cj4gPiBzL25hbmRfYmFzZSBkcml2ZXIvdGhlIHJhdyBOQU5EIGxheWVy
Lwo+ID4gcy9vbmZpL09ORkkvCj4gPiBzL2VjYy9FQ0MvCj4gPgo+ID4gV2hhdCBpcyAiZXh0Ij8g
UGxlYXNlIHVzZSBwbGFpbiBFbmdsaXNoIGhlcmUuCj4gPiAgCj4gPiA+IGluZm8gZnJvbSBPTkZJ
IGV4dGVuZGVkIHBhcmFtZXRlciBwYWdlIGZvciBwYXJ0cyB1c2luZyBPTkZJID49IDIuMS4gSW4g
IAo+ID4KPiA+IHMvaW5mby9pbmZvcm1hdGlvbi8KPiA+ICAKPiA+ID4gY2FzZSBvZiBub24tb25m
aSBOQU5EIHRoZXJlIGNvdWxkIGJlIGEgbmFuZF9pZCB0YWJsZSBlbnRyeSB3aXRoIHRoZSBlY2Mg
IAo+ID4KPiA+IHMvZWNjL0VDQy8KPiA+ICAKPiA+ID4gaW5mby4gSWYgdGhlcmUgaXMgYSB2YWxp
ZCAgZGV2aWNlIHRyZWUgZW50cnkgZm9yIG5hbmQtZWNjLXN0cmVuZ3RoIGFuZAo+ID4gPiBuYW5k
LWVjYy1zdGVwLXNpemUgZmllbGRzIGl0IHN0aWxsIHNoYWxsIG92ZXJyaWRlIHRoZSBkZXRlY3Rl
ZCB2YWx1ZXMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEthbWFsIERhc3UgPGtkYXN1Lmtk
ZXZAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21u
YW5kL2JyY21uYW5kLmMgfCAxMCArKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvYnJjbW5hbmQvYnJjbW5hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2Jy
Y21uYW5kLmMKPiA+ID4gaW5kZXggY2UwYjhmZi4uZTk2N2IzMCAxMDA2NDQKPiA+ID4gLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ID4gPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPiA+IEBAIC0yMTQ0LDYgKzIx
NDQsMTYgQEAgc3RhdGljIGludCBicmNtbmFuZF9zZXR1cF9kZXYoc3RydWN0IGJyY21uYW5kX2hv
c3QgKmhvc3QpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ICAgICAg
IH0KPiA+ID4KPiA+ID4gKyAgICAgaWYgKCEoY2hpcC0+ZWNjLnNpemUgPiAwICYmIGNoaXAtPmVj
Yy5zdHJlbmd0aCA+IDApICYmICAKPiA+Cj4gPiBJcyB0aGUgY2FzZSB3aGVyZSBvbmx5IHNpemUg
T1Igc3RyZW5ndGggaXMgdmFsaWQgaGFuZGxlZD8gIAo+IAo+IEJvdGggc3RyZW5ndGggYW5kIG5l
ZWQgdG8gYmUgdmFsaWQsIGVsc2UgdGhlIGRyaXZlciB3aWxsIGJlaGF2ZSBsaWtlCj4gYmVmb3Jl
IGFuZCB3aWxsIGZhaWwgdGhlIHByb2JlLgoKWWVzLCBidXQgeW91IGRvIG5vdCBoYW5kbGUgdGhl
IGNhc2Ugd2hlbiBlaXRoZXIgc3RyZW5ndGggT1Igc2l6ZSBpcyBub3QKdmFsaWQgYnV0IHRoZSBv
dGhlciBvbmUgaXMuIElzIGl0IG9uZSBwdXJwb3NlPwoKPiAKPiA+ICAKPiA+ID4gKyAgICAgICAg
IChjaGlwLT5iYXNlLmVjY3JlcS5zdHJlbmd0aCA+IDAgJiYKPiA+ID4gKyAgICAgICAgICBjaGlw
LT5iYXNlLmVjY3JlcS5zdGVwX3NpemUgPiAwKSkgewo+ID4gPiArICAgICAgICAgICAgIC8qIHVz
ZSBkZXRlY3RlZCBlY2MgcGFyYW1ldGVycyAqLyAgCj4gPgo+ID4gICAgICAgICAgICAgICAgICAg
IFVzZSAgICAgICAgICBFQ0MKPiA+ICAKPiA+ID4gKyAgICAgICAgICAgICBjaGlwLT5lY2Muc2l6
ZSA9IGNoaXAtPmJhc2UuZWNjcmVxLnN0ZXBfc2l6ZTsKPiA+ID4gKyAgICAgICAgICAgICBjaGlw
LT5lY2Muc3RyZW5ndGggPSBjaGlwLT5iYXNlLmVjY3JlcS5zdHJlbmd0aDsKPiA+ID4gKyAgICAg
ICAgICAgICBwcl9pbmZvKCJVc2luZyBkZXRlY3RlZCBuYW5kLWVjYy1zdGVwLXNpemUgJWQsIG5h
bmQtZWNjLXN0cmVuZ3RoICVkXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY2hpcC0+
ZWNjLnNpemUsIGNoaXAtPmVjYy5zdHJlbmd0aCk7Cj4gPiA+ICsgICAgIH0KPiA+ID4gKwo+ID4g
PiAgICAgICBzd2l0Y2ggKGNoaXAtPmVjYy5zaXplKSB7Cj4gPiA+ICAgICAgIGNhc2UgNTEyOgo+
ID4gPiAgICAgICAgICAgICAgIGlmIChjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19IQU1NSU5H
KSAgCj4gPgo+ID4KPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwgIAo+IAo+IEthbWFsCgoKCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
