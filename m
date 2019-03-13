Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFF6C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:12:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394D2204FD
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QQAyI5Cb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394D2204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5n0jUYlVx66EbS9GtbuRRXGmWJ+WBaz1jnO1tzSUHA=; b=QQAyI5CbkKVBPu
	h+z2XOs7i6O8502TTzc1qHkuQ96iWzGT9WqhekGs1e4jWd1ikzzLQrITGVmWKCnJtH65PV+NvyxZM
	6bYpcGC3TW0Z8qRw5Qy/jYloZiAE0QtGQPNHEHT//LHhiFgLGmnYeRWlHEtSutgR8eUvPCiwUEkyS
	a8UqADAAUm2oMF3TdPzMpoQ0Q0ql1IM+8sPVBnjBX0VCVeWea1ob6/HQ8q7z1MaYhWy/HJrure4y1
	LMGHw0RNgCMNWxKtJe7F4gCz4HhnLbzIPMdOI2nCBNzEU3N2KDDWkYu1fO8MgMeDcJ51Rs/UFkrcY
	UkZnUHTlKqu/Q8xhMrGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43gd-0004MD-KY; Wed, 13 Mar 2019 13:12:47 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43ga-0004LZ-JC
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 13:12:46 +0000
X-Originating-IP: 90.88.22.102
Received: from xps13 (aaubervilliers-681-1-80-102.w90-88.abo.wanadoo.fr
 [90.88.22.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1115D4000F;
 Wed, 13 Mar 2019 13:12:31 +0000 (UTC)
Date: Wed, 13 Mar 2019 14:12:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/9] dt-bindings: mtd: ingenic: Change 'BCH' to 'ECC'
 in documentation
Message-ID: <20190313141231.1cc6e072@xps13>
In-Reply-To: <1552481988.2412.2@crapouillou.net>
References: <20190209192305.4434-1-paul@crapouillou.net>
 <20190209192305.4434-2-paul@crapouillou.net>
 <20190304105014.0cceea0a@xps13> <1551723830.4932.3@crapouillou.net>
 <20190304195852.45c056f6@xps13> <1552481988.2412.2@crapouillou.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_061244_933100_D6E3E2FC 
X-CRM114-Status: GOOD (  26.54  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKClBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZSBvbiBX
ZWQsIDEzIE1hciAyMDE5IDA5OjU5OjQ4Ci0wMzAwOgoKPiBMZSBsdW4uIDQgbWFycyAyMDE5IMOg
IDE1OjU4LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBhIMOpY3Jp
dCA6Cj4gPiBIaSBQYXVsLAo+ID4gCj4gPiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91
Lm5ldD4gd3JvdGUgb24gTW9uLCAwNCBNYXIgMjAxOSA+IDE5OjIzOjUwCj4gPiArMDEwMDoKPiA+
ICAgCj4gPj4gIE9uIE1vbiwgTWFyIDQsIDIwMTkgYXQgMTA6NTAgQU0sIE1pcXVlbCBSYXluYWwg
Pj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOiAgCj4gPj4gID4gSGkgUGF1bCwK
PiA+PiAgPgo+ID4+ICA+IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0ID4+IDxt
YWlsdG86cGF1bEBjcmFwb3VpbGxvdS5uZXQ+PiA+IHdyb3RlIG9uIFNhdCwgIDkgRmViIDIwMTkg
MTY6MjI6NTgKPiA+PiAgPiAtMDMwMDoKPiA+PiAgPiAgCj4gPj4gID4+ICBUaGUgSlo0NzQwIEVD
QyBoYXJkd2FyZSBpcyBub3QgQkNIIGJ1dCBSZWVkLVNvbG9tb24sIHNvIGl0ID4+IG1ha2VzID4+
IG1vcmUKPiA+PiAgPj4gIHNlbnNlIHRvIHVzZSB0aGUgbW9yZSBnZW5lcmljIEVDQyB0ZXJtLiAg
Cj4gPj4gID4+ID4+ICBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldCA+PiA+PiA8bWFpbHRvOnBhdWxAY3JhcG91aWxsb3UubmV0Pj4gIAo+ID4+ICA+PiAg
LS0tICAKPiA+PiAgPj4gPj4gIENoYW5nZXM6Cj4gPj4gID4+ID4+ICB2MzogTmV3IHBhdGNoCj4g
Pj4gID4+ID4+ICB2NDogTm8gY2hhbmdlCj4gPj4gID4+ID4+ICAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQudHh0ICAgIHwgMTggPj4gPj4gKysrKysrKysr
LS0tLS0tLS0tICAKPiA+PiAgPj4gICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKSAgCj4gPj4gID4+ID4+ICBkaWZmIC0tZ2l0ID4+ID4+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dCA+PiA+
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxqejQ3ODAt
bmFuZC50eHQgIAo+ID4+ICA+PiAgaW5kZXggYTViOTQwZjE4YmY2Li41YTQ1Y2M1NGY0NmQgMTAw
NjQ0ICAKPiA+PiAgPj4gIC0tLSA+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvaW5nZW5pYyxqejQ3ODAtbmFuZC50eHQgIAo+ID4+ICA+PiAgKysrID4+IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dAo+
ID4+ICA+PiAgQEAgLTEsNCArMSw0IEBACj4gPj4gID4+ICAtKiBJbmdlbmljIEpaNDc4MCBOQU5E
L0JDSAo+ID4+ICA+PiAgKyogSW5nZW5pYyBKWjQ3ODAgTkFORC9FQ0MgIAo+ID4+ICA+PiA+PiAg
IFRoaXMgZmlsZSBkb2N1bWVudHMgdGhlIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciBOQU5EIGZs
YXNoID4+ID4+IGRldmljZXMgb24gdGhlICAKPiA+PiAgPj4gICBKWjQ3ODAuIE5BTkQgZGV2aWNl
cyBhcmUgY29ubmVjdGVkIHRvIHRoZSBORU1DIGNvbnRyb2xsZXIgPj4gPj4gKGRlc2NyaWJlZCBp
bgo+ID4+ICA+PiAgQEAgLTE0LDEwICsxNCwxMCBAQCBSZXF1aXJlZCBOQU5EIGNvbnRyb2xsZXIg
ZGV2aWNlIHByb3BlcnRpZXM6Cj4gPj4gID4+ICAgICBhbiBvZmZzZXQgb2YgMCBhbmQgYSBzaXpl
IG9mIDB4MTAwMDAwMCAoaS5lLiB0aGUgd2hvbGUgTkVNQyA+PiA+PiBiYW5rKS4gIAo+ID4+ICA+
PiA+PiAgIE9wdGlvbmFsIE5BTkQgY29udHJvbGxlciBkZXZpY2UgcHJvcGVydGllczogIAo+ID4+
ICA+PiAgLS0gaW5nZW5pYyxiY2gtY29udHJvbGxlcjogVG8gbWFrZSB1c2Ugb2YgdGhlIGhhcmR3
YXJlIEJDSCA+PiA+PiBjb250cm9sbGVyLCB0aGlzCj4gPj4gID4+ICAtICBwcm9wZXJ0eSBtdXN0
IGNvbnRhaW4gYSBwaGFuZGxlIGZvciB0aGUgQkNIIGNvbnRyb2xsZXIgbm9kZS4gPj4gVGhlID4+
IHJlcXVpcmVkCj4gPj4gID4+ICArLSBpbmdlbmljLGJjaC1jb250cm9sbGVyOiBUbyBtYWtlIHVz
ZSBvZiB0aGUgaGFyZHdhcmUgRUNDID4+ID4+IGNvbnRyb2xsZXIsIHRoaXMKPiA+PiAgPj4gICsg
IHByb3BlcnR5IG11c3QgY29udGFpbiBhIHBoYW5kbGUgZm9yIHRoZSBFQ0MgY29udHJvbGxlciBu
b2RlLiA+PiBUaGUgPj4gcmVxdWlyZWQgIAo+ID4+ICA+Cj4gPj4gID4gSSB0aGluayB0aGVyZSBp
cyBhbHJlYWR5IGEgJ2VjYy1lbmdpbmUnIHByb3BlcnR5IHVzZWQgYnkgTVRLIGFuZCA+PiBBdG1l
bAo+ID4+ICA+IE5BTkQgY29udHJvbGxlcnMgdG8gcG9pbnQgdG8gdGhlIEVDQyBlbmdpbmUgYmxv
Y2suIFBsZWFzZSB1c2UgdGhpcwo+ID4+ICA+IHByb3BlcnR5IGluc3RlYWQgb2YgdGhlIGluZ2Vu
aWMgc3BlY2lmaWMgb25lLiAgCj4gPj4gPj4gIGluZ2VuaWMsYmNoLWNvbnRyb2xsZXIgaXMgYWxy
ZWFkeSBpbiB0aGUgZGV2aWNldHJlZSBBQkkuIEkgY2FuJ3QgPj4gY2hhbmdlIGl0IG5vdy4uLiAg
Cj4gPiAKPiA+IE9oLCByaWdodC4uLgo+ID4gCj4gPiBXZWxsLCBzYW1lIHRoaW5nIGFzIGJlZm9y
ZSwgbWF5YmUgeW91IGNhbiBjaGFuZ2UgaXQgYW5kIGtlZXAgdGhlID4gZHJpdmVyCj4gPiBiYWNr
d2FyZCBjb21wYXRpYmxlPyBJIGRvbid0IHdhbnQgbmV3IERUIHRvIHVzZSB0aGlzIHByb3BlcnR5
IGJlY2F1c2UKPiA+IGl0IGlzIG5vdCBnZW5lcmljIGFuZCB3ZSBtdXN0IGhhdmUgYSB3YXkgZnJv
bSB0aGUgY29yZSB0byBmaW5kIHRoZSBFQ0MKPiA+IGVuZ2luZSBoYW5kbGUgd2hlbiB0aGUgY29u
dHJvbGxlciBkb2VzIG5vdCBlbWJlZCBvbmUgaXRzZWxmICh0aHVzLCB0aGUKPiA+IGVjYy1lbmdp
bmUgcHJvcGVydHkgd2hpY2ggaXMgYXJvdW5kIGZvciBxdWl0ZSBzb21lIHRpbWUgYWxyZWFkeSku
ICAKPiAKPiBJIGNhbiBkbyB0aGF0LiBXaWxsIHRoZSBuZXcgRUNDIGZyYW1ld29yayB3b3JrIHdp
dGggdGhlICJlY2MtZW5naW5lIiBwcm9wZXJ0eT8KClllcy4KClJpZ2h0IG5vdyBpdCBkb2VzIG5v
dCwgYnV0IHdoZW4gc3VwcG9ydGluZyByYXcgTkFORCBkZXZpY2VzLCBpdCB3aWxsCmhhdmUgdG8u
CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
