Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C0CD5BD1
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1hgeRFWUwUY5LF+lIJV+1VkavFaamtnt8lrmly4wlA=; b=QV359QOs90j9eb
	jZAH0JZQ8tEhdpyzBF/g55Uap252RcohC8o6fu1Nr6myIIfRO+tSBQegDCjSGiGVO4i40Ngp02MPe
	oncGs0IJWmi6WgZXYeiJ0FsEU5B/rM1NdlO1wtzlaTkbW58Mby6mJivFOGcYIKXghoRp6XwbkBEYh
	XsEO6Qhlv+yMAf/tEwvtP4KXS3GIF2OQT3IxP6W8PuPq3ynkrspMuNt1MRKYgVLdqgXxLYfkSGnyD
	Ht0UfbgJU3oGlxIfbiNLSaVlGDGeaxIv13mB0b540ULBpkCsbco+zg2B73fq8+uHK7veX9pyI5zoE
	F4bgMfe2HUu8FWBEeJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX7R-00000005W1x-1SaA;
	Thu, 28 May 2026 09:33:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX7O-00000005W0d-0qgo
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 09:33:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6E704E42D77;
	Thu, 28 May 2026 09:33:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79A7F60495;
	Thu, 28 May 2026 09:33:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EE441088805F;
	Thu, 28 May 2026 11:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779960809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7wBWFmX7A2K5Kn1PWUGG3OttcMWxMxuRHQAzITMWkro=;
	b=GF3u8C2iZBrGmJms36EOr/WK4DYqgLLTjFyoc7YS9Fv5tsyQPYwCnlTWR9T4nS2dwcolYk
	9yshvGHj7seczzL/xclWdmidkK42ZGdldHLQfdvY9WaNuC6Mcg2U8eSucGLAEHyDXzq9UF
	HH5WM0oqtttYL+dIjxFqMqomdSt6k/J1KhXkUelbeDF5EIO7qCKC+8zDoeOTfURsixDRxl
	njPq8w3xujdHyBrZCiXZxw4OMKyTc+YCVw/IJsNE4FizEXN+50atnaKbUZfQ2OdRe6L2K1
	DWwbny8omVGniZzt8sdH4UqqHY3JDQMT10mp5UFehsZYtsPy4kgQr9+rEDaVDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Frieder Schrempf" <frieder.schrempf@kontron.de>,  "Frieder Schrempf"
 <frieder@fris.de>,  "Mark Brown" <broonie@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,
  "Han Xu" <han.xu@nxp.com>,  "Eberhard Stoll" <eberhard.stoll@kontron.de>,
  "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  <linux-spi@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <imx@lists.linux.dev>,  "Santhosh Kumar K" <s-k6@ti.com>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <DHHRLJLX9AVS.CRZTDV7TP1DO@kernel.org> (Michael Walle's message
	of "Wed, 01 Apr 2026 13:00:20 +0200")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	<87wlzlnioh.fsf@bootlin.com>
	<a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
	<87ecl09wtv.fsf@bootlin.com>
	<633fee13-a397-410f-a595-db95e04b8110@kontron.de>
	<87ldf881gr.fsf@bootlin.com>
	<fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de>
	<874ilv84j8.fsf@bootlin.com> <DHHRLJLX9AVS.CRZTDV7TP1DO@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 11:33:26 +0200
