Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CDDC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 15:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35066136F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 15:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B35066136F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk0y0LnL8pU1bo2X8uShvPrAPmBFLE0Lct+hgWDsYck=; b=IOu+UhOrTprBAP
	KtUhLijduMjAxejPktNI+sLT66oNyPzLTknJtB0Kpr1Ty1ZmEX57yuOPbsvH5DrH9garMmleJOm34
	xmrSnMrE/F0sIHGo1ZFDFYWO5Z/W+RG/ui6a+u93l1eA9H933bhnk2DVkULNse37onQbWkmzCMxbi
	Hf0H9otYVggFz3b7VMqQfxJQSYkOnpL05M9zD6xKnERsvuLQCV+xQHsBAES6zJdv6av2pqOSm+2Af
	Lh5wD1/n3CY20nThHlexqjpct7UqZkJ9LD6X37MjBf0MHSx16u1zcqn4NvpSCZEDOHrAxdXzO5eI3
	207aH5Z7AiVPmUadI9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIBUy-00HMlz-Ma; Mon, 23 Aug 2021 15:04:28 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIBUf-00HMcJ-RQ; Mon, 23 Aug 2021 15:04:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2D1E01BF203;
 Mon, 23 Aug 2021 15:03:55 +0000 (UTC)
Date: Mon, 23 Aug 2021 17:03:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
Message-ID: <20210823170354.2dccabd5@xps13>
In-Reply-To: <CAFr9PXkSeeHNn-KVyrVxp6RRdLYExTgWpheWKLLSZqEo_EHvRg@mail.gmail.com>
References: <20210811084924.52293-1-daniel@0x0f.com>
 <20210816101143.2a64d7b9@xps13>
 <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
 <20210823162148.35a24183@xps13>
 <CAFr9PXkSeeHNn-KVyrVxp6RRdLYExTgWpheWKLLSZqEo_EHvRg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_080410_198794_150A17F1 
