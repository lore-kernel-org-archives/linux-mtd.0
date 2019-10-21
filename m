Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D409ACA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 08:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74D82089C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 08:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RHOz2C5/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74D82089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNedykkWblw3XG9Ua8OtXb/43y7OluLp02rBbVOn0UE=; b=RHOz2C5/BDGfp9
	3nh5IJgWrqfmH9V3LpWqT5gm9wFOox8Hv/hmBxJqxMbmh9HFyFuSQXzp1euoylTOqD7cLfo7kzj5n
	sfQqeyAkPWOU+uF6FAFBO/oJV17AM7cD3TV5g1P7sTNOEn91MKf4Y33s/nuABdNPX8xaaE9DcAOyj
	a00Do+2SqHXqUhKpQZn9dm/u0PH8Yrd2EzJ3cA4fv4/ql+CNFXveq9zd0G72YiFsCsSwT+nmmqSpG
	tCvtgiM91hAQrpZct+4vrTFIVhCEiuenJQo98EuUWz/sKn5nBf0cU9CgxocUU/Ci+H2ZlbJS8UmiC
	0711zN6uZSZaFcsDQJ1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMSd4-00010i-3n; Mon, 21 Oct 2019 08:01:26 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMScu-0000sP-0V; Mon, 21 Oct 2019 08:01:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F298A2808D3;
 Mon, 21 Oct 2019 09:01:13 +0100 (BST)
Date: Mon, 21 Oct 2019 10:01:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spear_smi: Fix nonalignment not handled in
 memcpy_toio
