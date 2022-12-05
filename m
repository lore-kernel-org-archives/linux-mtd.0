Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F49BC47089
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKadbymIYFG5CTYren/S46egWwIa1XNbdnl8kd9KJ3E=; b=zXpF5LnvU6sfAZ
	LQ2IuDac4GB+Gw57PbyAdBju72EkcZqqiTwoflm50361qywgSB0TSI5xCVFjNdpW6QecMG7sNuTxB
	/qgpQu7Uez2f4OyZjzB3ATC31DNdMOLpFrpjqfTGLA7fF/sfF5KXEKV+cJGJBya8s9Q4iJRUqx7qo
	CmvlG+ltin3GUyCFgfV8L4Bqf5YN4C3YtJX2znjQVM/mLfC102pfrvXdwtuCMbMucTNhemzkBvfKp
	va/tt70H3/pUFEOu6J8D/MB/ATU3nxddC/G/YhyZkKbo6c++RpMYPBlrnhTJDfrGNaRGMIybnU2a5
	+P5AhEq8JJ96oOEG38ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Flh-008204-3Y; Mon, 05 Dec 2022 18:00:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FlV-0081kq-0Q; Mon, 05 Dec 2022 18:00:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B3392C0003;
	Mon,  5 Dec 2022 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670263222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bdDAK4fk0/LkRHjnH0BkmGmCTYghTKYbvgGTDqO6qbw=;
	b=RJT+NX/HjGkRaEKxNE1nU6nMYtt5KlOk/54xxD7j7LG3edYFnqlkLjSH0uPt283JmMZcVN
	fyW5E1/3qI1zBegF9fgDNIkazpfB9v2dBmAPEeX94sVZblmKCmt/qeG7WgDxchOLaJ0W1U
	JPjOwdCHxDpzHQsceatybjmpQmxFYrHCKvBde5QuNv1sPmmMr4AKiI4SQCthSQsPVTLrSx
	wtgYrAANr2kNkKn01T857747NGoF9JzEYGKEqMZGM5IyUk61RRv5tpTaiCxAwryULlUNof
	3YHj42zSTzS0JsXQpL9wxHPYBR6bewIvZJT3Ob7IE7SvlObK3toCDf/8zLbhCg==
Date: Mon, 5 Dec 2022 18:58:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Francesco Dolcini <francesco@dolcini.it>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Francesco
 Dolcini <francesco.dolcini@toradex.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221205185859.433d6cbf@xps-13>
In-Reply-To: <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
References: <20221205152327.26881-1-francesco@dolcini.it>
	<0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_100029_393686_F2A81EF9 
X-CRM114-Status: GOOD (  20.34  )
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

