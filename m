Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3117C25B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 07:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7M24RGqlo6p+OR38h2VX7j0fdjLhkwysw3MkcRFTqvM=; b=nBQ1HAampbnIeW
	IZu0dmCPxIxSCj1KysjKGOaN5OFsUG3Azs74z/xSt6/Ur/E5JCuzD3R+IYKo8xe5M6938cw4cQtb0
	IRwUYSbjniqkrNVbjDIsMym7V9NCYDDcqtX6nWIbjcdlpq2/7uFFKxuBSgtBobOUp8i7cHBiJn09/
	rhRj3pqSenRBadC1Ja5CL97G1SESbieRO66YiRQYWk3zExiOu1PN5oG/+yhPiUnJ68FJoWP+CtCqG
	86ZwToUZPjkZYUmoGCYcv4zOHnREvpTBRv9T7CPC300JgGZsg9M9HmfXaph++VJFtfsNMA4bzIqpz
	2PKPi0RD0DQKDLsEm6fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOoh-00000001YVk-0iXD;
	Tue, 04 Jun 2024 07:42:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEOoe-00000001YVQ-3Ee0
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 07:42:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F748611FE;
	Tue,  4 Jun 2024 07:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990D2C32782;
	Tue,  4 Jun 2024 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717486963;
	bh=SN5J7RI6JSHiLzdRYcIH1OJvtJI+2IfG/BlH4wBvC/A=;
	h=From:To:Cc:Subject:Date:From;
	b=YkpsAyIm/8xj6wyJAerwgfsp6uB58wAiiiT8NaZhiv9RDKz8VXNXynIvY5lFjy1bB
	 WY8W/C+CpCvv9gEuOIlo+d8t6UvotWwk3sfnkZI5v0RX/lsiPkEwRW8JXstdyXmi2k
	 QZPpEZDqnmFivbuC7VV+Vu7nvIbNUQNBzF0Gvsw9822a4IRvAbOL9S0SVX5akr+QLl
	 QD5yi/IxD7HlFsPHez6oRuDHiARY+cafvsOfX+M9aIe0JEBQdhMxXYNKF8OeocjywJ
	 8Btpe6CzHj8cRwv6hmvPF9mmO6X73+RfLDfy4qff3S+MQKs36IClQNyCvsDqo85pvY
	 feoJcmFQfawCw==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Marek Vasut <marex@denx.de>,
	Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM devices
Date: Tue,  4 Jun 2024 09:42:31 +0200
Message-Id: <20240604074231.1874972-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_004244_912927_6E1FFB6E 
X-CRM114-Status: GOOD (  19.04  )
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

