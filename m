Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEEEC531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phEc6DoRkTQEkQtpQlKJdiO5pJqYGcynpmx2fzjgWEo=; b=E04M5e1Q+dHa7z
	8vwcJjnBFgIytN6powkdqzmV3mDptFMsp/MJdh4iPz+naCsmRle/bSSJHcsoX4yTnsk0w6gWRJnch
	qbHbe9OLdZGavx+m/NVlYzgkETAu0EorFQJg5paXYgn+S8vo2LX6KwLgGukza/VmXnVbAMjtuteKR
	E76K6t28gskd1TCla7G2gW8iaCkt6T2WQMR165iaxUXC7ZWaGXCEXBZf4Ja0Kt4DXgHqtx8Kt5eGI
	Fh5MAhvzaSY58DSzndTapcMtqObUVZzvFdh3SCjX0ng5Za9HjN+bkVZJya9MD4qdtZT+uyZdIHBtH
	cs4FRfwGVMfmgHF+wusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX8B-0000000HYbh-4AOm;
	Fri, 23 Aug 2024 16:27:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX7E-0000000HYLI-2bvQ;
	Fri, 23 Aug 2024 16:26:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C6E820008;
	Fri, 23 Aug 2024 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZSZ4ZWkj6nN5cffjKGJ15MFqfbm3AdMyv45FOgL9lo=;
	b=JpFgaCA32WqOAE3V0avi6VMRNuexZVaIWTSYeFl+0wgVveqM/f8XnfTjdFcSomsT3BDCKi
	0Hh30CESmpUDky3nmmbKHKTd3/FYNC67cupzeYCQdrWMXHbHlZvNHTbCX8xOXRv3G92xhv
	FmfEpg24mUCZNK/Nkb7CGqfpHDEAZEbbkVH5Hy2LtG7rd9/wPbnLHDPLGwy0ZUTj1l4VEZ
	2ppZ3j7o66upZ+wP+dGi41RfTvb5TavNh/t8/NvDOcVij0SEDtRzMIvQE2Pr7fKRvgS78e
	rDoh1VviE+kBhlSbxDgHf7B4cE11WmrgL3suG9gviol32opZCBDPI0VXULmqkQ==
Date: Fri, 23 Aug 2024 18:26:16 +0200
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
Message-ID: <20240823182616.5a85e1ae@xps-13>
In-Reply-To: <20240821071132.281018-2-hpchen0nvt@gmail.com>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
	<20240821071132.281018-2-hpchen0nvt@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092620_836980_4D199D21 
X-CRM114-Status: GOOD (  13.16  )
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

SGksCgpocGNoZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDIxIEF1ZyAyMDI0IDA3OjEx
OjMxICswMDAwOgoKPiBBZGQgZHQtYmluZGluZ3MgZm9yIHRoZSBOdXZvdG9uIE1BMzUgU29DIE5B
TkQgQ29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIdWktUGluZyBDaGVuIDxocGNoZW4w
bnZ0QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbXRkL251dm90
b24sbWEzNWQxLW5hbmQueWFtbCAgICAgfCA5MyArKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbAo+
IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251
dm90b24sbWEzNWQxLW5hbmQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjE1Mjc4NGU3MzI2Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQu
eWFtbAo+IEBAIC0wLDAgKzEsOTMgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1s
Iwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPiArCj4gK3RpdGxlOiBOdXZvdG9uIE1BMzVEMSBOQU5EIEZsYXNoIEludGVyZmFjZSAoTkZJ
KSBDb250cm9sbGVyCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEh1aS1QaW5nIENoZW4gPGhw
Y2hlbjBudnRAZ21haWwuY29tPgo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiBuYW5kLWNvbnRy
b2xsZXIueWFtbCMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGVu
dW06Cj4gKyAgICAgIC0gbnV2b3RvbixtYTM1ZDEtbmFuZAoKQ2FuIHdlIHBsZWFzZSB1c2UgdGhl
IC1uYW5kLWNvbnRyb2xsZXIgc3VmZml4LiBBIE5BTkQgaXMgYSB0aGUgY29tbW9uCm5hbWUgZm9y
IGEgY2hpcCB3aXRoIHN0b3JhZ2UgaW5zaWRlLiBZb3UgYXJlIGRlc2NyaWJpbmcgYSBob3N0CmNv
bnRyb2xsZXIgdGhhdCBjYW4gYmUgY29ubmVjdGVkIHRvIGluIG9yZGVyIHRvIHRhbGsgdG8gYSBO
QU5ELgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
