Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFC4C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 11:17:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36C8B64E5E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 11:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36C8B64E5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5LohTgeEidBbCwZOQI+Xsaa8kAL+IrRk558yOIqVhHk=; b=k0IKsN8v7wMI7GDCkpOUBf1HE
	Jybim5mnC7osAhBNMv8y5Wr+nH1vJsdZ3alikt9k+RrwGvNsJSFdcx14ksdM2vSmEmye0fF8iEVvX
	5jjnh/EqSmcnllui+LmQoouPPF7ZB6YRMRGA6Atagq0b1k5uTkQZpo41QycsMZlg16FMBok8dPRfC
	Vlt3vH8Lizvu5vjFrj8qCA2eDV1YqGsZXyGrzx211fZKlupECScUhRlaEQ/6ToZ793syUF4KF8klX
	epGyrDMsR0FpzGpsHYc9KxRo+QnEBvy76KEN8sL1nLKLE5cWaAF5FvD+a0nz37I8bPzO/0LOjqvHt
	tG4f58Fcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBbsD-0000fe-V2; Mon, 15 Feb 2021 11:17:01 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBbs9-0000ec-VC
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 11:16:59 +0000
X-Originating-IP: 92.184.108.178
Received: from xps13 (pop.92-184-108-178.mobile.abo.orange.fr [92.184.108.178])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 17D241C000C;
 Mon, 15 Feb 2021 11:16:54 +0000 (UTC)
