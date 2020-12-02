Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4376C64E8A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 08:01:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFBB20872
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 08:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFBB20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oiO5V9Kzj2DaVX16uM+iEf16ExVlLvEa8B8zkT9JXRM=; b=CXhHzVobStcnxPxoHNDczVYYg
	p4oGzDwRizUvELLAm+1LXc1XrvPe7exoFOBdA/hCxIb1Y1KvnsmRHFW3TRtvbleizNpJgMLFxVBiZ
	L78/yfNuT8POXnFABN4IGICg0qmIXMfbGtXuwcIylPkTKqIej1P8sXmHYWdvcBXi40tNE7RJ6nDbo
	xxssoWmTZc7bLGn/ej016PqnJiMbLukOFWkrzhhw8CSBByBROX7a8S9wGIYnuGwUkNsO4SCuT49au
	lN3uYm502wprmKkEsPq9YcKGNAMVN4ks+90IW/yApDNjb7tpSW5E6M3ODfEzP6U5fw97GVQc+nbV1
	EHJhuKS2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkN3Q-000293-TK; Wed, 02 Dec 2020 08:00:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkN3N-00027m-Qs
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 07:59:58 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0FF491C0005;
 Wed,  2 Dec 2020 07:59:50 +0000 (UTC)
Date: Wed, 2 Dec 2020 08:59:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: orion-nand: uncorrectable ECC error on v5.10-rc6
Message-ID: <20201202085948.038efb3e@xps13>
In-Reply-To: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
References: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_025957_987129_9991C35D 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXMsCgpDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28u
bno+IHdyb3RlIG9uIFdlZCwgMiBEZWMKMjAyMCAwNzo0NzozMiArMDAwMDoKCj4gSGksCj4gCj4g
SSd2ZSBqdXN0IGJvb3RlZCB2NS4xMC1yYzYgb24gYSBraXJrd29vZCBiYXNlZCBib2FyZCAod2hp
Y2ggdXNlcyB0aGUgCj4gb3Jpb24tbmFuZCBkcml2ZXIpIGFuZCBJIGdldCB0aGUgZm9sbG93aW5n
IGVycm9ycyByZXBvcnRlZC4gSSBoYXZlbid0IAo+IHN0YXJ0ZWQgYmlzZWN0aW5nIHlldCBidXQg
djUuNy4xOSBtb3VudHMgdGhlIG5hbmQgZmxhc2ggd2l0aG91dCBhbnkgaXNzdWUuCj4gCj4gdWJp
MDogYXR0YWNoaW5nIG10ZDAKPiBfX25hbmRfY29ycmVjdF9kYXRhOiB1bmNvcnJlY3RhYmxlIEVD
QyBlcnJvcgo+IHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9y
KSB3aGlsZSByZWFkaW5nIDY0IGJ5dGVzIAo+IGZyb20gUEVCIDA6MCwgcmVhZCBvbmx5IDY0IGJ5
dGVzLCByZXRyeQo+IF9fbmFuZF9jb3JyZWN0X2RhdGE6IHVuY29ycmVjdGFibGUgRUNDIGVycm9y
Cj4gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxl
IHJlYWRpbmcgNjQgYnl0ZXMgCj4gZnJvbSBQRUIgMDowLCByZWFkIG9ubHkgNjQgYnl0ZXMsIHJl
dHJ5Cj4gX19uYW5kX2NvcnJlY3RfZGF0YTogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiB1Ymkw
IHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGlu
ZyA2NCBieXRlcyAKPiBmcm9tIFBFQiAwOjAsIHJlYWQgb25seSA2NCBieXRlcywgcmV0cnkKPiBf
X25hbmRfY29ycmVjdF9kYXRhOiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+IHViaTAgZXJyb3I6
IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2NCBieXRl
cyAKPiBmcm9tIFBFQiAwOjAsIHJlYWQgNjQgYnl0ZXMKPiBDUFU6IDAgUElEOiAxMDEgQ29tbTog
dWJpYXR0YWNoIE5vdCB0YWludGVkIDUuMTAuMC1yYzYrICMxCj4gSGFyZHdhcmUgbmFtZTogTWFy
dmVsbCBLaXJrd29vZCAoRmxhdHRlbmVkIERldmljZSBUcmVlKQo+IFs8ODAxMGNhNjQ+XSAodW53
aW5kX2JhY2t0cmFjZSkgZnJvbSBbPDgwMTA5YmQwPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQo+
IFs8ODAxMDliZDA+XSAoc2hvd19zdGFjaykgZnJvbSBbPDgwNDVmMTBjPl0gKHViaV9pb19yZWFk
KzB4MTg0LzB4MzA0KQo+IFs8ODA0NWYxMGM+XSAodWJpX2lvX3JlYWQpIGZyb20gWzw4MDQ1ZjRh
Yz5dICh1YmlfaW9fcmVhZF9lY19oZHIrMHg0NC8weDI0MCkKPiBbPDgwNDVmNGFjPl0gKHViaV9p
b19yZWFkX2VjX2hkcikgZnJvbSBbPDgwNDY0ZGIwPl0gCj4gKHViaV9hdHRhY2grMHgxNzgvMHgx
NWZjKQo+IFs8ODA0NjRkYjA+XSAodWJpX2F0dGFjaCkgZnJvbSBbPDgwNDU4ZDhjPl0gKHViaV9h
dHRhY2hfbXRkX2RldisweDUzOC8weGI0OCkKPiBbPDgwNDU4ZDhjPl0gKHViaV9hdHRhY2hfbXRk
X2RldikgZnJvbSBbPDgwNDVhMTE0Pl0gCj4gKGN0cmxfY2Rldl9pb2N0bCsweDE3MC8weDFlMCkK
PiBbPDgwNDVhMTE0Pl0gKGN0cmxfY2Rldl9pb2N0bCkgZnJvbSBbPDgwMjAzMDk0Pl0gKHN5c19p
b2N0bCsweDFmOC8weDk5MCkKPiBbPDgwMjAzMDk0Pl0gKHN5c19pb2N0bCkgZnJvbSBbPDgwMTAw
MDYwPl0gKHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4NTApCj4gRXhjZXB0aW9uIHN0YWNrKDB4ODc2
MzNmYTggdG8gMHg4NzYzM2ZmMCkKPiAzZmEwOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAwMDAwMDAwMyA3ZTliMGMzMCAwMDAwMDAwMyA0MDE4NmY0MCA3ZTliMGMzMCAKPiAw
MDAwMDAwMAo+IDNmYzA6IDAwMDAwMDAzIDdlOWIwYzMwIDAwMDE0OGY4IDAwMDAwMDM2IDAwMDE0
NzcwIDAwMDEzZjkwIDc2ZjNkZmE0IAo+IDAwMDAwMDAwCj4gM2ZlMDogNzZlOTM2ZjAgN2U5YjBj
MWMgMDAwMTFmNjggNzZlOTM2ZmMKCkkgcmVjZW50bHkgY29udHJpYnV0ZWQgYSBwaWxlIG9mIGZp
eGVzIHRvIGVuc3VyZSBEVCBwYXJzaW5nIHdhcyBub3QKYnJva2VuIGFuZCB0aGlzIGFwcGxpZXMg
dG8gT3Jpb24uIENhbiB5b3UgcGxlYXNlIGNoZWNrCgptdGQ6IHJhd25hbmQ6IG9yaW9uOiBNb3Zl
IHRoZSBFQ0MgaW5pdGlhbGl6YXRpb24gdG8gLT5hdHRhY2hfY2hpcCgpCgpBbmQgdGVsbCBtZSBp
ZiB5b3Ugc2VlIHNvbWV0aGluZyB3cm9uZyB0aGVyZT8gSSBhc3N1bWVkIHRoaXMgZHJpdmVyIHdh
cwpub3Qgc3VwcG9ydGluZyBvbiBob3N0IEVDQyBlbmdpbmVzIGFuZCBvbmx5IHNvZnQgSGFtbWlu
ZyB3YXMgdXNlZCwgaXMKdGhpcyBhc3N1bXB0aW9uIHdyb25nPwoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
