Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E2BC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1IA9AGzhlgZZXnMrVitR9xcL335td7l+MI3lTp1iZY=; b=Mwjy+yCLqnwS9+
	kVZFqypugx7Wsoez+CJzAkihYokdFKqSc2IHC1o6A0tznHx4L+eYIz7/EjCqoiey3gCEdc+MNDYgD
	1g3a9jz6za1tj3L0FYuDAhjJh19AX9y1V1MnR7qi3N5Put7NMZ+AaQVtHwgzjDCwvADSspA1RM9o2
	C1zp4k/FXEppOvzdp2vbluQkJllIF10uOAXz0yDwHkdamPL3gqq91FEwDxPF8dvI7Hg4o7upsoThb
	CJ/Dxh+mPUJZcf5cQhnUliVrL9Y3Xi9ai+FiDzbQFeG6YTPQZMKcVKkeCDkUv00/Eqa2awF6m07j7
	QLQuEE0ZvGHqgLylinig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7VvK-000000042jH-14nq;
	Thu, 16 May 2024 07:53:10 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7VvG-000000042iI-1pOn
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 07:53:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CAA1C0007;
	Thu, 16 May 2024 07:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715845979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MgJ3Llky/QfG8NT7dqX+eduKgJw2O/SWp7aGIaNCak8=;
	b=KY9HiCboAzjSxvfbQpdL8Wt4hcrCtQ/X3T70xQsxU//9/647Iwp2OHVRBofH9bfOtkP0um
	bVbtN9Ob5M/IH/PGSW7m6J+IaGZJ4SuspUY4u207r6se4RIsIdgSduul6p5YYB5fLAGQ/M
	1mY+frALkvOwpONN1vPzVQIcVJycCz3vUs6k4UXMbcp2ERnPXok+Syy6PvAxsu+sYbbDR9
	IBcbgxmD5rCH3iT09T7RlijrZL+JLUxp+am85sNVit8ITpyc4AjN79BT57DnRVlv8wAo6x
	QnxO9u3PnzqVqGdNIVqTKTGpAZMtI4txqpHVbbG9/xe2gO+IH0fGHaFYJNVjuw==
Date: Thu, 16 May 2024 09:52:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Steven Seeger <steven.seeger@flightsystems.net>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: Bypass a couple of sanity checks
 during NAND identification
Message-ID: <20240516095257.18ad0017@xps-13>
In-Reply-To: <DM6PR05MB450689909396CB80A56B8732F7E32@DM6PR05MB4506.namprd05.prod.outlook.com>
References: <20240507160546.130255-1-miquel.raynal@bootlin.com>
	<20240507160546.130255-3-miquel.raynal@bootlin.com>
	<DM6PR05MB450689909396CB80A56B8732F7E32@DM6PR05MB4506.namprd05.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_005307_003848_61F4ACF3 
X-CRM114-Status: GOOD (  24.83  )
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

