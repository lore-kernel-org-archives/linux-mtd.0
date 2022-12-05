Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FC5C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 16:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mow1gLYsk9kk4hgsW3ZbmUi2KjYegCjagorHFW9eaNQ=; b=2lEHP94GEdmwfU
	p8UYfr77/NfKZ4holosfK7+9S/EYn+hJFvwc0a3zjfP3+LZ1VtagRa+as08ahniJkhOsyPh4uQScA
	BqLcx7KVBZeDhpEhMhDt7cXO65VGj/yZnzgu5rSrHNMe6oMGN0gm+7s2kirs9QbjOhPX63VmYtz7e
	5+jxIU6vBCYPoDYjCz3G7Fmc+N16jntFL30mpU9PTcazfSbZf0MQ8TnafE6+fiMD7v20EzOTgSDiQ
	V0WnpEyjlacq0lpsB7rXhG5EwDAUCx2KXFXuDJB1aRycDfsOWBA+zVpkNKmQjtwCpDu5MgNXv0sbe
	uBe7+ZkZQ4PAGJvlfPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ENn-006V6F-NW; Mon, 05 Dec 2022 16:31:55 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ENX-006Uvd-EI; Mon, 05 Dec 2022 16:31:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B0222FF806;
	Mon,  5 Dec 2022 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1670257889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9EE3fQMr3pSS04VorK2MV9hiMfHZVXwxlbDklYuvHA=;
	b=Q2HsDL+5s3L7eQ8Z5HOvuFUiLBtCuucxTpAFLJvFPIYZqm1r/6Nqmeft1/+HSfEOzOWJ+M
	H1CSYCD8edKGBmIwAXQj4Aj+LWAtNDI38iTxYn2cPSfwtYgbcdxbcndbc/tZcSmir1jd8n
	J+Z6uZzfy4dBZpWcXTYDROchI7cx7rKt9D0PN/1/SUL6h75aebpgB0IGpsZG31BKMqJ5it
	TrSFD9tE2ZjDrW1OHzL4Lo4xrfzcrFlQlvQLpr9JEJ+Bh26qNOtDchoDGgMGRJXjhp5g2r
	o2nA5cYG/cw9MBedF7ojvLj99epW77r7ZGXu52RSZUAuN6+6dirU4j2iA81JAA==
Date: Mon, 5 Dec 2022 17:31:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marex@denx.de>, Francesco Dolcini
 <francesco.dolcini@toradex.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller
 size-cells"
Message-ID: <20221205172754.5a67e51d@xps-13>
In-Reply-To: <20221205152327.26881-1-francesco@dolcini.it>
References: <20221205152327.26881-1-francesco@dolcini.it>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_083139_657004_C9030961 
X-CRM114-Status: GOOD (  15.33  )
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

SGkgRnJhbmNlc2NvLAoKZnJhbmNlc2NvQGRvbGNpbmkuaXQgd3JvdGUgb24gTW9uLCAgNSBEZWMg
MjAyMiAxNjoyMzoyNyArMDEwMDoKCj4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNj
by5kb2xjaW5pQHRvcmFkZXguY29tPgo+IAo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNzUzMzk1ZWEx
ZTQ1YzcyNDE1MDA3MGI1Nzg1OTAwYjZhNDRiZDVmYi4KPiAKPiBJdCBpbnRyb2R1Y2VkIGEgYm9v
dCByZWdyZXNzaW9uIG9uIGNvbGlicmktaW14NywgYW5kIHBvdGVudGlhbGx5IGFueQo+IG90aGVy
IGkuTVg3IGJvYXJkcyB3aXRoIE1URCBwYXJ0aXRpb24gbGlzdCBnZW5lcmF0ZWQgaW50byB0aGUg
ZmR0IGJ5Cj4gVS1Cb290Lgo+IAo+IFdoaWxlIHRoZSBjb21taXQgd2UgYXJlIHJldmVydGluZyBo
ZXJlIGlzIG5vdCBvYnZpb3VzbHkgd3JvbmcsIGl0IGZpeGVzCj4gb25seSBhIGR0IGJpbmRpbmcg
Y2hlY2tlciB3YXJuaW5nIHRoYXQgaXMgbm9uLWZ1bmN0aW9uYWwsIHdoaWxlIGl0Cj4gaW50cm9k
dWNlcyBhIGJvb3QgcmVncmVzc2lvbiBhbmQgdGhlcmUgaXMgbm8gb2J2aW91cyBmaXggcmVhZHku
Cj4gCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogNzUzMzk1ZWExZTQ1ICgi
QVJNOiBkdHM6IGlteDc6IEZpeCBOQU5EIGNvbnRyb2xsZXIgc2l6ZS1jZWxscyIpCj4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k0ZGdCVEdOV3BNNlNRWElAZnJhbmNlc2NvLW5i
LmludC50b3JhZGV4LmNvbS8KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
MjEyMDUxNDQ5MTcuNjUxNDE2OGFAeHBzLTEzLwo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jZXNjbyBE
b2xjaW5pIDxmcmFuY2VzY28uZG9sY2luaUB0b3JhZGV4LmNvbT4KClJldmlld2VkLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKPiAtLS0KPiAgYXJjaC9hcm0v
Ym9vdC9kdHMvaW14N3MuZHRzaSB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9pbXg3cy5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14N3MuZHRzaQo+IGluZGV4IDAzZDJl
ODU0NGE0ZS4uMGZjOWU2YjhiMDVkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lt
eDdzLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg3cy5kdHNpCj4gQEAgLTEyNzAs
MTAgKzEyNzAsMTAgQEAgZG1hX2FwYmg6IGRtYS1hcGJoQDMzMDAwMDAwIHsKPiAgCQkJY2xvY2tz
ID0gPCZjbGtzIElNWDdEX05BTkRfVVNESENfQlVTX1JBV05BTkRfQ0xLPjsKPiAgCQl9Owo+ICAK
PiAtCQlncG1pOiBuYW5kLWNvbnRyb2xsZXJAMzMwMDIwMDAgewo+ICsJCWdwbWk6IG5hbmQtY29u
dHJvbGxlckAzMzAwMjAwMHsKPiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsaW14N2QtZ3BtaS1uYW5k
IjsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gLQkJCSNzaXplLWNlbGxzID0gPDA+Owo+
ICsJCQkjc2l6ZS1jZWxscyA9IDwxPjsKPiAgCQkJcmVnID0gPDB4MzMwMDIwMDAgMHgyMDAwPiwg
PDB4MzMwMDQwMDAgMHg0MDAwPjsKPiAgCQkJcmVnLW5hbWVzID0gImdwbWktbmFuZCIsICJiY2gi
Owo+ICAJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQgSVJRX1RZUEVfTEVWRUxfSElHSD47CgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
