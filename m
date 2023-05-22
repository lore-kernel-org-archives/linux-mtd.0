Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A524CC77B73
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vfd8s+VLU9VuxPi1ffCDs5G9FiUP9yl5sQJtVY2C1XA=; b=UKs4FYpzohVkJA
	t04gnvbHNAXZ4LvFCOX9sNJ+VfoaxC7i/Ui7r3Pq1ql+MMfsBtZ6t4IE72Yf0iCpneNkEvuXwR/6m
	qQzZ3Q7KHUMXb/Ks5SfuJRChN7PtpySRceCswotNngsphT0E6ao/bwIcPwTt/wWP6xMPTY+dLypg3
	o0RNdKPtZEmOwELST+giSVaaRUL7b80o9lvDvIgj1asZVSl/lCmHD1ICTd1v31YQKvuUVp4AyKN6A
	pHnrEV6ruM4QHuyY+fl990oBo9EB5grMH6zYsUB8szeF1Q8nwtBgSZkAFaw6m1KKyCSrvYBo6Z2x7
	VNXRODA06f073PRndI0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q12C6-005uoy-0k;
	Mon, 22 May 2023 09:51:10 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q12Bz-005uo9-0A
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 09:51:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8BF8EFF806;
	Mon, 22 May 2023 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684749059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kgR+kx+E0h6xq8/SEAddPn5xEBZ+n4iSnzTGkQdqPCU=;
	b=QREtmBvMDa3AjoLPdCnHG4flZ2Jonaih9xj1Rwxy3w1npB0GOG8OoOnC+4/6LJPX0EjzfK
	Pd67+4Xpm2MXyiV7Tb63FVWFPGEHr0dhzAIQo2cj7jbq8TTZM2WhW0Dv6nhwyU+vxuMsIp
	oYKJd0nL+EtUcjfmVNcxTCegLV8OU9GUSGlw3YphLXganZGh0iIMAkbx0bKnWtXGStwMOr
	hpd9+RE6gfNvUUrnJrmDEqcr2SAhnljIUKdFN8+zJ55U0S2EBVOhGDuY9RY6aL3NyJ6A4L
	YwxbXidCbdbX387eoZzFDOp04bnhhSgw9jiT8gfhQEEz7JNtXi3tBFpXnBVHGg==
Date: Mon, 22 May 2023 11:50:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, richard@nod.at,
 todd.e.brandt@intel.com, vigneshr@ti.com, pratyush@kernel.org,
 michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@leemhuis.info,
 bagasdotme@gmail.com, regressions@lists.linux.dev, joneslee@google.com,
 Todd Brandt <todd.e.brandt@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix divide by zero for spi-nor-generic
 flashes
Message-ID: <20230522115056.5fefd73f@xps-13>
In-Reply-To: <e7d682f3-c1a3-6ddb-5854-8e814dd66333@redhat.com>
References: <20230518085440.2363676-1-tudor.ambarus@linaro.org>
	<20230522102953.2fdf2b02@xps-13>
	<0c8a54ae-7f32-2614-9717-a00fe561513e@linaro.org>
	<e7d682f3-c1a3-6ddb-5854-8e814dd66333@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_025103_381597_52523CF1 
X-CRM114-Status: GOOD (  35.14  )
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

