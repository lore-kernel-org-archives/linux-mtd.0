Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD522C00528
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Aug 2023 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w92yJS2ZOqxwxgmeSMfEymhEpgQeG5t77ZPgZtfmovQ=; b=4RReq0NKwUqb/7
	ijsPpkUGa9v64luxZUL6FZkKirkrbXAvUbHVFa/6ahQFD2xDOGW6DYaEztrf9zBac7PDu5Cjf0c60
	s9nqds6E/9yHBqXBvNZn03VUQpc0c00KJtLwb3I4cQJIoCpKeCV/tFE8u0dzGvaNgtMUQdMPR2t64
	EK7OJffAIcLU+RKwixA/bQFRApMBmfGI2OCTQ4McbLRfc+8ad56zic6ILqVlM75mKjicyb/b4RhUX
	DTJezxCkaXd41+T1vcJNxj0792iSWPoVptrERK0/6qYmUs6DZTKbLCGb/9M7pTCc0MdcNldtWWCxG
	M142ptvIYMkDcJiCM1cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0aZ-00HRoA-1V;
	Mon, 07 Aug 2023 13:48:03 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT0aW-00HRmc-1O
	for linux-mtd@lists.infradead.org;
	Mon, 07 Aug 2023 13:48:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFCF31C0008;
	Mon,  7 Aug 2023 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691416075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sgpG9tc96RXAVrisVjb1ZlL6kzhbThzQ6qjQYGBJXDE=;
	b=TcK/Qaf6BTFBfmi0nKENimcG8cRbDvwZmNIJOV7uL9WiUwWXtLBDlIap8QQZ+Rxmsw9Kr8
	c9DvDaTNGJ7jYloYQCoL0KYqquyxJyb52pWB1YfJIOn7JPRxh83ijtj+WHLstyh5d1HiZb
	L4W+NJpnoCJck3F+4mBXPUMMUfr+9YoTXwTmj2Btsey8lUs2r6kMSmoeREZ5gdoU/VbSOv
	XD60PWfl0qKgZNdwAff6C/yz/fkBmhkLvACUGy5bl6l148wqdl77TYgduQITBadwR3aJKn
	jv1GCoApA6ZSDXekfzV/TLZSMuUaw/VPMyASEC3tIB+yjf271ud9aXVx/wYlCA==
Date: Mon, 7 Aug 2023 15:47:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 06/41] mtd: spi-nor: default page_size to 256 bytes
Message-ID: <20230807154754.70e994fa@xps-13>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v1-6-3d3d5bef4ba4@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v1-0-3d3d5bef4ba4@kernel.org>
	<20230807-mtd-flash-info-db-rework-v1-6-3d3d5bef4ba4@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_064800_743545_5C8E3D29 
X-CRM114-Status: GOOD (  23.07  )
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

