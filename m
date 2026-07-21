Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252BAC4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqJmyKVjmd7LLDEXB/pb9oii+oUi5vhIhOABI5pPa7I=; b=n+xw7UNqChZHXb
	q9tTKuamKDmfVz2xpjYhrK2BeUaHN9e61eO5dAZqEo+osLAZbIznmcRJugC29dWorixgYvixOIfcF
	mEdVPKiohHoMz7EE5UAsDi8sIqMl+wGHRB4nP3kRcWzQ52M4QqXWbc44CGrv3VofCTl/XlHgOM3iy
	2bfumTF3AjZntKo4evr0k6LdB9XmpWxJpJmiqZL9rp54Bb7KE/5zp3j+7taTA4imV7OSdbsbcfGVs
	XpfoZnZXwOrD8hyQ7G7cV6mss1BFVwOoAgSQ0d+CvnipC4oqGnWDpMLCswPDjV06XLiF0uEZ1YS7n
	zYww8jPSxCnzZiI6b4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ey-00000008gnm-0jaw;
	Tue, 21 Jul 2026 07:50:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ew-00000008gmT-24L6
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jul 2026 07:50:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE02060AA1
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85FA71F0155A
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620209;
	bh=xkJHITvqX1FWX4L63OpNnz2Qb0aVsri/wXqI3fsoexw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eoFPW2OD7s35Azw47YLLuikvix+UDF0w3sqdGWpfkJOeyiK09Fda4d0fyk9jUl7si
	 OWojPo2DlQjfjcU4fw+RMJIn4/Mp/2FOQKFNrEZPr8Bs8aZ5Fi1z4v3Z0lR2IdXJnO
	 eInAya/5/1oriC49/F1qvT5uA17CEP+nNEKuPD+czMZp574V2gfluiK1GzowZK9mxu
	 FJVRlvUdYUGS1VVhGR4beeQ0F0qvp2AB+hVkTh5Pvs4d1kfmIM7mBCD6gPVQTUJI/a
	 kh5kYFcyTFomZrO4NCQNzhcExq7n+5tplAkoF7WuocSAUoEgJsX6J2BzGVcfGyTqce
	 ltFpvhJfr/xUA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b159850b16so7284960e87.3
        for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2026 00:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoY5c/pq9+v87EhUFJe3s3YF4fgFyQeQTY33FdhL7931C/mSyh+vb/H2lnYHLJ1B1fe0odpHMPTcZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzowYuHkLm9+9tb4AcPxXzJmoqWFv4YhnX5anGLa7Mf6nO139RZ
	qzgujYOdEu+ZoJZA5UuJ8smeUW7XmTZA9mjbHr4dd7brltf/+nKtfh2LV8wzpMHDWYI5NFl5OKl
	DASlTNtHBct8WoVS0/XqOsWUM1EYPWtc=
X-Received: by 2002:a05:6512:b83:b0:5ae:b5bd:5e72 with SMTP id
 2adb3069b0e04-5b28fabb816mr3793719e87.59.1784620208288; Tue, 21 Jul 2026
 00:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260721052859.171341-1-manikandan.m@microchip.com> <20260721052859.171341-8-manikandan.m@microchip.com>
In-Reply-To: <20260721052859.171341-8-manikandan.m@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 09:49:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkzDDC66KjyMGommrC7T0L5KW3TA+JLKUmNf_psF-eRuw@mail.gmail.com>
X-Gm-Features: AUfX_myAPX-Fx-YYXrqqVAT9emnPnmjb3E1aTj_6ToEx3OEbZBmyyuGAfe7f9n4
Message-ID: <CAD++jLkzDDC66KjyMGommrC7T0L5KW3TA+JLKUmNf_psF-eRuw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] ARM: configs: sama5: enable Microchip/SST SFDP EUI
 NVMEM layout
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgNzozMeKAr0FNIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFu
CjxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4gd3JvdGU6Cgo+IEVuYWJsZSBDT05GSUdfTlZN
RU1fTEFZT1VUX1NTVDI2VkZfU0ZEUF9FVUkgc28gdGhlIGZhY3RvcnkgRVVJLTQ4IHN0b3JlZAo+
IGluIHRoZSBTU1QyNlZGIFFTUEkgZmxhc2ggU0ZEUCBjYW4gYmUgdXNlZCBhcyBhIE1BQyBhZGRy
ZXNzIG9uIGJvYXJkcwo+IHN1Y2ggYXMgdGhlIHNhbWE1ZDI3X3dsc29tMS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNv
bT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
