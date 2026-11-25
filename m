Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AD606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=We0UZeOA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/EWSr9R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+AuzWd7pFmiKaOvpXKi6grE5dmzmzUeVT9s/MV5GCQ=; b=We0UZeOAu8GhMaLGk08nIUmyJh
	Uyu0Yp5TZFfmsxlFfJ0o6+YGCLr9VF+HSXH3ctXaBfO5IBHzTUA9YRr/Nk2wwHrDjwlw9FWA222F2
	DIUoyoJ5zR4qSa5e5WAwpC9wJinw3jHvLUSBVG2cX9OGyJ7q++rd6avJ2YSaO0MlDxHPgJ7KIr1o8
	w7zXUZdW73Y/lRpohv/q9az8UlV7zRGkd0wr5AX7Mh9hJ+9Qkz52tOm25W7te4qwox5zCS+TOgbvW
	Hlu0hMIreglKxkvN/dnwZ0u2JgvmfFErpJZRL7fLxcHSAlc1MrDwot2QUPPPIZhAzokgh64QEBLkE
	PFvM/RsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHGm-0000000AtsQ-0D6E;
	Wed, 25 Nov 2026 17:59:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHGj-0000000AtqE-2J5W;
	Wed, 25 Nov 2026 17:58:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2978B434FB;
	Wed, 25 Nov 2026 17:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD5E1F000C4;
	Wed, 25 Nov 2026 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629537;
	bh=n/q7CZ4WchDFjcjZtl3tPRaBN+QI0P+NeEOoKx24qh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/EWSr9R2bnkPoMWGsf7W6ueTQdiSPV8ZdbM2tjQP5StBlLBG9NtqhV5x/uMdl0de
	 JNrsGKh6KSL9gWXzX+9F3GRSe1N9NmceW5FrWiyDAvo8L7TcLYZpAmNyLxrGchZ1EV
	 YO9AohJ/pvbXg42BIFh5lyuS0egtQgsN2K8ha6tAJ/ETyoTo8aGlrfmflf2kkjJLPv
	 tNLNvASAXB2RCC+Ig8yDULXQtBTzkW86mziDH/3EoTzr1ZP+EZlb+OjABjIGUXXRSn
	 /zm7v7lIQI7ZfEaKMPTLft2sTlkhM3LKTMRIQ4WznIBUcezOBUAw7ab99Lwhyul3Nb
	 +4uJxIqr4bgPA==
Message-ID: <sashiko-outbox-233877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 17:58:55 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gc3BpOiBzcGktbWVtOiBtaXNz
aW5nIEZpeGVzIHRyYWlsZXIgZm9yCiAgc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCkgZml4
Ci0tCgpjb21taXQgYmI2MTJjZDA4ZDVmZDU4ODdiZTM2Y2U1N2E3MTU5ZTgwNWE0NzgwZApBdXRo
b3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IHNwaTogc3Bp
LW1lbTogSGFuZGxlIGEgY29ybmVyIGNhc2Ugd2hpbGUgc2FuaXRpemluZyBvcHMKPgo+IFNvbWUg
bWl4ZWQgbW9kZSBvcGVyYXRpb25zIChzdWNoIGFzIDFTLXhELXlEKSB3aWxsIGJlIGZsYWdnZWQg
d2l0aAo+IG9wX2lzX2R0ciBidXQgd2lsbCBub3QgZW50ZXIgdGhlIE9EVFIgY2hlY2tzLiBBcyBh
IHJlc3VsdCwgdGhlIG51bWJlciBvZgo+IGNvbW1hbmQgYnl0ZXMgd2lsbCBuZXZlciBiZSBjaGVj
a2VkLgo+Cj4gUmVvcmdhbml6ZSBhIGxpdHRsZSBiaXQgdGhpcyBoZWxwZXI6Cj4gLSBJZiB0aGUg
b3BlcmF0aW9uIGNvbnRhaW5zIGEgRFRSIHBoYXNlLCBzYW5pdGl6ZSBpdC4KPiAtIFRoZW4gc2Fu
aXRpemUgdGhlIG9wLCBzaG91bGQgaXQgYmU6Cj4gICAtIE9EVFIgKDhELThELThEKQo+ICAgLSBh
bnl0aGluZyBlbHNlCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPgoKW1NldmVyaXR5OiBMb3ddClRoaXMgZml4ZXMgdGhlIGNvbW1hbmQt
Ynl0ZSBjaGVjayBza2lwcGVkIGZvciBub24tT0RUUiBvcGVyYXRpb25zIHdpdGgKRFRSIHBoYXNl
cyBzaW5jZSA4NjE4MjcxODg3Y2EgKCJzcGk6IHNwaS1tZW06IExpbWl0IG9jdGFsIERUUiBjb25z
dHJhaW50cwp0byBvY3RhbCBEVFIgc2l0dWF0aW9ucyIpLiAgU2hvdWxkIHRoaXMgaW5jbHVkZToK
CiAgRml4ZXM6IDg2MTgyNzE4ODdjYSAoInNwaTogc3BpLW1lbTogTGltaXQgb2N0YWwgRFRSIGNv
bnN0cmFpbnRzIHRvIG9jdGFsIERUUiBzaXR1YXRpb25zIikKCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBz
dHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjEtMC1mZDAzNjQwMmZkMzdAYm9vdGxpbi5jb20/cGFy
dD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
