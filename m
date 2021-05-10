Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE926C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:43:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA48B6113E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA48B6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jSTHTIzEY40SYbPRT2wnb477cJL1zxr+2v/0BVvi0BQ=; b=Mc+nNZBtRwAkPKTl8FcwpwKyg
	KpjJ/4lq/QjAoZYqjcbZaSbG1Q2XlGdly3K/H7hSGcxEfoXM/GAcVDQZyduqrRMUyu3FWXGlp25nS
	NyyZRJS3y88wUGU3ZBDWBGlCcmoqQrQxqRSUkbnWFFWKHleeFXHJBq7yr7b0UK1qXs9uTrIIFdGbt
	jmU1q5wJZ/kRsS6Cn3bfoOGtOxGX4MXT1vuNNQp0zF1PeMOUy65bgCoRYQhzUWK3Ka++n3gTe9jKX
	qcmR/qbcNwTitRRtveG29/2vT9s6EeMrriabnNMDVtDrHT0yTNiXX2LN8C2dHEcT81i4lX3XpSxAo
	WrvdsTe2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4Hi-00E7SK-0F; Mon, 10 May 2021 11:41:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3iZ-00E22G-DY
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 11:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=CYI24+OQYFHRIsgHEyadr3gmsvq0EpKycElnapHK1ss=; b=fqmTuwVpTZeWx0wNXET8kILwoQ
 YwFHWap1DbBrCBqrZ8ol8/0FsqFguJPIxY1lRT8GOgP6UqSOOuA9XznoF+GijGK2i9RrIEOuo8F9X
 zrm0z3SFSmlDKTp2MT1xk8YxsCety1R9773jUVRUhEArfSVMIw4N9qpzTQUelL1X3EVabeDidGhIQ
 +94XLez4p6JltSaPEZzvAm2cerMNgQ0S0/PoTM5SHOHdCe+54rqRuzt1bD0devvR1q/jLt7Jxw0zQ
 VTsafyDbQ2RqwZ1UfrRSVaFEpHvPBiNLuq1cxQ4OwYU//7P2zh8mMgEUe+MRyWQGfFbjr1/ElfQYz
 Tb68vGgg==;
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3iV-008aiq-Sv
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 11:04:54 +0000
Received: (qmail 20928 invoked from network); 10 May 2021 11:04:48 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by perseus.uberspace.de with SMTP; 10 May 2021 11:04:48 -0000
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210509144716.431650-1-mail@david-bauer.net>
 <752e8869acebdeeaf5dc775a5af35ffc@walle.cc>
 <796a15bd-66d9-b1a5-2258-b692f23364fe@david-bauer.net>
 <ef20e03c43d2eacff7133f74a118ea43@walle.cc>
 <0b8be4c9-4528-8cac-2067-4ad2b180df79@david-bauer.net>
 <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <f79a55f2-3f89-55a9-5cee-ae50d1fc0a47@david-bauer.net>
Date: Mon, 10 May 2021 13:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ee4c8e3ebbe0b4cf762bbcb3a4b0e6dc@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_040452_250606_09D82247 
X-CRM114-Status: GOOD (  32.46  )
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

