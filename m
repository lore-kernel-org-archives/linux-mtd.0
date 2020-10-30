Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4294C55179
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:37:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3CF206B2
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:37:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z74ureDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3CF206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oop6QShOPaQxLUwDgFMu82xQro6UUL7v9F4ZYnXcIY0=; b=z74ureDR+c/CMqUQaFA+zAg+R
	jgiAbOSDWL0zdypKYoG1mTbXZf5Hpvvoi8PHHD0fSk+JXODOS/ZXMJKPgbaGig1hmOW1r5dAMP4cn
	/gEkMKJch6twwQAINE2JHHz2BjNAt8nJcI1SC5NFTMVtzx3NWz7kz7I4Qfz05sWzfm/J5+tYHQBKD
	eFBi5W2rliIjkS4D7x3YSLD0uwT947K4RYC+VEzUwidYS5A1F9OA702kON27UDLrg/5a42zUtkPCp
	tX1usm0tciJ7y47rZp35UM806UpdxNhUo2roqR0rgQI8n7WatuJ5CESwEn457zZ3IuWkuQ092TKlR
	zs655w9iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYPtc-0006Ti-Og; Fri, 30 Oct 2020 08:36:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYPtZ-0006Sf-Qn
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 08:36:26 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 071C21C0005;
 Fri, 30 Oct 2020 08:36:22 +0000 (UTC)
Date: Fri, 30 Oct 2020 09:36:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
Message-ID: <20201030093621.6315ea1a@xps13>
In-Reply-To: <d3073938-e714-6b5d-1dc9-36887b11de46@st.com>
References: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
 <20201030091905.111aa7a4@xps13>
 <d3073938-e714-6b5d-1dc9-36887b11de46@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_043626_072538_3BE02EDB 
