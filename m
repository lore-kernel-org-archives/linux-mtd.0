Return-Path: <SRS0=OVP+=NQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676DC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 15:32:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE04C6109E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Aug 2021 15:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE04C6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8FtwZWF55E6b85C6z5Efpt/DqeLTHQN0donlMwBSrM=; b=QcPtFgMNZzCDdm
	cDpw6Rsph2fuymLLlWdXeUFgDwod4TdgwLrFysr4YFuiC91eyt33eQmHRokM7bet5HVyPao5uSC0p
	3CpSnM8IvGuM7pYhVsj1AaB8ThNUL/Pd4/D7yKFgUzbSIbaO0n1LYp62SU1WWDdlu2ARSBeK5+Eza
	UmaIyDW2vY/P7vRUgi6ratClv9yYorXQTbbknus3lwDrfC4NMOph1GWacM6cq3g+VwnyYsGiRL9bd
	27gEJ+knvbikOnVq34WvAOqr8Mbx0LjDSZjlnj2T4wRw09A6XJvN1Yjy2pnCDLhIXOIY0RuEvDNEf
	X6tdSaugrepMNN5z5dag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIusC-007YXH-NO; Wed, 25 Aug 2021 15:31:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIus6-007YUO-59
 for linux-mtd@lists.infradead.org; Wed, 25 Aug 2021 15:31:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2819EC0002;
 Wed, 25 Aug 2021 15:31:16 +0000 (UTC)
Date: Wed, 25 Aug 2021 17:31:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210825173114.04ae2b20@xps13>
In-Reply-To: <CAE9cyGRuoaiTu40Yu0po3dykk1fTq_VkqwNfrQkJq8DR6FPRpw@mail.gmail.com>
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
 <20210824192203.076df55e@xps13>
 <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
 <20210825105126.4c1c15cb@xps13>
 <CAE9cyGRuoaiTu40Yu0po3dykk1fTq_VkqwNfrQkJq8DR6FPRpw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_083122_537597_50E343C0 
X-CRM114-Status: GOOD (  48.80  )
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