SGVsbG8sCgpoZGVnb2VkZUByZWRoYXQuY29tIHdyb3RlIG9uIE1vbiwgMjIgTWF5IDIwMjMgMTE6
MzQ6NTUgKzAyMDA6Cgo+IEhpLAo+IAo+IE9uIDUvMjIvMjMgMTE6MjIsIFR1ZG9yIEFtYmFydXMg
d3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gNS8yMi8yMyAwOToyOSwgTWlxdWVsIFJheW5hbCB3cm90
ZTogIAo+ID4+IEhpIFR1ZG9yLCAgCj4gPiAKPiA+IEhpLCBNaXF1ZWwsCj4gPiAgIAo+ID4+Cj4g
Pj4gdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnIHdyb3RlIG9uIFRodSwgMTggTWF5IDIwMjMgMDg6
NTQ6NDAgKzAwMDA6Cj4gPj4gIAo+ID4+PiBXZSBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBuX2Jhbmtz
IGZvciBzcGktbm9yLWdlbmVyaWMgZmxhc2hlcywgd2hpY2gKPiA+Pj4gY2F1c2VkIGEgZGV2aWRl
IGJ5IHplcm8gd2hlbiBjb21wdXRpbmcgdGhlIGJhbmtfc2l6ZS4KPiA+Pj4KPiA+Pj4gQnkgZGVm
YXVsdCB3ZSBjb25zaWRlciB0aGF0IGFsbCBjaGlwcyBoYXZlIGEgc2luZ2xlIGJhbmsuIEluaXRp
YWxpemUKPiA+Pj4gdGhlIGRlZmF1bHQgbnVtYmVyIG9mIGJhbmtzIGZvciBzcGktbm9yLWdlbmVy
aWMgZmxhc2hlcy4gRXZlbiBpZiB0aGUKPiA+Pj4gYnVnIGlzIGZpeGVkIHdpdGggdGhpcyBzaW1w
bGUgaW5pdGlhbGl6YXRpb24sIGNoZWNrIHRoZSBuX2JhbmtzIHZhbHVlCj4gPj4+IGJlZm9yZSBk
aXZpZGluZyBzbyB0aGF0IHdlIG1ha2Ugc3VyZSB0aGlzIGtpbmQgb2YgYnVnIHdvbid0IG9jY3Vy
IGFnYWluCj4gPj4+IGlmIHNvbWUgb3RoZXIgc3RydWN0IGluc3RhbmNlIGlzIGNyZWF0ZWQgdW5p
bml0aWFsaXplZC4KPiA+Pj4KPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBUb2RkIEJyYW5kdCA8dG9kZC5l
LmJyYW5kdEBsaW51eC5pbnRlbC5jb20+Cj4gPj4+IFJlcG9ydGVkLWJ5OiBUb2RkIEJyYW5kdCA8
dG9kZC5lLmJyYW5kdEBsaW51eC5pbnRlbC5jb20+Cj4gPj4+IENsb3NlczogaHR0cHM6Ly9idWd6
aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTc0NDgKPiA+Pj4gRml4ZXM6IDlkNmM1
ZDY0ZjAyOCAoIm10ZDogc3BpLW5vcjogSW50cm9kdWNlIHRoZSBjb25jZXB0IG9mIGJhbmsiKQo+
ID4+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MTYyMjUxMDguMjkx
OTQtMS10b2RkLmUuYnJhbmR0QGludGVsLmNvbS8KPiA+Pj4gU2lnbmVkLW9mZi1ieTogVHVkb3Ig
QW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgo+ID4+PiAtLS0KPiA+Pj4gIGRyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jIHwgNSArKysrLQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ID4+
PiBpbmRleCAwYmIwYWQxNGEyZmMuLjVmMjlmYWM4NjY5YSAxMDA2NDQKPiA+Pj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKPiA+Pj4gQEAgLTIwMTgsNiArMjAxOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3Bp
X25vcl9tYW51ZmFjdHVyZXIgKm1hbnVmYWN0dXJlcnNbXSA9IHsKPiA+Pj4gIAo+ID4+PiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIHNwaV9ub3JfZ2VuZXJpY19mbGFzaCA9IHsKPiA+
Pj4gIAkubmFtZSA9ICJzcGktbm9yLWdlbmVyaWMiLAo+ID4+PiArCS5uX2JhbmtzID0gMSwgIAo+
ID4+Cj4gPj4gSSBkZWZpbml0ZWx5IG1pc3NlZCB0aGF0IHN0cnVjdHVyZS4KPiA+PiAgCj4gPj4+
ICAJLyoKPiA+Pj4gIAkgKiBKRVNEMjE2IHJldiBBIGRvZXNuJ3Qgc3BlY2lmeSB0aGUgcGFnZSBz
aXplLCB0aGVyZWZvcmUgd2UgbmVlZCBhCj4gPj4+ICAJICogc2FuZSBkZWZhdWx0Lgo+ID4+PiBA
QCAtMjkyMSw3ICsyOTIyLDggQEAgc3RhdGljIHZvaWQgc3BpX25vcl9sYXRlX2luaXRfcGFyYW1z
KHN0cnVjdCBzcGlfbm9yICpub3IpCj4gPj4+ICAJaWYgKG5vci0+ZmxhZ3MgJiBTTk9SX0ZfSEFT
X0xPQ0sgJiYgIW5vci0+cGFyYW1zLT5sb2NraW5nX29wcykKPiA+Pj4gIAkJc3BpX25vcl9pbml0
X2RlZmF1bHRfbG9ja2luZ19vcHMobm9yKTsKPiA+Pj4gIAo+ID4+PiAtCW5vci0+cGFyYW1zLT5i
YW5rX3NpemUgPSBkaXY2NF91NjQobm9yLT5wYXJhbXMtPnNpemUsIG5vci0+aW5mby0+bl9iYW5r
cyk7Cj4gPj4+ICsJaWYgKG5vci0+aW5mby0+bl9iYW5rcyA+IDEpCj4gPj4+ICsJCXBhcmFtcy0+
YmFua19zaXplID0gZGl2NjRfdTY0KHBhcmFtcy0+c2l6ZSwgbm9yLT5pbmZvLT5uX2JhbmtzKTsg
IAo+ID4+Cj4gPj4gSSdtIGZpbmUgd2l0aCB0aGUgY2hlY2sgYXMgaXQgaXMgd3JpdHRlbiBiZWNh
dXNlIGl0IGFsc28gbG9vayBsaWtlIGFuCj4gPj4gb3B0aW1pemF0aW9uLCBidXQgYmFua19zaXpl
IHNob3VsZCBuZXZlciBiZSAwIG90aGVyd2lzZSBpdCdzIGEgcmVhbCBidWcgIAo+ID4gCj4gPiBi
YW5rX3NpemUgd2FzIGludHJvZHVjZWQganVzdCBmb3IgY2hpcHMgZmVhdHVyaW5nIHNldmVyYWwg
YmFua3MsIGJ1dCB3ZQo+ID4gbWFkZSB0aGlzIGZpZWxkIG1hbmRhdG9yeSBmb3IgYWxsIGZsYXNo
ZXMsIHJlZ2FyZGxlc3Mgb2YgdGhlaXIgdHlwZS4gSQo+ID4gZmluZCB0aGlzIHJlc3RyaWN0aW9u
IHVubmVjZXNzYXJ5LCBiZWNhdXNlIHdlIGNhbiBkaWZmZXJlbnRpYXRlIHRoZSBSV1cKPiA+IGZs
YXNoZXMgYnkgY2hlY2tpbmcgdGhlIFNOT1JfRl9SV1cgZmxhZy4gU28gdGhlIGFsdGVybmF0aXZl
IHRvIHRoaXMKPiA+IHBhdGNoIGlzIHRvIHJlbW92ZSB0aGUgbl9iYW5rcyByZXN0cmljdGlvbiBh
bmQgc2V0IGl0IGp1c3QgZm9yIHRoZSBSV1cKPiA+IGZsYXNoZXMuIEkgdGhpbmsgSSBwcmVmZXIg
dGhpcywgYnV0IGtlZXAgaW4gbWluZCB0aGF0IEkgbmV2ZXIgcmVhZCBhIFJXVwo+ID4gZmxhc2gn
cyBkYXRhc2hlZXQsIG5vdCBwdWJsaWNseSBhdmFpbGFibGUsIHNvIHRoZSBkZWNpc2lvbiBpcyBp
biB5b3VyCj4gPiBjb3VydC4gSGFwcHkgdG8gbWFrZSBhIHBhdGNoLiAgCj4gCj4gU2luY2UgdGhp
cyBpcyBjYXVzaW5nIGEgc2VyaW91cyByZWdyZXNzaW9uIGNhdXNpbmcgcGVvcGxlJ3MgbGFwdG9w
cyB0byBoYW5nCj4gb24gc3VzcGVuZCBJIGJlbGlldmUgaXQgd291bGQgYmUgYmVzdCB0byBxdWV1
ZSB1cCB0aGUgc2ltcGxlc3QgZml4IGZvcgo+IHRoaXMgKHdoaWNoIHNlZW1zIHRvIGJlIHRoaXMg
cGF0Y2ggYXMgaXMpIGZvciA2LjQgYXNhcC4KPiAKPiBBbnkgbW9yZSBpbnZvbHZlZCBjaGFuZ2Vz
IHRvIGZpeCB0aGlzIGluIGEgYmV0dGVyIHdheSBjYW4gdGhlbiBiZSBhZGRlZAo+IG9uIHRvcCBm
b3IgdGhlIDYuNSBjeWNsZS4KCkFic29sdXRlbHkuIEkgYWN0dWFsbHkgYW0gdG90YWxseSBmaW5l
IHdpdGggdGhlIGN1cnJlbnQgc3RhdGUsIEkKYmVsaWV2ZSBleHBlY3RpbmcgYWxsIGZsYXNoZXMg
dG8gaGF2ZSBvbmUgYmFuayBpcyBzYW5lLCB0aGF0J3Mgd2h5IEkKdG9vayB0aGlzIHBhdGggaW4g
dGhlIGZpcnN0IHBsYWNlLiBCdXQgdGhpcyBjYW4gYmUgY2hhbmdlZCBsYXRlcgphbnl3YXkuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
