Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA8C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc3rVUC5nDxVu9IuSxuQXKdEZoM0lEIOKgk4jYxI6gY=; b=bJhKmeXgwDt6Wy
	gqbJuHhpfUu906v831VJDEQZOJqgWZgknro7IWx7DAh/RXCWR2G/3D9v8rMszQKr7FMCNTnQiqAJw
	qbSYnSDKhxuoDAP43uAa5PBZht6WDE+bBB1chlHUfMfPHkhCNxgNxKPl43NgDT6p8ledPw8MWn/et
	zqsuG8pPa2h9vM39mN5U4osX2OdG1LjYasOlu9KnoK9vofVJ2JFz733V5X4r2szbTez+UHEZjfrwn
	XGQEQNC1lVFJ1l1Zmd0r1oSlsp/E1KgcNXMkD6lcJ+msNAzrp+Rv7GDWBqtD9qHx+dIkEVNntwOlW
	mm6LxJJOq5vDCbxvcJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okp2f-008NVn-Nb; Tue, 18 Oct 2022 16:02:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okp2T-008Mln-Fn; Tue, 18 Oct 2022 16:01:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9E2761502;
	Tue, 18 Oct 2022 16:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB205C433D6;
	Tue, 18 Oct 2022 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666108916;
	bh=Hn/UlsHxFMZytEorg4BSDyJiZpF+QOnOBXapsACQcrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHxOk36gAwYbktOc8LmDZyJGSMN9auJnaUbH9Y/D1YD3J25ZLw6F2fdjTZ6+sDW6C
	 yVC470JlYJTLXnG3z2IAwUvEtYth+8QYkjfdwap6daW0v9w0H4ZxMNl9R1UuwujK8S
	 NnW9PGdxch6G6DdFumjVWBS1fyR4fiEiewwBhHTj2pHWGx2P9C1ilzblOuR3drsvIl
	 cawGlhcQs0Suwk5p/Wb0KAF4CiXt2/nSWF3L9vVRrIVQ3f6iz+fr5++qq9B4V2PUgE
	 sNuD3JF6XiBdFqC9LlsunLhRrK4qDG2UykNkuN3sLc+p/F3QmG/TyILB0HpdDopjIM
	 xQrwHpWNbpjGA==
Date: Tue, 18 Oct 2022 17:01:48 +0100
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
Message-ID: <Y07N7DXAKuPk5OTU@spud>
References: <20221018154202.4634-1-zajec5@gmail.com>
 <Y07LYoq6Dh+k0uJm@spud>
 <bd2bcbeb-c800-4f14-c801-c6b5489dbf49@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd2bcbeb-c800-4f14-c801-c6b5489dbf49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_090157_589986_037B59D6 
X-CRM114-Status: GOOD (  16.92  )
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

T24gVHVlLCBPY3QgMTgsIDIwMjIgYXQgMDU6NTU6MTRQTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDE4LjEwLjIwMjIgMTc6NTAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9u
IFR1ZSwgT2N0IDE4LCAyMDIyIGF0IDA1OjQyOjAxUE0gKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3
cm90ZToKPiA+ID4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ID4g
PiAKPiA+ID4gVS1Cb290IHBhcnRpdGlvbiBtYXkgY29udGFpbiBzdWJwYXJ0aXRpb25zLiBGb3Ig
ZXhhbXBsZSBCcm9hZGNvbQo+ID4gPiBpbmNsdWRlcyBlbnZpcm9ubWVudCBkYXRhIGJsb2NrIGlu
IHRoZSBtaWRkbGUgb2YgaXRzIFUtQm9vdCBwYXJ0aXRpb24uCj4gPiA+IAo+ID4gPiBUaGlzIGFs
bG93cyBkZXNjcmliaW5nIEJyb2FkY29tJ3MgVS1Cb290IGVudiBkYXRhIGFuZCB3aWxsIGFsbG93
Cj4gPiA+IHJlZmVyZW5jaW5nIGl0cyBOVk1FTSBjZWxsIGluIHRoZSBmdXR1cmUuCj4gPiA+IAo+
ID4gPiBSZWc6IDExOGYzZmJlNTE3ZjQgKCJkdC1iaW5kaW5nczogbXRkOiBwYXJ0aXRpb25zOiBz
dXBwb3J0IGxhYmVsL25hbWUgb25seSBwYXJ0aXRpb24iKQo+ID4gCj4gPiBQYXJkb24gbXkgaWdu
b3JhbmNlIGhlcmUsIGJ1dCB3aGF0IGlzIHRoZSBzaWduaWZpY2FuY2Ugb2YgYSAiUmVnIiB0YWc/
Cj4gCj4gVGhhdCB3YXMgbWVhbnQgdG8gYmUgIlJlZjoiIGFuZCB3YXMgbWVhbnQgdG8gc2hvdyBj
b21taXQgdGhhdCBpbnRyb2R1Y2VkCj4gY29uY2VwdCBvZiBkeW5hbWljIHBhcnRpdGlvbnMuIEkg
dGhvdWdodCBpdCdzIGEgbmV3IGZlYXR1cmUgbm90IGV2ZXJ5b25lCj4gbWF5IGJlIGZhbWlsaWFy
IHdpdGggeWV0LiBJIHRob3VnaHQgaXQgbWF5IGhlbHAgdG8gcmV2aWV3IHRoaXMgcGF0Y2guCgpB
aCBudywgSSB3YXNuJ3Qgc3VyZSBpZiBpdCB3cyBhIHR5cG8gb3IgIlJlZyIgc2hvcnQgZm9yIHJl
Z3Jlc3Npb24uCgo+IAo+IElmIHRoYXQgaXMgcG9pbnRsZXNzIHRob3VnaCBjb3VsZCB5b3UgUm9i
IGp1c3QgZHJvcCB0aG9zZSB0YWdzIHdoaWxlCj4gYXBwbHlpbmcsIHBsZWFzZT8gSSBndWVzcyBJ
J2xsIGp1c3QgbGV0IHlvdSBkZWNpZGUuCj4gCj4gCj4gPiA+IFJlZjogZGQ2MzgyMDJkZmI2NSAo
ImR0LWJpbmRpbmdzOiBtdGQ6IHBhcnRpdGlvbnM6IGFkZCBhZGRpdGlvbmFsIGV4YW1wbGUgZm9y
IHFjb20sc21lbS1wYXJ0IikKPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxy
YWZhbEBtaWxlY2tpLnBsPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
