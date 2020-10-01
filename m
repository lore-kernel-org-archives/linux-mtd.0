Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2DAC47420
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D9F2145D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EPOVIngz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D9F2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32OqhJ9TQcpAAvGM3MnTm5rvMxq2n6oTsP+GvCqRA88=; b=EPOVIngzwAIssRXS+knu7mPX8
	i5F8GVYJYo86/s8pstmYtUVAKYZMhx8yoFsrL7gAzrdpkbVyXkN6rPkcUx0RUPAQnQKs4yTJ5uhtR
	yk0U1miye3HD7nqzShInQ6WKiypZXCqOhgyeAR7t3q4Sd5d97kmBbfbfmbbyRVK0n6ABB3+XHz+gm
	CiF+/roCFrOPYfOx2P7Xvc9npl0vFPdFiEC6BrvgtpfAXmit4L8lLpCj3NojETqojIeFcvBTIpGbo
	vwg4G6rdoXYMkA+cJNKanCts2X9mYs/beTZMI3EZ9rTpQR/ubeIrWfEGZRNfCE8UiOPnGrvyCm359
	NTqWK00Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNtM7-0003MJ-V0; Thu, 01 Oct 2020 07:50:23 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNtM4-0003LA-FN
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:50:21 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8C3872000C;
 Thu,  1 Oct 2020 07:50:14 +0000 (UTC)
Date: Thu, 1 Oct 2020 09:50:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v14 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Message-ID: <20201001095012.5c331bf8@xps13>
In-Reply-To: <20201001073425.txsfdngrsugsy6uf@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-2-p.yadav@ti.com>
 <5340adf5-1bb2-1eff-3812-6976b3b76faf@microchip.com>
 <20201001073425.txsfdngrsugsy6uf@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_035020_700737_1F9C5CEC 
