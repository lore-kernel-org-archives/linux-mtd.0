Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE22FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t91lDGAaMMgA4SNbIVEc57O+M2dnnt81JbOI2tZmPFE=; b=4uAhKsIrd/wRYt
	wf5FgtOJ4k0SxGdAxqn9ZHfdAGDnPfezf8La4OqmzflRMEaj/jIg1CpNSVibiyryFNoY38sPHwoy2
	Pxv3hmLpPQje9cLcdxL/B+Ge4zHUz6thLmc39PDoNUr/lsTHPKz7LwfwcxGRAmhtFTCDybSYk6NE6
	sV94eWMBuDz6VaZFhl+8dZkwOIYuOqXt23S9fn6CnS9pVCsRZBDLVqxRdnVnCnlmBk6+B2TyjdIG7
	06RQpFr4I6HGRxZ5DL7g3CamywDFH1ASBi0CgmEFikwAc06eeexDiq1jFkB5vqoCNF5jyAup5ak5A
	fLeYq+jogKDTkb2zdVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0FM-003Vvd-UK; Tue, 15 Feb 2022 16:00:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzqN-003JhW-LA
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 15:34:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FFXwV8039094;
 Tue, 15 Feb 2022 09:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644939238;
 bh=h/zYlGUEcc55g9uDoWcPM6icynXj9sCfC3wz2wPbMlI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=HkQhHlHz4evf9qkhvc1KP9o7Ynwyec/ugo97uiN1mhCCOCqfCJVQammQpVOjTS+Pf
 Be7nyf9Kk3bhynTxrb+JuvjvhIfXw54EG6SmrUFJn6aiJ+dprtX1veGYvMc5Kj4q9o
 pV6eT63AzQbHDrzhP+yLG/FtdjSOfeXWLkcruMpU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FFXw47061286
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 09:33:58 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 09:33:58 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 09:33:58 -0600
Received: from [10.250.233.196] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FFXqVL025861;
 Tue, 15 Feb 2022 09:33:53 -0600
Message-ID: <bf3ea909-e0a5-eeac-12e9-c8a809685f48@ti.com>
Date: Tue, 15 Feb 2022 21:03:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 05/17] mtd: spinand: Define ctrl_ops for non-page
 read/write op templates
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Daniel Palmer
 <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
References: <20220101074250.14443-1-a-nandan@ti.com>
 <20220101074250.14443-6-a-nandan@ti.com>
 <20220103110107.45594e78@collabora.com>
From: Apurva Nandan <a-nandan@ti.com>
In-Reply-To: <20220103110107.45594e78@collabora.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073419_905804_741F78FA 
X-CRM114-Status: GOOD (  26.97  )
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

