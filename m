Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC9C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 22:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K24NKMCPe3bw4qcpFcBdKXUM1BZ/+gfwluVGoyXryDE=; b=lMGl5JatKfLAH6
	kNwtO15cKJFlTAB8dmqBnyzH7D0hVqaqaQdqTuthP1GiEt/hUYWwCqqQlTgs3D3xuH9C1si6t/acq
	XeasFnokWYsVsrS9jyX8smBBFIM2q7Q/HnL5/sX+Pu49FEKno6okNHYBIShLjtr6A2XrjCPaE+Rv3
	RhZ2qdd72kRBcNPnXIXCoKhnwtTxPI/WdHxRqooS6spIph1Bmw2Gu9cg6UCsOyXkVJ3jgMJVnPiR9
	fHHtDETDHm7SrRe81YkJXAqMnc3YLsRHpd3XDcOE7900nJ7avwmG/Et26jCO4voqqPgPWPcIfUmmw
	xalRBlyZ6MsOC4Ds5BlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weghW-00000000INU-3WX6;
	Tue, 30 Jun 2026 22:13:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weghV-00000000IN0-2CmT
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 22:13:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7A97601C1
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA601F00ACF
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782857583;
	bh=HM1j74yODPhJMYhAe8Gysw58b33HB8UlPnD7jYgM3wc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PJgsHN6yFCy6uM8OzJ5er++rKVozMaAHvyDqrhtYfMPCCxrpB8AXLUA6uGg+5VklC
	 9duGS1uMgl4p3p5uoQL7TK9MhvxKTa2dKSCMTkS2w2VwjlYEbiWAkQa2L67HL5VVVd
	 9uvKdyQ3g4QVOBg20tia94Xcv+JC3R0uEMn+QJKcGoYACQdi1ovvRcZqMegBGiFT4p
	 hLtNn0IurWdCmVibLCpjZx2NvYHdoGJBdwYHxHXG+WkxypEPGGiZsPFfWJoND2Kal+
	 98zSH13AxZSGRmzDL3hBFy5vxpfe1HN4oOXaZk4ptIHXrsgqLoTMTFxyer7juhoAp7
	 7YulToC5Pm34w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so2948819e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 15:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrGLUycjNkUOL/f8rbKbSH6I0EVgjnBcnLu6J+5xQP11MWbRrV2sm3twCFTYenX6VBecJoUu5iCa6Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0FBD8MvrLzUGZPNClGr5a1EhKMbNBKIo2w2ZHI6JmlSEcnciW
	DfM3TfxzrIT4IwnwtZ4IDUUgjKvtiqj7eRI29RVNr19HpTHQ4nJq4LhREay+WAQme35qWD/75ao
	T+vxZuklhSyZzgRtpYBDpRE0XiZFEgmY=
X-Received: by 2002:a05:6512:1248:b0:5ae:b2cf:8204 with SMTP id
 2adb3069b0e04-5aec10a3841mr657448e87.2.1782857582274; Tue, 30 Jun 2026
 15:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-2-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-2-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:12:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
X-Gm-Features: AVVi8CcLJOfvOFl8jmVmAP_uzLY_UWoBigmB1_kTp6EN1gm7rCEox0bV8PbTeSw
Message-ID: <CAD++jL=FkEfpz-LW0vmPpZ28fLfGFMWo5E479Mapz55YUxKNAQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: mtd: jedec,spi-nor: allow the SFDP to
 be exposed via NVMEM
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, 
	arnd@arndb.de, michael@walle.cc, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
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

SGkgTWFuaWthbmRhbiwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgSnVuIDMwLCAy
MDI2IGF0IDExOjI04oCvQU0gTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4KPG1hbmlrYW5kYW4ubUBt
aWNyb2NoaXAuY29tPiB3cm90ZToKCj4gQWRkIGFuIG9wdGlvbmFsICJzZmRwIiBjaGlsZCBub2Rl
IChjb21wYXRpYmxlICJqZWRlYyxzZmRwIikgdGhhdAo+IGRlc2NyaWJlcyB0aGUgU0ZEUCBhcyBh
IHJlYWQtb25seSBOVk1FTSBwcm92aWRlciB2aWEgbnZtZW0ueWFtbCwgc28gaXRzCj4gY29udGVu
dHMgKGUuZy4gYSB2ZW5kb3IgRVVJLTQ4L0VVSS02NCkgY2FuIGJlIHJlYWQgdGhyb3VnaCBOVk1F
TSBjZWxscy4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5p
a2FuZGFuLm1AbWljcm9jaGlwLmNvbT4KCkkgd291bGQgZXhwZWN0IGl0IHRvIGZvbGxvdyBudm1l
bSBjb252ZW50aW9ucyBsaWtlIHRoaXMsIG5vdGljZQpjb21wYXRpYmxlcyBzcGVjaWZpYy10by1n
ZW5lcmFsIHdpdGggc2ZkcCBmaXJzdDoKCnNmZHAgewogICAgLyogTlZNRU0gcHJvdmlkZWQgYnkg
U0ZEUCAqLwogICAgY29tcGF0aWJsZSA9ICJqZWRlYyxzZmRwIiwgIm52bWVtLWNlbGxzIjsKICAg
IGxhYmVsID0gIlNGRFAiOwogICAgcmVhZC1vbmx5OwogICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
CiAgICAjc2l6ZS1jZWxscyA9IDwxPjsKCiAgICBtYWMwOiBtYWNhZGRyQDB4MDAgewogICAgICAg
IHJlZyA9IDwweDAwIDB4MDY+OwogICAgfTsKICAgIG1hYzE6IG1hY2FkZHJAMHgwNiB7CiAgICAg
ICAgcmVnID0gPDB4MDYgMHgwNj47CiAgICB9Owp9OwoKWW91ciBleGFtcGxlIHNob3VsZCBkZWZp
bml0ZWx5IGJlIG1vcmUgZWxhYm9yYXRlIGxpa2UgdGhpcywKanVzdCBhbiBvcGFxdWUgc2ZkcCBu
b2RlIHdpbGwgbm90IHN1ZmZpY2UuIE1heWJlIGEgc2VwYXJhdGUKZXhhbXBsZT8KCllvdXJzLApM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
