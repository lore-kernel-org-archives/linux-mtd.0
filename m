Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA126C4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 07:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TQ9WSbB7MmFD76s0Yb1nirg+MxuHXr4hqydXtQ0QBg=; b=bM+gKCX9PfybJp
	fySs89q4FBI+HtbIdTrazxVufaGmEWL0e+DH1+hK5eKe5Bkph/yZzFmWQKkX9QI3c1LX3OdgwHMm4
	F5bbA889+ppVVvBdSswmLwaxuOSL4gbM/UDucVAuUZSuoq9hO31xvx9LlxOxfVUpOzU0T14OT26Sk
	TVRrl3/ml60a5U8sRz9Y5IWXFw6i3G0qlNxfhDsU/akQf3YU/Qgb/qcnliQIMA1V+w4FFxJRjmvcb
	cD5rKDhTPl4b2gslahmXglxsicaIPeEHSpjklfqfdCjPHyB2Cz06rMRs+TN5XRVwkLr/rRHDi4HpY
	y7erqo1e9Ft3m0iQ+SUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ao-00000008gDN-3YgU;
	Tue, 21 Jul 2026 07:45:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Am-00000008gD8-3lvn
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jul 2026 07:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BEDA43E82
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0017F1F00A3F
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784619952;
	bh=okTMrHZiP0sVY1prxXrRl26i6JyH7ulay0Mr3CLRG44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ojz3AsS3yLTPkRMTWCGx3vLCWNJy+520RCn2Hza8D9RWBnYJbEh8KKU7q6b9KxNCG
	 FHzBMRNMV2NDCrmrXTMAIDh9ZXTD4JaCCfqPRiKYxkEDYlZJ79HsJH6w5Bvcqa2j35
	 /omhQr4tItO8u+8wN+5vTIlZd3EYh61tK8e/CZ7sLleetWTivG2suhIYaIlSpCEyp/
	 SsGRsiKsxsfU9dORzY9BMmR9Smd6yYuNmJF6wGZiHD3krGX8TLAD12v9/uNGZZx5WY
	 CmCGVYzGk8bqrjiboPfGsdBPU1t+QrGnJhA7IwQNzCgVmInxUhn16Zd6G1KqYYHiea
	 YWW+3gTKLQsVQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso10151490e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 00:45:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9sQxZ4d6dMGe0oVRQn6CjPpV1BqCmMWQ/3jG7T0a5q10w4MNeue1/M04g2XeldfaJEVOeAkLn30M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZJOn38YJxQucPXSqvjopJqwHKSX54m3J0eIg9nwPNcpLeWwT5
	kWV28Pel+ZTxM1KCup15YMBQNePr8Wc46Zyye+xP3EkItYj0RPZAYNU6sLRBzO4S6Zpjy19QRH6
	Tc5lKX615NBlB8JfCeoiIPdL6HiLIDc8=
X-Received: by 2002:a05:6512:611:10b0:5ae:bbe4:f4b9 with SMTP id
 2adb3069b0e04-5b28f9aead9mr2079075e87.55.1784619950751; Tue, 21 Jul 2026
 00:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-3-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-3-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:45:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjY8hwGE9nNnDpuapVyTf-cBJhyZA8B9PE7U-CWmkyjw@mail.gmail.com>
X-Gm-Features: AUfX_mz_2Va_62Eq0-JUpFBlFm9mhUwZ4GUXlXtPLrXevxSFmqeo3xMHXg5EG2Q
Message-ID: <CAD++jLkjY8hwGE9nNnDpuapVyTf-cBJhyZA8B9PE7U-CWmkyjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: nvmem: layouts: add Microchip/SST
 SFDP EUI layout
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgNzoyOeKAr0FNIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
CjxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4gd3JvdGU6Cgo+IEFkZCBhIGJpbmRpbmcgZm9y
IHRoZSBOVk1FTSBsYXlvdXQgdGhhdCBleHBvc2VzIHRoZSBmYWN0b3J5LXByb2dyYW1tZWQKPiBF
VUktNDggaWRlbnRpZmllciBmcm9tIHRoZSBNaWNyb2NoaXAvU1NUIHZlbmRvci1zcGVjaWZpYyBT
RkRQIHBhcmFtZXRlcgo+IHRhYmxlIChlLmcuIFNTVDI2VkYwNjRCRVVJKSBhcyBhICJtYWMtYWRk
cmVzcyIgTlZNRU0gY2VsbCwgYW5kIHJlZmVyZW5jZQo+IGl0IGZyb20gbnZtZW0tbGF5b3V0Lnlh
bWwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiA8bWFuaWthbmRh
bi5tQG1pY3JvY2hpcC5jb20+CgpJIGxpa2UgaXQhClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
