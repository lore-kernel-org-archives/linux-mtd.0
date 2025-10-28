Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E51CCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 07:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tWha1JhiHK+6Qf/jE7y//VaYYFl4/QDxUq05FOHHFuk=; b=0s/0M2KWyT79l9
	xxesLBRVIh7Ij6CEzUSFEwZpZ/r7EauKmdRxWPN5dr3O5jnO43EcD6nDf0TUz5FfEMPIWO4iH6iWq
	l+sKHlfuj1gIta6jRAhwtWs/UCBTuie97/nnRgvehBUv8QnlPB5lhMREQODjqAc3p2g3HJzE2Z97g
	UjLBHKQdoA1gujSEVyFfdY86J7YvJuxYEHbWWptmYmWRBuOJGgMM4HH+qyGNlCtvjiT+copFZ59c0
	7bxy1hiuGIhy9dVroZywltEb0n6xwMLqWlfyw7fmYBnLYDW8apuETW04GNkvZQCLzJMJijVbNVSzt
	seULb2AIcSmjhjhv2K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFS-0000000FQPa-25lz;
	Tue, 28 Oct 2025 07:36:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFP-0000000FQOF-0FV1
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 07:36:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C42964E41390;
	Tue, 28 Oct 2025 07:36:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FF69606AB;
	Tue, 28 Oct 2025 07:36:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AE70102F2511;
	Tue, 28 Oct 2025 08:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636959; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kS+v7UxhH3NIRfcFBUgh9cjGXshVr2JyUKKPIyxO3A0=;
	b=e628aea8rtzS7HMfOueonC377QxRQ8Kym+dGULqdTzFtYF6atHkETnXomz5YoWuTMq0eZL
	tk41px3Vj9dCl5lttpveLS1T9Q2/ex3MRuF8np9QSc/c+A9P5aNZz/Re0fWt8f+B36M0e7
	J1o0Sp0TEOEePjWxBdfjfn0xAVd9kOSOVRcMUIm2OoSVUSBYtno7/CD/b0dG+IUyvV5Yig
	Qi7vLyjP5a9K5eNSwSSrzOTkw7XyTB26L0hlYFwgLK7kXgKRXP0kJgu0ZJkpd/Gk9NhVOw
	RywNA517kYC0l8fZRxpXa++PSHGtQB7fomey5bqpUgapWnGYV3di6OcciGdEQg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 00/16] Introduce Allwinner H6/H616 NAND controller support
Date: Tue, 28 Oct 2025 08:34:53 +0100
Message-ID: <20251028073534.526992-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_003604_117821_976D74B2 
X-CRM114-Status: GOOD (  16.88  )
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

SGkgZXZlcnlvbmUsCgpUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2UgSDYvSDYxNiBOQU5EIGNv
bnRyb2xsZXIgc3VwcG9ydCAoYnV0IG5vdCB5ZXQKdGhlIERNQS9NRE1BIHBhcnQpLgoKQWxsIHRo
ZSB3b3JrIHdhcyBkb25lIG9uIGEgSDYxNiBib2FyZCB3aXRoIGEgS2lveGlhIFRDNThOVkcxUzNI
VEEwMCBOQU5ECmNoaXAuCkVDQyBpcyBzdXBwb3J0ZWQsIGFzIHdlbGwgYXMgc2NyYW1ibGluZy4K
Ckg2IFNvQyBoYXMgbm90IGJlZW4gdGVzdGVkLCBidXQgaXQgc2hhcmVzIGFsbCByZWdpc3RlcnMg
d2l0aCBINjE2LCBwbHVzCnNvbWUgcmVnaXN0ZXJzIGRlZGljYXRlZCB0byBFbWJlZGRlZCBDcnlw
dG8gRW5naW5lIHRoYXQgSDYxNiBsYWNrcy4KClRoaXMgSVAgaGFzIHF1aXRlIHNvbWUgcmVnaXN0
ZXIgZmllbGRzIG1vZGlmaWVkIGZyb20gdGhlIEExMC9BMjMsIGJ1dCBpbgp0aGUgZW5kLCBpdCB3
b3JrcyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUuCk1haW4gZGlmZmVyZW5jZXMgd2l0aCBBMTAvQTIz
IGFyZToKLSBUaGUgbmVlZCBmb3IgMiBtb3JlIGNsb2NrcyAoZm9yIEVDQyBhbmQgTUJVUykKLSBU
aGUgdXNlIG9mIGEgbmV3IFVTRVJfREFUQV9MRU4gcmVnaXN0ZXIKLSBNb3JlIEVDQyBzdHJlbmd0
aHMgKDQ0LCA1MiwgNjgsIDcyLCA3NiBhbmQgODAgYml0cyAvIDFLQikKLSBNRE1BIGJhc2VkIG9u
IGNoYWluZWQgYnVmZmVycwotIHNvbWUgcmVnaXN0ZXJzIGxheW91dHMgaGF2ZSBjaGFuZ2VkICht
YWlubHkgZHVlIGRvIHRoZSBzdHJvbmdlciBFQ0MpCgpQYXRjaCAxIGludHJvZHVjZXMgYWxsd2lu
bmVyLHN1bjUwaS1oNjE2LW5hbmQtY29udHJvbGxlciBjb21wYXRpYmxlCmluIG9yZGVyIHRvIGRp
ZmZlcmVudGlhdGUgZnJvbSB0aGUgQTEwIGFuZCBBMjMuCgpQYXRjaCAyIHJlbW92ZXMgYSBzdXBl
cmZsdW91cyBjYWxsLCBhbmQgaXMgaW5kZXBlbmRlbnQgZnJvbSB0aGUgb3RoZXJzLgoKUGF0Y2gg
MyByZXBsYWNlcyB0aGUgaGFyZCBjb2RlZCB2YWx1ZSAnNCcgdXNlZCBmb3IgdXNlciBkYXRhIGxl
bmd0aCBieQphIG1vcmUgbWVhbmluZ2Z1bCBkZWZpbmUKClBhdGNoZXMgNC0xNCBhcmUgcGF2aW5n
IHRoZSB3YXkgdG8gdGhlIGludHJvZHVjdGlvbiBvZiBINjE2IE5BTkQKY29udHJvbGxlciBzdXBw
b3J0LgpUaGV5IGFyZSBzbWFsbCwgd2l0aG91dCBmdW5jdGlvbmFsIGNoYW5nZSBhbmQgZWFzaWVy
IHRvIHJldmlldyB0aGFuIGEKYmlnIHBhdGNoLgpUaGV5IG1vdmUgYSBmaXhlZCB2YWx1ZSAocmVn
aXN0ZXIgb2Zmc2V0LCBmaWVsZCBtYXNrLCBTUkFNIHNpemUpIGludG8KdGhlIHN0cnVjdCBzdW54
aV9uZmNfY2FwcyB3aGVuIHRoaXMgdmFsdWUgaXMgZGlmZmVyZW50IG9uIEg2L0g2MTYuCgpQYXRj
aCAxNSBpbnRyb2R1Y2VzIHRoZSBzdXBwb3J0IGZvciBINi9INjE2IE5BTkQgY29udHJvbGxlci4K
ClBhdGNoIDE2IGFkZHMgdGhlIE5BTkQgY29udHJvbGxlciBub2RlIHRvIHN1bjUwaS1oNjE2LmR0
c2kKCkNoYW5nZXMgZnJvbSB2MzoKLSBmaXggcGF0Y2hlcyBvcmRlciBieSBiZWdpbm5pbmcgd2l0
aCBiaW5kaW5nIHBhdGNoIGFuZCBmaW5pc2hpbmcgd2l0aAogIGR0cyBwYXRjaAotIGFkZCBhIHBh
dGNoIHRvIHJlcGxhY2UgdXNlciBkYXRhIGxlbmd0aCBoYXJkIGNvZGVkIHZhbHVlIGJ5IGEgZGVm
aW5lCiAgYXMgc3VnZ2VzdGVkIGJ5IE1pcXXDqGwKLSB1bi1icmVhayBhIGxpbmUgaW4gcGF0Y2gg
NSBhcyBzdWdnZXN0ZWQgYnkgTWlxdcOobAotIHVwZGF0ZSBHZWVydCdzIHNlcmllcyBsaW5rIHRv
IHY1Ci0gdXBkYXRlIHBhdGNoIDggY29tbWl0IG1lc3NhZ2Ugd2l0aCBhIG1lbnRpb24gdG8gR2Vl
cnQncyBzZXJpZXMKLSBhZGRyZXNzIE1pcXXDqGwgcmVtYXJrcyBvbiBwYXRjaCAxNToKICAtIGNo
YW5nZSAvLyB0byAvKiAqLwogIC0gcmVtb3ZlIHN0YXRpY3Mgc2V0IHRvIGZhbHNlCgpDaGFuZ2Vz
IGZyb20gdjI6Ci0gYWRkIG1pc3NpbmcgJ3N0YXR1cyA9ICJkaXNhYmxlZCI7JyBpbiBuYW5kIGNv
bnRyb2xsZXIgbm9kZS4KLSBmYWN0b3JpemUgYmFjayBjbG9jay9jbG9jay1uYW1lcyBpbiBiaW5k
aW5nLgotIHBpY2stdXAgcmV2aWV3ZWQtYnkKCkNoYW5nZXMgZnJvbSB2MToKLSByZW9yZGVyIHBh
dGNoZXMgdG8gaGF2ZSBkdHNpL2JpbmRpbmdzIHBhdGNoZXMgYXQgdGhlIGVuZC4KLSByZW9yZGVy
IG5hbmQtY29udHJvbGxlciBhbmQgcGlucyBub2RlcyB0byByZXNwZWN0IHRoZSBvcmRlci4KLSBh
ZGQgL29taXQtaWYtbm8tcmVmLyBvbiBwaW5zIHRoYXQgbWF5IGJlIHVudXNlZC4KLSByZW1vdmUg
cGluY3RybCBmcm9tIG5hbmQgY29udHJvbGxlciBub2RlICh0aGlzIHNob3VsZCBiZSBhZGRlZCB0
byBkZXZpY2UKIERUKS4KLSByZXdvcmsgZHQgYmluZGluZy4KLSBmaXggSDYxNiBjb21tZW50IG9u
IGNoYWluZWQgZGVzY3JpcHRvcnMgc3VwcG9ydC4KLSBhZGQgbWlzc2luZyBtYnVzX2NsayBkZXNj
cmlwdGlvbi4KLSBtYWtlIEVDQyBjbG9jayBtYW5kYXRvcnkgZm9yIEg2IChiZWNhdXNlIGl0J3Mg
aW5kZWVkIG1hbmRhdG9yeSkuCi0gaGFybW9uaXplIG5ldyBjbG9jayByZXRyaWV2aW5nIGVycm9y
IG1lc3NhZ2VzIHdpdGggb2xkZXIgb25lcy4KLSBoYXJtb25pemUgY29tbWl0cyBzdWJqZWN0cyAo
bXRkOiByYXduYW5kOiBzdW54aSkuCi0gcmV3b3JkIGNvbW1pdCBtZXNzYWdlcyB0byB1c2UgaW1w
ZXJhdGl2ZSBtb29kLgotIHBpY2stdXAgcmV2aWV3ZWQtYnkKClRoYW5rcyBLcnp5c3p0b2YsIEpl
cm5laiwgQ2hlbi1ZdSBhbmQgTWlxdcOobCBmb3IgdGhlIHJldmlld3MhCgpSZWdhcmRzLApSaWNo
YXJkCgpSaWNoYXJkIEdlbm91ZCAoMTYpOgogIGR0LWJpbmRpbmdzOiBtdGQ6IHN1bnhpOiBBZGQg
SDYxNiBjb21wYXRpYmxlCiAgbXRkOiByYXduYW5kOiBzdW54aTogUmVtb3ZlIHN1cGVyZmx1b3Vz
IHJlZ2lzdGVyIHJlYWRpbmdzCiAgbXRkOiByYXduYW5kOiBzdW54aTogUmVwbGFjZSBoYXJkIGNv
ZGVkIHZhbHVlIGJ5IGEgZGVmaW5lCiAgbXRkOiByYXduYW5kOiBzdW54aTogbW92ZSBFQ0Mgc3Ry
ZW5naHRzIGluIHN1bnhpX25mY19jYXBzCiAgbXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNl
IHJlZ19lY2NfZXJyX2NudCBpbiBzdW54aV9uZmNfY2FwcwogIG10ZDogcmF3bmFuZDogc3VueGk6
IGludHJvZHVjZSByZWdfdXNlcl9kYXRhIGluIHN1bnhpX25mY19jYXBzCiAgbXRkOiByYXduYW5k
OiBzdW54aTogcmV3b3JrIHBhdHRlcm4gZm91bmQgcmVnaXN0ZXJzCiAgbXRkOiByYXduYW5kOiBz
dW54aTogYWRkIGhhc19lY2NfYmxvY2tfNTEyIGNhcGFiaWxpdHkKICBtdGQ6IHJhd25hbmQ6IHN1
bnhpOiBpbnRyb2R1Y2UgZWNjX21vZGVfbWFzayBpbiBzdW54aV9uZmNfY2FwcwogIG10ZDogcmF3
bmFuZDogc3VueGk6IGludHJvZHVjZSByYW5kb20gZW4vZGlyIGluIHN1bnhpX25mY19jYXBzCiAg
bXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNlIHJlZ19wYXRfaWQgaW4gc3VueGlfbmZjX2Nh
cHMKICBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBpbnRyb2R1Y2UgcmVnX3NwYXJlX2FyZWEgaW4gc3Vu
eGlfbmZjX2NhcHMKICBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBpbnRyb2R1Y2UgZWNjX2Vycl9tYXNr
IGluIHN1bnhpX25mY19jYXBzCiAgbXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNlIHNyYW1f
c2l6ZSBpbiBzdW54aV9uZmNfY2FwcwogIG10ZDogcmF3bmFuZDogc3VueGk6IEFkZCBzdXBwb3J0
IGZvciBINjE2IG5hbmQgY29udHJvbGxlcgogIGFybTY0OiBkdHM6IGFsbHdpbm5lcjogaDYxNjog
YWRkIE5BTkQgY29udHJvbGxlcgoKIC4uLi9tdGQvYWxsd2lubmVyLHN1bjRpLWExMC1uYW5kLnlh
bWwgICAgICAgICB8ICA0MSArLQogLi4uL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
aDYxNi5kdHNpIHwgIDUyICsrKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jICAg
ICAgICAgICAgIHwgNDA3ICsrKysrKysrKysrKysrKy0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0MjYg
aW5zZXJ0aW9ucygrKSwgNzQgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDNhODY2MDg3ODgz
OWZhYWRiNGYxYTZkZDcyYzMxNzljMWRmNTY3ODcKLS0gCjIuNDcuMwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