SGkgU3RldmVuLAoKc3RldmVuLnNlZWdlckBmbGlnaHRzeXN0ZW1zLm5ldCB3cm90ZSBvbiBUdWUs
IDE0IE1heSAyMDI0IDE3OjU3OjQ2CiswMDAwOgoKPiBPbiBUdWVzZGF5LCBNYXkgNywgMjAyNCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiAKPiA+U28sIGlmIHRoZSBmaWVsZHMgYXJlIGVtcHR5LCBl
c3BlY2lhbGx5IG10ZC0+d3JpdGVzaXplIHdoaWNoIGlzICphbHdheXMqCj4gPnNldCBxdWl0ZSBy
YXBpZGx5IGFmdGVyIGlkZW50aWZpY2F0aW9uLCBsZXQncyBza2lwIHRoZSBzYW5pdHkgY2hlY2tz
LiAgCj4gCj4gSSBub3RpY2VkIHRoaXMgd2hlbiBmaXJzdCBsb29raW5nIGF0IG15IGJvYXJkIHdp
dGggdGhlIGJpdGZsaXAgaW4gYSBOQU5EIGNoaXAncyBwYXJhbWV0ZXIgcGFnZS4gSSBqdXN0IGFz
c3VtZWQgdGhhdCBzaW5jZSBJIHdhcyBzZXR0aW5nIGl0IHVwIHRvIGRvIGNvbHVtbiBjaGFuZ2Ug
b3BlcmF0aW9ucywgSSBuZWVkZWQgdG8gYWRkIHRoaXMgaW4gYXQgdGhlIHRpbWUuIExvb2tpbmcg
YXQgaXQgbm93LCBzaW5jZSB0aGlzIGluZm9ybWF0aW9uIGlzIGJlaW5nIHN1cHBsaWVkIGJ5IG1l
IGJlZm9yZSB0aGUgc2NhbiwgaXQncyB3cm9uZy4gIFNvIEkgYWdyZWUgaXQncyBhIGJ1ZywgYnV0
IEkgZGlkbid0IHRoaW5rIGFib3V0IGl0IGFnYWluIHNpbmNlIEkgd2FzIHRhY2tsaW5nIHRoZSBi
dWcgb2YgdHJ5aW5nIHRvIHJlYWQgYWRkaXRpb25hbCBwYXJhbWV0ZXIgcGFnZSBjb3BpZXMgZnVy
dGhlciBkb3duIHRoZSBwYWdlIGR1ZSB0byB0aGUgYml0ZmxpcC4KPiAKPiBJIGRvbid0IGhhdmUg
YWNjZXNzIHRvIHRoZSBib2FyZCByaWdodCBub3csIGJ1dCB3aGVuIEkgZ2V0IHRvIGl0IGFnYWlu
IEkgY2FuIHRyeSB0aGlzIHBhdGNoLiBJIHdpbGwgbmVlZCB0byByZW1vdmUgd2hhdCBJIGFscmVh
ZHkgYWRkZWQgaW4gdG8gY2hlY2sgYW5kIHJlcGx5IGJhY2suIEl0IG1heSBiZSBhIGZldyB3ZWVr
cywgdGhvdWdoLgo+IAo+IE9uIGFub3RoZXIgbm90ZSwgSSB0aGluayB0aGF0IHRoaXMgZW50aXJl
IEFQSSB3b3VsZCBiZW5lZml0IGZyb20gZGlzY291cmFnaW5nIGh5YnJpZCBhcHByb2FjaGVzLiBJ
IGltcGxlbWVudCBmdW5jdGlvbiBvdmVybG9hZHMgZm9yIHRoaW5ncyBsaWtlIGVjYy5yZWFkX3Bh
Z2UsIHdyaXRlX3BhZ2UsIHJlYWRfcGFnZV9yYXcsIGV0YywgYnV0IGFsc28gdXNlIHRoZSBleGVj
IGZ1bmN0aW9uIGZvciB0aGluZ3MgbGlrZSBlcmFzZSwgcmVhZCBpZCwgcmVhZCBwYXJhbWV0ZXIg
cGFnZSwgZXRjLiBJIG1heWJlIGRpZCBpdCAid3JvbmciIGJ1dCBpdCB3b3Jrcy4gUGFzdCBkcml2
ZXJzIEkndmUgZG9uZSB1c2UgdGhlIGxlZ2FjeSBjbWRmdW5jLCBzbyB0aGlzIHdhcyBteSBmaXJz
dCBhdHRlbXB0IGF0IHVzaW5nIHRoZSBjb21tYW5kIHBhcnNlci4gSSBzdXNwZWN0IHRoZXJlIGFy
ZSBhIGxvdCBvZiBwZW9wbGUgbGlrZSBtZSB3cml0aW5nIGRyaXZlcnMgZm9yIHByb3ByaWV0YXJ5
IGhhcmR3YXJlIHRoYXQgdXNlcyBGUEdBcyB0byBkbyBzb21lIG9mIHRoZSBOQU5EIGludGVyYWN0
aW9uLCByYXRoZXIgdGhhbiBkaXJlY3QgY2hpcCBhY2Nlc3MgYXMgdGhlIEFQSSB3YXMgb3JpZ2lu
YWxseSBkZXNpZ25lZCBmb3IuCgpJIGRvbid0IGtub3cgd2hhdCB5b3UgbWVhbiB3aXRoIGRpcmVj
dCBjaGlwIGFjY2Vzcy4gLT5jbWRfY3RybCgpIGFuZAotPmNtZGZ1bmMoKSB3ZXJlIGRlc3BlcmF0
ZWx5IHRvbyBzaW1wbGUgYW5kIG1hbnkgZHJpdmVycyBzdGFydGVkCmd1ZXNzaW5nIHdoYXQgdGhl
IGNvcmUgd2FzIHRyeWluZyB0byBkbywgbWFraW5nIGl0IHZlcnkgaGFyZCB0bwpleHRlbmQvbW9k
aWZ5IHRoZSBjb3JlIHdpdGhvdXQgYnJlYWtpbmcgdGhlbSBhbGwuIFRoaXMgd2FzIHNpZ24Kb2Yg
YW4gaW5hZGVxdWF0ZSBkZXNpZ24gYW5kIGhlbmNlIC0+ZXhlY19vcCgpIChwcm92aWRpbmcgYWxs
IHRoZQpvcGVyYXRpb24pIHdhcyBpbnRyb2R1Y2VkLgoKSnVzdCB0byBtYWtlIGl0IGNsZWFyLCB0
aGUgb3JpZ2luYWwgQVBJcyB3ZXJlIHRvdGFsbHkgZmluZSBiYWNrIHRoZW4sCmJ1dCBjb250cm9s
bGVycyBldm9sdmVkLCBiZWNhbWUgc21hcnRlcl5XIG1vcmUgY29tcGxleCwgdW50aWwgdGhlIEFQ
SXMKd2VyZSBubyBsb25nZXIgZml0dGluZy4KCj4gU28sIHRvIGV4cGxhaW4gZnVydGhlciwgcmVh
ZF9wYWdlIHRyaWdnZXJzIG15IGFkZHIvY2hpcCBzZWxlY3QsIHJlYWQgcGFnZSBjb21tYW5kLCBh
bmQgcmV0cmlldmluZyB0aGUgYnVmZmVyLiBSZWFkIHBhcmFtZXRlciBwYWdlIGdvZXMgdGhyb3Vn
aCB0aGUgY29tbWFuZCBwYXJzZXIsIGFzIGRvZXMgdGhlIGNvbHVtbiBjaGFuZ2Ugb3AsIHdpdGgg
c29tZSBzdGF0ZSB2YXJpYWJsZXMgdG8ga2VlcCB0cmFjayBvZiB3aGVyZSBpbiB0aGUgcmVhZCBj
eWNsZSB3ZSBhcmUgc28gdGhhdCBlYWNoIGNvcHkgb2YgdGhlIHBhcmFtZXRlciBwYWdlIGRhdGEg
Y2FuIGJlIGFjY2Vzc2VkIGluIHRoZSBidWZmZXIuIEkgbGFtZW50IHRoZSBsYWNrIG9mIGNvbnNp
c3RlbmN5IGhlcmUuIEJ1dCwgaXQgd29ya3MgYW5kIHRoZSBjdXN0b21lciBpcyB1bmxpa2VseSB0
byB3YW50IHRvIGNoYW5nZSBhbnl0aGluZyBhdCB0aGlzIHBvaW50LiA6KQoKVGhlIGxvZ2ljIGlz
OgoKLSBFYXJseSBhdCBib290IHlvdSBuZWVkIHRvIGlkZW50aWZ5IHRoZSBjaGlwLCBpdHMgcGFy
YW1ldGVycywgaXRzCiAgY29uZmlndXJhdGlvbiwgZXRjLgoKICAtPiBleGVjX29wKCkgaXMgdXNl
ZAoKLSBEdXJpbmcgbm9ybWFsIG9wZXJhdGlvbiwgaXQncyB0aW1lIGZvciBJL09zLiBVc2luZyAt
PmV4ZWNfb3AoKSBhZ2FpbgogIGNhbiB3b3JrLCBidXQgbW9zdCBvZiB0aGUgdGltZSB0aGVzZSBv
cGVyYXRpb25zIGNhbiBiZSBkb25lIGZhc3RlcgogIHdpdGggYSBtb3JlIGN1c3RvbSBhcHByb2Fj
aCwgZXNwZWNpYWxseSBzaW5jZSBtb3N0IGNvbnRyb2xsZXIgZHJpdmVycwogIGVtYmVkIGFuZCBF
Q0MgZW5naW5lIHRoYXQgYWxzbyBuZWVkcyB0byBiZSBtYW5hZ2VkIGR1cmluZyB0aGVzZQogIGFj
Y2Vzc2VzLgoKICAtPiB5b3VyIHBhZ2UgaGVscGVycyBhcmUgaGVyZSBmb3IgdGhhdAoKLSBEdXJp
bmcgZGVidWdnaW5nIHlvdSBtaWdodCB3YW50IHRvIHBlcmZvcm0gcmF3IHBhZ2UgcmVhZHMsCiAg
cGVyZm9ybWFuY2UgZG9lcyBub3QgbWF0dGVyIGhlcmUgYnV0IHRoZSBkYXRhIGxheW91dCBpbiB0
aGUgY2hpcCBpcwogIE5BTkQgY29udHJvbGxlciBhbmQgRUNDIGVuZ2luZSBzcGVjaWZpYywgd2hp
bGUgdGhlIHVzZXIgZXhwZWN0ZWQKICBsYXlvdXQgaXM6IFthbGwgdGhlIGRhdGFdW2FsbCB0aGUg
b29iXS4gCgogIC0+IHlvdXIgcmF3IHBhZ2UgaGVscGVycyBhcmUgaGVyZSBmb3IgdGhhdAoKQW5k
IHRoZXJlIGFyZSBzdGFuZGFyZCBoZWxwZXJzIHByb3ZpZGVkIGluIHRoZSBjb3JlIGlmIHlvdXIg
Y29udHJvbGxlcgpkb2VzIG5vdCBuZWVkIHNwZWNpZmljIGltcGxlbWVudGF0aW9ucy4gWW91IG1h
eSB3YW50IHRvIHVzZSB0aGVtCmJlY2F1c2UgaXQgbWFrZXMgeW91ciBsaWZlIGVhc2llciwgdGhl
eSB3aWxsIHVzZSAtPmV4ZWNfb3AoKS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
