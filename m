Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98792C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw+gjYHMtb/pca1+yi4ULqbC/lm4tjeWKMVnusSYj88=; b=nfpzepkRPwLNHZ
	pDXDBTgpBz5JUDz5wVXpmBy4Hmv9gOkEvWy6cPGt0UUpLIrHRX0NhTpYJYMtUVdyJR1SbgED/K8+4
	xUq+UuncrICk9d6ndDgCtzYc2u3/XRxdQnhNWG9U8LQ/1g3tyuXrpljHcsGqU+hOxNRCgBdvbiKwc
	7S9o/3FWAb+3FyleyO/atvEek2v2qE4aClO9W6xYoLjJEpekjwTAFW+u6ph11PhqRKlTQr573a7cO
	Cg25CmeUg/CllPHAEQPXCjZXaQsWX/vzsSvUtFTbmxtNmpvOY1+up+ZJAzoA96oDpJu1wpA3/Hhnx
	Mkv5cUL9kp7lmpBBwqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okosP-007zmF-6x; Tue, 18 Oct 2022 15:51:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okorx-007zKI-NL; Tue, 18 Oct 2022 15:51:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 167E76147F;
	Tue, 18 Oct 2022 15:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2483C433D6;
	Tue, 18 Oct 2022 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666108264;
	bh=bLdmMle94QQwCBRxz3r6k1ilHoY6wGNxy1a0zdTcu18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4XHmj26B2z94vShlmPetNZJEwXdsYIVvD/5QnLCZSSU8yk65hTV+YPCeiPJS7jY/
	 i8IAkhn8MrdJRhe9M3vIVk2Wo9RDALAMHOZsIoCI/WaNidG05zJIMBYhLrZPJfkvHF
	 bJm6kP+tR7jdv9pBK1Efd6NEQJmYGEuBeBc3UmUQ/nYYnIsH4EpRtjFMdU3rwqydku
	 Fo1YVHn/FGelFRHR9uAk0LzMqBluACgDRboDI3QaSUp54iJC+9WHZp3HoCNJhb+dWH
	 pDSlvFQTlDMa1zUhPQxLAhMbJfhHn8cxlO3H9Z5zFUQ6WJ4sPlzBmuiDnnuXnOyPrq
	 WRyDvLHxiGV3A==
Date: Tue, 18 Oct 2022 16:50:58 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tom Rini <trini@konsulko.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Joel Peshkin <joel.peshkin@broadcom.com>,
	William Zhang <william.zhang@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: u-boot: allow
 dynamic subpartitions
Message-ID: <Y07LYoq6Dh+k0uJm@spud>
References: <20221018154202.4634-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018154202.4634-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_085105_831730_EAFAC147 
X-CRM114-Status: GOOD (  18.36  )
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

T24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMDU6NDI6MDFQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBV
LUJvb3QgcGFydGl0aW9uIG1heSBjb250YWluIHN1YnBhcnRpdGlvbnMuIEZvciBleGFtcGxlIEJy
b2FkY29tCj4gaW5jbHVkZXMgZW52aXJvbm1lbnQgZGF0YSBibG9jayBpbiB0aGUgbWlkZGxlIG9m
IGl0cyBVLUJvb3QgcGFydGl0aW9uLgo+IAo+IFRoaXMgYWxsb3dzIGRlc2NyaWJpbmcgQnJvYWRj
b20ncyBVLUJvb3QgZW52IGRhdGEgYW5kIHdpbGwgYWxsb3cKPiByZWZlcmVuY2luZyBpdHMgTlZN
RU0gY2VsbCBpbiB0aGUgZnV0dXJlLgo+IAo+IFJlZzogMTE4ZjNmYmU1MTdmNCAoImR0LWJpbmRp
bmdzOiBtdGQ6IHBhcnRpdGlvbnM6IHN1cHBvcnQgbGFiZWwvbmFtZSBvbmx5IHBhcnRpdGlvbiIp
CgpQYXJkb24gbXkgaWdub3JhbmNlIGhlcmUsIGJ1dCB3aGF0IGlzIHRoZSBzaWduaWZpY2FuY2Ug
b2YgYSAiUmVnIiB0YWc/ClRoYW5rcywKQ29ub3IuCgo+IFJlZjogZGQ2MzgyMDJkZmI2NSAoImR0
LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6IGFkZCBhZGRpdGlvbmFsIGV4YW1wbGUgZm9yIHFj
b20sc21lbS1wYXJ0IikKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1p
bGVja2kucGw+Cj4gLS0tCj4gVjM6IEFkZCB0aGlzIHBhdGNoIGFzIHByZS1yZXF1aXJlbWVudCBm
b3IgdS1ib290LGVudi55YW1sICYgYnJjbSxlbnYKPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbXRkL3BhcnRpdGlvbnMvdS1ib290LnlhbWwgICAgICAgICB8IDcgKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFt
bAo+IGluZGV4IDhhODhlN2QxNjUyNC4uM2M1NmVmZTQ4ZWZkIDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91LWJvb3QueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy91
LWJvb3QueWFtbAo+IEBAIC0yNyw2ICsyNywxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAg
QnJvYWRjb20gc3RvcmVzIGVudmlyb25tZW50IHZhcmlhYmxlcyBpbnNpZGUgYSBVLUJvb3QgcGFy
dGl0aW9uLiBUaGV5Cj4gICAgICAgICAgICBjYW4gYmUgaWRlbnRpZmllZCBieSBhIGN1c3RvbSBo
ZWFkZXIgd2l0aCBtYWdpYyB2YWx1ZS4KPiAgCj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ICsgICJe
cGFydGl0aW9uLS4qJCI6Cj4gKyAgICAkcmVmOiBwYXJ0aXRpb24ueWFtbCMKPiArCj4gIHVuZXZh
bHVhdGVkUHJvcGVydGllczogZmFsc2UKPiAgCj4gIGV4YW1wbGVzOgo+IEBAIC00MCw2ICs0NCw5
IEBAIGV4YW1wbGVzOgo+ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImJyY20sdS1ib290IjsK
PiAgICAgICAgICAgICAgcmVnID0gPDB4MCAweDEwMDAwMD47Cj4gICAgICAgICAgICAgIGxhYmVs
ID0gInUtYm9vdCI7Cj4gKwo+ICsgICAgICAgICAgICBwYXJ0aXRpb24tdS1ib290LWVudiB7Cj4g
KyAgICAgICAgICAgIH07Cj4gICAgICAgICAgfTsKPiAgCj4gICAgICAgICAgcGFydGl0aW9uQDEw
MDAwMCB7Cj4gLS0gCj4gMi4zNC4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