SGkgTWFyZWssCgptYXJleEBkZW54LmRlIHdyb3RlIG9uIE1vbiwgNSBEZWMgMjAyMiAxNzoyNjo1
MyArMDEwMDoKCj4gT24gMTIvNS8yMiAxNjoyMywgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6Cj4g
PiBGcm9tOiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+
Cj4gPiAKPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNzUzMzk1ZWExZTQ1YzcyNDE1MDA3MGI1Nzg1
OTAwYjZhNDRiZDVmYi4KPiA+IAo+ID4gSXQgaW50cm9kdWNlZCBhIGJvb3QgcmVncmVzc2lvbiBv
biBjb2xpYnJpLWlteDcsIGFuZCBwb3RlbnRpYWxseSBhbnkKPiA+IG90aGVyIGkuTVg3IGJvYXJk
cyB3aXRoIE1URCBwYXJ0aXRpb24gbGlzdCBnZW5lcmF0ZWQgaW50byB0aGUgZmR0IGJ5Cj4gPiBV
LUJvb3QuCj4gPiAKPiA+IFdoaWxlIHRoZSBjb21taXQgd2UgYXJlIHJldmVydGluZyBoZXJlIGlz
IG5vdCBvYnZpb3VzbHkgd3JvbmcsIGl0IGZpeGVzCj4gPiBvbmx5IGEgZHQgYmluZGluZyBjaGVj
a2VyIHdhcm5pbmcgdGhhdCBpcyBub24tZnVuY3Rpb25hbCwgd2hpbGUgaXQKPiA+IGludHJvZHVj
ZXMgYSBib290IHJlZ3Jlc3Npb24gYW5kIHRoZXJlIGlzIG5vIG9idmlvdXMgZml4IHJlYWR5Lgo+
ID4gCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gRml4ZXM6IDc1MzM5NWVhMWU0
NSAoIkFSTTogZHRzOiBpbXg3OiBGaXggTkFORCBjb250cm9sbGVyIHNpemUtY2VsbHMiKQo+ID4g
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k0ZGdCVEdOV3BNNlNRWElAZnJhbmNl
c2NvLW5iLmludC50b3JhZGV4LmNvbS8KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIyMTIwNTE0NDkxNy42NTE0MTY4YUB4cHMtMTMvCj4gPiBTaWduZWQtb2ZmLWJ5OiBG
cmFuY2VzY28gRG9sY2luaSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4gPiAtLS0K
PiA+ICAgYXJjaC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaSB8IDQgKystLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDdzLmR0c2kKPiA+IGluZGV4IDAzZDJlODU0NGE0ZS4uMGZjOWU2YjhiMDVkIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaQo+ID4gKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvaW14N3MuZHRzaQo+ID4gQEAgLTEyNzAsMTAgKzEyNzAsMTAgQEAgZG1hX2FwYmg6IGRt
YS1hcGJoQDMzMDAwMDAwIHsKPiA+ICAgCQkJY2xvY2tzID0gPCZjbGtzIElNWDdEX05BTkRfVVNE
SENfQlVTX1JBV05BTkRfQ0xLPjsKPiA+ICAgCQl9OyAgCj4gPiAgID4gLQkJZ3BtaTogbmFuZC1j
b250cm9sbGVyQDMzMDAyMDAwIHsgIAo+ID4gKwkJZ3BtaTogbmFuZC1jb250cm9sbGVyQDMzMDAy
MDAwewo+ID4gICAJCQljb21wYXRpYmxlID0gImZzbCxpbXg3ZC1ncG1pLW5hbmQiOwo+ID4gICAJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+IC0JCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsJ
CQkjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ICAgCQkJcmVnID0gPDB4MzMwMDIwMDAgMHgyMDAwPiwg
PDB4MzMwMDQwMDAgMHg0MDAwPjsKPiA+ICAgCQkJcmVnLW5hbWVzID0gImdwbWktbmFuZCIsICJi
Y2giOwo+ID4gICAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQgSVJRX1RZUEVfTEVWRUxfSElH
SD47ICAKPiAKPiBJIHN1c3BlY3QgdGhpcyBmaXggc2hvdWxkIGV2ZW50dWFsbHkgYmUgcmV2ZXJ0
ZWQgYWdhaW4sIG9uY2UgYSBwcm9wZXIgZml4IGlzIGFncmVlZCB1cG9uIGluIHRoZSBNVEQgT0Yg
cGFyc2VyLCByaWdodCA/CgpJIGd1ZXNzIGl0J3MgdGltZSB0byBtaWdyYXRlIHRvIGEgbW9yZSBt
b2Rlcm4gZGVmaW5pdGlvbiwgaXQncyBub3QKY29tcGxleCB0byBkbywgdGhlcmUgYXJlIHBsZW50
eSBvZiBleGFtcGxlcy4gVGhpcyB3b3VsZCBiZSBJTUhPIGEKYmV0dGVyIHN0ZXAgYWhlYWQgcmF0
aGVyIHRoYW4ganVzdCBhIGNlbGwgY2hhbmdlLiBBbnl3YXksIEkgZG9uJ3QgbWluZApyZXZlcnRp
bmcgdGhpcyBvbmNlIHdlJ3ZlIHNvcnRlZCB0aGlzIG1lc3Mgb3V0IGFuZCBmaXhlZCBVLUJvb3Qu
CgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
