Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E9BCC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEtBgnXNLzrcq/wQblE7ow38ci6O5MgOmNyjWSIsMBg=; b=qu0cJ93M9K0PGW
	Kh+llhu01LMeVe0scP8Ag64R5FoKSqN6r2JoZdLydHWeEtg/vZPcGpROfkCWv+o0m8t2Wq+hTRcj3
	c+IHEUwGmdKk9e5W85LE+S3L3g3/cjPdey9HTE4l946LSrk+gQe0PXznBYqiAuuk/YrwbynUEThAO
	4HWSN0epYRSFuDSEve876dDfmZwjTH2Z2JOo1R7XeFFz47W/7xkW7Rb3M40RjjU5LDCME1wkSOHO6
	1uXOmVbD72Jhnep6DaA6GbXJd0JqXk/tquB/vaBcOnXuxIFTYjLPUNPftpYMANql5SdYYkqX1Gj5z
	nyNwLYs7lkC/sWS+2Wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfjI-0000000DavX-0dDw;
	Tue, 13 Oct 2026 16:51:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfjG-0000000DavE-0osn
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:51:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91F5F41AA3;
	Tue, 13 Oct 2026 16:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3751F000FF;
	Tue, 13 Oct 2026 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910313;
	bh=9k5edM2yzPHJJWM8cKSNSUBSjjbzZXxoL90zgovLWfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7m2xMFCwKDhtTIKPRjfklRKV9IPOWftBjO1jH3PanuLpQl8MwL/v8AzzFf9vWSCZ
	 hbLt+WmgLHlFRoldUvmal34Z2PIGyF/hmcfK8cVDPhcr4wDtotf7SM/uq8UjLbfRhn
	 A4jY2waNgMnBkdoz4eTXAE5L+lv2KV1Hb4UgjWSP0IIp/IhaOs2cCp2F60eBPacku/
	 8bQ8wslRYPW05FaMSre3hU/zcfohG7wQP+trUg1zpDnPaz/atbf7mGst1/qsnCtCFp
	 s7B9mnCIjqvyMrJxxP1wnsW9FR/InOEHX/CxgiB8xUNFgXLkx1QxJBXUcxrpbcdhPK
	 7kjq3e1Dw/WZw==
Message-ID: <sashiko-outbox-170165@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/17] mtd: spi-nor: Fix WRSR with ODTR chips
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
 <20261013-winbond-master-spi-nor-w35t-v3-8-6dde1d513df8@bootlin.com>
