Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B14AC4320A
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB0360F92
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB0360F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGwztcAGNm4pP+t/kOKHi1lJaAQn3mB4sf6actnXPIo=; b=W+b5aeJZCSPd+X
	AguakdFSX4Uh0a8HjwA+dFJdvm+fbJv3QR9zi4eHnqo/1saB4JNKKR4UHq4v+0hHeA6BHZojrzKf0
	CnpJ6QavnLggfeuSG+8ZzSUNmx73uF9OND9RKeHXlxL+8Ef7XAbU5T4KPbrfZmjOJMnBLNcFjc9YQ
	O6lqzaVEkQeISQOsRYce+9Mf5Pd/w4fOxGkeVj/vpWJ0GMQeZHaNn5QT8exfcATRjuMiPyVjUOSla
	6wR2JFS0TTaG0dKkQ8s0Krnrex0pEdXUe+MhXm18SaCB2LVqB14OHNt5q+FD6GILf2lMtWM589VRi
	eHaPDmDCWJ+A8Pab667A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3Jf-00B3u3-I6; Fri, 20 Aug 2021 12:08:07 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3Ic-00B3fG-6d
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:07:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9DFEF1BF207;
 Fri, 20 Aug 2021 12:06:57 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:06:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 04/13] mtd: spinand: Fix odd byte addr and data phase in
 read/write reg op and write VCR op for Octal DTR mode
Message-ID: <20210820140656.72819d90@xps13>
In-Reply-To: <a0decde4-c68e-9494-9ce5-97d60916f9ad@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-5-a-nandan@ti.com>
 <20210806204334.5fedea42@xps13>
 <a0decde4-c68e-9494-9ce5-97d60916f9ad@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_050702_601145_B47AE752 
