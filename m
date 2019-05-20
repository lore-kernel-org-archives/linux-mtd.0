Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852E3C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 14:30:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B03D213F2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 14:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ToYzxe19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B03D213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8sVz/2VkMqov9LkLclqe0NUtGRNIHVI4l3jetc5J8g=; b=ToYzxe19jERIUB
	0VXma2SlPy7W2in7FH+zMamcIV02wc4n0tB7Y1ayquz/l4evAcWq87ku4Io3jcpnaVe9yMMoR8+sj
	9Xnes69F9tB/dtw7MH5J+reABU22DgLkeRdznaAsjsmz4FJY06OJMil25t2nOcumcbk/mcdBpU6Il
	KaWEroRV8gpemTVWrAHrrqlVZOEUBRSHmVjW7YcDGg4fu73XTXCC2BjIyIjfNQx1lmnmTWW5BAikG
	3nsUQsEB9qZ03rqX4/LSFS0Go+OCQYXB+kofUL6nmTi2EV5lV4hwmtAAf4I2VLptY7LIqI7OSkXNx
	lIeQvsEH95Mgr+O6KxQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSjJS-0000af-66; Mon, 20 May 2019 14:30:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSjJO-0000aG-Pt
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 14:30:48 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DD2C31C0003;
 Mon, 20 May 2019 14:30:39 +0000 (UTC)
