Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EF4C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F9661053
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 11:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9F9661053
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stg6rcqoKTOKxF4WF29IqCI/jcqnYCOmqyGl+N/DbsU=; b=uvV6jP7hAEhkjUIfLQ8uBmdIGx
	G/lglc6SDkkB7lfwBXytTXQGdcYjXGZVW7k7/v915XM+abOpWQo4tAQRqh5p7RnlJUCwyP8qvpTHS
	YA2W+gB2W7i82QYuYQpOlix0tcueG9L9/EH7RX/HfWVQqBmZsMcfHJs09+EnHkzExUpeyy/Xxkx/z
	3vEpnis+WFn5VsQ9m54owkKXPX79vU6oOef8VHTo2r/r8pv3RVURIWXxWqi9XgrGOgn/k37WzvtLL
	9rwh7WcO0RGTwzy2EYfU2OQiS2iVWtyZc5fxr3u9XfO4ubykjTx0kiiaG/zEzlkfkCjqbJ48EMGKU
	MRU6sPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2rE-00AvBT-OW; Fri, 20 Aug 2021 11:38:44 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2fy-00AqbJ-Ju
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 11:27:10 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KBQuZE119613;
 Fri, 20 Aug 2021 06:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629458816;
 bh=blrgn41yMQlxOpCV/VPuXs84NzoE3cc6qLpb8S94VE4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=swjkvz54exp+Wi8TBkY4OTQeimFIS/ZAQdEWw/vHHso+agYXhpWiR550eC656sl3t
 XiWTMU8DWzoRHLsb2tUralWWqGBjzuP0NdGP2cGuV6cQ/yJ7aqk5+REsNCED7UM6OJ
 p5g+gjNafB2qlViDVgxuC5tFSTpmCY4zvPEkQdCE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KBQuue098116
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Aug 2021 06:26:56 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 06:26:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 06:26:55 -0500
Received: from [10.250.232.95] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KBQpoU097699;
 Fri, 20 Aug 2021 06:26:52 -0500
