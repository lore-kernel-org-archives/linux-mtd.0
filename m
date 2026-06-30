Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66231C43327
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 22:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uv6Dq+Rn2aJ7HawdUi966nL6P/lXgrZFAVEPRuJ79IA=; b=thdOjglTJtkLM7
	rdys9IMuAO7TpOFK9+3dHYNzZ+52QF+mvOs8etQyMJaaVIM3sBEvWCXJ4kEBoVZOnEahsIo17+ixq
	BckN+ZZ2F0RUuam6SV6eCq+OCHKAUjJf2VzHFubMjBUJi1gY36BEAcXXBDcvsSN7frz6ojkROgfqQ
	UofSTlBYUjvqHiy/lkz8nA5Whph4HvG59eFpceuS6OKYlxMlANqfK8P/JVK/ERCT4SLAw048XzsZW
	0KcpG8VRU/5JIhzz9ITLR4EW6PrD11fRQB/3MHtRI+xSuGoGe8SytsMgzivLuqmm/CHdN0+s8yWZ1
	f1s1+jsXGODqSohe0Usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegvW-00000000J9s-0WBq;
	Tue, 30 Jun 2026 22:27:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegvT-00000000J71-3cfT
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 22:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75A3243D5B
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FD91F00ADB
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782858450;
	bh=TTcVu3N5A2qxImNE8jx0tO9sA0vxx21QZu6VSH0wmU4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a3nZipE5rJA5y3N4Pt43hJP+a36yVR5xrcMfyXU20kSXL/EMJ9K0p232l6Wre9wwp
	 XZGaTAaW+es9sgk2ARLIAXeZYTEfZEKo5NkLTX00wcwnR0btmfhuX2qmDgsgRcXS/Q
	 BaQDKyMcLqkohVenN5e9fDl+zIbBLwde996RnNIGz3h3eKEQE15LGapkSZsv9IMD0m
	 Iqoina2XyIvqZEumLIqhlDlgyvjWqtUVlH/1DwkhbLX9mv9yy2rvdW7YtvW9bGvLLU
	 x9VHYe8+Vd4Yjn/Rs6RW4nQMcWgQ6Jl5XlPCKLmcmP5L7dbjrZpWPH2Edj+0omjQhI
	 Ur0N2LFTC6dYA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so1179835e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2026 15:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpEzX3OG+kPsjphg7SO/YA9sMcRQCpSfW++Ug8+URsXb0Sop882n+rfYmCbQ7zjw8uOBoaRfE6qsTw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyA+PNQePGumOHdBlBNFZtMEboA3GgHdIgk/mGVIUs7GNflgxs0
	9UH9FIthgilMvvFb/xOeKj4eJwG08kRJqbvNDnGWsH1cO/Jl9Z7Tx+w0HYg+L43P9dIbu5WEk2N
	laayrpvGINBR9LgwWgpWpEisKRKWQRko=
X-Received: by 2002:ac2:4bd0:0:b0:5ae:a2b5:3ae3 with SMTP id
 2adb3069b0e04-5aebdbb32bdmr1526007e87.29.1782858449161; Tue, 30 Jun 2026
 15:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260630092406.150587-1-manikandan.m@microchip.com> <20260630092406.150587-6-manikandan.m@microchip.com>
In-Reply-To: <20260630092406.150587-6-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 00:27:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmURCUfQNoTgLeTRtxfoWxgyPcmHv6rJpmB1gXWFL+NGA@mail.gmail.com>
X-Gm-Features: AVVi8CfX0Qclfl00TlhG9NPtI9hB9ExKc-14XAFH9ZzPrWiRzE1N9YyLdRCBq80
Message-ID: <CAD++jLmURCUfQNoTgLeTRtxfoWxgyPcmHv6rJpmB1gXWFL+NGA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] ARM: dts: microchip: sama5d27_wlsom1: use
 fixed-partitions for QSPI flash
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

T24gVHVlLCBKdW4gMzAsIDIwMjYgYXQgMTE6MjbigK9BTSBNYW5pa2FuZGFuIE11cmFsaWRoYXJh
bgo8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKPiBNb3ZlIHRoZSBRU1BJIGZs
YXNoIHBhcnRpdGlvbnMgdW5kZXIgYSAicGFydGl0aW9ucyIgbm9kZSB3aXRoIHRoZQo+ICJmaXhl
ZC1wYXJ0aXRpb25zIiBjb21wYXRpYmxlLCBhcyByZXF1aXJlZCBieSB0aGUgY3VycmVudCBNVEQg
cGFydGl0aW9uCj4gYmluZGluZywgaW5zdGVhZCBvZiBkZWNsYXJpbmcgdGhlbSBhcyBkaXJlY3Qg
Y2hpbGRyZW4gb2YgdGhlIGZsYXNoIG5vZGUuCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3Jv
Y2hpcC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+
CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
