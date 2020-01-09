Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAB3C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:22:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0042067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EzlYil1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0042067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wreunSPJFKJ5G+OTaCe8dni/AAWqx2s9LeWxFd7vnRA=; b=EzlYil1OUiIhND
	KkzK83pdg70Ab8X9FbcaMvPzVGXnwG42SUZxGb9ggSLqwztVDa4i1eKzC7WEE+Fn/wv1UqxPOu3JE
	KNy6PndHQct6glKIEzpdV10c7o59BhwWG22zNFCsQZdoH7k00Wtsr3zYz2sOdBARhXH6e9rmDUlKE
	+8G48Hn6LSEsYc16986dN+SHC+7QZUyWijKI0OZdKr9Xe/X7xv5LDqch5hQV6WC/+BVpAUH9jRG5u
	Pz1Q79egPjswFRhKmZ9WmhOfwYJxCbJbwCobAcDOCFz98d/x0blOjtJ4R/KU3IPKcMcgKV3dG3eAX
	VZMDsyi+XnSmEd8i3fmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipaZv-0000lM-I6; Thu, 09 Jan 2020 16:22:35 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipaO6-0004SD-5C
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:10:24 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3A6C620017;
 Thu,  9 Jan 2020 16:10:15 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:10:14 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 3/3] mtd: rawnand: brcmnand: Add support for flash-edu
 for dma transfers
Message-ID: <20200109171014.527e6d5d@xps13>
In-Reply-To: <20191120182153.29732-3-kdasu.kdev@gmail.com>
References: <20191120182153.29732-1-kdasu.kdev@gmail.com>
 <20191120182153.29732-3-kdasu.kdev@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_081022_522691_4D914CAD 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS2FtYWwsCgpLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gV2Vk
