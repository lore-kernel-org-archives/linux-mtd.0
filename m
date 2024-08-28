Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A4EC5472D
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 07:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKXOhRl2LnoN4hQEfDVtxcXQ1CaEFPhYZbob/NS1cIk=; b=geJ72FzlpgBXdj
	9EZSrKliVjQw8stfozZCp5Ks4iHu9y6PRIRMRUW2XG98S9kP2ht6V/0OcjWvchleyFNWaNQVh+1OQ
	vIsJdUVYyJwPa/sp/ii/K3MbCkNx6fco68/8BlihVMh2yvDKmr5RXjkpb6a44kKhESDgdNuRSfRJe
	AjQJreooEKd8xY02k50bykCsgGbxK3086Sl8xKdI6STRKbqic496E+0eYkKvOKcyd8fhsx/PVEO6W
	6OBZpS1IIR8jbBrTp5dFDME7DTuR/qZmrh3r7zaEwU7f+JQCgn48o7EqZ5AxW9S6Hwd4FRsZITncg
	EffIxJbbuPzs4GB43icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDSi-0000000EO1h-1n6c;
	Wed, 28 Aug 2024 07:51:28 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDQD-0000000ENDz-1Vlo;
	Wed, 28 Aug 2024 07:48:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62B78FF808;
	Wed, 28 Aug 2024 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724831329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5zLZsHecvlr5wSYFNatvZpgULQ6Qmig03QDSQmQd4Y=;
	b=m+IuM1tTx5x1LLw++vJv+fVKTLfoYsQe486sDQqOB4JvPo0i/JIlUYXEqpBcD7ew+lG8B5
	ubnACfagbmX36TbQzavKFAA1nP2nJ5ZwxCZGhsqN7mUYMGwrGChsrNnlfh7Al2nn234Vw6
	Qnc4toma/uSIkeZ1OdF1EdVuicT2P1hY9CIe8yxDpCuOR76KOtIv1DHColUWaqmuiJ3bIs
	0GrAY77FOYA2mQdSs6dYdUZHwrkSlhieu3DRPo3qY2QJPwYsg1S8TfExbKa/a6fFAA4i+3
	ZLDUWtxAjoEyXiq2awP9FrIKW+GiEySKt/VFt0QRGEtxj52f7nxEMphy/vnEPw==
Date: Wed, 28 Aug 2024 09:48:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
Message-ID: <20240828094846.166c7de6@xps-13>
In-Reply-To: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
	<20240821071132.281018-2-hpchen0nvt@gmail.com>
	<20240823182616.5a85e1ae@xps-13>
	<fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_004853_707938_633B5615 
X-CRM114-Status: GOOD (  21.50  )
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

SGkgSHVpLVBpbmcsCgpocGNoZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDI4IEF1ZyAy
MDI0IDEwOjQ3OjE3ICswODAwOgoKPiBEZWFyIE1pcXXDqGwsCj4gCj4gVGhhbmsgeW91IGZvciB5
b3VyIHJlcGx5Lgo+IAo+IAo+IAo+IE9uIDIwMjQvOC8yNCDkuIrljYggMTI6MjYsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBocGNoZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBv
biBXZWQsIDIxIEF1ZyAyMDI0IDA3OjExOjMxICswMDAwOgo+ID4gIAo+ID4+IEFkZCBkdC1iaW5k
aW5ncyBmb3IgdGhlIE51dm90b24gTUEzNSBTb0MgTkFORCBDb250cm9sbGVyLgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogSHVpLVBpbmcgQ2hlbiA8aHBjaGVuMG52dEBnbWFpbC5jb20+Cj4gPj4g
UmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGlu
YXJvLm9yZz4KPiA+PiAtLS0KPiA+PiAgIC4uLi9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEt
bmFuZC55YW1sICAgICB8IDkzICsrKysrKysrKysrKysrKysrKysKPiA+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA5MyBpbnNlcnRpb25zKCspCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9udXZvdG9uLG1hMzVkMS1uYW5kLnlhbWwKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L251dm90b24sbWEzNWQxLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sCj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjE1Mjc4NGU3MzI2Mwo+ID4+IC0tLSAvZGV2L251
bGwKPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90
b24sbWEzNWQxLW5hbmQueWFtbAo+ID4+IEBAIC0wLDAgKzEsOTMgQEAKPiA+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPj4gKyVZ
QU1MIDEuMgo+ID4+ICstLS0KPiA+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sIwo+ID4+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+PiArCj4gPj4gK3RpdGxlOiBO
dXZvdG9uIE1BMzVEMSBOQU5EIEZsYXNoIEludGVyZmFjZSAoTkZJKSBDb250cm9sbGVyCj4gPj4g
Kwo+ID4+ICttYWludGFpbmVyczoKPiA+PiArICAtIEh1aS1QaW5nIENoZW4gPGhwY2hlbjBudnRA
Z21haWwuY29tPgo+ID4+ICsKPiA+PiArYWxsT2Y6Cj4gPj4gKyAgLSAkcmVmOiBuYW5kLWNvbnRy
b2xsZXIueWFtbCMKPiA+PiArCj4gPj4gK3Byb3BlcnRpZXM6Cj4gPj4gKyAgY29tcGF0aWJsZToK
PiA+PiArICAgIGVudW06Cj4gPj4gKyAgICAgIC0gbnV2b3RvbixtYTM1ZDEtbmFuZCAgCj4gPiBD
YW4gd2UgcGxlYXNlIHVzZSB0aGUgLW5hbmQtY29udHJvbGxlciBzdWZmaXguIEEgTkFORCBpcyBh
IHRoZSBjb21tb24KPiA+IG5hbWUgZm9yIGEgY2hpcCB3aXRoIHN0b3JhZ2UgaW5zaWRlLiBZb3Ug
YXJlIGRlc2NyaWJpbmcgYSBob3N0Cj4gPiBjb250cm9sbGVyIHRoYXQgY2FuIGJlIGNvbm5lY3Rl
ZCB0byBpbiBvcmRlciB0byB0YWxrIHRvIGEgTkFORC4gIAo+IAo+IAo+IE9rYXksIEkgd2lsbCBj
aGFuZ2UgaXQgdG8gbnV2b3RvbixtYTM1ZDEtbmZpLgo+IAo+IEJlY2F1c2UgaW4gb3VyIHBsYXRm
b3JtLCBpdCBpcyB0aGUgTkFORCBGbGFzaCBJbnRlcmZhY2UuCgpuZmkgaXMgbm90IGFuIGFjcm9u
eW0gdGhhdCBpcyB1bmRlcnN0YW5kYWJsZSBieSBldmVyeW9uZS4gUGxlYXNlIHVzZQotbmFuZC1j
b250cm9sbGVyLiBEb24ndCBiZSB3b3JyaWVkIGJ5IHRoZSBzaXplIG9mIHRoZSBzdHJpbmcuCgpZ
b3UgY2FuIHVzZSB0aGUgYWNyb255bSBhcyBwcmVmaXggZm9yIHlvdXIgTkFORCBjb250cm9sbGVy
IGZ1bmN0aW9ucwp0aG91Z2guCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