X-CRM114-Status: GOOD (  26.62  )
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
Cc: vigneshr@ti.com, Tudor.Ambarus@microchip.com, richard@nod.at,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+IHdyb3RlIG9uIFRodSwgMSBP
Y3QgMjAyMCAxMzowNDoyNyArMDUzMDoKCj4gT24gMDEvMTAvMjAgMDc6MTlBTSwgVHVkb3IuQW1i
YXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4gT24gOS8zMC8yMCA5OjU3IFBNLCBQcmF0eXVz
aCBZYWRhdiB3cm90ZTogIAo+ID4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUK
Ckl0IHNlZW1zIHRoYXQgeW91ciBtYWlsZXIvc2VydmVyIGludHJvZHVjZWQgdGhhdCBsaW5lIGF1
dG9tYXRpY2FsbHksCmNhbiB5b3UgZG8gc29tZXRoaW5nIHRvIGF2b2lkIGl0PwoKPiA+ID4gCj4g
PiA+IEVOT1RTVVBQIGlzIG5vdCBhIFNVU1Y0IGVycm9yIGNvZGUuIFVzaW5nIEVPUE5PVFNVUFAg
aXMgcHJlZmVycmVkCj4gPiA+IGluIGl0cyBzdGVhZC4KCkkgcmFuIGludG8gdGhpcyBjaGVja3Bh
dGNoLnBsIGVycm9yIHJlY2VudGx5LCBJIGNvdW50IDgwKyBpdGVyYXRpb25zIGluCmRyaXZlcnMv
bXRkLyBzbyBwZXJoYXBzIGhhdmluZyBhIHN1YnN5c3RlbSB3aWRlIHJlcGxhY2VtZW50IHdpbGwg
YmUKbmljZS4gSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNoIHRob3VnaCBhcyBpdCBpcyBhZGRyZXNz
aW5nIGFsbCBTUEktTk9SCmNhc2VzIGFscmVhZHkuCgpDaGVlcnMsCk1pcXXDqGwKCj4gPiA+IAo+
ID4gPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAu
Y29tPiAgCj4gPiAKPiA+IFRoZSBSLWIgdGFnIHNob3VsZCBiZSBhZnRlciB5b3VyIFMtby1iLiBU
aGlzIGFwcGxpZXMgdG8gb3RoZXIKPiA+IHBhdGNoZXMgaW4gdGhlIHNlcmllcyB0b28uIE5vIG5l
ZWQgdG8gcmVzdWJtaXQsIGl0IGNhbiBiZSBmaXhlZCB3aGVuCj4gPiBhcHBseWluZy4gIAo+IAo+
IElmIHdlJ3JlIHVzaW5nIGNocm9ub2xvZ2ljYWwgb3JkZXIgdGhlbiBJIGZpcnN0IGFkZGVkIHlv
dXIgUmV2aWV3ZWQtYnksIAo+IGFuZCB0aGVuIHNpZ25lZCBvZmYgYmVmb3JlIHJlc2VuZGluZyB0
aGUgcGF0Y2hlcy4gU28gdGhhdCB3YXkgcy1vLWIgCj4gY29tZXMgYWZ0ZXIgci1iLgo+IAo+IEFu
eXdheSwgaXQgZG9lc24ndCByZWFsbHkgbWF0dGVyLiBVc2Ugd2hpY2hldmVyIG9yZGVyIHlvdSBw
cmVmZXIuCj4gIAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0
aS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCAxMCAr
KysrKy0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+ID4gaW5kZXggMDM2OWQ5OGIyZDEy
Li40ZDBmOGQxNjU1NDQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiA+IEBAIC0yMjgx
LDcgKzIyODEsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfaHdjYXBzX3BwMmNtZCh1MzIgaHdjYXBz
KQo+ID4gPiAgICpAbm9yOiAgICAgICAgcG9pbnRlciB0byBhICdzdHJ1Y3Qgc3BpX25vcicKPiA+
ID4gICAqQG9wOiAgICAgICAgIHBvaW50ZXIgdG8gb3AgdGVtcGxhdGUgdG8gYmUgY2hlY2tlZAo+
ID4gPiAgICoKPiA+ID4gLSAqIFJldHVybnMgMCBpZiBvcGVyYXRpb24gaXMgc3VwcG9ydGVkLCAt
RU5PVFNVUFAgb3RoZXJ3aXNlLgo+ID4gPiArICogUmV0dXJucyAwIGlmIG9wZXJhdGlvbiBpcyBz
dXBwb3J0ZWQsIC1FT1BOT1RTVVBQIG90aGVyd2lzZS4KPiA+ID4gICAqLwo+ID4gPiAgc3RhdGlj
IGludCBzcGlfbm9yX3NwaW1lbV9jaGVja19vcChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzcGlfbWVtX29wICpvcCkK
PiA+ID4gQEAgLTIyOTUsMTIgKzIyOTUsMTIgQEAgc3RhdGljIGludCBzcGlfbm9yX3NwaW1lbV9j
aGVja19vcChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+ID4gPiAgICAgICAgIG9wLT5hZGRyLm5ieXRl
cyA9IDQ7Cj4gPiA+ICAgICAgICAgaWYgKCFzcGlfbWVtX3N1cHBvcnRzX29wKG5vci0+c3BpbWVt
LCBvcCkpIHsKPiA+ID4gICAgICAgICAgICAgICAgIGlmIChub3ItPm10ZC5zaXplID4gU1pfMTZN
KQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiA+IAo+ID4gPiAg
ICAgICAgICAgICAgICAgLyogSWYgZmxhc2ggc2l6ZSA8PSAxNk1CLCAzIGFkZHJlc3MgYnl0ZXMg
YXJlIHN1ZmZpY2llbnQgKi8KPiA+ID4gICAgICAgICAgICAgICAgIG9wLT5hZGRyLm5ieXRlcyA9
IDM7Cj4gPiA+ICAgICAgICAgICAgICAgICBpZiAoIXNwaV9tZW1fc3VwcG9ydHNfb3Aobm9yLT5z
cGltZW0sIG9wKSkKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQ
UDsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4g
PiAgICAgICAgIH0KPiA+ID4gCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+IEBAIC0yMzEy
LDcgKzIzMTIsNyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKHN0cnVjdCBz
cGlfbm9yICpub3IsCj4gPiA+ICAgKkBub3I6ICAgICAgICAgcG9pbnRlciB0byBhICdzdHJ1Y3Qg
c3BpX25vcicKPiA+ID4gICAqQHJlYWQ6ICAgICAgICBwb2ludGVyIHRvIG9wIHRlbXBsYXRlIHRv
IGJlIGNoZWNrZWQKPiA+ID4gICAqCj4gPiA+IC0gKiBSZXR1cm5zIDAgaWYgb3BlcmF0aW9uIGlz
IHN1cHBvcnRlZCwgLUVOT1RTVVBQIG90aGVyd2lzZS4KPiA+ID4gKyAqIFJldHVybnMgMCBpZiBv
cGVyYXRpb24gaXMgc3VwcG9ydGVkLCAtRU9QTk9UU1VQUCBvdGhlcndpc2UuCj4gPiA+ICAgKi8K
PiA+ID4gIHN0YXRpYyBpbnQgc3BpX25vcl9zcGltZW1fY2hlY2tfcmVhZG9wKHN0cnVjdCBzcGlf
bm9yICpub3IsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHN0cnVjdCBzcGlfbm9yX3JlYWRfY29tbWFuZCAqcmVhZCkKPiA+ID4gQEAgLTIzMzgsNyAr
MjMzOCw3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9zcGltZW1fY2hlY2tfcmVhZG9wKHN0cnVjdCBz
cGlfbm9yICpub3IsCj4gPiA+ICAgKkBub3I6ICAgICAgICAgcG9pbnRlciB0byBhICdzdHJ1Y3Qg
c3BpX25vcicKPiA+ID4gICAqQHBwOiAgICAgICAgICBwb2ludGVyIHRvIG9wIHRlbXBsYXRlIHRv
IGJlIGNoZWNrZWQKPiA+ID4gICAqCj4gPiA+IC0gKiBSZXR1cm5zIDAgaWYgb3BlcmF0aW9uIGlz
IHN1cHBvcnRlZCwgLUVOT1RTVVBQIG90aGVyd2lzZS4KPiA+ID4gKyAqIFJldHVybnMgMCBpZiBv
cGVyYXRpb24gaXMgc3VwcG9ydGVkLCAtRU9QTk9UU1VQUCBvdGhlcndpc2UuCj4gPiA+ICAgKi8K
PiA+ID4gIHN0YXRpYyBpbnQgc3BpX25vcl9zcGltZW1fY2hlY2tfcHAoc3RydWN0IHNwaV9ub3Ig
Km5vciwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3Qgc3BpX25vcl9wcF9jb21tYW5kICpwcCkKPiA+ID4gLS0KPiA+ID4gMi4yOC4wCj4gPiA+ICAg
Cj4gPiAgIAo+IAoKCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
