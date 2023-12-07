Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95A6C4167B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu3YR0Uya1jlufM6OpGA2hnN5cdzzi/YaoArINRMs1M=; b=qKHcfZlPGvQhlZ
	KZr3mQGfWm+7S0ZLzuRw7BaJ4jFyA24qF3YNo6PkxYRg/2OxWXNjV51lEie1Gzt3XmU9TU3+d8rxJ
	97+jQlCgYz+RfD97Z4+4f5A4+7vxAtZSiXhkac1sTYrukA0fAfxRx6CRM75Z7JezyfLev6eOsct6X
	ylSBon+L/xAvTBc51p9XUIg4hHl5Ld6+mtdI1UjYHjNJZXP62OOfZazDlMUo/BmrqZ96tNF28V2E6
	zuuSsL7pjo4+sNwllDIgu1oZoa72YNdu6B5OXB9hj0xOdLKMyhmPET0bINtxkjxW1awUKp1XxbSzz
	y3E2ebUiqK7I6hvUO/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEan-00CvMy-1A;
	Thu, 07 Dec 2023 13:39:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBEai-00CvKp-0I;
	Thu, 07 Dec 2023 13:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 76DAFB827E9;
	Thu,  7 Dec 2023 13:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7E5C433C7;
	Thu,  7 Dec 2023 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701956337;
	bh=LrKFalPpX4ro1UCj+XeZRPkOqxKYC9UU2FyCF0mGy08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjLPZIg8FFgsaWRJGrgM6lwAFRaMTuWNUEdoEZvWuxAYsk5rD+M9zXvKHaXN1xlrS
	 hXU/HzHP6fXanl92P/HT69g0DluwYbE+xs8k7PpcJ2g50JRXKnct5IOFVJ0TtPo+dm
	 pLPZxW2WmIq67oYfevuMMtKStccsxVUdN7fZqGVpgksCsyRPTkrDtHNZyG2ODFUjsw
	 1mcvjtPeWPGKEj4DxkbdpVd4shxELDPBf+Uq9viCxEFQid8zyP1ekkbsfPmESx8jna
	 /On7CAGQCWJntcZabaDryMMDMWorCO6m+gEZjEAQ6MIGGThmYxQ2cfF5IQHlPzG4Bh
	 TS2sianKt7+dQ==
Date: Thu, 7 Dec 2023 13:38:49 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, james.schulman@cirrus.com,
	david.rhodes@cirrus.com, rf@opensource.cirrus.com, perex@perex.cz,
	tiwai@suse.com, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: [GIT PULL] Immutable branch between MFD and SPI due for the v6.8
 merge window
Message-ID: <20231207133849.GB8867@google.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
 <170142465659.3329910.8527538140063947758.b4-ty@kernel.org>
 <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <395caa58-a8a0-4c75-85d3-4fa0f6f4a9ba@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_053900_275484_1D15F315 
X-CRM114-Status: UNSURE (   8.50  )
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

R29vZCBhZnRlcm5vb24gTWFyaywKCj4gSXMgdGhlcmUgYSBzaWduZWQgdGFnIGF2YWlsYWJsZSBm
b3IgdGhpcyAtIHdpdGhvdXQgdGhpcyBjaGFuZ2UgdGhlCj4gc3Vic2VxdWVudCBTUEkgY2hhbmdl
cyBpbnRyb2R1Y2UgYSBidWlsZCBicmVha2FnZS4KClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgYjg1ZWE5NWQwODY0NzFhZmI0YWQwNjIwMTJhNGQ3M2NkMzI4ZmE4NjoKCiAgTGlu
dXggNi43LXJjMSAoMjAyMy0xMS0xMiAxNjoxOTowNyAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbGVlL21mZC5naXQgaWItbWZkLXNwaS12Ni44Cgpmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gNGFlMDg4NDVkYjRjMWY3NTliODM4MmJjNzUyN2FiODI0OTIzMGU3
ZjoKCiAgbWZkOiB0cHM2NTk0OiBVc2Ugc3BpX2dldF9jaGlwc2VsZWN0KCkgQVBJIHRvIGFjY2Vz
cyBzcGktPmNoaXBfc2VsZWN0ICgyMDIzLTEyLTA3IDEzOjM2OjI5ICswMDAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJ
bW11dGFibGUgYnJhbmNoIGJldHdlZW4gTUZEIGFuZCBTUEkgZHVlIGZvciB0aGUgdjYuOCBtZXJn
ZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KQW1pdCBLdW1hciBNYWhhcGF0cmEgKDEpOgogICAgICBtZmQ6IHRw
czY1OTQ6IFVzZSBzcGlfZ2V0X2NoaXBzZWxlY3QoKSBBUEkgdG8gYWNjZXNzIHNwaS0+Y2hpcF9z
ZWxlY3QKCiBkcml2ZXJzL21mZC90cHM2NTk0LXNwaS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
