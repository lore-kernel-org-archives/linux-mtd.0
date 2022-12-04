Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31B6C4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Dec 2022 13:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LkdAK70bEWtlx+OJgKSl1GvjKEqUZttGEuSPJAjIMw=; b=JW9ewi92IRUWJa
	GyaUML/QAroM3o/X4tgdOq7gJ5L/z7Zm1vhC4Vy+67FJyV5NaZKTly/Q7vf/AGzjuErdQArE9H4CV
	qmaVy5/2Ue8ARzVrqXPsWG0TTMfpK6UUNkSVFELmUhMkVBYJ0s1jeOuoY9pWfeR6/kNbublHgdClb
	qyKPjWXx160mACS+C6qbqcpsEp7OFDa4TolYlystG8tfHhTlv5FjTP5b+UXc1YNHEZRdcQF7IuXMk
	ossCEpeiuaEenceZOWDVifrbmnVEuZ2XDhtDfhpcV9kzi2mnGzB/CeFNvINT/srJDDnvkpQ0zlVy1
	5kvh/1NUEHB0urY0rUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1obO-007yXj-I6; Sun, 04 Dec 2022 13:00:14 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oau-007yJS-1c; Sun, 04 Dec 2022 12:59:45 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p1oan-00009e-96; Sun, 04 Dec 2022 13:59:37 +0100
Message-ID: <b652fe29-5fbc-b548-266a-d494733b6e32@leemhuis.info>
Date: Sun, 4 Dec 2022 13:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US, de-DE
To: Marek Vasut <marex@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <f6417f32-cf30-2e01-701e-ed1634055c6a@leemhuis.info>
 <cc497c19-050a-b3c2-d3e2-640c07338ff6@denx.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <cc497c19-050a-b3c2-d3e2-640c07338ff6@denx.de>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670158784;f28d6343;
X-HE-SMSGID: 1p1oan-00009e-96
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_045944_271116_BCFB7FFE 
X-CRM114-Status: GOOD (  18.30  )
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

