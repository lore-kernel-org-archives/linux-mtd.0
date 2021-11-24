Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E7AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Nov 2021 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WA23P5reguBpvukNFTrzYMH7y1yzDSrQe+/Sqle1NyE=; b=m5+pijtBpZBibT
	vbSOGzL6QdMNW+yUZxk2sBHPDj3cY4mroCoLnmASIMi9et52PsN7P6D6uQ/SV3T1jcu9CAF/EhBqx
	02tLaF+9ZF9Yz84wfNAWZXOzzKRKCPGQ4I82Wc3HvTJ+eaLQVPggh8nMfmxJpvpU7iTpMrZ02lyZi
	LhJsbhuTyYdNkTTzTHPqTN5l0qiRMOhldhow9KAhJ7ifZfXh+yijSef/BZz/a8SEibp5PEB9+9tL8
	tworZlNtT6kPS9uS3gp3k4u9qXO5DujEo4wIJHOyOWpxKCN9gTssTCNurOJ7VSvWTX0oRs6Rxq57o
	obQN0KR3xiejcQ3GcMrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvRM-005JcK-5F; Wed, 24 Nov 2021 16:48:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvR6-005JXJ-TA; Wed, 24 Nov 2021 16:47:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D688A60F36;
 Wed, 24 Nov 2021 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637772475;
 bh=xZZelNzGy3fEF+TRUP3mu2a2dvknfo0hSlfUMkdbXnE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZVpmCQnPt3L02oPsJhAmO4nX97QnIS5niHGEeu54izCev4oMWyJIlXQ24GtVZboz4
 LMaKEueP3mCpBmBPTByCysthlSUjCFjsYDvCerR3inwzHftWLQLSYeALAQ6fkghdfn
 UBdDjv5fENvPHtqupkg3nbZNDvSAeuWhwS4gprqrmDS5YEsaocCOagKTvsmAUnm1rs
 MiUxSF3gH8eXDNChMsZzaRRsN2SpEwQ9zkrl2rG/icX1RhLu986iIAJI6h4ZDqhfAk
 76rAij08PK/MXJd1LoZBIKVAaZHZ9aUh5PEYgRefEBC9zGSAk+OA9wgPJIW1MxDmr2
 CGDyYBOUS6Llw==
Received: by mail-wm1-f41.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so6054330wme.0; 
 Wed, 24 Nov 2021 08:47:55 -0800 (PST)
X-Gm-Message-State: AOAM5305XDcj/xhb6PprvxCaK5rSkAaygK+36n2wf/a5VTNFN7dDJgdq
 fN3f/02sD0gKbYp7pPPyDlbZrZUbDGyrKkqkZFU=
X-Google-Smtp-Source: ABdhPJwbFP7vLbm8pNQQOpEuYc09R2zZihV7ND7aqtuJCkGnJDFI12J2lrIBTl3QZQQRaScbWu3GRnefAkQ3ygpVdCU=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr16061185wmi.173.1637772474274; 
 Wed, 24 Nov 2021 08:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
 <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
In-Reply-To: <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 24 Nov 2021 17:47:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
Message-ID: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jon Hunter <jonathanh@nvidia.com>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev, 
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_084757_039172_70C78E81 
X-CRM114-Status: GOOD (  16.49  )
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

T24gV2VkLCBOb3YgMjQsIDIwMjEgYXQgNTozMiBQTSBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBn
bWFpbC5jb20+IHdyb3RlOgo+IDIzLjExLjIwMjEgMDE6MjEsIEFybmQgQmVyZ21hbm4g0L/QuNGI
0LXRgjoKPgo+IFRoZSBjb21taXQgbWVzc2FnZSBpcyBjb3JyZWN0LCBob3dldmVyIHlvdSBjb3Vs
ZCByZW1vdmUgZXZlbiBtb3JlIGNvZGUKPiBoZXJlLiBCdXQgdGhlcmUgaXMgbm8gbmVlZCB0byBt
YWtlIGEgdjMganVzdCBiZWNhdXNlIHRoaXMgcGF0Y2ggYmVjYXVzZQo+IEkgYWxyZWFkeSBwcmVw
YXJlZCBwYXRjaHNldCB0aGF0IHJldml2ZXMgdGhpcyBTL1BESUYgZHJpdmVyIGFuZCBlbmFibGVz
Cj4gSERNSSBhdWRpbyBvbiBUZWdyYTIwLiBJJ2xsIHRha2UgY2FyZSBvZiBjbGVhbmluZyB1cCB0
aGUgd2hvbGUgY29kZSBvZgo+IHRoaXMgZHJpdmVyLgoKT2ssIHBlcmZlY3QsIHRoYW5rcyBmb3Ig
dGFraW5nIGEgY2xvc2VyIGxvb2sgYXMgd2VsbC4KCj4KPiAtICAgICAgIGRtYXJlcSA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX0RNQSwgMCk7Cj4gLSAgICAgICBpZiAo
IWRtYXJlcSkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJObyBETUEg
cmVzb3VyY2VcbiIpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiAtICAgICAg
IH0KPiAtCgpSaWdodCwgSSB0aGluayBJIGNvbnNpZGVyZWQgZG9pbmcgdGhpcyBhdCBzb21lIHBv
aW50IGFzIHdlbGwsIG5vdCBzdXJlCndoeSBJIGxlZnQgaXQgaW4gZm9yIHRoZSB2ZXJzaW9uIEkg
cG9zdGVkLiBQYXNzaW5nIHRoZSBJT1JFU09VUkNFX0RNQQp2YWx1ZXMgaXMgY2xlYXJseSB3cm9u
ZyBieSBpdHNlbGYgYW5kIG5lZWRzIHRvIGJlIHJlbW92ZWQsIHRob3VnaAppdCdzIG5vdCBvYnZp
b3VzIHdoYXQgdGhlIGNvcnJlY3Qgd2F5IG9mIHJlcXVlc3RpbmcgdGhlIERNQSBjaGFubmVsCmlz
IGZvciB0aGlzIGRyaXZlciBlaXRoZXIsIHdpdGhvdXQgYSBEVCBiaW5kaW5nIG9yIHVzZXJzLgoK
ICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