PiA+ID4gPiA+ID4gPiB0aGFuayB5b3UgZm9yIHlvdXIgcmVzcG9uc2UuCj4gPiA+ID4gPiA+ID4g
SWYgSSByZW1vdmUgdGhlIG5hbmQtZWNjLXh4eCBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UgdHJl
ZSwgdGhlIGRldmljZSB3aXRoCj4gPiA+ID4gPiA+ID4gdGhlIFRvc2hpYmEgTkFORCBjaGlwIGlz
IHdvcmtpbmcuIEhvd2V2ZXIsIHRoZSBkZXZpY2Ugd2l0aCB0aGUgTWljcm9uCj4gPiA+ID4gPiA+
ID4gTkFORCBmYWlscyB3aXRoIE5PIEVDQyBmdW5jdGlvbnMgc3VwcGxpZWQ7IGhhcmR3YXJlIEVD
QyBub3QgcG9zc2libGUsCj4gPiA+ID4gPiA+ID4gc2VlbXMgdG8gYmUgYXQgbGluZSA1MzY3IG9y
IGVxdWl2YWxlbnQuCj4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyNMNTM2Nwo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSXQgbG9va3MgbGlrZSB0aGUgbWljcm9uIG5hbmQg
ZHJpdmVyIHN1cHBvcnRzIG9uIGRpZSBvbmx5IGlmIGl0cwo+ID4gPiA+ID4gPiA+IHNwZWNpZmll
ZCBpbnQgdGhlCj4gPiA+ID4gPiA+ID4gRGV2aWNlIHRyZWU6Cj4gPiA+ID4gPiA+ID4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21pY3Jvbi5jI0w1MTEKPiA+ID4gPiA+ID4gPiBUaGUgTWljcm9uIE5BTkQgZHJp
dmVyIHByb2JhYmx5IG5lZWRzIHRvIHNldCB0aGUgRUNDIHR5cGUgdG8gT04gRElFIGlmIHRoZQo+
ID4gPiA+ID4gPiA+IHZhcmlhYmxlIG9uZGllIGNvbnRhaW5zIHRoZSBzdXBwb3J0ZWQgYXR0cmli
dXRlPyEgIAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBZb3UncmUgcmlnaHQgYnV0IEkgZG9uJ3Qg
c2VlIGFueSBlYXN5IHVwc3RyZWFtLWFibGUgc29sdXRpb24gaGVyZS4KPiA+ID4gPiA+ID4gQ2hh
bmdpbmcgdGhlIGJlaGF2aW9yIGluIHRoZSBYd2F5IGRyaXZlciB3b3VsZCBjZXJ0YWlubHkgYnJl
YWsgdXNlcnMsCj4gPiA+ID4gPiA+IGNoYW5naW5nIHRoZSBiZWhhdmlvciBpbiB0aGUgTWljcm9u
IGRyaXZlciB3b3VsZCBjZXJ0YWlubHkgYnJlYWsgZXZlbgo+ID4gPiA+ID4gPiBtb3JlIHVzZXJz
LiBUaGUgcm9vdCBjYXVzZSBiZWluZyBhbiBhYnNlbmNlIG9mIHByb3BlciBkZXNjcmlwdGlvbiAo
dGhlCj4gPiA+ID4gPiA+IGludGVncmF0aW9uIGNoYW5nZWQpLiBIb25lc3RseSBJIGZlZWwgc3R1
Y2ssIG1heWJlIHlvdSBjYW4gdHJ5IHRvCj4gPiA+ID4gPiA+IHJlZ2lzdGVyIHlvdXIgZGV2aWNl
LCBpZiBpdCBmYWlscywgY2hhbmdlIHRoZSBpbnRlZ3JhdGlvbiBpbiB0aGUgZHJpdmVyCj4gPiA+
ID4gPiA+ICh0byBhbiBvbmRpZSBlY2MgZW5naW5lKSB0aGVuIHJldHJ5Pwo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBUaGFua3MsCj4gPiA+ID4gPiA+IE1pcXXDqGwgIAo+ID4gPiA+ID4KPiA+ID4g
PiA+IERvIHlvdSB0aGluayBhZGRpbmcgc29tZXRoaW5nIGxpa2UgYmVsb3cgYXQgdGhlIGZvbGxv
d2luZyBsb2NhdGlvbgo+ID4gPiA+ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9kcml2ZXJzL210ZC9uYW5kL3Jhdy94d2F5X25hbmQuYyNMMjIzCj4gPiA+
ID4gPiB3b3VsZCBiZSB1cHN0cmVhbWFibGUgKHdpdGggb3Igd2l0aG91dCBkZXZpY2UgdHJlZSBw
cm9wZXJ0eT8pPwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgZXJyID0gbmFuZF9zY2FuKCZk
YXRhLT5jaGlwLCAxKTsKPiA+ID4gPiA+ICAgICAgICAgaWYgKGVyciAvKiAmJiBvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2wobnAsICJsYW50aXEscmV0cnktb24tZGllIikgKi8pIHsKPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICBkYXRhLT5jaGlwLmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lO
RV9UWVBFX09OX0RJRTsKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICBlcnIgPSBuYW5kX3NjYW4o
JmRhdGEtPmNoaXAsIDEpOwo+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChlcnIpIHJldHVy
biBlcnI7Cj4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJdCBzdGlsbCB0
aHJvd3MgdGhlIGtlcm5lbCB3YXJuaW5nIG9uIGZpcnN0IHRyeSwgYnV0IHRoZSBzZWNvbmQgdHJ5
IHRoZW4gd29ya3MuICAKPiA+ID4gPgo+ID4gPiA+IENhbiB5b3UgcGxlYXNlIHJlbWluZCBtZSB3
aGF0IGlzIHh3YXkvbGFudGlxL3lvdXIgc2V0dXAvaG93IHB1YmxpYyBpdAo+ID4gPiA+IGlzL3do
bydzIHVzaW5nIHRoaXMgZHJpdmVyPwo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+IE1p
cXXDqGwgIAo+ID4gPgo+ID4gPiBJdHMgZm9yIE9wZW53cnQsIEkgd291bGQgbGlrZSB0byBhZGQg
c3VwcG9ydCBmb3IgMyBtb3JlIGRldmljZXMKPiA+ID4gQVZNIGZyaXR6Ym94IDM0OTAvNTQ5MCBh
bmQgNzQ5MC4gVGhleSBhbGwgaGF2ZSB2YXJ5aW5nIE5BTkQgY2hpcHMuCj4gPiA+IEkgaGF2ZSBp
bml0aWFsbHkgY3JlYXRlZCBhIFBSIHRvIGhhdmUgbXkgaW5pdGlhbCBwYXRjaCB0ZXN0ZWQ6Cj4g
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVsbC80NDI2Cj4gPiA+IFRo
ZXJlIGlzIGFscmVhZHkgb25lIGRldmljZSBzdXBwb3J0ZWQgd2hpY2ggaGFzIHR3byBEVEJzIG9u
ZSBmb3IKPiA+ID4gTWljcm9uIGFuZCBvbmUgZm9yIG5vbiBNaWNyb24gKDMzNzApLCBidXQgaXRz
IG5vdCB2ZXJ5IHN0cmFpZ2h0IGZvcndhcmQuCj4gPiA+IFdpdGhvdXQgaGF2aW5nIHRoaXMgaXNz
dWUgc29sdmVkLCBmbGFzaGluZyB0aG9zZSBkZXZpY2VzIHdvdWxkIGJlCj4gPiA+IHBvc3NpYmx5
IGhhdmluZyBpc3N1ZXMgZGVwZW5kaW5nIG9uIE5BTkQgY2hpcCBvciB0aGUgYXdrd2FyZAo+ID4g
PiB3b3JrYXJvdW5kIG9mIGZsYXNoaW5nIG9uZSBpbWFnZSBhbmQgaWYgaXQgZG9lcyBub3QgYm9v
dCwgYm9vdCB0aGUKPiA+ID4gb3RoZXIgb25lLiBXaXRob3V0IHNlbGYgc29sZGVyZWQgc2VyaWFs
IGNvbnNvbGUsIGl0IHdvdWxkIG5vdCB2ZXJ5Cj4gPiA+IGVhc3kgdG8gZmlndXJlIG91dCB0aGUg
TkFORCBtYW51ZmFjdHVyZXIuCj4gPiA+IFRoZSBBVk0gc3RvY2sgZmlybXdhcmUgaXMgb2xkIGtl
cm5lbCBhbmQgZG9lcyBub3QgdXNlIGRldmljZQo+ID4gPiB0cmVlIGZvciBOQU5ELCB0aGV5IGp1
c3QgcXVlcnkgYWxsIHBvc3NpYmxlIG1hbnVmYWN0dXJlcnMgYW5kIHNldAo+ID4gPiB1cCBOQU5E
IGJhc2VkIG9uIG1hbnVmYWN0dXJlciBxdWVyeS4gIAo+ID4KPiA+IEJ1dCBpbiB0aGlzIGNhc2Ug
Y2FuJ3QgeW91IGNoZWNrIHRoZSAncm9vdCcgY29tcGF0aWJsZSBhZ2FpbnN0IGNlcnRhaW4KPiA+
IHZhbHVlcyBhbmQgYW5kIHNvbWUga2luZCBvZiBxdWlyayBpbiB0aGUgLT5hdHRhY2goKSBob29r
IHRvIHVwZGF0ZSB0aGUKPiA+IEVDQyBlbmdpbmUgdG8gdGhlIHJpZ2h0IG9uZT8KPiA+Cj4gPiBU
aGFua3MsCj4gPiBNaXF1w6hsICAKPiAKPiBtYXliZSBJIHdyb3RlIHRoZSB3cm9uZyB0aGluZywg
YnV0IHdoYXQgZG8geW91IG1lYW4gd2l0aCByb290IGNvbXBhdGlibGUuCj4gVGhlIGNvbnRyb2xs
ZXIgaXMgYWx3YXlzIE5BTkQgeHdheSBhbmQgSSB0aGluayB0aGVyZSBhcmUgNCBkaWZmZXJlbnQK
PiBOQU5EIGNoaXAgdHlwZXMuIEJ1dCB0aGUgc3RvY2sgZmlybXdhcmUganVzdCBxdWVyaWVzIHRo
ZSBOQU5ECj4gbWFudWZhY3R1cmVyIG5hbWUsIG5vdCBhIGRhdGUgb3IgdHlwZS9tb2RlbCBvZiB0
aGUgZGV2aWNlcy4gRS5nLiA3NDkwIGNhbgo+IGhhdmUgTWljcm9uIG9yIE1hY3Jvbml4IE5BTkQs
IGJ1dCBxdWVyeWluZyB0aGUgTWljcm9uIGlkIG9yIE1hY3Jvbml4Cj4gaWQgcmVxdWlyZXMgYSBj
aGFuZ2UgdG8gdGhlIHh3YXkgZHJpdmVyPwo+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlIGlu
IHRoZSBmaXJzdCBwYXRjaCBkbyBxdWVyeSB0aGUgbWFudWZhY3R1cmVyCj4gYnV0IGp1c3QgZm9y
IGFsbCB0aGUgND8KPiAKPiBUaGFua3MsIERhbmllbC4KCllvdSB3ZXJlIHRhbGtpbmcgYWJvdXQg
bmV3IGJvYXJkcywgaWYsIG9uIGVhY2ggb2YgdGhlc2UgYm9hcmRzLCB5b3UKa25vdyB3aGF0IGlz
IHRoZSBOQU5EIGNoaXAsIHlvdSBjb3VsZCByZXRyaWV2ZSB0aGUgcm9vdCBjb21wYXRpYmxlIChi
eQpyb290IEkgbWVhbiB0aGUgb25lIGF0IHRoZSByb290IG9mIHRoZSB0cmVlIC8geyB9IGluIHRo
ZSBEVCkgYW5kCmRlcGVuZGluZyBvbiBpdCBjaGFuZ2UgdGhlIEVDQyBlbmdpbmUgdGhhdCBtdXN0
IGJlIHVzZWQgZnJvbSB0aGUgZHJpdmVyCml0c2VsZi4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