X-CRM114-Status: GOOD (  19.00  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBNb24s
IDIzIEF1ZyAyMDIxIDIzOjU0OjIwCiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gTW9uLCAy
MyBBdWcgMjAyMSBhdCAyMzoyMSwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPiBJIGFtIG5vdCBzdXJlIHRvIGZvbGxvdywgYWJvdmUgdGhlIHNvZnR3
YXJlIHNheXMgIjMgY29ycmVjdGVkIGJmIiB3aGlsZSAgCj4gCj4gRHVlIHRvIHRoZSBzdGF0dXMg
YmVpbmcgImJldHdlZW4gMCBhbmQgMyBiaXRmbGlwcyIgSSB0aGluayBpdCdsbAo+IGJhc2ljYWxs
eSByZXBvcnQgMyBtb3N0IG9mIHRoZSB0aW1lLgo+IEFzIGEgcmVmcmVzaGVyIHdlIHNlZW0gdG8g
aGF2ZSBhIHN0YXR1cyBmb3IgMCAtIDMgZmxpcHMgYnV0IG9rLCA0IGJpdAo+IGZsaXBzIGJ1dCBv
aywgYW5kID40IGZsaXBzIG5vIGdvLgo+IEluIG1vc3QgY2FzZXMgKDAgLSAzKSB0aGUgZHJpdmVy
IGlzIHJlcG9ydGluZyAzLgo+IAo+ID4gSSB0aG91Z2h0IHRoZSBwcm9ibGVtIHdhcyB3aGVuIGdl
dHRpbmcgNCBiZiwgYnV0IHRoZSBkdW1wIHNob3cgbWFueQo+ID4gbW9yZS4gQ2FuIHlvdSBzaG93
IG1lIGhvdyBpdCBiZWhhdmVzOgo+ID4gKiBlcmFzZSAobGlrZSB5b3UgZGlkKQo+ID4gKiBpbnNl
cnQgezEsIDIsIDMsIDQsIDV9IGJmIGFuZCBzaG93IHRoZSBkdW1wIGVhY2ggdGltZT8gIAo+IAo+
IEhlcmUncyBhIGNvbXBsZXRlIGxvZyBvZiBlcmFzaW5nIHRoZSBwYWdlIHRoZW4gZmxpcHBpbmcg
YWxsIHRoZSBiaXRzCj4gaW4gdGhlIGZpcnN0IGJ5dGUuCj4gCj4gIyBmbGFzaF9lcmFzZSAvZGV2
L210ZDAgMHg4MDAwMDAwIDEKPiBFcmFzaW5nIDEyOCBLaWJ5dGUgQCA4MDAwMDAwIC0tIDEwMCAl
IGNvbXBsZXRlCj4gIyBuYW5kZHVtcCAtLWJiPWR1bXBiYWQgLXMgMHg4MDAwMDAwIC1sIDEgLWMg
LXAgL2Rldi9tdGQwIHwgaGVhZCAtbiAxMAo+IEVDQyBmYWlsZWQ6IDAKPiBFQ0MgY29ycmVjdGVk
OiA2MjQ5Cj4gTnVtYmVyIG9mIGJhZCBibG9ja3M6IDAKPiBOdW1iZXIgb2YgYmJ0IGJsb2Nrczog
MAo+IEJsb2NrIHNpemUgMTMxMDcyLCBwYWdlIHNpemUgMjA0OCwgT09CIHNpemUgNjQKPiBEdW1w
aW5nIGRhdGEgc3RhcnRpbmcgYXQgMHgwODAwMDAwMCBhbmQgZW5kaW5nIGF0IDB4MDgwMDAwMDEu
Li4KPiBFQ0M6IDMgY29ycmVjdGVkIGJpdGZsaXAocykgYXQgb2Zmc2V0IDB4MDgwMDAwMDAKPiAw
eDA4MDAwMDAwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAwMDAxMDogZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAw
MjA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4u
Li4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDMwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAwMDA0MDogZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4u
Li4uLi4ufAo+IDB4MDgwMDAwNTA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDYwOiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58
Cj4gMHgwODAwMDA3MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAwODA6IGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4
MDAwMDkwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAg
fC4uLi4uLi4uLi4uLi4uLi58Cj4gIyBuYW5kZmxpcGJpdHMgL2Rldi9tdGQwIDBAMHg4MDAwMDAw
Cj4gIyBuYW5kZHVtcCAtLWJiPWR1bXBiYWQgLXMgMHg4MDAwMDAwIC1sIDEgLWMgLXAgL2Rldi9t
dGQwIHwgaGVhZCAtbiAxMAo+IEVDQyBmYWlsZWQ6IDAKPiBFQ0MgY29ycmVjdGVkOiA2MjUyCj4g
TnVtYmVyIG9mIGJhZCBibG9ja3M6IDAKPiBOdW1iZXIgb2YgYmJ0IGJsb2NrczogMAo+IEJsb2Nr
IHNpemUgMTMxMDcyLCBwYWdlIHNpemUgMjA0OCwgT09CIHNpemUgNjQKPiBEdW1waW5nIGRhdGEg
c3RhcnRpbmcgYXQgMHgwODAwMDAwMCBhbmQgZW5kaW5nIGF0IDB4MDgwMDAwMDEuLi4KPiBFQ0M6
IDMgY29ycmVjdGVkIGJpdGZsaXAocykgYXQgb2Zmc2V0IDB4MDgwMDAwMDAKPiAweDA4MDAwMDAw
OiBmZSBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4u
Li4uLi4uLi4uLi58CgpIb3cgaXMgdGhpcyByZXN1bHQgcG9zc2libGU/IFlvdSBhcmUgZHVtcGlu
ZyB3aXRoIHRoZSBFQ0MgZW5naW5lCmVuYWJsZWQsIGl0IHJlcG9ydHMgMyBiZiAobWVhbmluZyB0
aGF0IGl0IGlzIGFjdHVhbGx5IHJ1bm5pbmcsIGF0IGxlYXN0CnRoZSBzb2Z0d2FyZSByZWFsbHkg
dGhpbmtzIHRoZXJlIGlzIGFuIG9uLWRpZSBlbmdpbmUgZW5hYmxlZCkgYnV0IHRoZQpkYXRhIGhh
cyBub3QgYmVlbiBjb3JyZWN0ZWQuIEkgZXhwZWN0IHRoZSBmaXJzdCBieXRlIHRvIGJlIDB4RkYg
YWZ0ZXIKY29ycmVjdGlvbi4gT25seSB3aXRoIC1uIChyYXcgZHVtcCkgd2Ugc2hvdWxkIHNlZSB0
aGlzLgoKPiAweDA4MDAwMDEwOiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAwMDAyMDogZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+
IDB4MDgwMDAwMzA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDQwOiBmZiBmZiBmZiBmZiBmZiBmZiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4uLi4uLi4uLi58Cj4gMHgwODAw
MDA1MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgIHwu
Li4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAwNjA6IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4uLnwKPiAweDA4MDAwMDcwOiBm
ZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiBmZiAgfC4uLi4uLi4u
Li4uLi4uLi58Cj4gMHgwODAwMDA4MDogZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYgZmYg
ZmYgZmYgZmYgZmYgZmYgIHwuLi4uLi4uLi4uLi4uLi4ufAo+IDB4MDgwMDAwOTA6IGZmIGZmIGZm
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmICB8Li4uLi4uLi4uLi4uLi4u
LnwKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
