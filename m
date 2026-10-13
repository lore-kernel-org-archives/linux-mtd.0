Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCD3CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AfuRPK/A72NcB7ePjhbnBAp7K3UGN73AtjyvdIK6vg=; b=ynhMqGh6CH/Yn7
	aLEBTvxzV+XCOInL4JjJbATlaFckJr6ToUteQxEGUvIOCJnMLqTI6LD45D+I2zx3dPfk01pVy22bE
	Jx9Txrl8Ngr2VThlihhx4AmjQBgE1CYMFJGERNdTP4oyAxnI3Gff9LeKRBMMzEw5oC7nzWkoJ0rCh
	aiKYmo8H1bKlUy/Z6EIuf7rvymN69QdEYjVh7z2RchUToqZg8EfmUDVk4ssIAbawE1ynAMO/FPp/x
	bhk6dqxHhbfzgc1vTINvtZPqwC4v7oSETXadQMtMidu4PtucpwpRPnsnPvj/ArMtWlv245j4KjfhS
	7C3YHoJaBehXtbIsavig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfhK-0000000Dabx-3Y9R;
	Tue, 13 Oct 2026 16:49:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfhJ-0000000DabS-3eJ9
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:49:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44B25436D0;
	Tue, 13 Oct 2026 16:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DB21F000FF;
	Tue, 13 Oct 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910193;
	bh=Sd7OKo4ZPYoyITfV1Pwf//TkyPHPeoIcP3U2vokbk7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vyozr7oGMFpDuZmYJ5q+ZetSAoZ5O4XZPpZiqgozmqbBHCGsu7R/WQtS9GzF91KFv
	 qaRnawwip6ZitcFqWmy5zyVkgGRREKsGS3Nd/wNWd9I8I+Q4lbF4+4JpLg5HvQr8ZT
	 jJlPod+RkEbBpmf2sevTFc3ovny/BADX/MB3hmKEp6uGG9Fid5gTRzv+dFBWonPVqq
	 FKepKs37SDgaLih40kITfM7+LaYtqtAt/YXck+JXJrESJzWjj9CnEJg3SnnG9SwR6t
	 V+2S6yF1ywGoG0OjsD/8KUkF+BL45yVy9EiJEi6aKU/4O9eYJOgZq/N2fU8ZDRnVo1
	 Av7q+I6hFq2Vg==
Message-ID: <sashiko-outbox-170162@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/17] mtd: spi-nor: Allow configuring the actual
 number of dummy cycles
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
 <20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
