Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ACDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 23:10:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B0260EBB
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 23:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14B0260EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZH759nOu/rS9gMk5NDSi8ChiIPuxztIEdXpiihWJgaU=; b=VWl/lBE3/58gbq
	kEey86isblr82PSqDt7msw69pFAmet9bZ/nd5MO+5AYQNPPN53FXyi8iC8a3LV9P6Lx0kLoKvJW75
	yJxWA8Ejg/N7ASUBQiUOyNPGmMQcYOYB45I/XmeU6PHc+KFzBzpwTHqvpw1MVYjsVyz52QU/+4jGN
	NxBFka5+ZNjjmRvHvFQrCyOBqlPx3Q2jn2R0xsDmEnbQyJXPWm/YXMLsS2zCTuNjUS8NY0NySIpc9
	gk+rymIrBOYn68aZ6PLRfpZkD4+PuTFuiDo53XM5bwxApiXqb9vx7BBWDxHhRwpv2hReOiQXsjSRh
	4mwjIDAZ9LBiSGFFiNMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVMEO-009DPY-RV; Tue, 28 Sep 2021 23:09:49 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVLWo-0093Xf-CR
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 22:24:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 56193FF802;
 Tue, 28 Sep 2021 22:24:36 +0000 (UTC)
Date: Wed, 29 Sep 2021 00:24:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] mtd: Changes for v5.13-rc4
Message-ID: <20210929002435.4d0b437c@xps13>
In-Reply-To: <20210526184612.751e7e5c@xps13>
References: <20210526175924.4f9ab124@xps13>
 <CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com>
 <20210526184612.751e7e5c@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_152446_599421_AA2FDD7A 
X-CRM114-Status: GOOD (  27.68  )
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

SGkgTGludXMsCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIFdlZCwgMjYgTWF5
IDIwMjEgMTg6NDY6MTIgKzAyMDA6Cgo+IEhpIExpbnVzLAo+IAo+IExpbnVzIFRvcnZhbGRzIDx0
b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGUgb24gV2VkLCAyNiBNYXkKPiAyMDIx
IDA2OjIwOjM1IC0xMDAwOgo+IAo+ID4gT24gV2VkLCBNYXkgMjYsIDIwMjEgYXQgNTo1OSBBTSBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZTogIAo+ID4gPgo+
ID4gPiBSYXcgTkFORDoKPiA+ID4gKiB0eHg5bmRmbWMsIHRtaW8sIHNoYXJwc2wsIG5kZmMsIGxw
YzMyeHhfc2xjLCBmc21jLCBjczU1M3g6Cj4gPiA+ICAgLSBGaXggZXh0ZXJuYWwgdXNlIG9mIFNX
IEhhbW1pbmcgRUNDIGhlbHBlciAgICAKPiA+IAo+ID4gV2h5IGFyZSB0aGVzZSBndXlzIGFsbCBw
b2ludGxlc3NseSBkdXBsaWNhdGluZyB0aGUgZWNjIHdyYXBwZXIKPiA+IGZ1bmN0aW9ucyBmb3Ig
dGhlaXIgZWNjICdjb3JyZWN0JyBmdW5jdGlvbnM/Cj4gPiAKPiA+IFRoZSB3aG9sZSAidGhlIEhh
bW1pbmcgc29mdHdhcmUgRUNDIGVuZ2luZSBoYXMgYmVlbiB1cGRhdGVkIHRvIGJlY29tZQo+ID4g
YSBwcm9wZXIgYW5kIGluZGVwZW5kZW50IEVDQyBlbmdpbmUiIGV4Y3VzZSBtYWtlcyBubyBzZW5z
ZS4gSWYKPiA+IG11bHRpcGxlIGNoaXBzIGp1c3Qgd2FudCBhIGJhc2ljIHN3IGhhbW1pbmcgaGVs
cGVyLCB0aGVuIHRoZXkgc2hvdWxkCj4gPiBoYXZlIG9uZS4gTm90IGhhdmUgdG8gYmUgZm9yY2Vk
IHRvIGVhY2ggd3JpdGUgdGhlaXIgb3duIHBvaW50bGVzcwo+ID4gd3JhcHBlciBsaWtlIHRoaXMu
Cj4gPiAKPiA+IFRoZXNlIGNoaXAgZHJpdmVycyBqdXN0IHdhbnQgJ2VjY19zd19oYW1taW5nX2Nv
cnJlY3QoKScgd2l0aCB0aGUKPiA+IHByb3BlciBhcmd1bWVudHMsIGFuZCBpdCBzZWVtcyBlbnRp
cmVseSB3cm9uZyB0byBkdXBsaWNhdGUgdGhlIGhlbHBlcgo+ID4gZml2ZSB0aW1lcyBvciB3aGF0
ZXZlci4gVGhlcmUgc2hvdWxkIGp1c3QgYmUgYSBnZW5lcmljIGhlbHBlciAtIHRoZQo+ID4gd2F5
IHRoZXJlIHVzZWQgdG8gYmUuCj4gPiAKPiA+IEluIGZhY3QsIEkgd291bGQgZ2VuZXJhbGx5IHN0
cm9uZ2x5IHJlY29tbWVuZCB0aGF0IGlmIHRoZXJlIHVzZWQgdG8gYmUKPiA+IGEgZ2VuZXJpYyBo
ZWxwZXIgdGhhdCBkaWZmZXJlbnQgY2hpcCBkcml2ZXJzIHVzZWQgKGllIHRoZSBvbGQKPiA+IHJh
d25hbmRfc3dfaGFtbWluZ19jb3JyZWN0KCkpLCB0aGVuIHN1Y2ggYSBoZWxwZXIgc2hvdWxkIGJl
IGxlZnQgYWxvbmUKPiA+IGFuZCBub3QgY2hhbmdlIHRoZSBzZW1hbnRpY3Mgb2YgaXQuICAKPiAK
PiBJIGFtIG5vdCBoYXBweSBuZWl0aGVyIHdpdGggdGhlIGZpeCAod2hpY2ggSSB3cm90ZSBteXNl
bGYpIGFzIG15IGZpcnN0Cj4gZ29hbCB3YXMgdG8gdW5pZm9ybWl6ZSB0aGUgd2F5IHRoZSBIYW1t
aW5nIGhlbHBlcnMgYXJlIGJlaW5nIGNhbGxlZCAoYXMKPiBwYXJ0IG9mIGEgbXVjaCBiaWdnZXIg
d29yaykuIEkgYXNzdW1lZCB0aGF0IGFsbCBkcml2ZXJzIGVpdGhlciB1c2VkIHRoZQo+IEhhbW1p
bmcgc29mdHdhcmUgZW5naW5lIG9yIHNpbXBseSBkaWRuJ3QsIHdpdGhvdXQgdGhpbmtpbmcgYWJv
dXQgdGhlCj4gImludGVybWVkaWF0ZSIgc2l0dWF0aW9ucyB3aGVyZSBhIHBhcnRpY3VsYXIgZHJp
dmVyIHdvdWxkIGp1c3Qgd2FudCB0bwo+IGNhbGwgYSBwYXJ0aWN1bGFyIEhhbW1pbmcgaGVscGVy
IHRvIHdvcmthcm91bmQgaXRzICJtaXNzaW5nIiBoYXJkd2FyZQo+IGNhcGFiaWxpdGllcy4KPiAK
PiBVbmZvcnR1bmF0ZWx5IHdoZW4gSSBzcG90dGVkIHRoYXQgbWFueSBkcml2ZXJzIHdlcmUgYnJv
a2VuIGJ5IG15IHJld29yawo+IEkgZGVjaWRlZCB0byBwcm92aWRlIHBlci1kcml2ZXIgZml4ZXMs
IHdoaWxlLCBhcyB5b3Ugc3VnZ2VzdCwgSSBzaG91bGQKPiBwcm9iYWJseSBoYXZlIGRlY2xhcmVk
IGEgZ2VuZXJpYyAnaGFtbWluZyBjb3JyZWN0JyBjb3JlIGhlbHBlciBhbmQgdXNlCj4gdGhhdCBk
aXJlY3RseSBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZSBsb2dpYyBpbiBlYWNoIGJyb2tlbiBk
cml2ZXIuCj4gCj4gPiBUaGUgbmV3ICJwcm9wZXIgaW5kZXBlbmRlbnQgRUNDIGVuZ2luZSIgdGhh
dCBoYWQgbmV3IHNlbWFudGljcyBzaG91bGQKPiA+IGhhdmUgYmVlbiB0aGUgb25lIHRoYXQgZ290
IGEgbmV3IG5hbWUsIHJhdGhlciB0aGFuIGJyZWFraW5nIGFuIG9sZCBhbmQKPiA+IGV4aXN0aW5n
IGhlbHBlciBmdW5jdGlvbiBhbmQgdGhlbiBtYWtpbmcgdGhlIGNoaXAgZHJpdmVycyBwb2ludGxl
c3NseQo+ID4gd3JpdGUgdGhlaXIgb3duIG5ldyBoZWxwZXIgZnVuY3Rpb25zLgo+ID4gCj4gPiBJ
J3ZlIHB1bGxlZCB0aGlzLCBidXQgdW5kZXIgcHJvdGVzdC4gVGhlIHBhdGNoIGhvbmVzdGx5IGp1
c3QgbG9va3MKPiA+IGxpa2UgbWluZGxlc3MgZHVwbGljYXRpb24uICAKCkp1c3QgdG8gbGV0IHlv
dSBrbm93IHRoYXQgSSBwcm9wb3NlZCB0aGVyZSBbMV0gYSBzZXJpZXMgdG8gY2xlYW4gdGhpcwp1
cC4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMTA5MjgyMjE1MDcu
MTk5MTk4LTEtbWlxdWVsLnJheW5hbEBib290bGluLmNvbS9ULyN0CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
