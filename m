Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D68C25B4E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 08:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rwdy5Cr5/ObkJ1krVCvKn3s9uXtwS1PlyivUaTjU7uM=; b=h/bKqCYOfTaZBF
	ZNaujFwBjLW8zTrzSUZriFpnvJRfni54ARmrIa9VFS13L/p0Jc9b+ATTUgOl8XyC8m7KcBhGCPhY+
	CBiU+mY4hPkdF6Whski4RNOwGdLQH17yJ2t30vFq3vTacZcftaZ6kexq4B9ol///N3u1SuiYUr0EI
	biNCarT2ows/6fkd/NmdCvf8ZENjUVrAbhHFFkJHTwMFim3EkXRdzGiGJu7Ka/zFsdTxsgzwOeuUc
	ObYfim4f80FTK+0P/49YzTK6Tqbbs0wFQB8Drmhdtd7Uh7I+aqUJ1wTvX4iu3vY7Pz0Myt+7jsDxP
	3JdX5Xahw+HzQhjEkvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKF8N-002oeN-7S; Tue, 24 Jan 2023 08:58:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKF8J-002odW-L9
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 08:58:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2E3C2000A;
	Tue, 24 Jan 2023 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674550697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmnZsk65JXvZp7Rqk/PIKewJPv7ymgmrcWlk8yB8Rk0=;
	b=Rp4CuqMKc/DI3sotU7/qZPA/Mpe6vEVXRdwcgTngtFj2HTLtIfmXlhqtbNDPhWltXRcreH
	fDdbltlI501EfS804VtpUOvPUKpiDgok8G4XAOlVz1DYTM5m3RwAs9mVntSNpCToqKp9Pv
	X3lfLyyVCerl4HIlyNmHb17NPdoYqakvh5eImsfeVz9L2R9mXiwABpNCp2XuubdGDlNBkV
	6hAxWjmLMZtOdfY1b//LMQl3qgntg2luimBxPJMNX34X5LoykVcwiYx0oSKMvHkyTjv5bE
	nWF1/B8aN6aEvtoeXOCk5d8Bcx7LvJkqkBDmh2arY9/xfgoFF54TnEnmIHl63g==
Date: Tue, 24 Jan 2023 09:58:15 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Message-ID: <20230124095815.21d01af8@xps-13>
In-Reply-To: <Y8+ZxTu05BEu5knS@francesco-nb.int.toradex.com>
References: <20230113184547.487322-1-francesco@dolcini.it>
	<20230113184547.487322-2-francesco@dolcini.it>
	<9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
	<Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
	<06279fe3-a3b3-f3c4-276f-7cd0d4773875@denx.de>
	<Y8WQsIHXEDuJJuLd@francesco-nb.int.toradex.com>
	<0584cc0e-eacb-ce71-0317-27d10264d3bf@denx.de>
	<20230123105610.38034a11@xps-13>
	<Y8+ZxTu05BEu5knS@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_005824_147090_01EEEFAB 
