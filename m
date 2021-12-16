Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C45C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KfZP2rs2DPihbU8+uoAQ9kcSpsO85TrCzGYwcTs/9E=; b=x5sH45E1Zmp9UY
	MYkWCioVL4RvJzbqDdGHPBhuG33kTnk4Acaa9eBznRCf9ZAGYtZWlGQ8I+1dWjcmGQ1FIVkhQJAvy
	Si8JhVeK8vUGh5Sgn25bEydrNZTeO2Xcp4XSWtqPXRiWCUIxQXXg/l9UWXFw/yWS8M5fctpRSx8Ck
	8zVsGg/U2qssP2eufd9OQepc6pzqC5JjKsjyMZ8FvLIUoBeOtv4N0KvxXLii9sHYfi56G3XXvbYrO
	6KTc9CaFr21AhsIcAqWtontjXR0SKNE7pAwNF9QV1f3cphSAQuzsELmGpKlISTEeGFqBXn37EddlI
	Ffmb9bbx/2b3FciFD5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxnwf-004qRv-Vd; Thu, 16 Dec 2021 10:25:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxnwb-004qQK-Mq
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 10:25:03 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D266A1F41E40;
 Thu, 16 Dec 2021 10:24:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639650300; bh=WfVkgDjDGwRztrZPRyO30Ci5s7IG2KmALynZrqky/VY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cCaFCaJbCmAQJnSsRH4HWATLh+qEdsuTTWvjeE6kubudTxIl/iTKsymGQD6ol7QFv
 a0aB6uBaSe8HzzybkymJRv2yxBbOJWtPgTQ23N8455XgFNkgnTHne8WYIvd5dKdWqW
 fhgLYqLPPUXcEo7i3rruKI4+grz8HgLI4SiuPNUl9l9YS/JQA7kU4qo9xNOch5j2Vl
 i/b21bdEsh/pIdKjbRwLQlAUdibHEz5dWz+7Qrfw15FqwUihCsbw1ceNT7LMjDdgpy
 ENT/FGAfv3WjY/sotHtAt3SzBFbqh1A0onLwZRyaShpKYYmtBlQ3E/eRVneNHNWZr4
 /Fv6+S19ydHUA==
Date: Thu, 16 Dec 2021 11:24:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mtdchar: add MEMREAD ioctl
Message-ID: <20211216112456.327298dd@collabora.com>
In-Reply-To: <20211216083418.13512-1-kernel@kempniu.pl>
References: <20211216083418.13512-1-kernel@kempniu.pl>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_022501_959793_4C3F0BDC 
X-CRM114-Status: GOOD (  20.00  )
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

