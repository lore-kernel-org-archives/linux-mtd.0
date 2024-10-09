Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB0ACED628
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+mP/ah17L3gU5QTdb1WSOfiG1hklQcpBUFLAIiRHdk=; b=E0cvyjDhpbPXvU
	ddMYxPbwQ/r4PpWUqU+xTeV5BjPNfxZt1I20zA9Ut9jAGnLsGGXmKHh27a+CbFbvLpQGnbU5oSQ9A
	GfDX3nQN0XWRJ84/4rYk2LtVaekJT7afEg3+ZVPcQfgLwb7QlPGmSZaRT84tuIZs6cn+h/B0YcY+a
	4eHx3d1uMMLVydUTXXiszUrYQ9wY7jqTDPrwecoVDwa2oOCOSX/Yjhz9s112ELkjVTc8teSh/Rdo5
	MWp41Q6Uj4A3S2f2lQ1f9bMoR204eEnHUDAuEE44Qj72p/0fdZYE9Ay752hFZuXID2ZE7wvBFyZn6
	ymEEEgeDNU4JEdBkYZyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRrO-00000008Osr-2WJ8;
	Wed, 09 Oct 2024 08:15:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRgm-00000008MsA-1jm4;
	Wed, 09 Oct 2024 08:04:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D55AB240002;
	Wed,  9 Oct 2024 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728461092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZqUu2zXtpPIFf6u2ipPatyPzUjw/B5iwIYSh3KUBBk=;
	b=CET+bD2aQpIFbn83eKT+JAQlvpdrc0gESxRVHARr0UpzskXaayoxehxFYpeqV2I+pGYHf7
	xSvkBl7b89C/+0Gdk47ezTrP7u6qPBIGR5kwqsIzgc3ZKH3047DghYSSp6FbBjBZvoxqlu
	j6zm6Afpuenl/O0Lyd9lpC3DzF1Z91xyY1qE//1L7iEPG9apRogWNH7xuYpKJxsEJ0vFR8
	f7awQRGnelx1xTR53a07BHU3UMyrCGrqIJqTl366jh6Nmmxl0DzFyVPbWQkTKSy/mEAo4/
	0QUCeD6U6SN9pWklqIOJ4bFozd3MC1LJrrtFwXUpIuM/vk9XRWdRR6ANHh7WTg==
Date: Wed, 9 Oct 2024 10:04:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nikita.shubin@maquefel.me, arnd@arndb.de,
 vkoul@kernel.org, esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <20241009100450.362e3556@xps-13>
In-Reply-To: <02098767-19ce-407e-88be-24c6259c4053@gmail.com>
References: <20240927020749.46791-1-hpchen0nvt@gmail.com>
	<20240927020749.46791-3-hpchen0nvt@gmail.com>
	<20241001215755.5c2f8465@xps-13>
	<8d5e7755-17fd-4860-bcb0-8c1de04bf0c5@gmail.com>
	<20241008105230.7fd25438@xps-13>
	<02098767-19ce-407e-88be-24c6259c4053@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_010456_968856_604A98FE 
X-CRM114-Status: GOOD (  17.54  )
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

SGkgSHVpLVBpbmcsCgo+ID4+Pj4gKwkJcmV0dXJuIDA7Cj4gPj4+PiArCX0KPiA+Pj4+ICsKPiA+
Pj4+ICsJbWEzNV9uYW5kX2RtYWNfaW5pdChuYW5kKTsKPiA+Pj4+ICsKPiA+Pj4+ICsJd3JpdGVs
KG10ZC0+b29ic2l6ZSwgbmFuZC0+cmVncyArIE1BMzVfTkZJX1JFR19OQU5EUkFDVEwpOwo+ID4+
Pj4gKwo+ID4+Pj4gKwkvKiBzZXR1cCBhbmQgc3RhcnQgRE1BIHVzaW5nIGRtYV9hZGRyICovCj4g
Pj4+PiArCWRtYV9hZGRyID0gZG1hX21hcF9zaW5nbGUobmFuZC0+ZGV2LCAodm9pZCAqKWFkZHIs
IGxlbiwgRE1BX0ZST01fREVWSUNFKTsKPiA+Pj4+ICsJcmV0ID0gZG1hX21hcHBpbmdfZXJyb3Io
bmFuZC0+ZGV2LCBkbWFfYWRkcik7Cj4gPj4+PiArCWlmIChyZXQpIHsKPiA+Pj4+ICsJCWRldl9l
cnIobmFuZC0+ZGV2LCAiZG1hIG1hcHBpbmcgZXJyb3JcbiIpOwo+ID4+Pj4gKwkJcmV0dXJuIC1F
SU5WQUw7Cj4gPj4+PiArCX0KPiA+Pj4+ICsKPiA+Pj4+ICsJd3JpdGVsKCh1bnNpZ25lZCBsb25n
KWRtYV9hZGRyLCBuYW5kLT5yZWdzICsgTUEzNV9ORklfUkVHX0RNQVNBKTsgIAo+ID4+PiBQbGVh
c2UgZW5mb3JjZSBhIGRtYSBtYXNrIG9mIDMyIChldmVuIHRob3VnaCBpdCBtaWdodCBiZSB0aGUg
ZmF1bHQpLiAgCj4gPj4gSSB3aWxsIGNoYW5nZSBpdCB0byBkbWFfYWRkciAmIDB4ZmZmZmZmZmYu
ICAKPiA+IFRoYXQncyBub3Qgd2hhdCBJIG1lYW4sIEkgYmVsaWV2ZSB5b3Ugc2hvdWxkIHVzZSB0
aGUgZG1hIEFQSSB0byBhc2sgZm9yCj4gPiBhIG1hcHBpbmcgd2l0aGluIHRoZSBhY2Nlc3NpYmxl
IDMyLWJpdCBhZGRyZXNzIHJhbmdlLiBUaGUKPiA+IGRtYV9tYXBwaW5nX2Vycm9yKCkgY2hlY2sg
c2hvdWxkIHJldHVybiBhbiBlcnJvciBpZiB0aGF0J3Mgbm90IHRoZQo+ID4gY2FzZS4gVGhlbiB5
b3UgY2FuIHNhZmVseSB3cml0ZSB0aGUgdmFsdWUuICAKPiAKPiBIZXJlIGlzIG15IG1pc3VuZGVy
c3RhbmRpbmc6IGp1c3QgZmlsbCBpbiB0aGUgZG1hX2FkZHIgZGlyZWN0bHksCj4gCj4gbm8gdHlw
ZSBjb252ZXJzaW9uIGlzIG5lZWRlZC4gSSBoYXZlIGFscmVhZHkgdGVzdGVkIGl0LgoKRllJLCBp
dCBvbmx5IHdvcmtzIGJlY2F1c2UgdGhlIGRlZmF1bHQgRE1BIG1hc2sgZm9yIHlvdXIgZGV2aWNl
IGlzIGdvbm5hCmJlIDMyIGJpdHMuIElmIHRoZSByZWFsaXR5ICh3aGF0IHlvdXIgcGVyaXBoZXJh
bCBETUEgY2FuIGRvKSB3YXMKZGlmZmVyZW50IHRoYW4gdGhpcywgeW91IHdvdWxkIGhhdmUgdG8g
c2V0IGEgZGlmZmVyZW50IG1hc2sgZXhwbGljaXRseQp0byBtYWtlIHN1cmUgdGhlIGRtYS1tYXBw
aW5nIHN0ZXAgd291bGQgbm90IHByb3ZpZGUgYnVmZmVycyB3aGljaCBhcmUKb3V0IG9mIHJlYWNo
LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