Date: Mon, 15 Feb 2021 12:16:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Message-ID: <20210215121653.4edd86c4@xps13>
In-Reply-To: <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_061658_201550_E67E0F76 
X-CRM114-Status: GOOD (  37.38  )
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
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBNb24s
IDE1IEZlYiAyMDIxIDE5OjUzOjEzCiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gTW9uLCAx
NSBGZWIgMjAyMSBhdCAxOToyNCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ2FuIHlvdSBwbGVhc2UgYWRkIGEgY2hhbmdlbG9nIGhlcmUg
d2hlbiB5b3Ugc2VuZCBhIG5ldyB2ZXJzaW9uIG9mIGEKPiA+IHBhdGNoPyAgCj4gCj4gU29ycnks
IEkgd2FzIGdvaW5nIHRvIGFkZCBhIGNvdmVyIGxldHRlciBidXQgZWxzZXdoZXJlIGdvdCB0b2xk
IHRoYXQKPiBvbmUgaXNuJ3QgbmVlZGVkIGZvciBhIHNpbmdsZSBwYXRjaC4uCgpBIGNvdmVyIGxl
dHRlciBpcyB1c2VmdWwgd2hlbiB0aGVyZSBhcmUgbWFueSBwYXRjaGVzLCBvciB3aGVuIHRoZXJl
IGlzCnNvbWUgY29udGV4dCB0aGF0IGlzIGltcG9ydGFudCB0byByZW1lbWJlci4KCkJ1dCBhIGNo
YW5nZWxvZyBzaG91bGQgYWx3YXlzIGJlIGFkZGVkIHdoZW4geW91IGNoYW5nZSBzb21ldGhpbmcK
YmV0d2VlbiB0d28gdmVyc2lvbnMuIEFuZCB0aGUgY2hhbmdlbG9nIGNhbiBiZSBsb2NhdGVkIGJl
bG93IHRoZSB0aHJlZQpkYXNoZXMgKCItLS0iKSB3aXRob3V0IGJlaW5nIHBhcnQgb2YgdGhlIGZp
bmFsIGNvbW1pdCBtZXNzYWdlLCBpdCBkb2VzCm5vdCBuZWVkIHRvIGJlIGluIGEgc2VwYXJhdGUg
Y292ZXIgbGV0dGVyLgoKPiBCYXNpY2FsbHkgSSBjaGFuZ2VkIEZTMzVORDAxRyB0byBGUzM1TkQw
MUctUzFZMiBhcyB0aGF0J3MgdGhlIHByb3Blcgo+IHBhcnQgbnVtYmVyIGZvciB0aGUgY2hpcCBJ
IGhhdmUgYW5kIHRoZXJlIHNlZW0gdG8gYmUgYSBmZXcgdmFyaWF0aW9ucwo+IG9mIHRoaXMuCj4g
QXNpZGUgZnJvbSB0aGF0IEkgZml4ZWQgdXAgdGhlIGhleCBudW1iZXJzIHRvIGJlIHVwcGVyY2Fz
ZSBhbmQgYWRkZWQKPiB0aGUgb29iIGxheW91dCBjYWxsYmFja3MuCj4gCj4gPiA+ICtzdGF0aWMg
aW50IGZzMzVuZDAxZ19zMXkyX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBp
bnQgc2VjdGlvbiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKQo+ID4gPiArewo+ID4gPiArICAgICBpZiAoc2VjdGlv
biA+IDMpCj4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FUkFOR0U7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgLyoKPiA+ID4gKyAgICAgICogTm8gRUNDIGRhdGEgaXMgc3RvcmVkIGluIHRoZSBhY2Nl
c3NpYmxlIE9PQiBzbyB0aGUgZnVsbCAxNiBieXRlcwo+ID4gPiArICAgICAgKiBvZiBlYWNoIHNw
YXJlIHJlZ2lvbiBpcyBhdmFpbGFibGUgdG8gdGhlIHVzZXIuIEFwcGFyZW50bHkgYWxzbwo+ID4g
PiArICAgICAgKiBjb3ZlcmVkIGJ5IHRoZSBpbnRlcm5hbCBFQ0MuICAKPiA+Cj4gPiBIb3cgaXMg
dGhpcyBldmVuIHBvc3NpYmxlPyBFQ0MgbXVzdCBiZSBzdG9yZWQgc29tZXdoZXJlLCBtYXliZSBp
dCBpcwo+ID4gbm90IHBvc3NpYmxlIHRvIHJldHJpZXZlIGl0IGJ1dCBJIGd1ZXNzIHlvdSBjYW5u
b3QgdXNlIHRoZSAzMiBieXRlcyBvZgo+ID4gT09CIGZvciB1c2VyIGRhdGEuIENhbiB5b3UgcGxl
YXNlIHZlcmlmeSB0aGF0PyAgCj4gCj4gVGhpcyB3b3JyaWVkIG1lIHRvbyBhcyBJIGNvdWxkIG5v
dCBmaW5kIHRoZSBPT0IgbGF5b3V0IGFueXdoZXJlLgo+IFRoZXkgc2ltcGx5IGxpc3QgdGhlcmUg
YmVpbmcgNCA1MTIgYnl0ZSBtYWluIGFyZWFzIGFuZCB0aGVuIDQgMTYgYnl0ZQo+IHNwYXJlIGFy
ZWFzLiBUaGUgb25seSBvdGhlciBub3RlIGlzIHRoYXQgdGhlIGZpcnN0IGJ5dGUgb2Ygc3BhcmUw
IGlzCj4gdXNlZCBmb3IgdGhlIGJhZCBibG9jayBtYXJrZXIuCj4gCj4gSSBjb250YWN0ZWQgTG9u
Z3N5cyBidXQgdGhleSBkaWRuJ3QgZ2V0IGJhY2sgdG8gbWUuCj4gU28gd2hhdCBJIGRpZCBoZXJl
IHdhcyBJIHN0YXJ0ZWQgZ29vZ2xpbmcgc3RyaW5ncyB3aXRoaW4gdGhlIGRhdGFzaGVldAo+IHRv
IGZpbmQgb3RoZXIgY2hpcHMgdGhhdCBhcmUgcHJvYmFibHkgdGhlIHNhbWUgSVAgaW5zaWRlIGFu
ZCBJIGZvdW5kCj4gdGhlIEZNMjVHMDEuCj4gSXQncyBkYXRhc2hlZXQgc2hhcmVzIGEgbG90IG9m
IHRoZSBzYW1lIHRleHQgYW5kIHRoZSBmbGFzaCBsYXlvdXQKPiBkaWFncmFtcyBldGMgYXJlIHRo
ZSBzYW1lLgo+IEl0IGhhcyB0aGUgc2FtZSB0YWJsZSBmb3IgdGhlIGZsYXNoIGxheW91dC4gNCA1
MTIgYnl0ZSBhcmVhcyBhbmQgNCAxNgo+IGJ5dGUgc3BhcmUgYXJlYXMuIEl0IGhhcyB0aGUgc2Ft
ZSBub3RlIGZvciB0aGUgYmFkIGJsb2NrIG1hcmtlciBhbmQKPiB0aGVuIG9uZSBhZGRpdGlvbmFs
IG5vdGU6Cj4gCj4gIjIuIFNwYXJlIGFyZWEgODAwSCB0byA4M0ZIIGlzIGFsbCBhdmFpbGFibGUg
Zm9yIHVzZXIuCj4gIEVDQyBwYXJpdHkgY29kZXMgYXJlIHByb2dyYW1tZWQgaW4KPiBhZGRpdGlv
bmFsIHNwYWNlIGFuZCBub3QgdXNlciBhY2Nlc3NpYmxlLiIKPiAKPiBJdCB3b3VsZCBzZWVtIHRo
YXQgdGhlIHBhZ2VzIGFyZSBhY3R1YWxseSBiaWdnZXIgdGhhbiAySyArIDY0IG9yIHRoZXJlCj4g
aXMgc29tZSBvdGhlciBwbGFjZSB0aGV5IGtlZXAgdGhlIEVDQy4KPiBPciBib3RoIGRhdGFzaGVl
dHMgYXJlIGx5aW5nLiBTb21ld2hlcmUgZWxzZSBpbiB0aGUgZGF0YXNoZWV0cyBpdCBzYXlzCj4g
dGhhdCB3cml0ZXMgdG8gdGhlIEVDQyBhcmVhIHdpbGwgYmUgaWdub3JlZCBidXQgdGhhdCBkb2Vz
bid0IG1ha2UgYQo+IGxvdCBvZiBzZW5zZSBpZiB0aGUgRUNDIGFyZWEgaXNuJ3QgdXNlciBhY2Nl
c3NpYmxlIGluIHRoZSBmaXJzdCBwbGFjZS4KPiAKPiBJIGRpZG4ndCB0aGluayBhYm91dCBpdCBh
dCB0aGUgdGltZSBidXQgSSBjYW4gdGFrZSBhIGR1bXAgb2YgdGhlIE9PQgo+IGFyZWEgb2YgbXkg
RlMzNU5EMDFHLVMxWTIgdG8gY29uZmlybSBpdCdzIGFsbCAweGZmIGV4Y2VwdCBmb3IgYW55Cj4g
ZmFjdG9yeSBtYXJrZWQgYmFkIGJsb2Nrcy4KCkkgc2VlLiBDYW4geW91IHBsZWFzZSB0cnkgdGhl
IGZvbGxvd2luZzoKCm5hbmR3cml0ZSAtbyAvZGV2L210ZHggL2Rldi96ZXJvCm5hbmRkdW1wIC1v
bDEgL2Rldi9tdGR4CgpJZiB0aGUgZW50aXJlIGFyZWEgaXMgZWZmZWN0aXZlbHkgZnJlZSB0byBi
ZSB1c2VkLCB5b3Ugc2hvdWxkIHNlZSAwJ3MKZXZlcnl3aGVyZS4gT3RoZXJ3aXNlIHlvdSBzaG91
bGQgaGF2ZSBmZidzIHNvbWV3aGVyZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