T24gMDQuMTIuMjIgMTM6NTAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDEyLzIvMjIgMTY6NTYs
IFRob3JzdGVuIExlZW1odWlzIHdyb3RlOgo+PiBPbiAwMi4xMi4yMiAxNTozMSwgTWFyZWsgVmFz
dXQgd3JvdGU6Cj4+PiBPbiAxMi8yLzIyIDE1OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+Pj4g
Wy4uLl0KPj4+PiAzLiBUbyBmaXggdGhlIGN1cnJlbnQgc2l0dWF0aW9uOgo+Pj4+IMKgwqDCoMKg
IEltbWVkaWF0ZWx5IHJldmVydCBjb21taXQgKGFuZCBwcmV2ZW50IGl0IGZyb20gYmVpbmcgYmFj
a3BvcnRlZCk6Cj4+Pj4gwqDCoMKgwqAgNzUzMzk1ZWExZTQ1ICgiQVJNOiBkdHM6IGlteDc6IEZp
eCBOQU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxscyIpCj4+Pj4gwqDCoMKgwqAgVGhpcyB3YXkgeW91
ciBvd24gYm9vdCBmbG93IGlzIGZpeGVkIGluIHRoZSBzaG9ydCB0ZXJtLgo+Pj4KPj4+IEhlcmUg
SSBkaXNhZ3JlZSwgdGhlIGZpeCBpcyBjb3JyZWN0IGFuZCBJIHRoaW5rIHdlIHNob3VsZG4ndCBw
cm9saWZlcmF0ZQo+Pj4gaW5jb3JyZWN0IERUcyB3aGljaCBkb24ndCBtYXRjaCB0aGUgYmluZGlu
ZyBkb2N1bWVudC4gUmF0aGVyLCBpZiBhCj4+PiBib290bG9hZGVyIGdlbmVyYXRlcyBpbmNvcnJl
Y3QgKG5ldykgRFQgZW50cmllcywgSSBiZWxpZXZlIHRoZSBkcml2ZXIKPj4+IHNob3VsZCBpbXBs
ZW1lbnQgYSBmaXh1cCBhbmQgd2FybiB1c2VyIGFib3V0IHRoaXMuIFBDIGRvZXMgdGhhdCBhcyB3
ZWxsCj4+PiB3aXRoIGJyb2tlbiBBQ1BJIHRhYmxlcyBhcyBmYXIgYXMgSSBjYW4gdGVsbC4KPj4K
Pj4gV2VsbCwgdGhhdCBtaWdodCBiZSB0aGUgcmlnaHQgc29sdXRpb24gaW4gdGhlIGxvbmcgcnVu
LCB0aGF0J3MgdXAgZm9yCj4+IG90aGVycyB0byBkZWNpZGUsIGJ1dCB3ZSBuZWVkIHRvIGZpeCB0
aGlzICpxdWlja2x5Ki4gRm9yIHR3byByZWFzb25zCj4+IGFjdHVhbGx5OiB0aGUgNi4xIHJlbGVh
c2UgaXMgbmVhciBhbmQgdGhlIGNoYW5nZSB3YXMgYmFja3BvcnRlZCB0bwo+PiBzdGFibGUgYWxy
ZWFkeS4KPj4KPj4gRm9yIGRldGFpbHMgd3J0IHRvIHRoZSAicXVpY2tseSIsIHNlZSAiUHJpb3Jp
dGl6ZSB3b3JrIG9uIGZpeGluZwo+PiByZWdyZXNzaW9ucyIgaGVyZToKPj4gaHR0cHM6Ly9kb2Nz
Lmtlcm5lbC5vcmcvcHJvY2Vzcy9oYW5kbGluZy1yZWdyZXNzaW9ucy5odG1sCj4+Cj4+IElPVzog
SWRlYWxseSBpdCBzaG91bGQgYmUgZml4ZWQgYnkgU3VuZGF5Lgo+Pgo+PiBJJ2xsIGhlbmNlIGxp
a2VseSBzb29uIHdpbGwgcG9pbnQgTGludXMgdG8gdGhpcyBhbmQgc3VnZ2VzdCB0byByZXZlcnQK
Pj4gdGhpcywgdW5sZXNzIHRoZXJlIGFyZSBzdHJvbmcgcmVhc29ucyBhZ2FpbnN0IHRoYXQgb3Ig
c29tZSBzb3J0IG9mCj4+IGFncmVlbWVudCBvbiBhIGJldHRlciBzb2x1dGlvbi4KPiAKPiBZb3Ug
bWlnaHQgd2FudCB0byB3YWl0IHVudGlsIGV2ZXJ5b25lIGlzIGJhY2sgb24gTW9uZGF5LCB0aGUg
ZGlzY3Vzc2lvbgo+IGlzIHN0aWxsIG9uZ29pbmcsIGJ1dCBpdCBzZWVtcyB0byBiZSBnZXR0aW5n
IHRvIGEgY29uY2x1c2lvbi4KClllYWgsIGNhbWUgdG8gYSBzaW1pbGFyIGNvbmNsdXNpb24sIGJ1
dCB3YW50IHRvIG1lbnRpb25lZCBpdApuZXZlcnRoZWxlc3MgYW5kIGFscmVhZHkgaGF2ZSB0aGlz
IHByZXBhcmVkICh0b2dldGhlciB3aWxsIGFwcHJvcHJpYXRlCmxpbmtzIHRvIHRoZSBkaXNjdXNz
aW9uKToKCmBgYApBIHJlZ3Jlc3Npb24gY2F1c2luZyBib290IGZhaWx1cmVzIG9uIGlNWDcgKGR1
ZSB0byBhIGJhY2twb3J0IHRoaXMgaXMKYWxzbyBhZmZlY3RpbmcgNi4wLnkpIGNvdWxkIGJlIGZp
eGVkIHdpdGggYSBxdWljayByZXZlcnQgYXMgd2VsbC4gQnV0Cmxvb2tzIGxpa2UgdGhlcmUgaXMg
bm8gbmVlZCBmb3IgaXQsIGFmdGVyIHNvbWUgYmFjayBhbmQgZm9ydGggdGhlCmRldmVsb3BlcnMg
dGhhdCBjYXJlIGFyZSBjbG9zZSB0byBjb21lIHRvIGFuIGFncmVlbWVudCBob3cgdG8gZml4IHRo
ZQpwcm9ibGVtIHByb3Blcmx5IHNvb25pc2g6CmBgYAoKQ2lhbywgVGhvcnN0ZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