X-CRM114-Status: GOOD (  25.51  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gVHVlLCAyNCBKYW4g
MjAyMyAwOTo0MTo0MSArMDEwMDoKCj4gSGVsbG8gTWlxdWVsLAo+IAo+IE9uIE1vbiwgSmFuIDIz
LCAyMDIzIGF0IDEwOjU2OjEwQU0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBtYXJl
eEBkZW54LmRlIHdyb3RlIG9uIFR1ZSwgMTcgSmFuIDIwMjMgMDE6NTk6NTQgKzAxMDA6Cj4gPiAg
IAo+ID4gPiBPbiAxLzE2LzIzIDE5OjAwLCBGcmFuY2VzY28gRG9sY2luaSB3cm90ZTogIAo+ID4g
PiA+IE9uIE1vbiwgSmFuIDE2LCAyMDIzIGF0IDA2OjU0OjQ0UE0gKzAxMDAsIE1hcmVrIFZhc3V0
IHdyb3RlOiAgICAKPiA+ID4gPj4gT24gMS8xNi8yMyAxNToyMCwgRnJhbmNlc2NvIERvbGNpbmkg
d3JvdGU6ICAgIAo+ID4gPiA+Pj4gT24gU3VuLCBKYW4gMTUsIDIwMjMgYXQgMDM6MzU6MjVQTSAr
MDEwMCwgTWFyZWsgVmFzdXQgd3JvdGU6ICAgIAo+ID4gPiA+Pj4+IE9uIDEvMTMvMjMgMTk6NDUs
IEZyYW5jZXNjbyBEb2xjaW5pIHdyb3RlOiAgICAKPiA+ID4gPj4+Pj4gRnJvbTogRnJhbmNlc2Nv
IERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+ID4gPiA+Pj4+Pgo+ID4g
PiA+Pj4+PiBGaXh1cCAjc2l6ZS1jZWxscyB2YWx1ZSB3aGVuIHVwZGF0aW5nIHRoZSBNVEQgcGFy
dGl0aW9ucywgdGhpcyBpcwo+ID4gPiA+Pj4+PiByZXF1aXJlZCB0byBwcmV2ZW50IGlzc3VlcyBp
biBjYXNlIHRoZSBNVEQgcGFyZW50IHNldCAjc2l6ZS1jZWxscyB0bwo+ID4gPiA+Pj4+PiB6ZXJv
Lgo+ID4gPiA+Pj4+PiBUaGlzIGNvdWxkIGhhcHBlbiBmb3IgZXhhbXBsZSBpbiB0aGUgbGVnYWN5
IGNhc2UgaW4gd2hpY2ggdGhlIHBhcnRpdGlvbnMKPiA+ID4gPj4+Pj4gYXJlIGNyZWF0ZWQgYXMg
ZGlyZWN0IGNoaWxkIG9mIHRoZSBtdGQgbm9kZSBhbmQgdGhhdCBzcGVjaWZpYyBub2RlIGhhcwo+
ID4gPiA+Pj4+PiBubyBjaGlsZHJlbi4gUmVjZW50IGNsZWFuLXVwIG9uIExpbnV4IGRldmljZSB0
cmVlIGZpbGVzIGNyZWF0ZWQgYSBib290Cj4gPiA+ID4+Pj4+IHJlZ3Jlc3Npb24gb24gY29saWJy
aS1pbXg3Lgo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+PiBUaGlzIGZpeHVwIGhhcyB0aGUgbGltaXRh
dGlvbiB0byBhc3N1bWUgMzItYml0ICgjc2l6ZS1jZWxscz0xKQo+ID4gPiA+Pj4+PiBhZGRyZXNz
aW5nLCB0aGVyZWZvcmUgaXQgd2lsbCBub3Qgd29yayB3aXRoIGRldmljZSBiaWdnZXIgdGhhbiA0
R2lCLgo+ID4gPiA+Pj4+Pgo+ID4gPiA+Pj4+PiBUaGlzIGNoYW5nZSBhbHNvIGVuZm9yY2UgI2Fk
ZHJlc3MtY2VsbHMgdG8gYmUgdGhlIHNhbWUgYXMgI3NpemUtY2VsbHMsCj4gPiA+ID4+Pj4+IHRo
aXMgd2FzIGFscmVhZHkgc2lsZW50bHkgZW5mb3JjZWQgYnkgZmR0X25vZGVfc2V0X3BhcnRfaW5m
bygpLCBub3cgdGhpcwo+ID4gPiA+Pj4+PiBpcyBjaGVja2VkIGV4cGxpY2l0bHkgYW5kIHBhcnRp
dGlvbiBmaXh1cCB3aWxsIGp1c3QgZmFpbCBpbiBzdWNoIGNhc2UuCj4gPiA+ID4+Pj4+Cj4gPiA+
ID4+Pj4+IEluIGdlbmVyYWwgYm9hcmQgc2hvdWxkIG5vdCBnZW5lcmFsbHkgbmVlZCBub3IgdXNl
IHRoaXMgZnVuY3Rpb25hbGl0eQo+ID4gPiA+Pj4+PiBhbmQgc2hvdWxkIGJlIGp1c3QgZGVwcmVj
YXRlZCwgcGFzc2luZyBtdGRwYXJ0cz0gaW4gdGhlIGtlcm5lbCBjb21tYW5kCj4gPiA+ID4+Pj4+
IGxpbmUgaXMgdGhlIHByZWZlcnJlZCB3YXkgYWNjb3JkaW5nIHRvIExpbnV4IE1URCBzdWJzeXN0
ZW0gbWFpbnRhaW5lci4gIAo+ID4gCj4gPiBKdXN0IHRvIGJlIGNsZWFyLCBJJ20gcGVyZmVjdGx5
IGZpbmUgd2l0aCB0aGUgcGFydGl0aW9ucyBiZWluZyBlaXRoZXIKPiA+IG9uIHRoZSBjbWRsaW5l
IG9yIGluIHRoZSBEVCB3aXRob3V0IHByZWZlcmVuY2UgKHdlbGwsIHRoZSBjbWRsaW5lIG9ubHkK
PiA+IHdvcmtzIHdpdGggdGhlIHNpbXBsZSBnZW5lcmljIHBhcnNlciwgYnV0IHdoYXRldmVyKS4g
V2hhdCBJIHJlYWxseQo+ID4gbWVhbnQgaXMgdGhhdCB0d2Vha2luZyB0aGUgRFQgZnJvbSBVLUJv
b3Qgc2hvdWxkIGJlIHJhcmUgYW5kIGluIG5vIGNhc2UKPiA+IHRoZSAicmlnaHQgdGhpbmcgdG8g
YWRkIHBhcnRpdGlvbnMiLiAgCj4gCj4gTWlxdWVsLCBzaG91bGQgSSBzZW5kIGEgdjIgdG8gY2xh
cmlmeSB0aGUgY29tbWl0IG1lc3NhZ2Ugb3IgeW91IGRvIG5vdAo+IG1pbmQga2VlcGluZyBpdCBh
cyBpdCBpcz8KCkkgdGhpbmsgaXQgaXMgd29ydGggbWVudGlvbmluZywgYWxzbyBhZGRpbmcgVG9t
J3MgcmVtYXJrOgotIERlc2NyaWJpbmcgdGhlIHBhcnRpdGlvbnMgb24gdGhlIGNtZGxpbmUgb3Ig
aW4gdGhlIERUIGlzIHRoZSByaWdodAogIHRoaW5nIHRvIGRvLgotIFR3ZWFraW5nIHRoZSBEVCB0
byBhZGQgc3RhdGljIHBhcnRpdGlvbnMgc2hvdWxkIGJlIGZvcmJpZGRlbi4KLSBJbiBzb21lIHJh
cmUgbGVnYWN5IGNhc2VzLCBkeW5hbWljIGNoYW5nZXMgdG8gdGhlIHBhcnRpdGlvbnMgbWlnaHQg
YmUKICB0b2xlcmF0ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