SGkgTWljaGFlbCwKCk9uIDUvMTAvMjEgMTI6NTYgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4g
QW0gMjAyMS0wNS0xMCAxMjoyNywgc2NocmllYiBEYXZpZCBCYXVlcjoKPj4gT24gNS8xMC8yMSAx
MTozNSBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjEtMDUtMTAgMTE6MjgsIHNj
aHJpZWIgRGF2aWQgQmF1ZXI6Cj4+Pj4gT24gNS8xMC8yMSAxMDowMCBBTSwgTWljaGFlbCBXYWxs
ZSB3cm90ZQo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
Zmxhc2hfaW5mbyBib2hvbmdfcGFydHNbXSA9IHsKPj4+Pj4+ICvCoMKgwqAgLyogQm9Ib25nIE1p
Y3JvZWxlY3Ryb25pY3MgKi8KPj4+Pj4+ICvCoMKgwqAgeyAiYmgyNXExMjhhcyIsIElORk8oMHg2
ODQwMTgsIDAsIDY0ICogMTAyNCwgMjU2LAo+Pj4+Pgo+Pj4+PiBJIGNvdWxkbid0IGZpbmQgIkJv
SG9uZyIgaW4gSkVQMTA2QkMuIDB4NjggKHdpdGhvdXQgY29udGludWF0aW9uIGNvZGVzKQo+Pj4+
PiBpcyAiQ29udmV4IENvbXB1dGVyIi4gU28gdGhpcyBpcyB3cm9uZy4gT1RPSCBJJ20gbm90IHN1
cmUsIGhvdyBtYW55Cj4+Pj4+IFNQSSBmbGFzaGVzICJjb252ZXggY29tcHV0ZXIiIGhhdmUsIGlm
IGFueSA7KSBUaGlzIGNvbXBhbnkgd2FzIGJyb3VnaHQKPj4+Pj4gYnkgSFAgaW4gdGhlIGVuZC4K
Pj4+Pj4KPj4+Pj4gSW4gYW55IGNhc2UsIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBob3cgd2UgaGFu
ZGxlIGNvbnRpbnVhdGlvbiBjb2RlcyBvcgo+Pj4+PiBpZiB3ZSBjYW4gaGFuZGxlIHRoZW0gYXQg
YWxsLiBPciBpZiB0aGlzIGZsYXNoIGp1c3QgbGllIGFib3V0IGl0cwo+Pj4+PiBtYW51ZmFjdHVy
ZXIgaWQgYW5kIGRvbid0IGFuZCBDQy4KPj4+Pgo+Pj4+IEZpcnN0IG9mIGFsbCwgQm9Ib25nIGFu
ZCBCb3lhIG1pY3JvZWxlY3Ryb25pY3Mgc2VlbXMgdG8gYmUgdGhlIHNhbWUKPj4+PiBjb21wYW55
LCBhcyB0aGVpciBkYXRhc2hlZXRzIHNlZW0gdG8gY29weSBlYWNoIG90aGVyLiBUaGVyZSdzIG5v
dCBtdWNoCj4+Pj4gaW5mb3JtYXRpb24gYWJvdXQgZWl0aGVyIG9mIGJvdGgsIHNvIEknZCBzYXkg
dGhhdCdzIGEgZmFpciBhc3N1bXB0aW9uLgo+Pj4+Cj4+Pj4gUmVnYXJkaW5nIHRoZSBjb250aW51
YXRpb24gY29kZXMsIEJveWEgaXMgbGlzdGVkIGluIGJhbmsgbmluZSwgaG93ZXZlcgo+Pj4+IGlu
IHRoaXMgY2FzZSBJIHNob3VsZCBjdXJyZW50bHkgcmVhZCBhbiBhbGwgMHg3ZiBJRCBzaG91bGRu
J3QgST8KPj4+Cj4+PiBJJ2QgZ3Vlc3Mgc28sIHllcy4KPj4+Cj4+Pj4gVGhlIGRhdGFzaGVldCBh
bHNvIG9ubHkgc3BlY2lmaWVzIDMgYnl0ZXMgYXMgYSByZXR1cm4gdmFsdWUgZm9yCj4+Pj4gcmVn
aXN0ZXIgMHg5ZmggOigKPj4+Cj4+PiBZZWFoLiBTbywgdGhpcyBmbGFzaCBmYWxscyBpbnRvIHRo
ZSBzYW1lIGNhdGVnb3J5ICJzaW1wbHkgaGlqYWNrcwo+Pj4gYSBtYW51ZiBpZCIgYXMgYWxsIHRo
ZSBvdGhlciBmbGFzaGVzLgo+Pgo+PiBGcm9tIGEgcXVpY2sgY2hlY2ssIHRoaXMgaXMgYWxzbyBi
ZSB0aGUgY2FzZSBmb3IgR2lnYURldmljZXMgYW5kIFhNQy4KPj4KPj4gTXkgc3BvbnRhbmVvdXMg
aWRlYSB3b3VsZCBiZSB0byBleHRlbmQgc3VwcG9ydCBmb3IgSkVERUMgSURzIHRvIHJlYWQKPj4g
dGhlIHVwIHRvIDkgYmFua3Mgb2YgdGhlIHZlbmRvciBJRCBhbmQgZml4IHVwIHRoZSBleGlzdGlu
ZyBvZmZlbmRlcnMuCj4gCj4geW91IG1lYW4gZ2lnYWRldmljZXMgYW5kIHhtYz8gSSdkIHByZXN1
bWUgdGhleSBhcmUgYWxzbyBsYWNraW5nIHRoZQo+IGNvbnRpbnVhdGlvbiBieXRlcy4KCkNvcnJl
Y3QsIHNhbWUgc3Rvcnkgd2l0aCB0aGVtLgoKPiAKPj4gVG8gbm90IGJyZWFrIGV4aXN0aW5nIGJv
YXJkcywgd2UgY291bGQgZWl0aGVyIHNraXAgdGhlIGNvbnRpbnVhdGlvbgo+PiBieXRlcyBvZiB0
aGUga2VybmVsIElEIGRlZmluaXRpb25zIGZvciBhbGwgZmxhc2ggY2hpcHMgb3IgZmxhZyB0aGUK
Pj4gYWxyZWFkeSBleGlzdGluZyBvbmVzIGFuZCBvbmx5IHBlcmZvcm0gdGhpcyBvbiBzdWNoIGZs
YWdnZWQgY2hpcHMuCj4+Cj4+IFBlcnNvbmFsbHksIEknZCBzYXkgdGhhdCBvbmx5IHBlcmZvcm1p
bmcgdGhpcyBvbiBleGlzdGluZyBjaGlwcyB3b3VsZAo+PiBiZSBiZXR0ZXIsIGFzIG5ldyB2ZW5k
b3JzIHdpdGggdGhpcyB2aW9sYXRpb24gc2NoZW1lIG1pZ2h0IHByb2JhYmx5Cj4+IGFwcGVhciBh
bmQgY2F1c2UgY29uZmxpY3RzLgo+Pgo+PiBBcyB3ZSBzdGlsbCBsYWNrIGF1dG8gZGV0ZWN0aW9u
IGZvciBuZXcgY2hpcHMgd2l0aCB0aGF0LCBjb25maWd1cmluZwo+PiB0aGUgZmxhc2ggY2hpcCB1
c2VkIHdpdGggdGhlIGNoaXAgbmFtZSB2aWEgRFQgd291bGQgYWxsb3cgdG8gc2V0IHRoZQo+PiBl
eGFjdCBjaGlwIHVzZWQgYW5kIGFsc28gdmFsaWRhdGUgaWYgdGhlIG1hbnVmYWN0dXJlciAvIHBy
b2R1Y3QgYWZ0ZXIKPj4gdGhlIGNvbnRpbnVhdGlvbiBiaXRzIG1hdGNoZXMgdGhlIG9uZSByZWFk
IGZyb20gdGhlIGNoaXAuCj4+Cj4+IFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IElmIHlvdSdkIGFz
ayBtZSwgdW5sZXNzIHRoZXJlIGlzIGEgcmVhbCB3b3JsZCBjb25mbGljdCwgSSdkIGp1c3QgZ28K
PiBhaGVhZCBhbmQgYWRkIHRoZW0gYXMgaXMuIElmIHRoZXJlIGlzIGEgY29uZmxpY3Qgd2UnZCBu
ZWVkIHRvIGZpbmQKPiBhIHBlciBkZXZpY2UgcmVzb2x1dGlvbiBmb3IgaXQuCgpPa2F5LCBJJ2xs
IHJlc2VuZCBhIHYyIHdpdGggdGhlIHJlbW92ZWQgY29weXJpZ2h0IHRoZW4uCgo+IAo+IFRoZXJl
IGlzIGFub3RoZXIgcHJvYmxlbTogc2hhcmVkIGRldmljZSBpZHMgcGVyIHZlbmRvci4gU29tZSAo
bW9zdD8pCj4gZmxhc2ggdmVuZG9yIHNoYXJlIGRldmljZSBpZHMgb24gInNpbWlsYXIiIGZsYXNo
ZXMsIHdoaWNoIHdlIHN0aWxsCj4gbmVlZCB0ZWxsIGFwYXJ0IGluIHRoZSBrZXJuZWwuIFNvIHRl
Y2huaWNhbGx5LCB0aGlzIGlzIHRoZSBzYW1lIHByb2JsZW0KPiBhcyB3aXRoIG5vbi1leGlzdGlu
ZyBjb250aW51YXRpb24gYnl0ZXMuIFR3byBkaWZmZXJlbnQgZmxhc2hlcyBzaGFyaW5nCj4gdGhl
IHNhbWUgaWQuIEZvciBub3csIHdlIGxvb2sgZm9yIGRpZmZlcmVuY2VzIGluIHRoZSBTRkRQLgo+
IAo+IFJpZ2h0IG5vdywgdGhlIGZsYXNoIGlzIHByb2JlZCBmaXJzdCBieSBpdHMgaWQgYW5kIHRo
ZSB0aGUgU0ZEUCBpcwo+IHJlYWQgYW5kIHBhcnNlZC4gVGhlcmUgYXJlIGlkZWFzIHRvIGZpcnN0
IHJlYWQgdGhlIFNGRFAuIEhhdmluZyB0aGlzCj4gbWlnaHQgY29tZSBpbiBoYW5keSBoZXJlLCB0
b28uIEVnLiB3ZSBjb3VsZCBmaW5nZXJwcmludCB0aGUgZmxhc2gKPiBieSBpdHMgU0ZEUC4KCkkg
d2FzIGFsc28gdGhpbmtpbmcgYWJvdXQgdGhhdCBhbmQgd2UncmUgYWxzbyBhbHJlYWR5IGJpdHRl
biBieSBpZGVudGljYWwKSkVERUMgSURzIGZvciBkaWZmZXJlbnQgbW9kZWxzLiBJdCdzIHJlYWxs
eSBhIHBpdHkgdGhhdCB0aGVyZSBpcyBubyByZWFsCnVuaXF1ZSBtb2RlbCBpZGVudGlmaWVyIGZv
ciB1cyB0byB1c2UsIHdoaWNoIGlzIG5vdCBoYWNrZWQgdG8gc3VwcG9ydApsZWdhY3kgaW1wbGVt
ZW50YXRpb25zIGxpa2Ugd2l0aCB0aGlzIGNoaXAgOigKCkJlc3QKRGF2aWQKCj4gCj4gSSBrbm93
IFZpbmdlc2ggaXMgd29ya2luZyBvbiB0aGUgY29udGludWF0aW9uIGJ5dGVzIHN0dWZmLiBTbyBJ
IG1pZ2h0Cj4gYmUgbGF0ZSB0byB0aGUgcGFydHkgOykKPiAKPiBSZWdhcmRpbmcgdGhlIGRldmlj
ZSB0cmVlIGNvbXBhdGlibGVzLCB0aGUgbWFpbnRhaW5lcnMgZG9lc24ndCBsaWtlCj4gdGhhdCB2
ZXJ5IG11Y2guIE1heWJlIGFzIGEgbGFzdCByZXNvcnQgbWV0aG9kLgo+IAo+IC1taWNoYWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
