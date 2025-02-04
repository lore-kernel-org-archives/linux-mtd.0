Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5306C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 23:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Yh7P0+bgXvgLFq14xAUZuOH9uFChdsKs/YERH+k2H4=; b=EoOVPIs1xsnjjx
	xdlScySBO5eid5e+IllTzgcDJwNYFNWNt19WpfKVUCRsIK6V/9Lw19SV811f/N9DdVm6YB1H86u4X
	s7zwU/iSQbSAnewCU1IbGdphYCDhSrI4uSKDXbt9nijqb0rcS/tU8VDMzMSJQUwoGNTkZQ3HPEfKn
	PDsFlK2hFLQJ9udSK86dQVRWDGo9Q/0bwjB3B3DKdpdJ+ZX/ZDcA47K3QeJNgmzJwHkHshtZqxsvh
	2TUZVw7f1VL8nceICBy2tPal4DXqkUijQYKUw6kGticLCD6fp7z6lN0APZ6eTzX8fVtp59pEp/tyh
	QUnNJ0JwvYGaBFcjtbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSNu-00000001pjg-0Dbt;
	Tue, 04 Feb 2025 23:31:14 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSNp-00000001pjJ-1h4e
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 23:31:12 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C98F1240101
	for <linux-mtd@lists.infradead.org>; Wed,  5 Feb 2025 00:31:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1738711866; bh=dJP28q5tsQaLJ5Y1dJlvwdNzH08V5OcPLoDVQOBCze0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=JeH//egAxdP/noC5RoCMUR3PiFz8ld6VUlVtNLxdHdQ8SVa0TA1wMdmTUh+Elqwc2
	 YF4XtdkaZoixuZJffID+g8XfpiuAhFGAU7d6unfcWOvhDIoZStaY3pjDbYkJXsBBKy
	 GosPqLrzztYl9ylpxFQK5ubT8pb5IttYHtOCXzS7TOSo/aiD+ceeNzAz4fMPciOouH
	 FYWhMleejDIQaZg53HWg6BONww1nKdZ6C3q8JgXjy+kHpRXkh0MdXLAhUC9Qtce/Kx
	 owEjoat9URBVHI6oDP9H4/fZSkfolngK6wRJ9x1TiXd1iPPQehe7ccX3oWIGO+a7NG
	 4D+DKLWIasuWw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YnfkX6mVsz6tvZ;
	Wed,  5 Feb 2025 00:31:00 +0100 (CET)
Date: Tue,  4 Feb 2025 23:31:00 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
Message-ID: <Z6KjNC2tM29h1Z2M@probook>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <20250127045004.GE3106458-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250127045004.GE3106458-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_153109_730913_02ACB65D 
X-CRM114-Status: GOOD (  13.47  )
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

T24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMTA6NTA6MDRQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU3VuLCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDFQTSArMDEwMCwgSi4gTmV1c2No
w6RmZXIgd3JvdGU6Cj4gPiBTdXBwbGVtZW50IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wY2kvZnNsLHBjaS50eHQgd2l0aCBhIG1vcmUKPiA+IGZvcm1hbCBiaW5kaW5nIGluIFlB
TUwgZm9ybWF0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBw
b3N0ZW8ubmV0Pgo+ID4gLS0tClsuLi5dCj4gPiArdGl0bGU6IEZyZWVzY2FsZSBNUEM4M3h4IFBD
SS9QQ0ktWC9QQ0llIGNvbnRyb2xsZXJzCj4gPiArCj4gPiArZGVzY3JpcHRpb246IHwKPiA+ICsg
IEJpbmRpbmcgZm9yIHRoZSBQQ0kvUENJLVgvUENJZSBob3N0IGJyaWRnZXMgb24gTVBDOHh4eCBT
b0NzLgo+ID4gKyAgU2VlIGFsc286IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvZnNsLHBjaS50eHQKPiAKPiBDYW4geW91IG1vdmUgdGhhdCBpbmZvcm1hdGlvbiBoZXJlLgoK
V2lsbCBkby4KCj4gCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEouIE5ldXNjaMOk
ZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+Cj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRy
ZWY6IC9zY2hlbWFzL3BjaS9wY2ktaG9zdC1icmlkZ2UueWFtbCMKPiA+ICsKPiA+ICtwcm9wZXJ0
aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBpdGVt
czoKPiA+ICsgICAgICAgICAgLSBlbnVtOgo+ID4gKyAgICAgICAgICAgICAgLSBmc2wsbXBjODMw
OC1wY2llCj4gPiArICAgICAgICAgICAgICAtIGZzbCxtcGM4MzE1LXBjaWUKPiA+ICsgICAgICAg
ICAgICAgIC0gZnNsLG1wYzgzNzctcGNpZQo+ID4gKyAgICAgICAgICAgICAgLSBmc2wsbXBjODM3
OC1wY2llCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGZzbCxtcGM4MzE0LXBjaWUKPiA+ICsgICAg
ICAtIGNvbnN0OiBmc2wsbXBjODMxNC1wY2llCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAg
ICAgICAgLSBjb25zdDogZnNsLG1wYzgzNjAtcGNpCj4gPiArICAgICAgICAgIC0gY29uc3Q6IGZz
bCxtcGM4MzQ5LXBjaQo+ID4gKyAgICAgIC0gY29uc3Q6IGZzbCxtcGM4MzQ5LXBjaQo+ID4gKyAg
ICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IGZzbCxtcGM4NTQwLXBjaXgKPiA+
ICsgICAgICAgICAgLSBjb25zdDogZnNsLG1wYzg1NDAtcGNpCj4gPiArICAgICAgLSBjb25zdDog
ZnNsLG1wYzg1NDAtcGNpCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25z
dDogZnNsLG1wYzg1NDAtcGNpeAo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBmc2wsbXBjODU0MC1w
Y2kKPiA+ICsgICAgICAtIGNvbnN0OiBmc2wsbXBjODU0OC1wY2llCj4gPiArICAgICAgLSBjb25z
dDogZnNsLG1wYzg1NDgtcGNpZQo+ID4gKyAgICAgIC0gY29uc3Q6IGZzbCxtcGM4NjQxLXBjaWUK
PiAKPiBNb3ZlIGFsbCB0aGUgc2luZ2xlICdjb25zdCcgdG8gMSBlbnVtIGVudHJ5LgoKV2lsbCBk
bwoKPiA+ICsKPiA+ICsgIHJlZzoKPiA+ICsgICAgbWluSXRlbXM6IDEKPiA+ICsgICAgaXRlbXM6
Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogaW50ZXJuYWwgcmVnaXN0ZXJzCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogY29uZmlnIHNwYWNlIGFjY2VzcyByZWdpc3RlcnMKPiA+ICsKPiA+ICsg
IGNsb2NrLWZyZXF1ZW5jeToKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvdWludDMyCj4gCj4gRG9uJ3QgbmVlZCBhIHR5cGUgZm9yIHRoaXMuCgpXaWxsIGNo
YW5nZS4KCgpUaGFua3MsCkouIE5ldXNjaMOkZmVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