Date: Mon, 20 May 2019 16:30:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v3 00/14] Implement exec_op for GPMI nand driver
Message-ID: <20190520163038.7f38b54a@xps13>
In-Reply-To: <20190425125643.29990-1-s.hauer@pengutronix.de>
References: <20190425125643.29990-1-s.hauer@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_073046_985986_9C1D7C02 
X-CRM114-Status: GOOD (  17.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2FzY2hhLAoKU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPiB3cm90ZSBv
biBUaHUsIDI1IEFwciAyMDE5CjE0OjU2OjI5ICswMjAwOgoKPiBUaGUgR1BNSSBuYW5kIGRyaXZl
ciBzdWZmZXJzIGZyb20gdmVyeSBwb29yIHBlcmZvcm1hbmNlLiBUaGUgcmVhZAo+IHBlcmZvcm1h
bmNlIGNhbiBiZSByb3VnaGx5IGRvdWJsZWQgd2l0aCB0d28gc3RlcHM6IEZpcnN0IGlzIHRvIHVz
ZQo+IHJ1bnRpbWUgUE0gZm9yIGNvbnRyb2xsaW5nIHRoZSBjbG9ja3Mgd2hpY2ggcHJldmVudHMg
dGhlIGRyaXZlciBmcm9tCj4gc3BlbmRpbmcgYSBnb29kIGFtb3VudCBvZiB0aW1lIGVuL2Rpc2Fi
bGluZyB0aGUgY2xvY2tzLiBUaGUgc2Vjb25kIHN0ZXAKPiBpcyB0byBpbXBsZW1lbnQgZXhlY19v
cCB3aGljaCBhbGxvd3MgdXMgdG8gY29tYmluZSB0aGUgc3RlcHMgbmVjZXNzYXJ5Cj4gdG8gZG8g
YSBwYWdlIHJlYWQgaW50byBhIHNpbmdsZSBETUEgdHJhbnNhY3Rpb24uCj4gCj4gSSB3b3VsZCBw
cmVmZXIgdG8gbGV0IHRoaXMgZ28gdGhyb3VnaCB0aGUgbXRkIHRyZWUgd2l0aCB0aGUgYWNrIG9m
IHRoZQo+IGRtYWVuZ2luZSBtYWludGFpbmVycwo+IAo+IGNoYW5nZXMgc2luY2UgdjI6Cj4gCj4g
LSBzL2RtYS9kbWFlbmdpbmUgaW4gZG1hZW5naW5lIHNwZWNpZmljIHBhdGNoZXMKPiAtIHMvbmFu
ZC9OQU5ELwo+IC0gQWRkIHJldmlld2VkLWJ5IE1pcXVlbAo+IC0gQWRkIEFja2VkLWJ5IFZpbm9k
Cj4gCj4gY2hhbmdlcyBzaW5jZSB2MToKPiAKPiAtIHRlc3RlZCBhbmQgZml4ZWQgb24gaS5NWDI4
Cj4gLSByZW1vdmUgZGVidWdnaW5nIGxlZnRvdmVyCj4gLSBBZGQgbXhzIGRtYSBzcGVjaWZpYyBo
ZWFkZXIgZmlsZXMgdG8gcHV0IHRoZSBvZGRpdGllcyBvZiB0aGUgbXhzIGRtYQo+ICAgZHJpdmVy
IGluCj4gLSBUdXJuIG9mZiBCQ0ggZW5naW5lIGludGVycnVwdHMgd2hlbiBub3QgbmVlZGVkIGFz
IHRoZXkgcmVzdWx0IGluCj4gICBjYWxsaW5nIGNvbXBsZXRlKCkgb24gYW4gdW5pbml0aWFsaXpl
ZCBjb21wbGV0aW9uLiBUaGlzIGNyYXNoZXMKPiAgIG9uIGkuTVgyOAo+IAo+IFNhc2NoYSBIYXVl
ciAoMTQpOgo+ICAgbXRkOiByYXduYW5kOiBleHBvcnQgTkFORCBvcGVyYXRpb24gdHJhY2VyCj4g
ICBtdGQ6IHJhd25hbmQ6IGZzbWM6IFVzZSBuYW5kX29wX3RyYWNlIGZvciBvcGVyYXRpb24gdHJh
Y2luZwo+ICAgbXRkOiByYXduYW5kOiBncG1pOiBtb3ZlIGFsbCBkcml2ZXIgY29kZSBpbnRvIHNp
bmdsZSBmaWxlCj4gICBtdGQ6IHJhd25hbmQ6IGdwbWk6IHJlbW92ZSB1bnVzZWQgdmFyaWFibGUK
PiAgIG10ZDogcmF3bmFuZDogZ3BtaTogUmVtb3ZlIHVubmVjZXNzYXJ5IHZhcmlhYmxlcwo+ICAg
bXRkOiByYXduYW5kOiBncG1pOiByZWFkIGJ1ZiBpbiBuYW5kX3JlYWRfcGFnZV9vcAo+ICAgbXRk
OiByYXduYW5kOiBncG1pOiByZW1vdmUgdW51c2VkIHBhcmFtZXRlcnMKPiAgIG10ZDogcmF3bmFu
ZDogZ3BtaTogRHJvcCB1bm5lY2Vzc2FyeSByZXN0b3Jpbmcgb2YgcHJldmlvdXMgY2hpcHNlbGVj
dGlvbgo+ICAgbXRkOiByYXduYW5kOiBncG1pOiB1c2UgcnVudGltZSBQTSB0byBtYW5hZ2UgY2xv
Y2tzCj4gICBkbWFlbmdpbmU6IG14czogRHJvcCB1bm5lY2Vzc2FyeSBmbGFnCj4gICBtdGQ6IHJh
d25hbmQ6IGdwbWk6IGRyb3AgdW5uZWNlc3NhcnkgZmxhZwo+ICAgZG1hZW5naW5lOiBteHM6IEFk
ZCBoZWFkZXIgZmlsZSB0byBiZSBzaGFyZWQgd2l0aCBncG1pIG5hbmQgZHJpdmVyCj4gICBkbWFl
bmdpbmU6IG14czogcmVuYW1lIGN1c3RvbSBmbGFnCj4gICBtdGQ6IHJhd25hbmQ6IGdwbWk6IElt
cGxlbWVudCBleGVjX29wCj4gCj4gIGRyaXZlcnMvZG1hL214cy1kbWEuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMjUgKy0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNtY19uYW5kLmMgICAg
ICAgICAgIHwgICAxOSArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvTWFrZWZp
bGUgICAgfCAgICAxIC0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGli
LmMgIHwgIDkzNiAtLS0tLS0tLS0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQv
Z3BtaS1uYW5kLmMgfCAxNjg3ICsrKysrKysrKysrKysrLS0tLS0tCj4gIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuaCB8ICAgNjQgKy0KPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9iYXNlLmMgICAgICAgICAgIHwgICAzMCArLQo+ICBpbmNsdWRlL2xpbnV4L2Rt
YS9teHMtZG1hLmggICAgICAgICAgICAgICAgfCAgIDI0ICsKPiAgaW5jbHVkZS9saW51eC9tdGQv
cmF3bmFuZC5oICAgICAgICAgICAgICAgIHwgICAzNyArCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTI2
NCBpbnNlcnRpb25zKCspLCAxNTU5IGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvbGludXgvZG1hL214cy1kbWEuaAo+IAoKUGxlYXNlIGlnbm9yZSB0aGUg
cHJldmlvdXMgbWVzc2FnZSB0ZWxsaW5nIHRoZSBwYXRjaCB3YXMgYXBwbGllZCwgSQpoYXZlIHRv
IG1hbnVhbGx5IGZpeCBhbGwgdGhlIGNvbmZsaWN0cywgSSBjYW5jZWxlZCB0aGUgb3BlcmF0aW9u
OiB3b3VsZAp5b3UgbWluZCByZWJhc2luZyBvbiB2NS4yLXJjMSBhbmQgcmVzcGluPwoKClRoYW5r
cyBhbmQgc29ycnkgZm9yIHRoZSB0cm91YmxlLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