Subject: Re: [PATCH 08/13] mtd: spinand: Reject 8D-8D-8D op_templates if
 octal_dtr_enale() is missing in manufacturer_op
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-9-a-nandan@ti.com> <20210806210146.3358a85b@xps13>
From: Apurva Nandan <a-nandan@ti.com>
Message-ID: <4d428465-59d7-6771-8344-c5090add2a06@ti.com>
Date: Fri, 20 Aug 2021 16:56:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806210146.3358a85b@xps13>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_042706_861998_A3326E4B 
X-CRM114-Status: GOOD (  26.10  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwNy8wOC8yMSAxMjozMSBhbSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBBcHVydmEs
Cj4gCj4gQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBUdWUsIDEzIEp1
bCAyMDIxIDEzOjA1OjMzCj4gKzAwMDA6Cj4gCj4+IFRoZSBTUEkgTkFORCBjb3JlIGRvZXNuJ3Qg
a25vdyBob3cgdG8gc3dpdGNoIHRoZSBmbGFzaCB0byBPY3RhbCBEVFIKPj4gbW9kZSAoaS5lLiB3
aGljaCBvcGVyYXRpb25zIHRvIHBlcmZvcm0pLiBJZiB0aGUgbWFudWZhY3R1cmVyIGhhc24ndAo+
PiBpbXBsZW1lbnRlZCB0aGUgb2N0YWxfZHRyX2VuYWJsZSgpIG1hbnVmYWN0dXJlcl9vcCwgdGhl
IFNQSSBOQU5EIGNvcmUKPj4gd291bGRuJ3QgYmUgYWJsZSB0byBzd2l0Y2ggdG8gOEQtOEQtOEQg
bW9kZSBhbmQgd2lsbCBhbHNvIG5vdCBiZSBhYmxlCj4+IHRvIHJ1biBpbiAxUy0xUy0xUyBtb2Rl
IGR1ZSB0byBhbHJlYWR5IHNlbGVjdGVkIDhELThELThEIHJlYWQvd3JpdGUKPj4gY2FjaGUgb3Bf
dGVtcGxhdGVzLgo+Pgo+PiBTbywgYXZvaWQgY2hvb3NpbmcgYSBPY3RhbCBEVFIgU1BJIG9wX3Rl
bXBsYXRlIGZvciByZWFkX2NhY2hlLAo+PiB3cml0ZV9jYWNoZSBhbmQgdXBkYXRlX2NhY2hlIG9w
ZXJhdGlvbnMsIGlmIHRoZSBtYW51ZmFjdHVyZXJfb3AKPj4gb2N0YWxfZHRyX2VuYWJsZSgpIGlz
IG1pc3NpbmcuCj4gCj4gQWZ0ZXIgbG9va2luZyBhdCB5b3VyIHByZXZpb3VzIGNvbW1pdCBJIGRv
bid0IHNlZSB3aHkgdGhpcyBwYXRjaCB3b3VsZAo+IGJlIG5lZWRlZC4gb2N0YWxfZHRyX2VuYWJs
ZSgpIG9ubHkgdXBkYXRlcyB0aGUgbW9kZSB3aGVuIGl0IHN1Y2NlZWRzIHNvCj4gSSBkb24ndCB0
aGluayB0aGlzIHBhdGNoIGlzIHJlYWxseSBuZWVkZWQuCj4gCgpJIGFkZGVkIGl0IHRvIHByZXZl
bnQgYW55IGVycm9ycyBoYXBwZW5pbmcgZHVlcyB0byBhIG1pc3NpbmcgCmltcGxlbWVudGF0aW9u
IG9mIG9jdGFsX2R0cl9lbmFibGUoKSBmcm9tIG1hbnVmYWN0dXJlciBkcml2ZXIgc2lkZS4KU28s
IGlmIHRoZSBtYW51ZmFjdHVyZXJzIHNraXBzIHRoZSBvY3RhbF9kdHJfZW5hYmxlKCkgaW1wbGVt
ZW50YXRpb24sIHdlIAp3YW50IHRoZSBzcGluYW5kIGNvcmUgdG8gcnVuIGluIDFzLTFzLTFzIG1v
ZGUuCgpSZWFkL3dyaXRlL3VwZGF0ZSBvcCB2YXJpYW50IHNlbGVjdGlvbiBoYXBwZW5zIGluIHNl
bGVjdF9vcF92YXJpYW50KCksIAptdWNoIGJlZm9yZSBvY3RhbF9kdHJfZW5hYmxlKCkuIFNvIGp1
c3QgY2hlY2sgaWYgdGhlcmUgaXMgYSBkZWZpbml0aW9uIApvZiBvY3RhbF9kdHJfZW5hYmxlIGlu
IG1hbnVmYWN0dXJlciBvcHMgYW5kIHRoZW4gb25seSB1c2UgOEQgb3AgdmFyaWFudHMuCgpSZW1v
dmluZyB0aGlzIHdvdWxkbid0IGJyZWFrIGFueXRoaW5nIGluIHRoZSBjdXJyZW50IGltcGxlbWVu
dGF0aW9uLgpEbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgdGhpcz8KCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgNyArKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+IGluZGV4
IDE5ZDhhZmZhYzA1OC4uODcxMWU4ODdiNzk1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3NwaS9jb3JlLmMKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4+IEBA
IC0xMDI4LDYgKzEwMjgsOCBAQCBzdGF0aWMgaW50IHNwaW5hbmRfbWFudWZhY3R1cmVyX21hdGNo
KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCwKPj4gICAJCWlmIChpZFswXSAhPSBtYW51
ZmFjdHVyZXItPmlkKQo+PiAgIAkJCWNvbnRpbnVlOwo+PiAgIAo+PiArCQlzcGluYW5kLT5tYW51
ZmFjdHVyZXIgPSBtYW51ZmFjdHVyZXI7Cj4+ICsKPj4gICAJCXJldCA9IHNwaW5hbmRfbWF0Y2hf
YW5kX2luaXQoc3BpbmFuZCwKPj4gICAJCQkJCSAgICAgbWFudWZhY3R1cmVyLT5jaGlwcywKPj4g
ICAJCQkJCSAgICAgbWFudWZhY3R1cmVyLT5uY2hpcHMsCj4+IEBAIC0xMDM1LDcgKzEwMzcsNiBA
QCBzdGF0aWMgaW50IHNwaW5hbmRfbWFudWZhY3R1cmVyX21hdGNoKHN0cnVjdCBzcGluYW5kX2Rl
dmljZSAqc3BpbmFuZCwKPj4gICAJCWlmIChyZXQgPCAwKQo+PiAgIAkJCWNvbnRpbnVlOwo+PiAg
IAo+PiAtCQlzcGluYW5kLT5tYW51ZmFjdHVyZXIgPSBtYW51ZmFjdHVyZXI7Cj4+ICAgCQlyZXR1
cm4gMDsKPj4gICAJfQo+PiAgIAlyZXR1cm4gLUVOT1RTVVBQOwo+PiBAQCAtMTA5Nyw2ICsxMDk4
LDEwIEBAIHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpz
cGluYW5kLAo+PiAgIAkJdW5zaWduZWQgaW50IG5ieXRlczsKPj4gICAJCWludCByZXQ7Cj4+ICAg
Cj4+ICsJCWlmIChzcGluYW5kX29wX2lzX29jdGFsX2R0cigmb3ApICYmCj4+ICsJCSAgICAhc3Bp
bmFuZC0+bWFudWZhY3R1cmVyLT5vcHMtPm9jdGFsX2R0cl9lbmFibGUpCj4+ICsJCQljb250aW51
ZTsKPj4gKwo+PiAgIAkJbmJ5dGVzID0gbmFuZGRldl9wZXJfcGFnZV9vb2JzaXplKG5hbmQpICsK
Pj4gICAJCQkgbmFuZGRldl9wYWdlX3NpemUobmFuZCk7Cj4+ICAgCj4gCj4gVGhhbmtzLAo+IE1p
cXXDqGwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KPiAKClRoYW5rcywK
QXB1cnZhIE5hbmRhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