SGkgQm9yaXMsCgpPbiAwMy8wMS8yMiAxNTozMSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IE9u
IFNhdCwgMSBKYW4gMjAyMiAxMzoxMjozOCArMDUzMAo+IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFu
QHRpLmNvbT4gd3JvdGU6Cj4KPj4gJ2N0cmxfb3BzJyBhcmUgb3AgdGVtcGxhdGVzIGZvciBub24t
cGFnZSByZWFkL3dyaXRlIG9wZXJhdGlvbnMsCj4+IHdoaWNoIGFyZTogcmVzZXQsIGdldF9mZWF0
dXJlLCBzZXRfZmVhdHVyZSwgd3JpdGVfZW5hYmxlLCBibG9ja19lcmFzZSwKPj4gcGFnZV9yZWFk
IGFuZCBwcm9ncmFtX2V4ZWN1dGUgb3BzLiBUaGUgJ2N0cmxfb3BzJyBzdHJ1Y3QgY29udGFpbnMg
aW4gaXQKPj4gb3AgdGVtcGxhdGVzIGZvciBlYWNoIG9mIHRoaXMgb3AsIGFzIHdlbGwgYXMgZW51
bSBzcGluYW5kX3Byb3RvY29sCj4+IGRlbm90aW5nIHByb3RvY29sIG9mIGFsbCB0aGVzZSBvcHMu
Cj4+Cj4+IFdlIHJlcXVpcmUgdGhlc2UgbmV3IG9wIHRlbXBsYXRlcyBiZWNhdXNlIG9mIGRldmlh
dGlvbiBpbiBzdGFuZGFyZAo+PiBTUElOQU5EIG9wcyBieSBtYW51ZmFjdHVyZXJzIGFuZCBhbHNv
IGR1ZSB0byBjaGFuZ2VzIHdoZW4gdGhlcmUgaXMgYQo+PiBjaGFuZ2UgaW4gU1BJIHByb3RvY29s
L21vZGUuIFRoaXMgcHJldmVudHMgdGhlIGNvcmUgZnJvbSBsaXZlLXBhdGNoaW5nCj4+IGFuZCB2
ZW5kb3Itc3BlY2lmaWMgYWRqdXN0bWVudHMgaW4gb3BzLgo+Pgo+PiBEZWZpbmUgJ2N0cmxfb3Bz
JywgYWRkIG1hY3JvcyB0byBpbml0aWFsaXplIGl0IGFuZCBhZGQgaXQgaW4KPj4gc3BpbmFuZF9k
ZXZpY2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNv
bT4KPj4gLS0tCj4+ICAgaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oIHwgMzMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaCBiL2lu
Y2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+PiBpbmRleCA0MzlkOGNlNDBlMWQuLmU1ZGY2MjIw
ZWMxZSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvc3BpbmFuZC5oCj4+ICsrKyBi
L2luY2x1ZGUvbGludXgvbXRkL3NwaW5hbmQuaAo+PiBAQCAtMzU2LDYgKzM1NiwzNSBAQCBzdHJ1
Y3Qgc3BpbmFuZF9vcF92YXJpYW50cyB7Cj4+ICAgCQkJc2l6ZW9mKHN0cnVjdCBzcGlfbWVtX29w
KSwJCQlcCj4+ICAgCX0KPj4gICAKPj4gK3N0cnVjdCBzcGluYW5kX2N0cmxfb3BzIHsKPj4gKwlj
b25zdCBzdHJ1Y3Qgewo+PiArCQlzdHJ1Y3Qgc3BpX21lbV9vcCByZXNldDsKPj4gKwkJc3RydWN0
IHNwaV9tZW1fb3AgZ2V0X2ZlYXR1cmU7Cj4+ICsJCXN0cnVjdCBzcGlfbWVtX29wIHNldF9mZWF0
dXJlOwo+PiArCQlzdHJ1Y3Qgc3BpX21lbV9vcCB3cml0ZV9lbmFibGU7Cj4+ICsJCXN0cnVjdCBz
cGlfbWVtX29wIGJsb2NrX2VyYXNlOwo+PiArCQlzdHJ1Y3Qgc3BpX21lbV9vcCBwYWdlX3JlYWQ7
Cj4+ICsJCXN0cnVjdCBzcGlfbWVtX29wIHByb2dyYW1fZXhlY3V0ZTsKPj4gKwl9IG9wczsKPj4g
Kwljb25zdCBlbnVtIHNwaW5hbmRfcHJvdG9jb2wgcHJvdG9jb2w7Cj4gRG8geW91IHJlYWxseSBu
ZWVkIHRoYXQgcHJvdG9jb2wgZmllbGQ/Cj4KPj4gK307Cj4+ICsKPj4gKyNkZWZpbmUgU1BJTkFO
RF9DVFJMX09QUyhfX3Byb3RvY29sLCBfX3Jlc2V0LCBfX2dldF9mZWF0dXJlLCBfX3NldF9mZWF0
dXJlLAlcCj4+ICsJCQkgX193cml0ZV9lbmFibGUsIF9fYmxvY2tfZXJhc2UsIF9fcGFnZV9yZWFk
LAkJXAo+PiArCQkJIF9fcHJvZ3JhbV9leGVjdXRlKQkJCQkJXAo+PiArCXsJCQkJCQkJCQlcCj4+
ICsJCS5vcHMgPSB7CQkJCQkJCVwKPj4gKwkJCS5yZXNldCA9IF9fcmVzZXQsCQkJCQlcCj4+ICsJ
CQkuZ2V0X2ZlYXR1cmUgPSBfX2dldF9mZWF0dXJlLAkJCQlcCj4+ICsJCQkuc2V0X2ZlYXR1cmUg
PSBfX3NldF9mZWF0dXJlLAkJCQlcCj4+ICsJCQkud3JpdGVfZW5hYmxlID0gX193cml0ZV9lbmFi
bGUsCQkJCVwKPj4gKwkJCS5ibG9ja19lcmFzZSA9IF9fYmxvY2tfZXJhc2UsCQkJCVwKPj4gKwkJ
CS5wYWdlX3JlYWQgPSBfX3BhZ2VfcmVhZCwJCQkJXAo+PiArCQkJLnByb2dyYW1fZXhlY3V0ZSA9
IF9fcHJvZ3JhbV9leGVjdXRlLAkJCVwKPj4gKwkJfSwJCQkJCQkJCVwKPj4gKwkJLnByb3RvY29s
ID0gX19wcm90b2NvbCwJCQkJCQlcCj4+ICsJfQo+PiArCj4+ICAgLyoqCj4+ICAgICogc3BpbmFu
ZF9lY2NfaW5mbyAtIGRlc2NyaXB0aW9uIG9mIHRoZSBvbi1kaWUgRUNDIGltcGxlbWVudGVkIGJ5
IGEgU1BJIE5BTkQKPj4gICAgKgkJICAgICAgY2hpcAo+PiBAQCAtNDY4LDYgKzQ5Nyw4IEBAIHN0
cnVjdCBzcGluYW5kX2Rpcm1hcCB7Cj4+ICAgICogQGRhdGFfb3BzLnJlYWRfY2FjaGU6IHJlYWQg
Y2FjaGUgb3AgdGVtcGxhdGUKPj4gICAgKiBAZGF0YV9vcHMud3JpdGVfY2FjaGU6IHdyaXRlIGNh
Y2hlIG9wIHRlbXBsYXRlCj4+ICAgICogQGRhdGFfb3BzLnVwZGF0ZV9jYWNoZTogdXBkYXRlIGNh
Y2hlIG9wIHRlbXBsYXRlCj4+ICsgKiBAY3RybF9vcHM6IHZhcmlvdXMgU1BJIG1lbSBvcCB0ZW1w
bGF0ZXMgZm9yIGhhbmRsaW5nIHRoZSBmbGFzaCBkZXZpY2UsIGkuZS4KPj4gKyAqCSAgICAgIG5v
biBwYWdlLXJlYWQvd3JpdGUgb3BzLgo+PiAgICAqIEBzZWxlY3RfdGFyZ2V0OiBzZWxlY3QgYSBz
cGVjaWZpYyB0YXJnZXQvZGllLiBVc3VhbGx5IGNhbGxlZCBiZWZvcmUgc2VuZGluZwo+PiAgICAq
CQkgICBhIGNvbW1hbmQgYWRkcmVzc2luZyBhIHBhZ2Ugb3IgYW4gZXJhc2VibG9jayBlbWJlZGRl
ZCBpbgo+PiAgICAqCQkgICB0aGlzIGRpZS4gT25seSByZXF1aXJlZCBpZiB5b3VyIGNoaXAgZXhw
b3NlcyBzZXZlcmFsIGRpZXMKPj4gQEAgLTQ5OCw2ICs1MjksOCBAQCBzdHJ1Y3Qgc3BpbmFuZF9k
ZXZpY2Ugewo+PiAgIAkJY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKnVwZGF0ZV9jYWNoZTsKPj4g
ICAJfSBkYXRhX29wczsKPj4gICAKPj4gKwljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9jdHJsX29wcyAq
Y3RybF9vcHM7Cj4+ICsKPiBPa2F5LCBJIGhhZCBzb21ldGhpbmcgc2xpZ2h0bHkgZGlmZmVyZW50
IGluIG1pbmQuIEZpcnN0LCBJJ2QgcHV0IGFsbAo+IHRlbXBsYXRlcyBpbiBhIHN0cnVjdDoKPgo+
IHN0cnVjdCBzcGluYW5kX29wX3RlbXBsYXRlcyB7Cj4gCWNvbnN0IHN0cnVjdCBzcGlfbWVtX29w
ICpyZWFkX2NhY2hlOwo+IAljb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqd3JpdGVfY2FjaGU7Cj4g
CWNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICp1cGRhdGVfY2FjaGU7Cj4gCWNvbnN0IHN0cnVjdCBz
cGlfbWVtX29wICpyZXNldDsKPiAJY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKmdldF9mZWF0dXJl
Owo+IAljb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqc2V0X2ZlYXR1cmU7Cj4gCWNvbnN0IHN0cnVj
dCBzcGlfbWVtX29wICp3cml0ZV9lbmFibGU7Cj4gCWNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpi
bG9ja19lcmFzZTsKPiAJY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKnBhZ2VfbG9hZDsKPiAJY29u
c3Qgc3RydWN0IHNwaV9tZW1fb3AgKnByb2dyYW1fZXhlY3V0ZTsKPiB9Owo+Cj4gVGhlbiwgYXQg
dGhlIHNwaW5hbmQgbGV2ZWwsIEknZCBkZWZpbmUgYW4gYXJyYXkgb2YgdGVtcGxhdGVzOgo+Cj4g
ZW51bSBzcGluYW5kX3Byb3RvY29sIHsKPiAJU1BJTkFORF8xU18xU18xUywKPiAJU1BJTkFORF8y
U18yU18yUywKPiAJU1BJTkFORF80U180U180UywKPiAJU1BJTkFORF84U184U184UywKPiAJU1BJ
TkFORF84RF84RF84RCwKPiAJU1BJTkFORF9OVU1fUFJPVE9DT0xTLAo+IH07Cj4KPiBzdHJ1Y3Qg
c3BpbmFuZF9kZXZpY2Ugewo+IAkuLi4KPiAJZW51bSBzcGluYW5kX3Byb3RvY29sIHByb3RvY29s
Owo+IAljb25zdCBzdHJ1Y3Qgc3BpbmFuZF9vcF90ZW1wbGF0ZXMgKm9wX3RlbXBsYXRlc1tTUElO
QU5EX05VTV9QUk9UT0NPTFNdOwo+IAkuLi4KPiB9Owo+Cj4gVGhpcyB3YXksIHlvdSBjYW4gZWFz
aWx5IHBpY2sgdGhlIHJpZ2h0IHNldCBvZiBvcGVyYXRpb25zIGJhc2VkCj4gb24gdGhlIHByb3Rv
Y29sL21vZGUgeW91J3JlIGluOgo+Cj4gI2RlZmluZSBzcGluYW5kX2dldF9vcF90ZW1wbGF0ZShz
cGluYW5kLCBvcG5hbWUpIFwKPiAJKChzcGluYW5kKS0+b3BfdGVtcGxhdGVzWyhzcGluYW5kKS0+
cHJvdG9jb2xdLT5vcG5hbWUpCj4KPiBzdGF0aWMgaW50IHNwaW5hbmRfcmVhZF9yZWdfb3Aoc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLCB1OCByZWcsIHU4ICp2YWwpCj4gewo+IAlzdHJ1
Y3Qgc3BpX21lbV9vcCBvcCA9ICpzcGluYW5kX2dldF9vcF90ZW1wbGF0ZShzcGluYW5kLCBnZXRf
ZmVhdHVyZSk7Cj4gCWludCByZXQ7Cj4KPiAJLi4uCj4gfQoKSSBmaW5kIGEgY291cGxlIG9mIGlz
c3VlcyB3aXRoIHRoaXPCoCBtZXRob2QsCgoxLiByZWFkX2NhY2hlLCB3cml0ZV9jYWNoZSwgdXBk
YXRlX2NhY2hlIG9wIHRlbXBsYXRlcyBkb24ndCBmaXQgd2VsbCAKd2l0aCB0aGUgb3RoZXIgbm9u
LWRhdGEgb3BzLCBhcwp0aGVzZSBkYXRhIG9wcyBhcmUgdXNlZCB0byBjcmVhdGUgYSBkaXJtYXAs
IGFuZCB0aGF0IGNhbiBiZSBkb25lIG9ubHkgCm9uY2UgYXQgcHJvYmUgdGltZS4gSGVuY2UsIHRo
ZXJlCmlzIGEgZGlmZmVyZW50IG1lY2hhbmlzbSBvZiBzZWxlY3Rpbmcgb2YgZGF0YSBvcHMgYW5k
IG5vbi1kYXRhIG9wcy4gCkhlbmNlLCB0aGlzIGRpdmlzaW9uIGluIHRoZSBvcCB0ZW1wbGF0ZXMK
c3RydWN0IGFzIGRhdGFfb3BzIGFuZCBjdHJsX29wcyBpcyByZXF1aXJlZC4gQ3VycmVudGx5LCB0
aGUgY29yZSBvbmx5IApzdXBwb3J0cyB1c2luZyBhIHNpbmdsZSBwcm90b2NvbCBmb3IKZGF0YSBv
cHMsIGNob3NlbiBhdCB0aGUgdGltZSBvZiBwcm9iaW5nLgoKMi4gSWYgd2UgdXNlIHRoaXMgc2lu
Z2xlIG9wX3RlbXBsYXRlcyBzdHJ1Y3QsIEkgY2FuJ3QgdGhpbmsgb2YgYW55IGdvb2QgCndheSB0
byBpbml0aWFsaXplIHRoZXNlIGluIHRoZQptYW51ZmFjdHVyZXJzIGRyaXZlciAod2luYm9uZC5j
KSwgcmVmZXIgdG8gMTd0aCBwYXRjaCBpbiB0aGlzIHNlcmllcy4gCkNvdWxkIHlvdSBwbGVhc2Ug
c3VnZ2VzdCBhIG1hY3JvCmltcGxlbWVudGF0aW9uIGFsc28gZm9yIHdpbmJvbmQuYyB3aXRoIHRo
ZSBzdWdnZXN0ZWQgb3BfdGVtcGxhdGVzIHN0cnVjdC4KClRoYW5rcywKQXB1cnZhIE5hbmRhbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
