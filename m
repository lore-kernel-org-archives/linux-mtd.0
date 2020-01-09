Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24C0C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C47DF20721
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kKpMtfQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C47DF20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzALebGZGM+42W4BhyKg7Zy8lRCQqmO7SnUEkENZhWw=; b=kKpMtfQRWIOuHe
	lZ8LxlKmytwXGEdt9o2gDOOReFjM6k5SUKexw/BTSf42qAWXoowOimdz8wAy4gFhJo3qgl36tI7Yc
	liHw6KN+JEiQHLcdpBt8mV0DlXVJYWSITge1Gec8OXVVMuojhgZXQB6WnOhQmAyPCOWXq7eny2p5z
	EiEj83FAfP7SAu7VryRT2OhDtF8MqXTf8h/jgWFQWtqc0I6tLTcQZOp2Y3u0E3FiJGnxB4Fw6ciw6
	Qcl5nlBDLheS5j3xML/5+PIRBaTHrwTBpOKveqhTFK+p4B8l8eLJ9s/ZyFYOv/eNedI4JBZgX8JKe
	eGC1BsTCiY6dW2cSCl+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdcY-0003UU-FL; Thu, 09 Jan 2020 19:37:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdcV-0003RP-SV
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:37:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 746F5291E16;
 Thu,  9 Jan 2020 19:37:25 +0000 (GMT)
Date: Thu, 9 Jan 2020 20:37:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
Message-ID: <20200109203722.4423ed09@collabora.com>
In-Reply-To: <20200109202358.2a428a8d@xps13>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
 <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
 <20200109194556.34cf67dc@xps13>
 <20200109201355.707c5b0d@collabora.com>
 <20200109202358.2a428a8d@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_113728_055328_A3B51319 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVGh1LCA5IEphbiAyMDIwIDIwOjIzOjU4ICswMTAwCk1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywKPiAKPiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBUaHUsIDkgSmFuCj4g
MjAyMCAyMDoxMzo1NSArMDEwMDoKPiAKPiA+IE9uIFRodSwgOSBKYW4gMjAyMCAxOTo0NTo1NiAr
MDEwMAo+ID4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6
Cj4gPiAgIAo+ID4gPiBIaSBSaWNoYXJkLAo+ID4gPiAKPiA+ID4gUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24gVGh1LCA5IEphbiAyMDIwIDE5OjQzOjA0Cj4gPiA+
ICswMTAwIChDRVQpOgo+ID4gPiAgICAgCj4gPiA+ID4gTWlxdWVsLAo+ID4gPiA+IAo+ID4gPiA+
IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0gICAgICAKPiA+ID4gPiA+PiBXaGF0IHBy
b2JsZW0gZG9lcyB0aGlzIHNvbHZlPwo+ID4gPiA+ID4+IC4uLmJlc2lkZSBvZiBhIG5pY2UgZGlm
ZnN0YXQgd2hpY2ggcmVtb3ZlcyBtb3JlIHRoYW4gaXQgYWRkcy4gOi0pICAgICAgICAKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gSXQgaXMgbXVjaCBlYXNpZXIgdG8gZXNjYWxhZGUgdG8gdGhlIHRvcCBt
b3N0ICJtYXN0ZXIiIGRldmljZSB3aGVuCj4gPiA+ID4gPiB0aGVyZSBhcmUgbXVsdGlwbGUgbGV2
ZWxzIG9mIHBhcnRpdGlvbmluZywgd2hpY2ggd2FzIG5vdCBjbGVhbmx5Cj4gPiA+ID4gPiBkZXNj
cmliZWQgSU1ITy4gQWxzbyBpdCBpcyBhbHJlYWR5IHVzZWQgaW4gdGhlIE1MQy1pbi1wc2V1ZG8t
U0xDLW1vZGUKPiA+ID4gPiA+IHNlcmllcyA6KSAgICAgICAgCj4gPiA+ID4gCj4gPiA+ID4gT2su
IEluIGZhY3QgSSAiZm91bmQiIHRoaXMgcGF0Y2ggbXkgbG9va2luZyBhdCB0aGUgU0xDIGVtdWxh
dGlvbiBwYXRjaGVzLgo+ID4gPiA+ICAgICAgIAo+ID4gPiA+ID4+ID4gK3N0YXRpYyBpbmxpbmUg
c3RydWN0IG10ZF9pbmZvICptdGRfZ2V0X21hc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPiA+
ID4gPiA+PiA+ICt7Cj4gPiA+ID4gPj4gPiArCXdoaWxlIChtdGQtPnBhcmVudCkKPiA+ID4gPiA+
PiA+ICsJCW10ZCA9IG10ZC0+cGFyZW50Owo+ID4gPiA+ID4+ID4gKwo+ID4gPiA+ID4+ID4gKwly
ZXR1cm4gbXRkOwo+ID4gPiA+ID4+ID4gK30gICAgICAgIAo+ID4gPiA+ID4+IAo+ID4gPiA+ID4+
IFNvLCBwYXJlbnQgPT0gbWFzdGVyPyAgICAgICAgCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHRvcCBt
b3N0IHBhcmVudCAodGhlIG9uZSB3aXRob3V0IHBhcmVudCkgPT0gbWFzdGVyICEKPiA+ID4gPiA+
ICAgICAgICAgCj4gPiA+ID4gPj4gCj4gPiA+ID4gPj4gV2hlbiBJIGNyZWF0ZSBhIE1URCBvbnRv
cCBvZiBVQkkgdXNpbmcgZ2x1ZWJpLCB3aG8gd2lsbCBiZSBwYXJlbnQvbWFzdGVyPyAgICAgICAg
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGlzc3Vl
IGhlcmU/ICAgICAgICAKPiA+ID4gPiAKPiA+ID4gPiBMZXQncyBzYXkgSSBoYXZlIG10ZDAgd2l0
aCBhbiB1YmkgYW5kIGEgdm9sdW1lICJ4eHgiLiBBZnRlciBlbmFibGluZwo+ID4gPiA+IGdsdWVi
aSBhIG5ldyBtdGQxIHdpbGwgYXJyaXZlIG9uIHRoZSBzeXN0ZW0uCj4gPiA+ID4gVGhlIHN0YWNr
aW5nIGlzIG10ZDAgLT4gdWJpICh2b2x1bWUgeHh4KSAtPiBtdGQxLiAgICAgIAo+ID4gPiAKPiA+
ID4gVGhpcyBpcyBtdWNoIGNsZWFyZXIsIHRoYW5rcyEKPiA+ID4gICAgIAo+ID4gPiA+IElzIG5v
dyBhIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIG10ZDEgYW5kIG10ZDA/ICAgICAgCj4gPiA+IAo+ID4g
PiBObyB0aGVyZSBpcyBub25lLiAKPiA+ID4gICAgIAo+ID4gPiA+IEknZCBleHBlY3QgbXRkMSdz
IHBhcmVudCBiZWluZyBtdGQwLiAgICAgIAo+ID4gPiAKPiA+ID4gVGhpcyB3b3VsZCBiZSBhIG5l
dyBmZWF0dXJlLCByaWdodD8gSSBkb24ndCB0aGluayBpdCBpcyB0aGUgY2FzZSB0b2RheS4gICAg
Cj4gPiAKPiA+IFdlIGRlZmluaXRlbHkgZG9uJ3Qgd2FudCBtdGQxIHRvIGFwcGVhciBhcyBhIHBh
cnRpdGlvbiBvZiBtdGQwIGluIHRoYXQKPiA+IGNhc2UgKGJsb2NrcyBpbiBtdGQxIGNhbid0IGJl
IG1hcHBlZCB0byBibG9ja3MgaW4gbXRkMCB3aXRob3V0IHRoZSBVQkkKPiA+IGxheWVyIGJlaW5n
IGludm9sdmVkKS4gTWF5YmUgaXQnZCBiZSBjbGVhcmVyIGlmIHdlIG1vdmUgdGhlIHBhcmVudAo+
ID4gZmllbGQgdG8gbXRkX3BhcnQgYW5kIGFkZCBhbiBNVERfSVNfUEFSVElUSU9OIGZsYWcuIE9y
IG1heWJlIHdlIGNhbgo+ID4ganVzdCBjaG9vc2UgYSBiZXR0ZXIgbmFtZS4gIAo+IAo+IEkgcHJl
ZmVyIHRoZSBuYW1lIGNoYW5nZS4gSSB0aGluayB0aGUgY3VycmVudCBzdHJ1Y3Qgb3JnYW5pemF0
aW9uCj4gaXMgcmlnaHQuIFdoYXQgZG8geW91IHN1Z2dlc3Q/CgpJIGRvbid0IGhhdmUgYSBiZXR0
ZXIgbmFtZSwgc29ycnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
