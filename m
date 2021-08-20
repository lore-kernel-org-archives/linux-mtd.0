Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B3DC4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:10:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA08D60EB5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA08D60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbWDzHs5lQ0zeNu3TFNPmFH9Y83UpWGxXqitPkxQ+Ow=; b=VWEYNQwhb3cr41
	buz0kPU8en7GQGTZ4Lgd6dOLDsC1sQBBkI+PJiXXFEKfxTw0KDicuMynLyjHjg/0i86R9yTNQd1vq
	b/9yiJJzFK91vmWlOurBgEe8mFafDyRaiWagq7xhrLvsEnbCpwGnkCKx3hQvxLkzA/4ISFK2gyI8A
	Fp62RQe5is0XRjEQ3KS9mNJATBvufPtqLMEEwi1rry3xdL12Kh2tRqVUC4Asbmici+BlLDME6D/RP
	kflOvOqPoziFzCD7yk4A2SqYUyWKNQuoRIsHLjLCR0GiOMaYFe0y3zj04eWpIHEUlhTc6w51VpVFm
	UB/dPPf+7vTp184qQudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3Ln-00B4Mn-BA; Fri, 20 Aug 2021 12:10:19 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3KI-00B438-Ms
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:08:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3587A240007;
 Fri, 20 Aug 2021 12:08:40 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:08:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO
 protocol using reg_proto
Message-ID: <20210820140840.4bbcac7e@xps13>
In-Reply-To: <3de32033-2a6e-bc46-a65a-4027ce78c6d6@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-4-a-nandan@ti.com>
 <20210806203013.30a41fd5@xps13>
 <3de32033-2a6e-bc46-a65a-4027ce78c6d6@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_050846_959072_AB66DBD5 
X-CRM114-Status: GOOD (  23.03  )
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

SGkgQXB1cnZhLAoKQm9yaXMsIHlvdSBtaWdodCBoYXZlIGEgZ29vZCBpZGVhIGZvciB0aGUgbmFt
aW5nIGRpc2N1c3NlZCBiZWxvdz8KCkFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4gd3Jv
dGUgb24gRnJpLCAyMCBBdWcgMjAyMSAxNToyMjo1NAorMDUzMDoKCj4gSGkgTWlxdcOobCwKPiAK
PiBPbiAwNy8wOC8yMSAxMjowMCBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIEFwdXJ2
YSwKPiA+IAo+ID4gQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUs
IDEzIEp1bCAyMDIxIDEzOjA1OjI4Cj4gPiArMDAwMDoKPiA+ICAgCj4gPj4gQ3VycmVudGx5LCB0
aGUgb3AgbWFjcm9zIGluIHNwaW5hbmQuaCBkb24ndCBnaXZlIHRoZSBvcHRpb24gdG8gc2V0dXAK
PiA+PiBhbnkgbm9uLWFycmF5IGFjY2VzcyBpbnN0cnVjdGlvbnMgZm9yIER1YWwvUXVhZC9PY3Rh
bCBEVFIgU1BJIGJ1cy4KPiA+PiBIYXZpbmcgYSBmdW5jdGlvbiB0aGF0IHNldHVwcyB0aGUgb3Ag
YmFzZWQgb24gcmVnX3Byb3RvIHdvdWxkIGJlCj4gPj4gYmV0dGVyIHRoYW4gdHJ5aW5nIHRvIHdy
aXRlIGFsbCB0aGUgc2V0dXAgbG9naWMgaW4gb3AgbWFjcm9zLgo+ID4+Cj4gPj4gQ3JlYXRlIGEg
c3BpbWVtX3NldHVwX29wKCkgdGhhdCB3b3VsZCBzZXR1cCBjbWQsIGFkZHIsIGR1bW15IGFuZCBk
YXRhCj4gPj4gcGhhc2Ugb2YgdGhlIHNwaV9tZW0gb3AsIGZvciB0aGUgZ2l2ZW4gc3BpbmFuZC0+
cmVnX3Byb3RvLiBBbmQgaGVuY2UsCj4gPj4gY2FsbCB0aGUgc3BpbWVtX3NldHVwX29wKCkgYmVm
b3JlIGV4ZWN1dGluZyBhbnkgc3BpX21lbSBvcC4KPiA+Pgo+ID4+IE5vdGU6IEluIHRoaXMgY29t
bWl0LCBzcGltZW1fc2V0dXBfb3AoKSBpc24ndCBjYWxsZWQgaW4gdGhlCj4gPj4gcmVhZF9yZWdf
b3AoKSwgd3JpdGVfcmVnX29wKCkgYW5kIHdhaXQoKSBmdW5jdGlvbnMsIGFzIHRoZXkgbmVlZAo+
ID4+IG1vZGlmaWNhdGlvbnMgaW4gYWRkcmVzcyB2YWx1ZSBhbmQgZGF0YSBuYnl0ZXMgd2hlbiBp
biBPY3RhbCBEVFIgbW9kZS4KPiA+PiBUaGlzIHdpbGwgYmUgZml4ZWQgaW4gYSBsYXRlciBjb21t
aXQuICAKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGlzIHNlcmllcyEKPiA+IAo+ID4gU28gZmFyIEkg
YW0gZmluZSB3aXRoIHlvdXIgY2hhbmdlcywgYnV0IEkgZG9uJ3QgbGlrZSB0aGUgc2V0dXBfb3Ao
KQo+ID4gbmFtaW5nIG11Y2guIEkgZG9uJ3QgeWV0IGhhdmUgYSBiZXR0ZXIgaWRlYSwgY291bGQg
eW91IHByb3Bvc2UKPiA+IHNvbWV0aGluZyBtb3JlIG1lYW5pbmdmdWw/Cj4gPiAgIAo+IAo+IEkg
bWFkZSB0aGlzIHNpbWlsYXIgdG8gdGhlIHNwaV9ub3Jfc3BpbWVtX3NldHVwX29wKCksIHdoaWNo
IGVzc2VudGlhbGx5IGRvZXMgdGhlIHNhbWUgdGFzayBhcyB0aGlzIGluIHRoZSBzcGktbm9yIGNv
cmUuCj4gCj4gT3RoZXIgbmFtZXMgdGhhdCBJIGNhbiB0aGluayBvZiBhcmU6Cj4gCj4gLSBjb25m
aWdfb3AoKSwgYWRqdXN0X29wKCksIGFtZW5kX29wKCksIHBhdGNoX29wKCkKPiAKPiBvcgo+IAo+
IC0gaGFuZGxlX29wX3ZhcmlhdGlvbnMoKSwgYXBwbHlfb3BfdmFyaWF0aW9ucygpCj4gCj4gV2hh
dCBkbyB5b3Ugc3VnZ2VzdD8KPiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBcHVydmEgTmFuZGFuIDxh
LW5hbmRhbkB0aS5jb20+ICAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobAo+ID4gCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+ID4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4gPiAgIAo+IFRoYW5rcywKPiBB
cHVydmEgTmFuZGFuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
