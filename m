Return-Path: <SRS0=wdd2=GW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FC5C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 11:57:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2DB23104
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jan 2021 11:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2DB23104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hh1qO2vUfSet4LskNwcGvrFGSuzUVuFZLx6AmP2sgZM=; b=rvV/89OM8fg17nKxfTIlw52Wi
	HhTqtSxmALLpxa0Mv82KBeO3lOA13UxnVI6cyn3W2j9csnY0/4SP6lMjEPSqi+zO8lcwQyWlDlqxm
	VgEFBUaerTYLqfMw8QSmkkzhQ93LqlBclWor7cxZwDhS8D32m/y3imsYMeG2HLK2YyysrkJit3W5C
	Q37jS0kSKLioYouuhDt5z+eztIGc+8+4hkJCAa3tNXcMGHGkAm+tWdojYZmPFl7qUYNxy3dCNEr6t
	7UPOnyw4K8H8w3mUpa6/Qd0T+3W7ZBJCAbPgXFniI1gll8CFn4xRViLRIkkjud3EGWhYuyPKWjIM2
	uhvyTFfhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1pcs-0006Y7-AT; Tue, 19 Jan 2021 11:56:46 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1pcp-0006X3-IS
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2021 11:56:44 +0000
X-Originating-IP: 86.201.233.230
Received: from xps13 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr
 [86.201.233.230]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id D9F244000C;
 Tue, 19 Jan 2021 11:56:35 +0000 (UTC)
Date: Tue, 19 Jan 2021 12:56:34 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH 04/20] mtd: nand: ecc-bch: Stop exporting the private
 structure
Message-ID: <20210119125634.6d4c5c1e@xps13>
In-Reply-To: <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
References: <20200929230124.31491-1-miquel.raynal@bootlin.com>
 <20200929230124.31491-5-miquel.raynal@bootlin.com>
 <CAHCN7xLHAd8B_OgR2_vPFZZJ95mwNGR29dmqFeKhhSU9_y_imA@mail.gmail.com>
 <20210111112027.7cbda0ba@xps13> <20210112153534.5ba93cde@xps13>
 <CAHCN7xJCn8TD+T8pi5P=QMU=uZJ_LN1_wOEQON-noagf2H9+nw@mail.gmail.com>
 <CAHCN7xL-uzvKqBiYq6R3=-8wNT-V9DZX5ca2ZQ9Y_Wahh0_rAA@mail.gmail.com>
 <20210114164224.5d21c170@xps13>
 <CAHCN7xKYSPzW-Qbeqzqvey+=V9KiYcsy8uxJeW=2WRXUwAq0JA@mail.gmail.com>
 <CAHCN7x+pHusxQj+r0SN4KPD=ZgGg5fdLHZxasu54pPf0k4dVjA@mail.gmail.com>
 <20210115171736.1c837c29@xps13>
 <CAHCN7xKWBcuF0h5+brHndZCD5dFbbcxxZZxEPXRPVK7kZGbM1Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_065643_831582_7CD568F9 