SGkgTWljaGFlbCwKCm13YWxsZUBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMDcgQXVnIDIwMjMg
MTU6MjE6MDAgKzAyMDA6Cgo+IFRoZSBJTkZPKCkgbWFjcm8gYWx3YXlzIHNldCB0aGUgcGFnZV9z
aXplIHRvIDI1NiBieXRlcy4gTWFrZSB0aGF0IGFuCj4gb3B0aW5hbCBwYXJhbWV0ZXIuIFRoaXMg
ZGVmYXVsdCBpcyBhIHNhbmUgb25lIGZvciBhbGwgb2xkZXIgZmxhc2hlcywKCm9wdGlvbmFsCgo+
IG5ld2VyIG9uZXMgd2lsbCBzZXQgdGhlIHBhZ2Ugc2l6ZSBieSBpdHMgU0ZEUCB0YWJsZXMgYW55
d2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDcgKy0tLS0tLQo+ICBkcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuaCB8IDggKysrKysrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBpbmRleCBj
NTA0YTVhZjQwMzIuLjEzOGJjMWUwYTY3YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gQEAgLTIwMTcs
MTEgKzIwMTcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyICpt
YW51ZmFjdHVyZXJzW10gPSB7Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlf
bm9yX2dlbmVyaWNfZmxhc2ggPSB7Cj4gIAkubmFtZSA9ICJzcGktbm9yLWdlbmVyaWMiLAo+ICAJ
Lm5fYmFua3MgPSAxLAo+IC0JLyoKPiAtCSAqIEpFU0QyMTYgcmV2IEEgZG9lc24ndCBzcGVjaWZ5
IHRoZSBwYWdlIHNpemUsIHRoZXJlZm9yZSB3ZSBuZWVkIGEKPiAtCSAqIHNhbmUgZGVmYXVsdC4K
PiAtCSAqLwo+IC0JLnBhZ2Vfc2l6ZSA9IDI1NiwKPiAgCS5wYXJzZV9zZmRwID0gdHJ1ZSwKPiAg
fTsKPiAgCj4gQEAgLTMwMDAsNyArMjk5NSw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5pdF9k
ZWZhdWx0X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICAJcGFyYW1zLT53cml0ZXNpemUg
PSAxOwo+ICAJcGFyYW1zLT5zaXplID0gaW5mby0+c2l6ZTsKPiAgCXBhcmFtcy0+YmFua19zaXpl
ID0gcGFyYW1zLT5zaXplOwo+IC0JcGFyYW1zLT5wYWdlX3NpemUgPSBpbmZvLT5wYWdlX3NpemU7
Cj4gKwlwYXJhbXMtPnBhZ2Vfc2l6ZSA9IGluZm8tPnBhZ2Vfc2l6ZSA/OiBTUElfTk9SX0RFRkFV
TFRfUEFHRV9TSVpFOwoKV291bGQgeW91IG1pbmQgY2xhcmlmeWluZyB0aGlzPyBJdCBkb2VzIG5v
dCBsb29rIHJpZ2h0LCB3aGlsZQpwZXJoYXBzIGl0IGlzLiBCdXQgVEJILCBJIGhhdmUgbm8gaWRl
YSB3aGF0IHBhcmFtcy0+cGFnZV9zaXplIHdpbGwgYmUKYWZ0ZXIgdGhpcyBhc3NpZ25tZW50LgoK
PiAgCj4gIAlpZiAoIShpbmZvLT5mbGFncyAmIFNQSV9OT1JfTk9fRlIpKSB7Cj4gIAkJLyogRGVm
YXVsdCB0byBGYXN0IFJlYWQgZm9yIERUIGFuZCBub24tRFQgcGxhdGZvcm0gZGV2aWNlcy4gKi8K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuaAo+IGluZGV4IDEyYzM1NDA5NDkzYi4uMjViYzE4MTk3NjE0IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oCj4gKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9jb3JlLmgKPiBAQCAtMTAsNiArMTAsMTEgQEAKPiAgI2luY2x1ZGUgInNmZHAuaCIKPiAg
Cj4gICNkZWZpbmUgU1BJX05PUl9NQVhfSURfTEVOCTYKPiArLyoKPiArICogMjU2IGJ5dGVzIGlz
IGEgc2FuZSBkZWZhdWx0IGZvciBtb3N0IG9sZGVyIGZsYXNoZXMuIE5ld2VyIGZsYXNoZXMgd2ls
bAo+ICsgKiBoYXZlIHRoZSBwYWdlIHNpemUgZGVmaW5lZCB3aXRoaW4gdGhlaXIgU0ZEUCB0YWJs
ZXMuCj4gKyAqLwo+ICsjZGVmaW5lIFNQSV9OT1JfREVGQVVMVF9QQUdFX1NJWkUgMjU2Cj4gIAo+
ICAvKiBTdGFuZGFyZCBTUEkgTk9SIGZsYXNoIG9wZXJhdGlvbnMuICovCj4gICNkZWZpbmUgU1BJ
X05PUl9SRUFESURfT1AobmFkZHIsIG5kdW1teSwgYnVmLCBsZW4pCQkJXAo+IEBAIC00NDcsNyAr
NDUyLDcgQEAgc3RydWN0IHNwaV9ub3JfZml4dXBzIHsKPiAgICogQHNlY3Rvcl9zaXplOiAgICB0
aGUgc2l6ZSBsaXN0ZWQgaGVyZSBpcyB3aGF0IHdvcmtzIHdpdGggU1BJTk9SX09QX1NFLCB3aGlj
aAo+ICAgKiAgICAgICAgICAgICAgICAgIGlzbid0IG5lY2Vzc2FyaWx5IGNhbGxlZCBhICJzZWN0
b3IiIGJ5IHRoZSB2ZW5kb3IuCj4gICAqIEBuX2JhbmtzOiAgICAgICAgdGhlIG51bWJlciBvZiBi
YW5rcy4KPiAtICogQHBhZ2Vfc2l6ZTogICAgICB0aGUgZmxhc2gncyBwYWdlIHNpemUuCj4gKyAq
IEBwYWdlX3NpemU6ICAgICAgKG9wdGlvbmFsKSB0aGUgZmxhc2gncyBwYWdlIHNpemUuIERlZmF1
bHRzIHRvIDI1Ni4KPiAgICogQGFkZHJfbmJ5dGVzOiAgICBudW1iZXIgb2YgYWRkcmVzcyBieXRl
cyB0byBzZW5kLgo+ICAgKgo+ICAgKiBAcGFyc2Vfc2ZkcDogICAgIHRydWUgd2hlbiBmbGFzaCBz
dXBwb3J0cyBTRkRQIHRhYmxlcy4gVGhlIGZhbHNlIHZhbHVlIGhhcyBubwo+IEBAIC01NTgsNyAr
NTYzLDYgQEAgc3RydWN0IGZsYXNoX2luZm8gewo+ICAjZGVmaW5lIFNQSV9OT1JfR0VPTUVUUlko
X3NlY3Rvcl9zaXplLCBfbl9zZWN0b3JzLCBfbl9iYW5rcykJCVwKPiAgCS5zaXplID0gKF9zZWN0
b3Jfc2l6ZSkgKiAoX25fc2VjdG9ycyksCQkJCVwKPiAgCS5zZWN0b3Jfc2l6ZSA9IChfc2VjdG9y
X3NpemUpLAkJCQkJXAo+IC0JLnBhZ2Vfc2l6ZSA9IDI1NiwJCQkJCQlcCj4gIAkubl9iYW5rcyA9
IChfbl9iYW5rcykKPiAgCj4gIC8qIFVzZWQgd2hlbiB0aGUgIl9leHRfaWQiIGlzIHR3byBieXRl
cyBhdCBtb3N0ICovCj4gCgpPdGhlcndpc2UsIGxndG0uCgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