Message-ID: <20191021100105.0f06b212@collabora.com>
In-Reply-To: <20191018143643.29676-1-miquel.raynal@bootlin.com>
References: <20191018143643.29676-1-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_010116_315453_41266CAE 
X-CRM114-Status: GOOD (  25.37  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOCBPY3QgMjAxOSAxNjozNjo0MyArMDIwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gQW55IHdyaXRlIHdpdGggZWl0aGVyIGRkIG9y
IGZsYXNoY3AgdG8gYSBkZXZpY2UgZHJpdmVuIGJ5IHRoZQo+IHNwZWFyX3NtaS5jIGRyaXZlciB3
aWxsIHBhc3MgdGhyb3VnaCB0aGUgc3BlYXJfc21pX2NweV90b2lvKCkKPiBmdW5jdGlvbi4gVGhp
cyBmdW5jdGlvbiB3aWxsIGdldCBjYWxsZWQgZm9yIGNodW5rcyBvZiB1cCB0byAyNTYgYnl0ZXMu
Cj4gSWYgdGhlIGFtb3VudCBvZiBkYXRhIGlzIHNtYWxsZXIsIHdlIG1heSBoYXZlIGEgcHJvYmxl
bSBpZiB0aGUgZGF0YQo+IGxlbmd0aCBpcyBub3QgNC1ieXRlIGFsaWduZWQuIEluIHRoaXMgc2l0
dWF0aW9uLCB0aGUga2VybmVsIHBhbmljcwo+IGR1cmluZyB0aGUgbWVtY3B5Ogo+IAo+ICAgICAj
IGRkIGlmPS9kZXYvdXJhbmRvbSBicz0xMDAxIGNvdW50PTEgb2Y9L2Rldi9tdGQ2Cj4gICAgIHNw
ZWFyX3NtaV9jcHlfdG9pbyBbNjIwXSBkZXN0IGM5MDcwMDAwLCBzcmMgYzdiZTg4MDAsIGxlbiAy
NTYKPiAgICAgc3BlYXJfc21pX2NweV90b2lvIFs2MjBdIGRlc3QgYzkwNzAxMDAsIHNyYyBjN2Jl
ODkwMCwgbGVuIDI1Ngo+ICAgICBzcGVhcl9zbWlfY3B5X3RvaW8gWzYyMF0gZGVzdCBjOTA3MDIw
MCwgc3JjIGM3YmU4YTAwLCBsZW4gMjU2Cj4gICAgIHNwZWFyX3NtaV9jcHlfdG9pbyBbNjIwXSBk
ZXN0IGM5MDcwMzAwLCBzcmMgYzdiZThiMDAsIGxlbiAyMzMKPiAgICAgVW5oYW5kbGVkIGZhdWx0
OiBleHRlcm5hbCBhYm9ydCBvbiBub24tbGluZWZldGNoICgweDgwOCkgYXQgMHhjOTA3MDNlOAo+
ICAgICBbLi4uXQo+ICAgICBQQyBpcyBhdCBtZW1jcHkrMHhjYy8weDMzMAoKQ2FuIHlvdSBmaW5k
IG91dCB3aGljaCBpbnN0cnVjdGlvbiBpcyBhdCBtZW1jcHkrMHhjYy8weDMzMD8gRm9yIHRoZQpy
ZWNvcmQsIHRoZSBhc3NlbWJseSBpcyBoZXJlIFsxXS4KCj4gCj4gV29ya2Fyb3VuZCB0aGlzIGlz
c3VlIGJ5IHVzaW5nIHRoZSBhbHRlcm5hdGUgX21lbWNweV90b2lvKCkgbWV0aG9kCj4gd2hpY2gg
YXQgbGVhc3QgZG9lcyBub3QgcHJlc2VudCB0aGUgc2FtZSBwcm9ibGVtLgo+IAo+IEZpeGVzOiBm
MThkYmJiMWJmZTAgKCJtdGQ6IFNUIFNQRUFyOiBBZGQgU01JIGRyaXZlciBmb3Igc2VyaWFsIE5P
UiBmbGFzaCIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTdWdnZXN0ZWQtYnk6IEJv
cmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+CgpJIGRvbid0IHJl
bWVtYmVyIHN1Z2dlc3RpbmcgdGhhdCBhcyBhIGZpbmFsIHNvbHV0aW9uLiBJIHByb2JhYmx5CnN1
Z2dlc3RlZCB0byB0ZXN0IHdpdGggX21lbWNweV90b2lvKCkgdG8gc2VlIGlmIHVzaW5nIGEgYnl0
ZSBhY2Nlc3Nvcgp3YXMgZml4aW5nIHRoZSBwcm9ibGVtLCBidXQgaXQncyBkZWZpbml0ZWx5IG5v
dCB0aGUgcmlnaHQgc29sdXRpb24KKHVzaW5nIGJ5dGUgYWNjZXNzIHdpdGggYSBtZW1vcnkgYmFy
cmllciBmb3IgMjU2IGJ5dGVzIGJ1ZmZlcnMgaXMgbGlrZWx5CnRvIGNhdXNlIGEgaHVnZSBwZXJm
IHBlbmFsdHkpLgoKPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgo+IC0tLQo+IAo+IEhlbGxvLAo+IAo+IFRoaXMgcGF0Y2ggY291bGQgbm90
IGJlIHRlc3RlZCB3aXRoIGEgbWFpbmxpbmUga2VybmVsIChvbmx5IGNvbXBpbGVkKQo+IGJ1dCB3
YXMgdGVzdGVkIHdpdGggYSBzdGFibGUgNC4xNC54IGtlcm5lbC4gSSBoYXZlIHJlYWxseSBubyBp
ZGVhIHdoeQo+IG1lbWNweSBmYWlscyBpbiB0aGlzIHNpdHVhdGlvbiB0aGF0J3Mgd2h5IEkgcHJv
cG9zZSB0aGlzIHdvcmthcm91bmQKPiBidXQgSSBiZXQgdGhlcmUgaXMgc29tZXRoaW5nIGRlZXBl
ciBub3Qgd29ya2luZy4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAo+ICBkcml2ZXJzL210ZC9k
ZXZpY2VzL3NwZWFyX3NtaS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZGV2aWNlcy9z
cGVhcl9zbWkuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvc3BlYXJfc21pLmMKPiBpbmRleCA5ODZm
ODFkMmY5M2UuLmQ4ODg2MjVhMzI0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9kZXZpY2Vz
L3NwZWFyX3NtaS5jCj4gKysrIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9zcGVhcl9zbWkuYwo+IEBA
IC02MTQsNyArNjE0LDcgQEAgc3RhdGljIGlubGluZSBpbnQgc3BlYXJfc21pX2NweV90b2lvKHN0
cnVjdCBzcGVhcl9zbWkgKmRldiwgdTMyIGJhbmssCj4gIAljdHJscmVnMSA9IHJlYWRsKGRldi0+
aW9fYmFzZSArIFNNSV9DUjEpOwo+ICAJd3JpdGVsKChjdHJscmVnMSB8IFdCX01PREUpICYgflNX
X01PREUsIGRldi0+aW9fYmFzZSArIFNNSV9DUjEpOwo+ICAKPiAtCW1lbWNweV90b2lvKGRlc3Qs
IHNyYywgbGVuKTsKPiArCV9tZW1jcHlfdG9pbyhkZXN0LCBzcmMsIGxlbik7Cj4gIAo+ICAJd3Jp
dGVsKGN0cmxyZWcxLCBkZXYtPmlvX2Jhc2UgKyBTTUlfQ1IxKTsKPiAgCgpbMV1odHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC92NS40LXJjMi9zb3VyY2UvYXJjaC9hcm0vbGliL21lbWNw
eS5TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
