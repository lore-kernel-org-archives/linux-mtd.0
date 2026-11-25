Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060E606A331
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zulxV0uV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fzztysMS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6vB+pcpl15nWSqFJnn6w8A/brKT+MnsfyRMPH52J/w=; b=zulxV0uVqV7iA2xKJ5En904vif
	6lVu0pLnEnPMdjWUY/zb9O8nwuiBHiU7j1vn4QJa8iF1pAbId5NQDz/W16FI4MhPclwoGmZO75nGR
	wUM8rLxlweeqV31Du/pD6T+9s3cFpYt2wKd0hjweZcgpfAcrYKJNbLiBkSbQ4dra7T50EjUosOED5
	8D/Wt0XKZdGU2IXZ2Tz+kYMMb2lvlqMkNkUc111nnjSSvkPNKZBbZKa3gKR46rGMokr0uy2A6Ug7G
	fMiM+aUunIwiNsdA46d0IkYnpr6zKb5aK/9RSJ/xfPdSEFa43tfQOwi7Rzzg2hiW1/1Mhd1Wr8KK1
	dLwSyq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHJP-0000000Aute-3BSf;
	Wed, 25 Nov 2026 18:01:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHJ2-0000000Aupe-0REI;
	Wed, 25 Nov 2026 18:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABDBE42DC2;
	Wed, 25 Nov 2026 18:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF3A1F000C0;
	Wed, 25 Nov 2026 18:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629679;
	bh=Kfnsn+GExxNF6/85LEMQhNMM6va6vosa6Wa8rs1WCO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fzztysMSAN+Qk5X91RAFmJr8I9YRkbOVZ7bim/A+1lN9fFPqt3ftvtRx0/R93mfTl
	 BqkJtNbph+G4LWywi3lBM/OknMNYEQSGfsE2mUQnxzVnWjLw+Vw9g7yNIs9ioDGGsA
	 qJNb7uljE/DlM9F18WTrCHhJigYq5mjYu6yDuJtb9oDhA1bxrskFe1ryq9M0F+eY12
	 HnmsBGMgcxw+96C3LFG90cDKHATjPPpQOgWizrn1R/GmvuHytoRyYfAYnLtLrXGu14
	 BCZKd9hUp6t9DoDsOlG/5s0btzt0XFifdsH5i15++ZN7+4MfWHgabNN1YMg6JohCCB
	 R5Ip6m9UgrnqQ==
Message-ID: <sashiko-outbox-233886@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/16] spi: sn-f-ospi: Consume dummy cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-13-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-13-fd036402fd37@bootlin.com>
Date: Wed, 25 Nov 2026 18:01:16 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogc24tZi1vc3BpOiBi
dWlsZCBmYWlsdXJlIGluIGZfb3NwaV9zdXBwb3J0c19vcCgpIGR1ZSB0bwogIG9wLmR1bW15Lm5j
eWNsZXMKLS0KCmNvbW1pdCA1YjIwMmQxNDhiOTE1YjYyOTdjOGIxMzU0YzNjODc2YWE5OTA1N2M1
CkF1dGhvcjogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCnNwaTog
c24tZi1vc3BpOiBDb25zdW1lIGR1bW15IGN5Y2xlcyBkaXJlY3RseQoKVGhpcyBjb21taXQgYWR2
ZXJ0aXNlcyB0aGUgZHVtbXlfY3ljbGVzIGNhcGFiaWxpdHkgaW4gZl9vc3BpX21lbV9jYXBzIGFu
ZAp1cGRhdGVzIHRoZSBkcml2ZXIgdG8gdXNlIG9wLT5kdW1teS5uY3ljbGVzIGRpcmVjdGx5IGlu
c3RlYWQgb2YgY29udmVydGluZwpkdW1teSBieXRlcyB0byBjeWNsZXMuCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktc24tZi1vc3Bp
LmMKPiBpbmRleCBmMDMyMGU5NmZlMjMyLi5lY2ZjZjIyOGM1ODcwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1zbi1mLW9zcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1zbi1mLW9z
cGkuYwoKWyAuLi4gXQoKPiBAQCAtNTUzLDcgKzU0NSw3IEBAIHN0YXRpYyBib29sIGZfb3NwaV9z
dXBwb3J0c19vcF93aWR0aChzdHJ1Y3Qgc3BpX21lbSAqbWVtLAo+ICBzdGF0aWMgYm9vbCBmX29z
cGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCQkJICAgICAgIGNvbnN0IHN0
cnVjdCBzcGlfbWVtX29wICpvcCkKPiAgewo+IC0JaWYgKGZfb3NwaV9nZXRfZHVtbXlfY3ljbGUo
b3ApID4gT1NQSV9EVU1NWV9DWUNMRV9NQVgpCj4gKwlpZiAob3AuZHVtbXkubmN5Y2xlcyA+IE9T
UElfRFVNTVlfQ1lDTEVfTUFYKQo+ICAJCXJldHVybiBmYWxzZTsKCltTZXZlcml0eTogSGlnaF0K
RG9lcyB0aGlzIGZhaWwgdG8gYnVpbGQgYmVjYXVzZSBvcCBpcyBhIHBvaW50ZXIgKGNvbnN0IHN0
cnVjdCBzcGlfbWVtX29wICopCmFjY2Vzc2VkIHdpdGggJy4nIGluc3RlYWQgb2YgJy0+Jz8KCkFs
c28sIG9wLT5kdW1teS5uY3ljbGVzIGlzIGEgdTggd2hpbGUgT1NQSV9EVU1NWV9DWUNMRV9NQVgg
aXMgMjU1LCBzbwpjb21wYXJpbmcgaXQgd2l0aCAnPiBPU1BJX0RVTU1ZX0NZQ0xFX01BWCcgaXMg
YWx3YXlzIGZhbHNlIGFuZCB0cmlnZ2VycyBhCi1XdHlwZS1saW1pdHMgY29tcGlsZXIgd2Fybmlu
Zy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjExMjUtbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjEtMC1mZDAz
NjQwMmZkMzdAYm9vdGxpbi5jb20/cGFydD0xMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