X-CRM114-Status: GOOD (  21.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, ycllin@mxic.com.tw,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRhbSwKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRyb3VibGVzaG9vdGluZyB0aGlzLCBo
ZXJlIGlzIG15IHByb3Bvc2FsLgoKPiA+ID4gSSBhcHBlYXIgdG8gaGF2ZSB0aGUgTkFORCBmbGFz
aCB3b3JraW5nIHdpdGggdGhlIGZvbGxvd2luZyBwYXRjaDoKPiA+ID4KPiA+ID4gQEAgLTI0Nywx
MSArMjUzLDIxIEBAIGludCBuYW5kX2VjY19zd19iY2hfaW5pdF9jdHgoc3RydWN0IG5hbmRfZGV2
aWNlICpuYW5kKQo+ID4gPiAgICAgICAgIG5hbmQtPmVjYy5jdHgucHJpdiA9IGVuZ2luZV9jb25m
Owo+ID4gPiAgICAgICAgIG5hbmQtPmVjYy5jdHgudG90YWwgPSBuc3RlcHMgKiBjb2RlX3NpemU7
Cj4gPiA+Cj4gPiA+ICsgICAgICAgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5k
KG10ZCk7Cj4gPiA+ICsgICAgICAgY2hpcC0+ZWNjLnN0ZXBzID0gbnN0ZXBzOwo+ID4gPiArICAg
ICAgIGNoaXAtPmVjYy5zaXplID0gIGNvbmYtPnN0ZXBfc2l6ZTsKCkkgd2FzIGZlYXJpbmcgdGhh
dCBtYW55IGJvYXJkcyB3b3VsZCBiZSBhZmZlY3RlZCBieSB0aGlzIGlzc3VlIGJ1dCBpdAphcHBl
YXJzIHRoYXQgdGhlIHByb2JsZW0gd2lsbCBvbmx5IHNob3cgdXAgaGVyZSBiZWNhdXNlIHRoZSBP
TUFQIGRyaXZlcgptYWtlcyBhIHN0cmFuZ2UgdXNlIG9mIHRoZSBCQ0ggbGlicmFyeTogaXQgaW5p
dGlhbGl6ZXMgaXQgaXRzZWxmCmJlY2F1c2UgaXQgb25seSBuZWVkcyBpdCBmb3IgYSBzaW5nbGUg
b3BlcmF0aW9uIHdoaWxlIHVzdWFsbHksIHRoZSBjb3JlCmlzIGluIGNoYXJnZSBvZiBkb2luZyB0
aGF0LiBEdXJpbmcgdGhlIGluaXRpYWxpemF0aW9uLCB0aGUgT09CIGxheW91dAppcyB2ZXJpZmll
ZC4gVXN1YWxseSwgdGhlIEJDSCBkcml2ZXIgaXMgdXNlZCB3aXRoIG9uZSBvZiB0aGUgZ2VuZXJp
YyBPT0IKbGF5b3V0cywgd2hpbGUgaGVyZSB0aGUgT01BUCBkcml2ZXIgdXNlcyBpdHMgb3duLCB3
aGljaCByZWFkcyByYXcgTkFORApjaGlwIGVudHJpZXMuCgpJIHJlY2VudGx5IG1vdmVkIHRoZSBC
Q0ggZHJpdmVyIHRvIG9ubHkgdXNlICJnZW5lcmljIiBOQU5EIGJpdHMsIHdoaWNoCnByb2R1Y2Vk
IHRoZSBidWcgYmVjYXVzZSB0aGUgZW50cmllcyBkZXJpdmVkIGJ5IHRoZSBsYXlvdXQgaGVscGVy
cwpoYXZlIG5vdCBiZWVuIHVwZGF0ZWQgeWV0LgoKU28gdXNpbmcgcmF3IE5BTkQgYml0cyBpbiB0
aGUgQkNIIGRyaXZlciBpcyBub3QgYW4gb3B0aW9uIGhlcmUuCkluc3RlYWQsIEkgdGhpbmsgdGhl
IGJlc3Qgd2F5IHRvIGFkZHJlc3MgdGhpcyBpcyB0byBleHBvcnQgdGhlCmRlY2xhcmF0aW9uIG9m
IHRoZSBCQ0ggaW50ZXJuYWwgY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUgdG8gdGhlIE9NQVAKZHJp
dmVyIGFuZCB1c2UgdGhlIHJpZ2h0IHZhbHVlcywgcmVjZW50bHkgZGVyaXZlZCBieSB0aGUgZHJp
dmVyOgoKLS0tODwtLS0KCkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4KRGF0ZTogICBUdWUgSmFuIDE5IDEyOjI3OjA3IDIwMjEgKzAxMDAKCiAgICB3aXA6
IGZpeCBvbWFwCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21h
cDIuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMKaW5kZXggZmJiOTk1NWYyNDY3Li4y
YzNlNjVjYjY4ZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L29tYXAyLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYwpAQCAtMTUsNiArMTUsNyBAQAogI2luY2x1
ZGUgPGxpbnV4L2ppZmZpZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUg
PGxpbnV4L210ZC9tdGQuaD4KKyNpbmNsdWRlIDxsaW51eC9tdGQvbmFuZC1lY2Mtc3ctYmNoLmg+
CiAjaW5jbHVkZSA8bGludXgvbXRkL3Jhd25hbmQuaD4KICNpbmNsdWRlIDxsaW51eC9tdGQvcGFy
dGl0aW9ucy5oPgogI2luY2x1ZGUgPGxpbnV4L29tYXAtZG1hLmg+CkBAIC0xODY2LDE4ICsxODY3
LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgb21hcF9vb2JsYXlv
dXRfb3BzID0gewogc3RhdGljIGludCBvbWFwX3N3X29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9p
bmZvICptdGQsIGludCBzZWN0aW9uLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbXRkX29vYl9yZWdpb24gKm9vYnJlZ2lvbikKIHsKLSAgICAgICBzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwID0gbXRkX3RvX25hbmQobXRkKTsKKyAgICAgICBzdHJ1Y3QgbmFuZF9kZXZpY2Ug
Km5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOworICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX2Vj
Y19zd19iY2hfY29uZiAqZW5naW5lX2NvbmYgPSBuYW5kLT5lY2MuY3R4LnByaXY7CiAgICAgICAg
aW50IG9mZiA9IEJBREJMT0NLX01BUktFUl9MRU5HVEg7CiAKLSAgICAgICBpZiAoc2VjdGlvbiA+
PSBjaGlwLT5lY2Muc3RlcHMpCisgICAgICAgaWYgKHNlY3Rpb24gPj0gZW5naW5lX2NvbmYtPm5z
dGVwcykKICAgICAgICAgICAgICAgIHJldHVybiAtRVJBTkdFOwogCiAgICAgICAgLyoKICAgICAg
ICAgKiBXaGVuIFNXIGNvcnJlY3Rpb24gaXMgZW1wbG95ZWQsIG9uZSBPTUFQIHNwZWNpZmljIG1h
cmtlciBieXRlIGlzCiAgICAgICAgICogcmVzZXJ2ZWQgYWZ0ZXIgZWFjaCBFQ0Mgc3RlcC4KICAg
ICAgICAgKi8KLSAgICAgICBvb2JyZWdpb24tPm9mZnNldCA9IG9mZiArIChzZWN0aW9uICogKGNo
aXAtPmVjYy5ieXRlcyArIDEpKTsKLSAgICAgICBvb2JyZWdpb24tPmxlbmd0aCA9IGNoaXAtPmVj
Yy5ieXRlczsKKyAgICAgICBvb2JyZWdpb24tPm9mZnNldCA9IG9mZiArIChzZWN0aW9uICogKGVu
Z2luZV9jb25mLT5jb2RlX3NpemUgKyAxKSk7CisgICAgICAgb29icmVnaW9uLT5sZW5ndGggPSBl
bmdpbmVfY29uZi0+Y29kZV9zaXplOwogCiAgICAgICAgcmV0dXJuIDA7CiB9CkBAIC0xODg1LDcg
KzE4ODcsOCBAQCBzdGF0aWMgaW50IG9tYXBfc3dfb29ibGF5b3V0X2VjYyhzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwgaW50IHNlY3Rpb24sCiBzdGF0aWMgaW50IG9tYXBfc3dfb29ibGF5b3V0X2ZyZWUo
c3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpvb2JyZWdpb24pCiB7Ci0gICAgICAg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9IG10ZF90b19uYW5kKG10ZCk7CisgICAgICAgc3RydWN0
IG5hbmRfZGV2aWNlICpuYW5kID0gbXRkX3RvX25hbmRkZXYobXRkKTsKKyAgICAgICBjb25zdCBz
dHJ1Y3QgbmFuZF9lY2Nfc3dfYmNoX2NvbmYgKmVuZ2luZV9jb25mID0gbmFuZC0+ZWNjLmN0eC5w
cml2OwogICAgICAgIGludCBvZmYgPSBCQURCTE9DS19NQVJLRVJfTEVOR1RIOwogCiAgICAgICAg
aWYgKHNlY3Rpb24pCkBAIC0xODk1LDcgKzE4OTgsNyBAQCBzdGF0aWMgaW50IG9tYXBfc3dfb29i
bGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogICAgICAgICAq
IFdoZW4gU1cgY29ycmVjdGlvbiBpcyBlbXBsb3llZCwgb25lIE9NQVAgc3BlY2lmaWMgbWFya2Vy
IGJ5dGUgaXMKICAgICAgICAgKiByZXNlcnZlZCBhZnRlciBlYWNoIEVDQyBzdGVwLgogICAgICAg
ICAqLwotICAgICAgIG9mZiArPSAoKGNoaXAtPmVjYy5ieXRlcyArIDEpICogY2hpcC0+ZWNjLnN0
ZXBzKTsKKyAgICAgICBvZmYgKz0gKChlbmdpbmVfY29uZi0+Y29kZV9zaXplICsgMSkgKiBlbmdp
bmVfY29uZi0+bnN0ZXBzKTsKICAgICAgICBpZiAob2ZmID49IG10ZC0+b29ic2l6ZSkKICAgICAg
ICAgICAgICAgIHJldHVybiAtRVJBTkdFOwogCi0tLT44LS0tCgpDYW4geW91IHBsZWFzZSB0cnkg
dGhpcyBwYXRjaCBhbmQgY29tcGFyZSB0aGUgdmFsdWVzIGJldHdlZW4geW91ciBoYWNrCmFuZCBt
aW5lIG9mOgotIGNoaXAtPmVjYy5ieXRlcyB2cy4gZW5naW5lX2NvbmYtPmNvZGVfc2l6ZQotIGNo
aXAtPmVjYy5zdGVwcyB2cy4gZW5naW5lX2NvbmYtPm5zdGVwcwpUaGUgdmFsdWVzIHNob3VsZCBi
ZSB0aGUgc2FtZSwgYnV0IEkgcHJlZmVyIHRvIGJlIHN1cmUuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