VGhlc2UgZGV2aWNlcyBhcmUgbW9yZSBsaWtlIGFuIEFUMjUgY29tcGF0aWJsZSBFRVBST00gaW5z
dGVhZCBvZgpmbGFzaGVzLiBMaWtlIGFuIEVFUFJPTSB0aGUgdXNlciBkb2Vzbid0IG5lZWQgdG8g
ZXhwbGljaXRseSBlcmFzZSB0aGUKbWVtb3J5LCBub3IgYXJlIHRoZXJlIHNlY3RvcnMgb3IgcGFn
ZXMuIFRodXMsIGluc3RlYWQgb2YgdGhlIFNQSS1OT1IKKGZsYXNoKSBkcml2ZXIsIG9uZSBzaG91
bGQgaW5zdGVhZCB1c2UgdGhlIGF0MjUgRUVQUk9NIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IE1p
Y2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPgpDYzogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6IFRob3JzdGVuIFNjaGVyZXIgPHQuc2No
ZXJlckBlY2tlbG1hbm4uZGU+CkNjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KQ2M6IElt
cmUgS2Fsb3ogPGthbG96QG9wZW53cnQub3JnPgpDYzogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPgpDYzogRmxhdmlvIFN1bGlnb2kgPGYuc3VsaWdvaUBhc2VtLml0PgotLS0KVGhlIHJlZmVy
ZW5jZWQgYmluZGluZyBvbmx5IHN1cHBvcnRzIHRoZSB0cnVlIEFUMjUgY29tcGF0aWJsZSBFRVBS
T01zCndoZXJlIHlvdSBoYXZlIHRvIHNwZWNpZnkgYWRkaXRpb25hbCBwcm9wZXJ0aWVzIGxpa2Ug
c2l6ZSBhbmQgcGFnZSBzaXplCm9yIGN5cHJlc3MgRlJBTSBkZXZpY2VzIHdoZXJlIGFsbCB0aGUg
cHJvcGVydGllcyBhcmUgZGlzY292ZXJlZCBieSB0aGUKZHJpdmVyLiBJIGRvbid0IGhhdmUgdGhl
IGFjdHVhbCBoYXJkd2FyZSwgdGhlcmVmb3JlIEkgY2FuJ3Qgd29yayBvbiBhCnByb3BlciBkcml2
ZXIgYW5kIGJpbmRpbmcuIEJ1dCBJIHJlYWxseSB3YW50IHRvIGRlcHJlY2F0ZSB0aGUgdXNlIG9m
CnRoZXNlIEVFUFJPTSBsaWtlIGRldmljZXMgaW4gU1BJLU5PUi4gU28gYXMgYSBmaXJzdCBzdGVw
LCBtYXJrIHRoZQpkZXZpY2VzIGluIHRoZSBEVCBiaW5kaW5ncyBhcyBkZXByZWNhdGVkLgoKVGhl
cmUgYXJlIHRocmVlIGluLXRyZWUgdXNlcnMgb2YgdGhpcy4gSSBob3BlIEkndmUgQ0NlZCBhbGwg
dGhlIHJlbGV2YW50CnBlb3BsZS4gV2l0aCB0aGUgc3dpdGNoIHRvIHRoZSBhdDI1IGRyaXZlciBh
bHNvIGNvbWVzIGEgdXNlci1zcGFjZQpmYWNpbmcgY2hhbmdlOiB0aGVyZSBpcyBubyBtb3JlIE1U
RCBkZXZpY2UuIEluc3RlYWQgdGhlcmUgaXMgYW4gImVlcHJvbSIKZmlsZSBpbiAvc3lzIG5vdywg
anVzdCBsaWtlIGZvciBldmVyeSBvdGhlciBFRVBST00uCgpNYXJlayBhbHJlYWR5IGV4cHJlc3Nl
ZCwgdGhhdCB0aGUgc3BzMSBkdHMgY2FuIGxpa2VseSBiZSByZW1vdmVkCmFsdG9nZXRoZXIuIEkn
ZCBsaWtlIHRvIGhlYXIgZnJvbSB0aGUgb3RoZXIgYm9hcmQgRFRTIG1haW50YWluZXJzIGlmCnRo
ZXkgc2VlbSBzb21lIHByb2JsZW1zIG1vdmluZyB0byB0aGUgRUVQUk9NIGludGVyZmFjZSAtIG9y
IG1heWJlIHRoYXQKZGV2aWNlIGlzbid0IHVzZWQgYXQgYWxsIGFueXdheS4gU28gaW4gdGhlIGVu
ZCwgd2UgY2FuIGhvcGVmdWxseSBtb3ZlCmFsbCB0aGUgdXNlcnMgb3ZlciB0byB0aGUgYXQyNSBk
cml2ZXIuCi0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxz
cGktbm9yLnlhbWwgfCA5ICsrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwKaW5kZXggNmUzYWZiNDI5MjZlLi4yZGNj
YjZiMDQ5ZWEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvamVkZWMsc3BpLW5vci55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sCkBAIC0yMSw3ICsyMSw2IEBAIHByb3BlcnRpZXM6
CiAgICAgICAgICAgICAgIChtMjVwKDQwfDgwfDE2fDMyfDY0fDEyOCl8XAogICAgICAgICAgICAg
ICBuMjVxKDMyYnwwNjR8MTI4YTExfDEyOGExM3wyNTZhfDUxMmF8MTY0aykpKXxcCiAgICAgICAg
ICAgICAgIGF0bWVsLGF0MjVkZigzMjFhfDY0MXwwODFhKXxcCi0gICAgICAgICAgICAgIGV2ZXJz
cGluLG1yMjVoKDEwfDQwfDEyOHwyNTYpfFwKICAgICAgICAgICAgICAgKG14aWN5fG1hY3Jvbml4
KSxteDI1bCg0MDA1YXwxNjA2ZXw2NDA1ZHw4MDA1fDEyODA1ZHwyNTYzNWUpfFwKICAgICAgICAg
ICAgICAgKG14aWN5fG1hY3Jvbml4KSxteDI1dSg0MDMzfDQwMzUpfFwKICAgICAgICAgICAgICAg
KHNwYW5zaW9uLCk/czI1ZmwoMTI4c3wyNTZzMXw1MTJzfDAwOGt8MDY0a3wxNjRrKXxcCkBAIC00
Miw2ICs0MSwxNCBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgICAtIHNwYW5zaW9uLHMyNWZz
NTEycwogICAgICAgICAgIC0gY29uc3Q6IGplZGVjLHNwaS1ub3IKICAgICAgIC0gY29uc3Q6IGpl
ZGVjLHNwaS1ub3IKKworICAgICAgIyBEZXByZWNhdGVkIGJpbmRpbmdzCisgICAgICAtIGl0ZW1z
OgorICAgICAgICAgIC0gcGF0dGVybjogIl5ldmVyc3BpbixtcjI1aCgxMHw0MHwxMjh8MjU2KSQi
CisgICAgICAgICAgLSBjb25zdDogamVkZWMsc3BpLW5vcgorICAgICAgICBkZXNjcmlwdGlvbjoK
KyAgICAgICAgICBEZXByZWNhdGVkIGJpbmRpbmcsIHVzZSBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZWVwcm9tL2F0MjUueWFtbC4KKyAgICAgICAgZGVwcmVjYXRlZDogdHJ1ZQog
ICAgIGRlc2NyaXB0aW9uOgogICAgICAgU1BJIE5PUiBmbGFzaGVzIGNvbXBhdGlibGUgd2l0aCB0
aGUgSkVERUMgU0ZEUCBzdGFuZGFyZCBvciB3aGljaCBtYXkgYmUKICAgICAgIGlkZW50aWZpZWQg
d2l0aCB0aGUgUkVBRCBJRCBvcGNvZGUgKDB4OUYpIGRvIG5vdCBkZXNlcnZlIGEgc3BlY2lmaWMK
LS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