T24gVGh1LCAxNiBEZWMgMjAyMSAwOTozNDoxMyArMDEwMApNaWNoYcWCIEvEmXBpZcWEIDxrZXJu
ZWxAa2VtcG5pdS5wbD4gd3JvdGU6Cgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgYSBuZXcgbXRk
Y2hhciBpb2N0bCwgTUVNUkVBRC4gIEl0cyBwdXJwb3NlIGlzIHRvCj4gc2VydmUgYXMgYSByZWFk
IGNvdW50ZXJwYXJ0IG9mIHRoZSBNRU1XUklURSBpb2N0bCwgZXhwb3NpbmcgYSBicm9hZGVyCj4g
c2V0IG9mIGNhcGFiaWxpdGllcyBmb3IgcmVhZCBvcGVyYXRpb25zIChlLmcuIHVzZSBvZiBNVERf
T1BTX0FVVE9fT09CLAo+IGFjY2VzcyB0byBFQ0Mgc3RhdGlzdGljcykgdG8gdXNlci1zcGFjZSBh
cHBsaWNhdGlvbnMgbWFraW5nIHVzZSBvZiBNVEQKPiBkZXZpY2VzIHZpYSAvZGV2L210ZCogY2hh
cmFjdGVyIGRldmljZXMuCj4gCj4gQ2hhbmdlcyBmcm9tIHYxOgo+IAo+ICAgLSBBZGRlZCBwYXRj
aGVzIDItNSB3aGljaCBlbmFibGUgdGhlIG5ldyBNRU1SRUFEIGlvY3RsIHRvIHJlcG9ydCBFQ0MK
PiAgICAgc3RhdGlzdGljcyBmb3IgdGhlIHJlYWQgb3BlcmF0aW9uIGJhY2sgdG8gdXNlciBzcGFj
ZS4gIChUaGVyZSBhcmUKPiAgICAgb2J2aW91c2x5IGRpZmZlcmVudCB3YXlzIHRoZXNlIGNoYW5n
ZXMgY2FuIGJlIHNwbGl0IHVwIGludG8gc2VwYXJhdGUKPiAgICAgY29tbWl0czsgSSB3YXMgYWlt
aW5nIGZvciBtYXhpbXVtIGVhc2Ugb2YgcmV2aWV3LikKPiAKPiAgIC0gVGhlICdyZXRsZW4nIGFu
ZCAnb29icmV0bGVuJyBmaWVsZHMgd2VyZSBub3Qgc2V0IGluIHRoZSBzdHJ1Y3QKPiAgICAgbXRk
X3JlYWRfcmVxIHJldHVybmVkIHRvIHVzZXJzcGFjZS4gIFRoaXMgd2FzIGRvbmUgcHJvcGVybHkg
aW4KPiAgICAgQm9yaXMnIG9yaWdpbmFsIGRyYWZ0IHBhdGNoIFsxXSwgYnV0IEkgbWlzc2VkIGl0
IGluIG15IHYxLgo+IAo+ICAgLSBJbnZhbGlkIElTX0VSUigpIGNoZWNrcyB3ZXJlIHJlcGxhY2Vk
IHdpdGggTlVMTCBjaGVja3MuICBUaGlzIHdhcyBhbgo+ICAgICBhcnRpZmFjdCBvZiBjb3B5LXBh
c3RpbmcgbXRkY2hhcl93cml0ZV9pb2N0bCgpIGluIHYxOiB1bmxpa2UKPiAgICAgbWVtZHVwX3Vz
ZXIoKSB1c2VkIHRoZXJlaW4sIGttYWxsb2MoKSBhbHdheXMgcmV0dXJucyBOVUxMIG9uIGVycm9y
Lgo+IAo+ICAgLSBNaW5vciBzdWJqZWN0IHByZWZpeCBhZGp1c3RtZW50IGZvciBwYXRjaCAxLzUg
KCJtdGQiIC0+ICJtdGRjaGFyIikuCj4gCj4gWzFdIGh0dHBzOi8vd3d3LmluZnJhZGVhZC5vcmcv
cGlwZXJtYWlsL2xpbnV4LW10ZC8yMDE2LUFwcmlsLzA2NzE4Ny5odG1sCj4gCj4gTWljaGHFgiBL
xJlwaWXFhCAoNSk6Cj4gICBtdGRjaGFyOiBhZGQgTUVNUkVBRCBpb2N0bAo+ICAgbXRkOiB0cmFj
ayBtYXhpbXVtIG51bWJlciBvZiBiaXRmbGlwcyBmb3IgZWFjaCByZWFkIHJlcXVlc3QKPiAgIG10
ZDogYWx3YXlzIGluaXRpYWxpemUgJ3N0YXRzJyBpbiBzdHJ1Y3QgbXRkX29vYl9vcHMKPiAgIG10
ZDogYWRkIEVDQyBlcnJvciBhY2NvdW50aW5nIGZvciBlYWNoIHJlYWQgcmVxdWVzdAo+ICAgbXRk
Y2hhcjogZXh0ZW5kIE1FTVJFQUQgaW9jdGwgdG8gcmV0dXJuIEVDQyBzdGF0aXN0aWNzCgpTcGxp
dHRpbmcgcGF0Y2ggMSBhbmQgNSBtZWFucyB5b3UgaGF2ZSBhbiBpbmNvbXBhdGlibGUgQUJJIGNo
YW5nZQpiZXR3ZWVuIHRob3NlIDIgY29tbWl0cywgdGh1cyBicmVha2luZyBiaXNlY3RhYmlsaXR5
LiBJJ2QgcmVjb21tZW5kCnB1dHRpbmcgcGF0Y2hlcyAyLTQgZmlyc3QgYW5kIHNxdWFzaGluZyBw
YXRjaCAxIGFuZCA1IGluIGEgc2luZ2xlCmNvbW1pdCBwbGFjZWQgYXQgdGhlIGVuZCBvZiB0aGUg
c2VyaWVzLiBUaGUgb3RoZXIgb3B0aW9ucyB3b3VsZCBiZSB0bwphZGQgYSB3YXkgdG8gZXh0ZW5k
IGlvY3RscyBpbiBhIGJhY2t3YXJkIGNvbXBhdGlibGUgd2F5ICh0aGUgRFJNCnN1YnN5c3RlbSBk
b2VzIHRoYXQgYnkgZmlsbGluZyB0aGUgdW5zcGVjaWZpZWQgcGFydCBvZiB0aGUgc3RydWN0IHdp
dGgKemVyb3MsIGFuZCByZWx5aW5nIG9uIHRoZSBmYWN0IHRoYXQgMCB2YWx1ZXMgYWx3YXlzIGlt
cGxpZXMgJ2RlZmF1bHQKYmVoYXZpb3InIHdoZW4gdGhlIHN0cnVjdCBpcyBleHRlbmRlZCBbMV0p
LgoKWzFdaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTYtcmM1L3NvdXJjZS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMjTDg4MgoKPiAKPiAgZHJpdmVycy9tdGQvZGV2aWNl
cy9kb2NnMy5jICAgICAgICAgICAgIHwgICA4ICsrCj4gIGRyaXZlcnMvbXRkL2luZnRsY29yZS5j
ICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL210ZC9tdGRjaGFyLmMgICAgICAg
ICAgICAgICAgICAgfCAxMzYgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvbXRk
L210ZGNvcmUuYyAgICAgICAgICAgICAgICAgICB8ICAgNSArCj4gIGRyaXZlcnMvbXRkL210ZHN3
YXAuYyAgICAgICAgICAgICAgICAgICB8ICAgNiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL29uZW5h
bmQvb25lbmFuZF9iYXNlLmMgfCAgMTYgKystCj4gIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9v
bmVuYW5kX2JidC5jICB8ICAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
YyAgICAgICAgfCAgMTAgKysKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYnQuYyAgICAg
ICAgIHwgICA4ICstCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3NtX2NvbW1vbi5jICAgICAgICB8
ICAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICAgICAgICAgICAgfCAgMTAg
KysKPiAgZHJpdmVycy9tdGQvbmZ0bGNvcmUuYyAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4g
IGRyaXZlcnMvbXRkL3NtX2Z0bC5jICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBkcml2
ZXJzL210ZC9zc2ZkYy5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9t
dGQvdGVzdHMvbmFuZGJpdGVycnMuYyAgICAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvbXRkL3Rl
c3RzL29vYnRlc3QuYyAgICAgICAgICAgICB8ICAgOCArLQo+ICBkcml2ZXJzL210ZC90ZXN0cy9y
ZWFkdGVzdC5jICAgICAgICAgICAgfCAgIDIgKy0KPiAgZnMvamZmczIvd2J1Zi5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA2ICstCj4gIGluY2x1ZGUvbGludXgvbXRkL210ZC5oICAgICAg
ICAgICAgICAgICB8ICAgNyArKwo+ICBpbmNsdWRlL3VhcGkvbXRkL210ZC1hYmkuaCAgICAgICAg
ICAgICAgfCAgNjQgKysrKysrKysrKy0KPiAgMjAgZmlsZXMgY2hhbmdlZCwgMjc2IGluc2VydGlv
bnMoKyksIDM0IGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