X-CRM114-Status: GOOD (  30.07  )
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
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gRnJpLCAzMCBPY3QKMjAyMCAwOTozMToyNSArMDEwMDoKCj4gSGkgTWlx
dWVsLAo+IAo+IE9uIDEwLzMwLzIwIDk6MTkgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBDaHJpc3RvcGhlLAo+ID4gCj4gPiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2Vy
ZWxsb0BzdC5jb20+IHdyb3RlIG9uIFRodSwgMjkgT2N0Cj4gPiAyMDIwIDE3OjM4OjEyICswMTAw
Ogo+ID4gICAKPiA+PiBTaW5jZSBjb21taXQgZDcxNTdmZjQ5YTViICgibXRkOiByYXduYW5kOiBV
c2UgdGhlIEVDQyBmcmFtZXdvcmsgdXNlcgo+ID4+IGlucHV0IHBhcnNpbmcgYml0cyIpLCBFQ0Mg
YXJlIGJyb2tlbiBpbiBGTUMyIGRyaXZlciBpbiBjYXNlIG9mCj4gPj4gbmFuZC1lY2Mtc3RlcC1z
aXplIGFuZCBuYW5kLWVjYy1zdHJlbmd0aCBhcmUgbm90IHNldCBpbiB0aGUgZGV2aWNlIHRyZWUu
Cj4gPj4gVGhlIGRlZmF1bHQgdXNlciBjb25maWd1cmF0aW9uIHNldCBpbiBGTUMyIGRyaXZlciBp
cyBsb3N0IHdoZW4KPiA+PiByYXduYW5kX2R0X2luaXQgZnVuY3Rpb24gaXMgY2FsbGVkLiBUbyBh
dm9pZCB0byBsb3NlIHRoZSBkZWZhdWx0IHVzZXIKPiA+PiBjb25maWd1cmF0aW9uLCBpdCBpcyBu
ZWVkZWQgdG8gbW92ZSBpdCBpbiB0aGUgbmV3IHVzZXJfY29uZiBzdHJ1Y3R1cmUuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bz
dC5jb20+Cj4gPj4gRml4ZXM6IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBF
Q0MgZnJhbWV3b3JrIHVzZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPiA+PiAtLS0KPiA+PiAgIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgOCArKysrKy0tLQo+ID4+ICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4gaW5kZXggYjMxYTU4MS4u
ZGM4NmFjOSAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYwo+ID4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5j
Cj4gPj4gQEAgLTE4NDYsNiArMTg0Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+PiAgIAlzdHJ1Y3QgcmVzb3VyY2Ug
KnJlczsKPiA+PiAgIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZDsKPiA+PiAgIAlzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwOwo+ID4+ICsJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kZGV2Owo+ID4+ICAgCXN0
cnVjdCByZXNvdXJjZSBjcmVzOwo+ID4+ICAgCWludCBjaGlwX2NzLCBtZW1fcmVnaW9uLCByZXQs
IGlycTsKPiA+PiAgIAlpbnQgc3RhcnRfcmVnaW9uID0gMDsKPiA+PiBAQCAtMTk1MiwxMCArMTk1
MywxMSBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPj4gICAJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0JVU1dJRFRIX0FVVE8g
fCBOQU5EX05PX1NVQlBBR0VfV1JJVEUgfAo+ID4+ICAgCQkJIE5BTkRfVVNFU19ETUE7ICAKPiA+
PiAgID4+IC0JLyogRGVmYXVsdCBFQ0Mgc2V0dGluZ3MgKi8gIAo+ID4+ICsJLyogRGVmYXVsdCBF
Q0MgdXNlciBzZXR0aW5ncyAqLwo+ID4+ICAgCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRf
RUNDX0VOR0lORV9UWVBFX09OX0hPU1Q7Cj4gPj4gLQljaGlwLT5lY2Muc2l6ZSA9IEZNQzJfRUND
X1NURVBfU0laRTsKPiA+PiAtCWNoaXAtPmVjYy5zdHJlbmd0aCA9IEZNQzJfRUNDX0JDSDg7Cj4g
Pj4gKwluYW5kZGV2ID0gbXRkX3RvX25hbmRkZXYobXRkKTsKPiA+PiArCW5hbmRkZXYtPmVjYy51
c2VyX2NvbmYuc3RlcF9zaXplID0gRk1DMl9FQ0NfU1RFUF9TSVpFOwo+ID4+ICsJbmFuZGRldi0+
ZWNjLnVzZXJfY29uZi5zdHJlbmd0aCA9IEZNQzJfRUNDX0JDSDg7ICAKPiA+PiAgID4+ICAgCS8q
IFNjYW4gdG8gZmluZCBleGlzdGVuY2Ugb2YgdGhlIGRldmljZSAqLyAgCj4gPj4gICAJcmV0ID0g
bmFuZF9zY2FuKGNoaXAsIG5hbmQtPm5jcyk7ICAKPiA+IAo+ID4gU29ycnkgZm9yIGJyZWFraW5n
IHRoZSBkcml2ZXIgd2l0aCB0aGlzIGNoYW5nZSwgYnV0IG5vdyBJIHRoaW5rIHdlCj4gPiBzaG91
bGQgaGF2ZSBhbGwgRUNDIHJlbGF0ZWQgYml0cyBpbiAtPmF0dGFjaCgpIGluc3RlYWQgb2YgLT5w
cm9iZSgpLgo+ID4gVGhlIC0+YXR0YWNoKCkgaG9vayBpcyBjYWxsZWQgZHVyaW5nIHRoZSBuYW5k
X3NjYW4oKSBvcGVyYXRpb24gYW5kIGF0Cj4gPiB0aGlzIHBvaW50IHRoZSBjaGlwJ3MgcmVxdWly
ZW1lbnRzL2xheW91dCBhcmUga25vd24gKG5vdCBiZWZvcmUpLiBJCj4gPiBrbm93IHRoYXQgY2Vy
dGFpbiBjb250cm9sbGVycyBkb24ndCByZWFsbHkgY2FyZSBhYm91dCB0aGF0LCBoZXJlIHlvdXIK
PiA+IHNpbXBseSBoYXJkY29kZSB0aGVzZSB0d28gZmllbGRzIGFuZCB5b3UgZG9uJ3QgbmVlZCB0
byBrbm93IGFueXRoaW5nCj4gPiBhYm91dCB0aGUgY2hpcCdzIHByb3BlcnRpZXMuIEJ1dCBhcyBh
IGJpZCB0byBoYXJtb25pemUgYWxsIGRyaXZlcnMgd2l0aAo+ID4gdGhlIHRhcmdldCBvZiBhIGdl
bmVyaWMgRUNDIGVuZ2luZSBpbiBtaW5kLCBJIHRoaW5rIGl0J3Mgbm93IHRpbWUgdG8KPiA+IG1v
dmUgdGhlc2UgdGhyZWUgbGluZXMgKGNoaXAtPmVjYy4qID0gLi4uKSBhdCB0aGUgdG9wIG9mIC0+
YXR0YWNoKCkuCj4gPiBBbHNvLCB0aGVzZSBmaWVsZHMgc2hvdWxkIGhhdmUgYmVlbiBwb3B1bGF0
ZWQgYnkgdGhlIGNvcmUgc28gcGVyaGFwcwo+ID4gdGhlIGJlc3QgYXBwcm9hY2ggaXMgdG8gY2hl
Y2sgaWYgdGhlIHVzZXIgcmVxdWlyZW1lbnRzIGFyZSBzeW5jZWQgd2l0aAo+ID4gdGhlIGNvbnRy
b2xsZXIncyBjYXBhYmlsaXRpZXMgYW5kIGVycm9yIG91dCBvdGhlcndpc2U/Cj4gPiAKPiA+IFdl
IHBsYW4gdG8gc2VuZCBhIGZpeGVzIFBSIGZvciAtcmMyLCBpZiB0aGUgdjIgYXJyaXZlcyB0b2Rh
eSBJJ2xsCj4gPiBpbnRlZ3JhdGUgaXQuICAKPiAKPiBPay4gSXNzdWUgaXMgdGhhdCB0aGUgY29u
dHJvbGxlciBpcyBpbml0aWFsaXplZCB3aGVuIHN0bTMyX2ZtYzJfbmZjX3NlbGVjdF9jaGlwIGlz
IGNhbGxlZC4gVGhpcyBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCBiZWZvcmUgdGhlIC0+YXR0YWNo
KCkgaG9vaywgd2hlbiB0aGUgZmlyc3QgY29tbWFuZCB3aWxsIGJlIHNlbnQgdG8gdGhlIE5BTkQg
ZGV2aWNlIChyZXNldCBjb21tYW5kKS4gU28sIG1vdmluZyB0aGUgZGVmYXVsdCBFQ0MgaW5pdGlh
bGl6YXRpb24KPiBuZWVkcyBwcm9iYWJseSBtb3JlIG1vZGlmaWNhdGlvbnMgaW4gdGhlIGRyaXZl
ci4KPiBJIHdpbGwgdHJ5IHRvIHNlbmQgYSB2MiB0b2RheS4KClRoZSBFQ0MgZW5naW5lIGlzIG5v
dCBzdXBwb3NlZCB0byBiZSB1c2VkIGJlZm9yZSBuYW5kX3NjYW4oKSBhbmQgaXRzCmRlZmF1bHQg
c3RhdGUgc2hvdWxkIGJlIGRpc2FibGVkLiBNYXliZSB0aGlzIGRyaXZlciBuZWVkcyBhbiB1cGRh
dGUKYWJvdXQgdGhhdCwgYnV0IHRoZW4gLWhvcGVmdWxseS0gaXQgd2lsbCBiZSBwcmV0dHkgc3Ry
YWlnaHRmb3J3YXJkLgoKTm8gaHVycnkgdGhvdWdoLCBpZiB0aGUgZml4IGlzIG5vdCByZWFkeSB3
ZSdsbCB3YWl0IGFuIGFkZGl0aW9uYWwgd2VlawooaXQgd2lsbCBiZSBpbiBuZXh0IGFzIHNvb24g
YXMgaXQgaXMgcmVhZHkgYW55d2F5KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