Date: Tue, 13 Oct 2026 16:49:52 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
bWlzc2luZyBoYXJkd2FyZSBzdGF0ZSByb2xsYmFjayBvbiBwcm9iZSBmYWlsdXJlCi0tCgpjb21t
aXQgZjkxM2FiZmNiYWQ4OGY4ZDRiNzlhYmI1ZDcxZDY1NjY3MTdhMTdmNQpBdXRob3I6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHNwaS1ub3I6IEFsbG93
IGNvbmZpZ3VyaW5nIHRoZSBhY3R1YWwgbnVtYmVyIG9mIGR1bW15IGN5Y2xlcwoKVGhlIFNQSSBO
T1IgY29yZSBzZWxlY3RzIHRoZSBmYXN0ZXN0IHJlYWQgdmFyaWFudCBhZHZlcnRpc2VkIGJ5IHRo
ZSBTRkRQCnRhYmxlcy4gVGhpcyBtYXkgb3IgbWF5IG5vdCBiZSBhIHdpc2UgY2hvaWNlIGJ1dCBh
dCBsZWFzdCBpdCBpcyBzaW1wbGVyCmFzIGFueSBidXMgZnJlcXVlbmN5IHdpbGwganVzdCB3b3Jr
LiBUaGVyZSBpcyBob3dldmVyIGEgZG93bnNpZGU6IHRoZQpudW1iZXIgb2YgZHVtbXkgY3ljbGVz
IGlzIG1heGltaXplZCAoaW4gY2FzZSB0aGUgYnVzIGZyZXF1ZW5jeSBpcyByZWFsbHkKZmFzdCwg
dGhpcyBpcyBob3cgdGhlIGNoaXAgZW5mb3JjZXMgYSBzdWZmaWNpZW50IGRlbGF5KS4gTWF4aW1p
emluZyB0aGUKbnVtYmVyIG9mIGR1bW15IGN5Y2xlcyBtZWFucyB0aGF0LCBpZiB0aGUgYW1vdW50
IG9mIGN5Y2xlcyBpcwpjb25maWd1cmFibGUgaW4gdGhlIGNoaXAsIHdlIG1pZ2h0IG5vdCB0YWtl
IGl0cyBkZWZhdWx0IHZhbHVlLiBXaGVuIHRoaXMKaGFwcGVucywgd2UgbmVlZCB0byBtYWtlIHN1
cmUgdGhhdCB0aGUgY2hpcCBpcyBjb25maWd1cmVkIGFjY29yZGluZ2x5LgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+IGluZGV4IGE5MWU0N2VhZTI3ODkuLjM1OWRmMjljNGNhNmYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
YwoKWyAuLi4gXQoKPiBAQCAtMzEwMCw2ICszMTE4LDEwIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9p
bml0KHN0cnVjdCBzcGlfbm9yICpub3IpCj4gIAlzdHJ1Y3Qgc3BpX25vcl9mbGFzaF9wYXJhbWV0
ZXIgKnBhcmFtcyA9IG5vci0+cGFyYW1zOwo+ICAJaW50IGVycjsKPiAgCj4gKwllcnIgPSBzcGlf
bm9yX3NldF9kdW1teShub3IpOwo+ICsJaWYgKGVycikKPiArCQlyZXR1cm4gZXJyOwo+ICsKPiAg
CWVyciA9IHNwaV9ub3Jfc2V0X29jdGFsX2R0cihub3IsIHRydWUpOwo+ICAJaWYgKGVycikgewo+
ICAJCWRldl9kYmcobm9yLT5kZXYsICJvY3RhbCBtb2RlIG5vdCBzdXBwb3J0ZWRcbiIpOwo+ICAJ
CXJldHVybiBlcnI7Cj4gIAl9CgpbU2V2ZXJpdHk6IEhpZ2hdCklmIHNwaV9ub3Jfc2V0X29jdGFs
X2R0cigpIHJldHVybnMgYW4gZXJyb3IsIGRvZXMgdGhpcyBsZWF2ZSB0aGUgZmxhc2ggY2hpcApp
biBhIG5vbi1kZWZhdWx0IGhhcmR3YXJlIHN0YXRlPwoKSXQgYXBwZWFycyB0aGF0IGlmIGVudGVy
aW5nIG9jdGFsIG1vZGUgZmFpbHMsIHRoZSBmdW5jdGlvbiByZXR1cm5zIGltbWVkaWF0ZWx5Cndp
dGhvdXQgdW5kb2luZyB0aGUganVzdC1hcHBsaWVkIHNwaV9ub3Jfc2V0X2R1bW15KCkgY29uZmln
dXJhdGlvbi4KClNpbWlsYXJseSwgaWYgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlscyBsYXRlciBk
dXJpbmcgZHJpdmVyIHByb2JlIGFmdGVyCnNwaV9ub3Jfc2NhbigpIGhhcyBzdWNjZXNzZnVsbHkg
bXV0YXRlZCB0aGUgZmxhc2ggc3RhdGU6Cgpkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYzpzcGlf
bm9yX3Byb2JlKCkgewogICAgLi4uCgllcnIgPSBzcGlfbm9yX3NjYW4obm9yLCBuYW1lLCAmaHdj
YXBzKTsKCWlmIChlcnIpCgkJcmV0dXJuIGVycjsKCglpZiAobm9yLT5ib3VuY2VidWZfc2l6ZSkg
ewoJCW5vci0+Ym91bmNlYnVmID0gZGV2bV9rbWFsbG9jKGRldiwgbm9yLT5ib3VuY2VidWZfc2l6
ZSwKCQkJCQkgICAgICBHRlBfS0VSTkVMKTsKCQlpZiAoIW5vci0+Ym91bmNlYnVmKQoJCQlyZXR1
cm4gLUVOT01FTTsKICAgIC4uLgp9CgpEb2VzIHRoZSBkcml2ZXIgcmV0dXJuIGhlcmUgd2l0aG91
dCBjYWxsaW5nIHNwaV9ub3JfcmVzdG9yZSgpIHRvIHVuZG8gdGhlCmR1bW15IGN5Y2xlcyBjb25m
aWd1cmF0aW9uPwoKSWYgdGhlIGZsYXNoIGNoaXAgaXMgbGVmdCBleHBlY3RpbmcgdGhlIG5ld2x5
IGNvbmZpZ3VyZWQgZHVtbXkgY3ljbGVzLApyZWFkcyB1c2luZyBkZWZhdWx0IFNQSSBwYXJhbWV0
ZXJzIChlLmcuLCBzdGFuZGFyZCBkdW1teSBjeWNsZXMpIGR1cmluZyBhIHdhcm0KcmVib290IG1p
Z2h0IHJldHVybiBnYXJiYWdlLCBwb3RlbnRpYWxseSBoYW5naW5nIHRoZSBib290IHByb2Nlc3Mu
CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0
LzIwMjYxMDEzLXdpbmJvbmQtbWFzdGVyLXNwaS1ub3ItdzM1dC12My0wLTZkZGUxZDUxM2RmOEBi
b290bGluLmNvbT9wYXJ0PTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
