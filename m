Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356ADC54764
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+quDw0/+tcfPoe6xa5AI+XyfbLkoFqQ4JDENi+79H8=; b=hWSzz06W5D0wpe
	oQeW92AcM24m8EbghBBSQRfAJ0h95Tpj1zHGBVJIFIbfvsYuUcB+Xbzorjj37UOV+eOzYC6vldS59
	fblBK8GzqbD/ny09hkFBNgkwxR+AxYczWYUn1mI2pijz3gZfnD2h1eiS6HfPhWGX3K9t2NQTODkl5
	niXgs1Bxybltx+VOU6JCOxBzfGlzUyb4cPJOhsp5r/z/J/RBuGgSZT2ioiUJDiCIhYCVu9rzBHxJm
	obf0GOuFiLF60JhaGKHiOvPZ+Zt8vAfTtA6Y/BDJ5ghjrwgPRtlWAPK0eg8xUblRZOzQN9Jhpqnyr
	wCkRQsX4IabQKYv63Lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1PV-0000000A8Tw-099X;
	Mon, 19 Feb 2024 11:02:09 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc1PQ-0000000A8Sk-3wA9
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 11:02:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03DBD6000B;
	Mon, 19 Feb 2024 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708340521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t27JD9vQCz4yHAU/sc6tVJAOHfeKNbWcnRVeUVWIkwo=;
	b=DuDL9T4PLsVeV0kVRHxYLvPzuYAWVBMrTHo2L0Wu2eWSHJaUcjDjbEbS5GFPVPrPrAsJao
	rSOpMgBXJx8FjeTaygqPpElW0w3H54qnBjtsPFP26NI9LOg45Pwcdtnh6RCc4+scAjjfHK
	skgFCaMrGvql4KtLksBIx0aeP1NBf/4Vs3hvHB0K6UAbU+eAeozXjygMQ3I5Kq1rMGeFUU
	PTEkS3kvfY/MmbwpXqO8W8xbIjkZzDPRPrJnN3G49JW+K4A1a3f/YcK0+V3huDvHsHylQi
	qMqCqT3fDV8K9MBJzXBSZGxdyBdTBK9rhisMHVrNTBE5aPticJxmnVmugWmLwQ==
Date: Mon, 19 Feb 2024 12:01:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
Message-ID: <20240219120156.383a1427@xps-13>
In-Reply-To: <82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
	<82ceb13954f7e701bf47c112333e7b15a57fc360.1702952891.git.daniel@makrotopia.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_030205_278907_69E0C6D6 
X-CRM114-Status: GOOD (  15.40  )
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

SGkgRGFuaWVsLAoKZGFuaWVsQG1ha3JvdG9waWEub3JnIHdyb3RlIG9uIFR1ZSwgMTkgRGVjIDIw
MjMgMDI6MzM6NDggKzAwMDA6Cgo+IEluIGFuIGlkZWFsIHdvcmxkIHdlIHdvdWxkIGxpa2UgVUJJ
IHRvIGJlIHVzZWQgd2hlcmUgZXZlciBwb3NzaWJsZSBvbiBhCj4gTkFORCBjaGlwLiBBbmQgd2l0
aCBVQkkgc3VwcG9ydCBpbiBBUk0gVHJ1c3RlZCBGaXJtd2FyZSBhbmQgVS1Cb290IGl0Cj4gaXMg
cG9zc2libGUgdG8gYWNoaWV2ZSBhbiAoYWxtb3N0LSlhbGwtVUJJIGZsYXNoIGxheW91dC4gSGVu
Y2UgdGhlIG5lZWQKPiBmb3IgYSB3YXkgdG8gYWxzbyB1c2UgVUJJIHZvbHVtZXMgdG8gc3RvcmUg
Ym9hcmQtbGV2ZWwgY29uc3RhbnRzLCBzdWNoCj4gYXMgTUFDIGFkZHJlc3NlcyBhbmQgY2FsaWJy
YXRpb24gZGF0YSBvZiB3aXJlbGVzcyBpbnRlcmZhY2VzLgo+IAo+IEFkZCBVQkkgdm9sdW1lIE5W
TUVNIGRyaXZlciBtb2R1bGUgZXhwb3NpbmcgVUJJIHZvbHVtZXMgYXMgTlZNRU0KPiBwcm92aWRl
cnMuIEFsbG93IFVCSSBkZXZpY2VzIHRvIGhhdmUgYSAidm9sdW1lcyIgZmlybXdhcmUgc3Vibm9k
ZSB3aXRoCj4gdm9sdW1lcyB3aGljaCBtYXkgYmUgY29tcGF0aWJsZSB3aXRoICJudm1lbS1jZWxs
cyIuCj4gQWNjZXNzIHRvIFVCSSB2b2x1bWVzIHZpYSB0aGUgTlZNRU0gaW50ZXJmYWNlIGF0IHRo
aXMgcG9pbnQgaXMKPiByZWFkLW9ubHksIGFuZCBpdCBpcyBzbG93LCBvcGVuaW5nIGFuZCBjbG9z
aW5nIHRoZSBVQkkgdm9sdW1lIGZvciBlYWNoCj4gYWNjZXNzIGR1ZSB0byBsaW1pdGF0aW9ucyBv
ZiB0aGUgTlZNRU0gcHJvdmlkZXIgQVBJLgoKSSBkb24ndCBmZWVsIHF1YWxpZmllZCBlbm91Z2gg
dG8gcmV2aWV3IHRoZSBvdGhlciBwYXRjaGVzLCBob3dldmVyIHRoaXMKb25lIGxvb2tzIGdvb2Qg
dG8gbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
