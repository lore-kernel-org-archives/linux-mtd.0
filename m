Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772EEC27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynHJ4mTlilmMMsj9JeyxlOBNGS2IL44LCftZcxNaRSk=; b=PZDtGZPoQD3FY7
	1N3Um2E7X8BR899S/XFVecDR5c8Q8jvi/nXdnCymZn0nwA7EBgC3QC0+TqhWl9YmGoC3k9yp81g6C
	E8s4UFF9sXf1jIwAS5T7HuV2GoahmD8w1K/Ip+nP7e9jKwjCCn1SyPoksshIorSZaQZntv/y7Y5pL
	z9RQao0ETXN7NB09KxNCZ2I0mcci3KVXgg2pxx+f2IW0jZllGC+Dm+5Dkb/bI6hWsd7eTYIko8hQb
	VVyT40ywmZyvrhkWpRPx8ql9xIQmZhb6rDPz2FV50bHg2egHmZlP2/ypfrBnxImUCYj/g8fxPlYuN
	2b/4XMbIci0nRosq0JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd41-000000093iw-1KGh;
	Fri, 21 Jun 2024 12:08:21 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKd3v-000000093fL-2YyG
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 12:08:17 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6b50c3aeb83so7889436d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2024 05:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718971694; x=1719576494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=fa84H4Cb9gr2eIWZrFUywlKHBQdbiy84oPUDccZ5yC5V9NoMBd2bwl77XpRbKnPysc
         ci8KZPtjS+W8obGWMF9L/ecuYUKQUU76QILHO4JvGyod76wD/MJjsrhNORPbBBsn456R
         hU9MVWLLYK9F90d1C9BBEDO4xnjnJGmHP+PXvTmtB63pf5kC1PtwkVThjKqoF5ZVpAtf
         DaKPPVzaX0AQqi0wXTDly4bpc3TGoJJ5A15dysyeijqmelmmG0XNCoKwYtV1Ll8jG/6M
         +z16zsx9gvzug4RxAHe9s2T7uPi+w/+uwmRmleqoMAxyG7lnvfX8UWPiO4DWrYWR9WEt
         /6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971694; x=1719576494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=pgEnXnaM/Jnd5tGiKA4Pt14Zf+Zl3DLzhRGEJkcBeLyWKCFFZMT2nOTyYjrK2yozSq
         iL3iqrGMorls1pcPykHKdiLg5NA7OaCpSG+65jO1iTeRkSF8ev4nCClxODGb0xFIrWGa
         w60OSlEdc/oqdYUts4x52qMlEC7dRHraDGMjj7AI8NlEXrB/cNdBr9FuH4FmmG7pX3q0
         KuuVZuwklFRzrwdhbrqhzfTfZbXiyHgGVdY83ODxhUwTXaSmkI+2H8lx6uC7eahjadWF
         +gc+QfP/dJ/JTsXP02k6gYC4mJCqYZk2q/VuBYIrqALb8M4GWElxQGGXfPXwoEZl3p8w
         bBvw==
X-Forwarded-Encrypted: i=1; AJvYcCVBDHxy7/GStj7TunNqagvGDsMofACyrYldkccNAmd/GhowiPO2ZOcx5uHL4DM3IahdHfin/GCZWjMr1QEU0bCoO4Qxqr6vG7JJaF6/LA==
X-Gm-Message-State: AOJu0YzOCtQNEJ3rq90m83GfmPK2QXeFilibI3jrJVdALJpFjll564fu
	AkTWf6BKNqt9fCJ3FaI000jsKNJHFEMTHChVxNEbcGWq/lyIlO/AdQ11l2BQ8paqI16KLjxQaBG
	bl2hvrJqY51Mih8RrWAoDUfQLV+92fTIDCbQjCQ==
X-Google-Smtp-Source: AGHT+IH9SeiO8vfdoOxDABbDkc1VlJaHvluIQfS8YUVwP2eXorBPvqf3BAKJdJfTNAn0CNJ3/z1faNaXrP6fson02ac=
X-Received: by 2002:ad4:4245:0:b0:6b0:6629:bdf9 with SMTP id
 6a1803df08f44-6b501e2c710mr72849356d6.21.1718971694039; Fri, 21 Jun 2024
 05:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com> <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
In-Reply-To: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:08:03 +0200
Message-ID: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from del_timer_sync()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Markus Elfring <Markus.Elfring@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_050815_817187_E3DEEE35 
X-CRM114-Status: GOOD (  14.91  )
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

SGkgQW5kaSwKCk9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDEyOjU34oCvQU0gQW5kaSBTaHl0aSA8
YW5kaS5zaHl0aUBrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAw
Nzo1Njo0MVBNIEdNVCwgUGlvdHIgV29qdGFzemN6eWsgd3JvdGU6Cj4gPiBXaGVuIGRlbF90aW1l
cl9zeW5jKCkgaXMgY2FsbGVkIGluIGFuIGludGVycnVwdCBjb250ZXh0IGl0IHRocm93cyBhIHdh
cm5pbmcKPiA+IGJlY2F1c2Ugb2YgcG90ZW50aWFsIGRlYWRsb2NrLiBUaHJlYWRlZCBpcnEgaGFu
ZGxlciBmaXhlcyB0aGUgcG90ZW50aWFsCj4gPiBwcm9ibGVtLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFBpb3RyIFdvanRhc3pjenlrIDxwaW90ci53b2p0YXN6Y3p5a0B0aW1lc3lzLmNvbT4KPgo+
IGRpZCB5b3UgcnVuIGludG8gYSBsb2NrZGVwIHNwbGF0Pwo+Cj4gQW55dGhpbmcgYWdhaW5zdCB1
c2luZyBkZWxfdGltZXIoKSwgaW5zdGVhZD8gSGF2ZSB5b3UgdHJpZWQ/CgpJIGRpZG4ndCBnZXQg
YSBsb2NrZGVwIHNwbGF0IGJ1dCBjb25zb2xlIHdhcyBmbG9vZGVkIHdpdGggd2FybmluZ3MgZnJv
bQpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi92Ni4xMC1yYzQva2VybmVs
L3RpbWUvdGltZXIuYyNMMTY1NQpJbiB0aGUgbGludXgga2VybmVsIHY1LjE1IEkgZGlkbid0IHNl
ZSB0aGVzZSB3YXJuaW5ncy4KCkknbSBub3QgYSBtYWludGFpbmVyIG9mIHRoZSBkcml2ZXIgYW5k
IEkgZGlkbid0IGRvIGFueSByZXNlYXJjaCBvbgp3aGF0IGtpbmQgb2YgaW1wYWN0CndvdWxkIGhh
dmUgdXNpbmcgZGVsX3RpbWVyKCkgaW5zdGFkLiBNYXliZSBWbGFkaW1pciBaYXBvbHNraXkgd2ls
bCBrbm93IHRoYXQuCgotLSAKUGlvdHIgV29qdGFzemN6eWsKVGltZXN5cwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