Message-ID: <875x47g9p5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_023334_374109_B12D2025 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sCgo+Pj4gTGV0J3Mgc2F5IGZvciBhIHdvcnN0IGNhc2Ugc2NlbmFyaW8gYSBjaGlwIGhh
cyBhbiBSWCBkZWxheSBvZiAyMG5zICh0aGUKPj4+IGhpZ2hlc3QgSSd2ZSBzZWVuIGluIGRhdGFz
aGVldHMgc28gZmFyIGlzIDhucykuIEluIHRoYXQgY2FzZSB0aGUgbWF4aW11bQo+Pj4gY2xvY2sg
d2UgY291bGQgc2FmZWx5IHVzZSBmb3IgcmVhZGluZyB0aGUgSUQgd291bGQgYmUgMS8oMioyMGUt
OSkgPQo+Pj4gMjVNSHouIERvIHlvdSB0aGluayBpdCByZWFsbHkgbWFrZXMgbXVjaCBvZiBhIGRp
ZmZlcmVuY2UgaWYgd2UgcmVhZCB0aGUKPj4+IElEIChvbmx5IGEgaGFuZGZ1bCBvZiBieXRlcykg
YXQgMjVNSHogb3IgZnVsbCBzcGVlZCAoZS4gZy4gMTA0IE1Ieik/IEkKPj4+IG1lYW4gdGhpcyBz
aG91bGQgYmUgZmFzdCBlbm91Z2ggZWl0aGVyIHdheSwgbm8/IEJ1dCBtYXliZSBJJ20gbWlzanVk
Z2luZwo+Pj4gdGhpcy4KPj4KPj4gSSBhbSBob25lc3RseSBub3QgYSBiaWcgZmFuIG9mIHRoZSBn
bG9iYWwgcGVuYWx0eSwgYnV0IEkgYW0gbm90IHRvdGFsbHkKPj4gb3Bwb3NlZCBlaXRoZXIsIGVz
cGVjaWFsbHkgc2luY2UgeW91IGp1c3Qgc2FpZCB5b3Ugb25seSBvYnNlcnZlZCA4bnMKPj4gZGVs
YXlzIGF0IG1vc3QuIFRoaXMgaXMgNjIuNU1Ieiwgd2hpY2ggaXMgYWxyZWFkeSBhYm92ZSB3aGF0
IG1vc3QKPj4gZGVzaWducyB1c2UsIHNvIHRoZSBwZW5hbHR5IHdvdWxkIGJlIG1pbmltYWwuIFdo
YXQgYWJvdXQgdGFraW5nIHRoaXMKPj4gYXBwcm9hY2ggYW5kIHNlZSBpZiB0aGF0IGZpeGVzIG1v
c3Qgb2Ygb3VyIHVzZSBjYXNlcz8KPgo+IFdoYXQgYXJlIHRoZSBhY3R1YWwgbnVtYmVycyB3ZSBh
cmUgdGFsa2luZyBhYm91dCBoZXJlPyBJIG1lYW4sIGF0Cj4gbGVhc3QgZm9yIFNQSSBOT1IsIHdl
IG9ubHkgcmVhZCB0aGUgSUQgKm9uY2UqLiBBbmQgaXQgdGFrZXMgYWJvdXQgNTYKPiBiaXRzIChj
b21tYW5kICsgaWQgbGVuZ3RoIG9mIDYpLiBUaGF0IGlzIGFib3V0IDJ1cyBhdCAyNU1Iei4gSSdk
Cj4gZ3Vlc3MgdGhlIHNldHVwIGFuZCB0aGUgc29mdHdhcmUgaGFuZGxpbmcgdGFrZXMgZmFyIGxv
bmdlciB0aGFuCj4gdGhhdC4KCkkgaGF2ZW4ndCBnb3QgdGhlIHRpbWUgdG8gcmVzdW1lIG15IFNQ
SSBOQU5EcyB0byB0ZXN0cyB0aGlzIHlldC4gSQp3YW50ZWQgdG8gaW5zdHJ1bWVudCB0aGUgY29k
ZSBhbmQgY2hlY2sgdGhlIGFjdHVhbCBpbXBhY3QgYmVjYXVzZSB3ZSBkbwpzZXZlcmFsIElEIHJl
YWRzIGluIFNQSSBOQU5ELiBJIGFtIHN0aWxsIGluIGZhdm91ciBvZiBrZWVwaW5nIHRoZQpwZW5h
bHR5IG1pbmltYWwgdGhvdWdoIChzZWUgbXkgcHJldmlvdXMgYW5zd2VyKSBpZiBwb3NzaWJsZS4g
RnJpZWRlciwKeW91IGFyZSB3ZWxjb21lIHRvIHByb2NlZWQgd2l0aCBhIGZvcm1hbCBmb2xsb3ct
dXAgc2VyaWVzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
