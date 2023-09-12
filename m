Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B786CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISDC0C1eMfzm+rZyXxZ2Amjwr1XRlk3Mf53Biw13zMg=; b=BX+siYLbIiAP+W
	dF+hhZLtRciYuytmclrl7WjIQdeTrtphhAqqtBY+yUO87ZHoWVXsqmVHWwgB1uH39wf5Tjq5m/hhp
	a7vlqfcMhadluoHBBbjYNfc2Z48kdtuDC95APUeySJlJBdeTQ0TOfeRx5P/BEf0Rk2eDdN6n9jpp6
	scZwMNpfSGvoA4BGX97UECVhDzaIvxUKRLaJb5Xd6j7cFrMw6j7roRzczBqFWWvmkkAjkQhj50ZxR
	huB8s2nU4jKvUcABPkFlSqkVeArZ2Krta8ECuTe+kBnW/zZ56+E2qIKpOWp+P8NNxaeKwEx7ZJds2
	QaGptDPntknvQ4jcSwmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2Vk-003Kqi-1n;
	Tue, 12 Sep 2023 12:28:56 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2Vh-003Kpt-0k
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 12:28:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8726E2000A;
	Tue, 12 Sep 2023 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694521729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6w4eE727ahcXyxO0B8znMsuiPT1RLt1MBCIFRc4fPgg=;
	b=jC/r0aqRQO/YPCJ8STlSaOY/dw4Vx09EJUWrU8X0QarVh46T7R2kyaqz+mdIXe2ucdLx8Q
	+7lSNpDrkMAYoQHely2wZKOF09lu6WINOQFz2TsjyJ/wf72PQepBKoyoY2Kwf9Dnic23UZ
	K81+HS27EPt/QMfNxuTQ+Ex2OBVjuNGP2O47bgrY8G1AufFPpRS/dVTjzU/n3Xvd9/jyTP
	y2hj2+keElhyWHi+iERfeNCxbHNdVxSob5YxwUqmHMv0htPqUgjLYbtO6kUfhCIz0XBI8x
	qXDxP5iDkGCcAlPQy18rUefZUWlR/i2k85i564hN8QA7Cg7GPb4PS1tX+FQGog==
Date: Tue, 12 Sep 2023 14:28:47 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
 <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
 <quic_pkondeti@quicinc.com>
Subject: Re: [PATCH v4] mtd: rawnand: qcom: Unmap the right resource upon
 probe failure
Message-ID: <20230912142847.4610c0a0@xps-13>
In-Reply-To: <20230912115903.1007-1-quic_bibekkum@quicinc.com>
References: <20230912115903.1007-1-quic_bibekkum@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_052853_408855_A2B4BBFD 
X-CRM114-Status: GOOD (  15.20  )
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

SGkgQmliZWssCgpxdWljX2JpYmVra3VtQHF1aWNpbmMuY29tIHdyb3RlIG9uIFR1ZSwgMTIgU2Vw
IDIwMjMgMTc6Mjk6MDMgKzA1MzA6Cgo+IFdlIGN1cnJlbnRseSBwcm92aWRlIHRoZSBwaHlzaWNh
bCBhZGRyZXNzIG9mIHRoZSBETUEgcmVnaW9uCj4gcmF0aGVyIHRoYW4gdGhlIG91dHB1dCBvZiBk
bWFfbWFwX3Jlc291cmNlKCkgd2hpY2ggaXMgb2J2aW91c2x5IHdyb25nLgo+IAo+IEZpeGVzOiA3
MzMwZmM1MDVhZjQgKCJtdGQ6IHJhd25hbmQ6IHFjb206IHN0b3AgdXNpbmcgcGh5c190b19kbWEo
KSIpCgpDYzogc3RhYmxlPwoKPiBTaWduZWQtb2ZmLWJ5OiBCaWJlayBLdW1hciBQYXRybyA8cXVp
Y19iaWJla2t1bUBxdWljaW5jLmNvbT4KPiAtLS0KPiB2NDogSW5jb3Jwb3JhdGVkIHN1Z2dlc3Rp
b24gZnJvbSBNaXF1ZWwKPiAgICAgLSBNb2RpZmllZCB0aXRsZSBhbmQgY29tbWl0IGRlc2NyaXB0
aW9uLgo+IAo+IHYzOiBJbmNvcnBvcmF0ZWQgY29tbWVudHMgZnJvbSBNaXF1ZWwKPiAgICAgLSBN
b2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRpdGxlIGFzIHBlciBzdWdnZXN0aW9ucy4K
PiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwOTEyMTAxODE0Ljc3NDgtMS1x
dWljX2JpYmVra3VtQHF1aWNpbmMuY29tLwo+IAo+IHYyOiBJbmNvcnBvcmF0ZWQgY29tbWVudHMg
ZnJvbSBQYXZhbi9NYW5pLgo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5
MTExMzMwMjYuMjk4NjgtMS1xdWljX2JpYmVra3VtQHF1aWNpbmMuY29tLwo+IAo+IHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5MDcwOTI4NTQuMTE0MDgtMS1xdWljX2JpYmVr
a3VtQHF1aWNpbmMuY29tLwo+IAo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCA2NDQ5OWMxYjM2MDMuLmIwNzk2
MDVjODRkMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMK
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMzQ0NCw3ICsz
NDQ0LDcgQEAgc3RhdGljIGludCBxY29tX25hbmRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gIGVycl9hb25fY2xrOgo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG5hbmRj
LT5jb3JlX2Nsayk7Cj4gIGVycl9jb3JlX2NsazoKPiAtCWRtYV91bm1hcF9yZXNvdXJjZShkZXYs
IHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSwKPiArCWRtYV91bm1hcF9yZXNvdXJjZShk
ZXYsIG5hbmRjLT5iYXNlX2RtYSwgcmVzb3VyY2Vfc2l6ZShyZXMpLAo+ICAJCQkgICBETUFfQklE
SVJFQ1RJT05BTCwgMCk7Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gLS0KPiAyLjE3LjEKPiAKCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