LCAyMCBOb3YgMjAxOSAxMzoyMDo1OQotMDUwMDoKCj4gTGVnYWN5IG1pcHMgc29jIHBsYXRmb3Jt
cyB0aGF0IGhhdmUgY29udHJvbGxlciB2NS4wIGFuZCA2LjAgdXNlCj4gZmxhc2gtZWR1IGJsb2Nr
IGZvciBkbWEgdHJhbnNmZXJzLiBUaGlzIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yCj4gbmFuZCBk
bWEgdHJhbnNmZXJzIHVzaW5nIHRoZSBFRFUgYmxvY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogS2Ft
YWwgRGFzdSA8a2Rhc3Uua2RldkBnbWFpbC5jb20+CgpJIGRvbid0IGhhdmUgdGhlIHBhdGNoIDIv
MyBpbiBteSBtYWlsYm94IDotLyBDYW4geW91IHBsZWFzZSByZXNlbmQgd2l0aAp0aGUgcmlnaHQg
bnVtYmVyaW5nIG9yIENjIG15c2VsZiBvbiB0aGUgMm5kPwoKT3RoZXJ3aXNlLCBtaW5vciBjb21t
ZW50cyBiZWxvdyA6KQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJj
bW5hbmQuYyB8IDI2OSArKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjYzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpbLi4uXQoKPiArLyogZWR1IGlycSAq
Lwo+ICtzdGF0aWMgaXJxcmV0dXJuX3QgYnJjbW5hbmRfZWR1X2lycShpbnQgaXJxLCB2b2lkICpk
YXRhKQo+ICt7Cj4gKwlzdHJ1Y3QgYnJjbW5hbmRfY29udHJvbGxlciAqY3RybCA9IGRhdGE7Cj4g
Kwo+ICsJaWYgKGN0cmwtPmVkdV9jb3VudCkgewo+ICsJCWN0cmwtPmVkdV9jb3VudC0tOwo+ICsJ
CXdoaWxlICghZWR1X3JlYWRsKGN0cmwsIEVEVV9ET05FKSkKPiArCQkJdWRlbGF5KDEpOwo+ICsJ
CWVkdV93cml0ZWwoY3RybCwgRURVX0RPTkUsIDApOwo+ICsJCSh2b2lkKWVkdV9yZWFkbChjdHJs
LCBFRFVfRE9ORSk7CgpXaHkgdGhpcyBjYXN0PyAoYW5kIGFsbCB0aGUgb3RoZXJzKQoKPiArCX0K
PiArCj4gKwlpZiAoY3RybC0+ZWR1X2NvdW50KSB7Cj4gKwkJY3RybC0+ZWR1X2RyYW1fYWRkciAr
PSBGQ19CWVRFUzsKPiArCQljdHJsLT5lZHVfZXh0X2FkZHIgKz0gRkNfQllURVM7Cj4gKwo+ICsJ
CWVkdV93cml0ZWwoY3RybCwgRURVX0RSQU1fQUREUiwgKHUzMiljdHJsLT5lZHVfZHJhbV9hZGRy
KTsKPiArCQkodm9pZCllZHVfcmVhZGwoY3RybCwgRURVX0RSQU1fQUREUik7Cj4gKwkJZWR1X3dy
aXRlbChjdHJsLCBFRFVfRVhUX0FERFIsIGN0cmwtPmVkdV9leHRfYWRkcik7Cj4gKwkJKHZvaWQp
ZWR1X3JlYWRsKGN0cmwsIEVEVV9FWFRfQUREUik7CgpbLi4uXQoKPiAgCj4gQEAgLTI1NjEsNiAr
Mjc2Nyw3IEBAIGludCBicmNtbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LCBzdHJ1Y3QgYnJjbW5hbmRfc29jICpzb2MpCj4gIAo+ICAJaW5pdF9jb21wbGV0aW9uKCZjdHJs
LT5kb25lKTsKPiAgCWluaXRfY29tcGxldGlvbigmY3RybC0+ZG1hX2RvbmUpOwo+ICsJaW5pdF9j
b21wbGV0aW9uKCZjdHJsLT5lZHVfZG9uZSk7Cj4gIAluYW5kX2NvbnRyb2xsZXJfaW5pdCgmY3Ry
bC0+Y29udHJvbGxlcik7Cj4gIAljdHJsLT5jb250cm9sbGVyLm9wcyA9ICZicmNtbmFuZF9jb250
cm9sbGVyX29wczsKPiAgCUlOSVRfTElTVF9IRUFEKCZjdHJsLT5ob3N0X2xpc3QpOwo+IEBAIC0y
NjUwLDYgKzI4NTcsNTYgQEAgaW50IGJyY21uYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYsIHN0cnVjdCBicmNtbmFuZF9zb2MgKnNvYykKPiAgCQlkZXZfaW5mbyhkZXYsICJl
bmFibGluZyBGTEFTSF9ETUFcbiIpOwo+ICAJfQo+ICAKPiArCS8qIHVzZSBFRFUgRE1BIG9ubHkg
bm8gRkxBU0hfRE1BIHByZXNlbnQgKi8KPiArCWlmIChoYXNfZmxhc2hfZG1hKGN0cmwpKQo+ICsJ
CXJlcyA9IDA7Cj4gKwllbHNlCj4gKwkJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFt
ZShwZGV2LCBJT1JFU09VUkNFX01FTSwKPiArCQkJCQkJICAgImZsYXNoLWVkdSIpOwoKQ2FuIHdl
IHNpbXBsaWZ5IHRoaXMgYmxvY2s/Cgo+ICsKPiArCWlmIChyZXMpIHsKCldoYXQgYWJvdXQgYSBk
ZWRpY2F0ZWQgaGVscGVyIHRvIGRvIHRoZSBFRFUgY29uZmlndXJhdGlvbiBvbmx5PwoKPiArCQlj
dHJsLT5lZHVfYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7Cj4gKwkJaWYg
KElTX0VSUihjdHJsLT5lZHVfYmFzZSkpCj4gKwkJCXJldHVybiBQVFJfRVJSKGN0cmwtPmVkdV9i
YXNlKTsKPiArCj4gKwkJY3RybC0+ZWR1X29mZnNldHMgPSBlZHVfcmVnczsKPiArCj4gKwkJZWR1
X3dyaXRlbChjdHJsLCBFRFVfQ09ORklHLCBFRFVfQ09ORklHX01PREVfTkFORCB8Cj4gKwkJCSAg
IEVEVV9DT05GSUdfU1dBUF9DRkcpOwo+ICsJCSh2b2lkKWVkdV9yZWFkbChjdHJsLCBFRFVfQ09O
RklHKTsKPiArCj4gKwkJLyogaW5pdGlhbGl6ZSBlZHUgKi8KPiArCQllZHVfd3JpdGVsKGN0cmws
IEVEVV9FUlJfU1RBVFVTLCAwKTsKPiArCQllZHVfd3JpdGVsKGN0cmwsIEVEVV9ET05FLCAwKTsK
PiArCQkodm9pZCllZHVfcmVhZGwoY3RybCwgRURVX0RPTkUpOwo+ICsKPiArCQljdHJsLT5lZHVf
aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsKPiArCQlpZiAoKGludCljdHJsLT5lZHVf
aXJxIDwgMCkgewo+ICsJCQlkZXZfd2FybihkZXYsCj4gKwkJCQkgIkZMQVNIIEVEVSBlbmFibGVk
LCB1c2luZyBjdGxyZHkgaXJxXG4iKTsKPiArCQl9IGVsc2Ugewo+ICsJCQlyZXQgPSBkZXZtX3Jl
cXVlc3RfaXJxKGRldiwgY3RybC0+ZWR1X2lycSwKPiArCQkJCQkgICAgICAgYnJjbW5hbmRfZWR1
X2lycSwgMCwKPiArCQkJCQkgICAgICAgImJyY21uYW5kLWVkdSIsIGN0cmwpOwo+ICsJCQlpZiAo
cmV0IDwgMCkgewo+ICsJCQkJZGV2X2VycihkZXYsICJjYW4ndCBhbGxvY2F0ZSBJUlEgJWQ6IGVy
cm9yICVkXG4iLAo+ICsJCQkJCWN0cmwtPmVkdV9pcnEsIHJldCk7Cj4gKwkJCQlyZXR1cm4gcmV0
Owo+ICsJCQl9Cj4gKwo+ICsJCQlkZXZfaW5mbyhkZXYsICJGTEFTSCBFRFUgZW5hYmxlZCB1c2lu
ZyBpcnEgJXVcbiIsCj4gKwkJCQkgY3RybC0+ZWR1X2lycSk7Cj4gKwkJfQo+ICsJfQo+ICsKPiAr
CS8qIHNldCB0aGUgYXBwcm9wcmlhdGUgZG1hIHRyYW5zZmVyIGZ1bmN0aW9uIHRvIGNhbGwgKi8K
PiArCWlmIChoYXNfZmxhc2hfZG1hKGN0cmwpKQo+ICsJCWN0cmwtPmRtYV90cmFucyA9IGJyY21u
YW5kX2RtYV90cmFuczsKPiArCWVsc2UgaWYgKGhhc19lZHUoY3RybCkpCj4gKwkJY3RybC0+ZG1h
X3RyYW5zID0gYnJjbW5hbmRfZWR1X3RyYW5zOwo+ICsJZWxzZQo+ICsJCWN0cmwtPmRtYV90cmFu
cyA9IE5VTEw7Cj4gKwo+ICAJLyogRGlzYWJsZSBhdXRvbWF0aWMgZGV2aWNlIElEIGNvbmZpZywg
ZGlyZWN0IGFkZHJlc3NpbmcgKi8KPiAgCWJyY21uYW5kX3Jtd19yZWcoY3RybCwgQlJDTU5BTkRf
Q1NfU0VMRUNULAo+ICAJCQkgQ1NfU0VMRUNUX0FVVE9fREVWSUNFX0lEX0NGRyB8IDB4ZmYsIDAs
IDApOwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