X-CRM114-Status: GOOD (  32.61  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBGcmks
IDIwIEF1ZyAyMDIxIDE1OjU3OjM2CiswNTMwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDA3LzA4
LzIxIDEyOjEzIGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgQXB1cnZhLAo+ID4gCj4g
PiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIw
MjEgMTM6MDU6MjkKPiA+ICswMDAwOgo+ID4gICAKPiA+PiBJbiBPY3RhbCBEVFIgU1BJIG1vZGUs
IDIgYnl0ZXMgb2YgZGF0YSBnZXRzIHRyYW5zbWl0dGVkIG92ZXIgb25lIGNsb2NrCj4gPj4gY3lj
bGUsIGFuZCBoYWxmLWN5Y2xlIGluc3RydWN0aW9uIHBoYXNlcyBhcmVuJ3Qgc3VwcG9ydGVkIHll
dC4gU28sCj4gPj4gZXZlcnkgRFRSIHNwaV9tZW1fb3AgbmVlZHMgdG8gaGF2ZSBldmVuIG5ieXRl
cyBpbiBhbGwgcGhhc2VzIGZvcgo+ID4+IG5vbi1lcnJhdGljIGJlaGF2aW91ciBmcm9tIHRoZSBT
UEkgY29udHJvbGxlci4KPiA+Pgo+ID4+IFRoZSBvZGQgbGVuZ3RoIGNtZCBhbmQgZHVtbXkgcGhh
c2VzIGdldCBoYW5kbGVkIGJ5IHNwaW1lbV9zZXR1cF9vcCgpCj4gPj4gYnV0IHRoZSBvZGQgbGVu
Z3RoIGFkZHJlc3MgYW5kIGRhdGEgcGhhc2VzIG5lZWQgdG8gYmUgaGFuZGxlZCBhY2NvcmRpbmcK
PiA+PiB0byB0aGUgdXNlIGNhc2UuIEZvciBleGFtcGxlIGluIE9jdGFsIERUUiBtb2RlLCByZWFk
IHJlZ2lzdGVyIG9wZXJhdGlvbgo+ID4+IGhhcyBvbmUgYnl0ZSBsb25nIGFkZHJlc3MgYW5kIGRh
dGEgcGhhc2UuIFNvIGl0IG5lZWRzIHRvIGV4dGVuZCBpdAo+ID4+IGJ5IGFkZGluZyBhIHN1aXRh
YmxlIGV4dHJhIGJ5dGUgaW4gYWRkciBhbmQgcmVhZGluZyAyIGJ5dGVzIG9mIGRhdGEsCj4gPj4g
ZGlzY2FyZGluZyB0aGUgc2Vjb25kIGJ5dGUuCj4gPj4KPiA+PiBIYW5kbGUgYWRkcmVzcyBhbmQg
ZGF0YSBwaGFzZXMgZm9yIE9jdGFsIERUUiBtb2RlIGluIHJlYWQvd3JpdGUKPiA+PiByZWdpc3Rl
ciBhbmQgd3JpdGUgdm9sYXRpbGUgY29uZmlndXJhdGlvbiByZWdpc3RlciBvcGVyYXRpb25zCj4g
Pj4gYnkgYWRkaW5nIGEgc3VpdGFibGUgZXh0cmEgYnl0ZSBpbiB0aGUgYWRkcmVzcyBhbmQgZGF0
YSBwaGFzZS4KPiA+Pgo+ID4+IENyZWF0ZSBzcGltZW1fc2V0dXBfcmVnX29wKCkgaGVscGVyIGZ1
bmN0aW9uIHRvIGVhc2Ugc2V0dGluZyB1cAo+ID4+IHJlYWQvd3JpdGUgcmVnaXN0ZXIgb3BlcmF0
aW9ucyBpbiBvdGhlciBmdW5jdGlvbnMsIGUuZy4gd2FpdCgpLgo+ID4+Cj4gPj4gU2lnbmVkLW9m
Zi1ieTogQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPgo+ID4+IC0tLQo+ID4+ICAgZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
PiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+IGluZGV4IDJlNTlmYWVjYzhmNS4uYTUzMzRhZDM0
Zjk2IDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+ID4+IEBAIC02NSwxMiArNjUsMjcgQEAg
c3RhdGljIHZvaWQgc3BpbmFuZF9zZXR1cF9vcChjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQsCj4gPj4gICAJfQo+ID4+ICAgfSAgCj4gPj4gICA+PiArc3RhdGljIHZvaWQgc3Bp
bmFuZF9zZXR1cF9yZWdfb3AoY29uc3Qgc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCAg
Cj4gPj4gKwkJCQkgc3RydWN0IHNwaV9tZW1fb3AgKm9wKSAgCj4gPiAKPiA+IFNhbWUgcmVtYXJr
IGFib3V0IHRoZSBuYW1pbmcuIEluIGZhY3QgSSBiZWxpZXZlIHdlIGNvdWxkIGhhdmUgdGhpcwo+
ID4gbG9naWMgaW4gX3NldHVwX29wKCkgKG9yIHdoYXRldmVyIGl0cyBuYW1lKSBhbmQgYWRkIGEg
c3BlY2lmaWMKPiA+IHBhcmFtZXRlciBmb3IgaXQ/Cj4gPiAgIAo+IAo+IE9rYXksIEkgd2lsbCBh
ZGQgYSBwYXJhbWV0ZXIgaW4gYXJndW1lbnQgYW5kIGluY2x1ZGUgdGhpcyBsb2dpYyBpbiBfc2V0
dXBfb3AoKS4KPiAKPiA+PiArewo+ID4+ICsJaWYgKHNwaW5hbmQtPnJlZ19wcm90byA9PSBTUElO
QU5EX09DVEFMX0RUUikgewo+ID4+ICsJCS8qCj4gPj4gKwkJICogQXNzaWduaW5nIHNhbWUgZmly
c3QgYW5kIHNlY29uZCBieXRlIHdpbGwgcmVzdWx0IGluIGNvbnN0YW50Cj4gPj4gKwkJICogYml0
cyBvbiB0aHMgU1BJIGJ1cyBiZXR3ZWVuIHBvc2l0aXZlIGFuZCBuZWdhdGl2ZSBjbG9jayBlZGdl
cyAgCj4gPiAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aGUKPiA+ICAgCj4gCj4g
T2suCj4gCj4gPj4gKwkJICovCj4gPj4gKwkJb3AtPmFkZHIudmFsID0gKG9wLT5hZGRyLnZhbCA8
PCA4KSB8IG9wLT5hZGRyLnZhbDsgIAo+ID4gCj4gPiBJIGFtIG5vdCBzdXJlIHRvIHVuZGVyc3Rh
bmQgd2hhdCB5b3UgZG8gaGVyZT8KPiA+ICAgCj4gCj4gSW4gT2N0YWwgRFRSIG1vZGUsIDIgYnl0
ZXMgb2YgZGF0YSBhcmUgc2VudCBpbiBhIGNsb2NrIGN5Y2xlLiBTbywgd2UgbmVlZCB0byBhcHBl
bmQgb25lIGV4dHJhIGJ5dGUgd2hlbiBzZW5kaW5nIGEgc2luZ2xlIGJ5dGUuIFRoaXMgZXh0cmEg
Ynl0ZSB3b3VsZCBiZSBzZW50IG9uIHRoZSBuZWdhdGl2ZSBlZGdlLgo+IAo+IEl0IHdpbGwgbWFr
ZSBzZW5zZSB0byBrZWVwIGJvdGggdGhlIGJ5dGVzIHNhbWUsIGFzIHdoZW4gaXQgd2lsbCBiZSBz
ZXQgb24gdGhlIFNQSSBwaW5zLCB0aGUgYml0cyBvbiB0aGUgU1BJIElPIHBvcnRzIHdpbGwgcmVt
YWluIGNvbnN0YW50IGJldHdlZW4gdGhlIHBvc2l0aXZlIGFuZCBuZWdhdGl2ZSBlZGdlcyAoYXMg
MSBjb21wbGV0ZSBieXRlIGlzIHNldCBpbiBvbmUgY2xvY2sgZWRnZSBpbiBNU0Igb3JkZXIpLiBU
aGVyZSBhcmUgbm8gcmVzdHJpY3Rpb25zIGJ5IHRoZSBtYW51ZmFjdHVyZXJzIG9uIHRoaXMsIHRo
ZSByZWxldmFudCBhZGRyZXNzIGJ5dGUgbmVlZHMgdG8gYmUgb24gcG9zaXRpdmUgZWRnZSBhbmQg
c2Vjb25kIGJ5dGUgb24gbmVnYXRpdmUgZWRnZSBpcyBkb24ndCBjYXJlLgoKSSB3YXMgYm90aGVy
ZWQgYnkgdGhlIHNoaWZ0IGJ1dCBhY3R1YWxseSBteSBoZWFkIHdhcyBtaXhpbmcgd2l0aCB0aGUK
cmF3IE5BTkQgY29yZSB3aGVyZSB0aGVzZSBhZGRyZXNzZXMgYXJlIGluIGFuIGFycmF5IGJ1dCBo
ZXJlIGl0IGlzIGEKdTY0IHdoaWNoIGlzIHRoZW4gZmluZS4KCihJIHdpbGwgY29udGludWUgYW5z
d2VyaW5nIHByb2JhYmx5IG5leHQgd2VlaykKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