Date: Tue, 13 Oct 2026 16:51:49 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaS1ub3I6IFVuY29u
ZGl0aW9uYWwgLUVJTlZBTCBmb3IgMi1ieXRlIHdyaXRlcyBpbiBEVFIgbW9kZSBicmVha3MgZmxh
c2ggdW5sb2NraW5nCi0tCgpjb21taXQgOGRmYjJlNGYxOWNkYmMwZDg4ZTA0MDNmNzZjZjhmZjk0
YzE3YmNkOApBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
CgptdGQ6IHNwaS1ub3I6IEZpeCBXUlNSIHdpdGggT0RUUiBjaGlwcwoKVGhlIE9EVFIgaW50ZXJm
YWNlIHJlcXVpcmVzIGFuIGV2ZW4gbnVtYmVyIG9mIGJ5dGVzIGluIGVhY2ggc2VjdGlvbiBvZgp0
aGUgb3BlcmF0aW9uLiBzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcCgpIHRha2VzIGNhcmUgb2YgdGhl
IG9wY29kZSBwaGFzZSwKYnV0IHdlIGhhdmUgdG8gYWRhcHQgdGhlIHJlc3Qgb2YgdGhlIG9wZXJh
dGlvbiBvdXJzZWxmLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDAzOTllMTkzYTg5NmQuLmE5MWU0
N2VhZTI3ODkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC03NzgsNyArNzc4LDggQEAgc3RhdGlj
IGludCBzcGlfbm9yX3dyaXRlX3NyX2xsKHN0cnVjdCBzcGlfbm9yICpub3IsIHU4IG9wY29kZSwg
Y29uc3QgdTggKnNyLAo+ICB7Cj4gIAlpbnQgcmV0LCBpOwo+ICAKPiAtCWlmIChsZW4gPiAyKQo+
ICsJLyogVGhlcmUgaXMgbm8gc3IxX2FuZF9zcjIgaW4gT0RUUiBtb2RlOiB0aGlzIGlzIGEgcXVh
ZC1vbmx5IGNvcm5lciBjYXNlICovCj4gKwlpZiAobGVuID4gMiAgfHwgKG5vci0+cmVnX3Byb3Rv
ID09IFNOT1JfUFJPVE9fOF84XzhfRFRSICYmIGxlbiA+IDEpKQo+ICAJCXJldHVybiAtRUlOVkFM
OwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgdW5jb25kaXRpb25hbCByZXR1cm4gb2YgLUVJ
TlZBTCBicmVhayBmbGFzaCB1bmxvY2tpbmcgZm9yIE9EVFIgY2hpcHM/CgpXaGVuIE9EVFIgaXMg
ZW5hYmxlZCwgdGhpcyBmb3JjZXMgc3BpX25vcl93cml0ZV9zcl9sbCgpIHRvIHJldHVybiAtRUlO
VkFMIGZvcgphbnkgd3JpdGUgbG9uZ2VyIHRoYW4gMSBieXRlLiBIb3dldmVyLCBzcGlfbm9yX3dy
aXRlX3NyMV9hbmRfc3IyKCkgZGlyZWN0bHkKcHJvcGFnYXRlcyB0aGlzIC1FSU5WQUwgd2l0aG91
dCBmYWxsaW5nIGJhY2sgdG8gaW5kaXZpZHVhbCBzcGlfbm9yX3dyaXRlX3NyMSgpCmFuZCBzcGlf
bm9yX3dyaXRlX3NyMigpIGNhbGxzIGlmIHBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9zcjFfYW5kX3Ny
MiBpcyBzZXQ6Cgpkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYzpzcGlfbm9yX3dyaXRlX3NyMV9h
bmRfc3IyKCkgewogICAgLi4uCiAgICBpZiAocGFyYW1zLT5vcGNvZGVzLndyaXRlX3NyMV9hbmRf
c3IyKQogICAgICAgIHJldHVybiBzcGlfbm9yX3dyaXRlX3NyX2xsKG5vciwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXJhbXMtPm9wY29kZXMud3JpdGVfc3IxX2FuZF9zcjIs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3IsIDIpOwogICAgLi4uCn0KClNp
bmNlIG5vdCBhbGwgT0RUUiBjaGlwcyBleHBsaWNpdGx5IGNsZWFyIHdyaXRlX3NyMV9hbmRfc3Iy
IChmb3IgZXhhbXBsZSwKU3BhbnNpb24gUzI4IHBhcnRzLCB1bmxlc3MgdGhlaXIgU0ZEUCB0YWJs
ZSBzZXRzIGEgUUVSIHRoYXQgaW1wbGljaXRseSBjbGVhcnMKaXQpLCBvcGVyYXRpb25zIGxpa2Ug
c3BpX25vcl9zcl91bmxvY2soKSB3aWxsIHVuY29uZGl0aW9uYWxseSBmYWlsIHdpdGggLUVJTlZB
TC4KCldoaWxlIHRoZSB3cml0ZV9zcjFfYW5kX3NyMiBmbGFnIG1heSBiZSBjbGVhcmVkIG1hbnVh
bGx5IGxhdGVyIGZvciBjZXJ0YWluCm1hbnVmYWN0dXJlcnMgKGxpa2UgV2luYm9uZCksIGxlYXZp
bmcgdGhlIHN0cnVjdHVyYWwgYnVnIGluCnNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjIoKSBjYXVz
ZXMgYSBjb21wbGV0ZSBmYWlsdXJlIGluc3RlYWQgb2YgYSBmYWxsYmFjay4KCi0tIApTYXNoaWtv
IEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTMtd2lu
Ym9uZC1tYXN0ZXItc3BpLW5vci13MzV0LXYzLTAtNmRkZTFkNTEzZGY4QGJvb3RsaW4uY29tP3Bh
cnQ9OAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
