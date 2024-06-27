Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A86C2BD09
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dBIp3PWPDYH4pA2GtQGWJvqBuHEIFhv1dYg6QLEW00=; b=d5nL5TjHfR4tPQ
	ZFO+0qyCW8ZftjK4+bMzCczY6bL1vqi78sp1yWVwBdqvRWby1n1LcRmzI+BiRtvrm2DyqZlFJJ5D4
	PG2Dhy03zAWrn7iQoaVBEnysoBWja1b56ylQ/Xnj9NKNxBQG9DftT+g/frRUQEdc9uLIjJb7BooLu
	rNktVOduusVLL8gcbNYnuj2zJcqMP8SgcyrBO5udq8TjYE/t4JJXatTa3nwWXtu7l5xlx4Py53aav
	EidLfmJfHtR8O2Pw8ifnX1afjmVKlkeWXsd7d4Rp1+MbK5HZ93tXMmTVo4p6Cc5hCKPNyFRYPDXhT
	gFIBOrcpECWy/+tJ9ucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmyH-0000000A5bv-2Vax;
	Thu, 27 Jun 2024 11:07:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmxl-0000000A5O2-2mnO
	for linux-mtd@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=; b=ePX0ZHTn5NuD+O6HVt30G8IO+e
	LweoJKl/S6LeuQKwyGtdJ9h/RYBeyjOWG87Sc/9YbpV2QH/TXvpwJmsA7CL5eTrnHPK+yN4lcE2UY
	pnVEwDvqlOXxdpy/soNeqIPrA8LIuEe2kEumJK/uprfODzq9Kc/xjw+DtpAkpLpXttekO864JY5U8
	zI992ClVlqJRGiCVCMeF5iXXwLGSIpU4uUouKRwG8LLnD5ybAIqKBjU+0b7jYOPOaU3x06GcQyG/e
	dGnQN/6G0BFta8ocBdi5+f+ApCxvur2DY3/SeHMCRMifzxQNDtsr7mBYjPDdeuHMkmpgiT+nCkfee
	0v0Hnygg==;
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmxO-00000008qO3-44QK
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 11:06:42 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6b593387daaso3608526d6.1
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719486365; x=1720091165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=;
        b=rkkCT3mc0VZ9SjYMML5JTnFeYAenogaj+P76FyY8VlQSudrleTweHOGUdDR4UF2uGH
         3ZrKBfskBw6Ze5AwUa4FbQ5LxH5SFEersuw38QziXUznj7h3u+FbNr7McI1N9Dug3CbT
         WGH3pkAb+07yjcdg+EL73vvaQL7A1v7an87iClD38i503JPHYHTZDvvI1S+Sd0PVxuVj
         pFTQqtvm2Rw6yZmVbyNCVx9HRuU+DaQyObXwZRSzCcUKKh3RcOSTPWHG/o3wgN1Te6+2
         MV0jG6lRVUL0pzEZOxcdJv6eYNy6rz8CF0h5TnjEPzzG6BbLA+yUDzKwJpgQEPvlUmkT
         JLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486365; x=1720091165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8pm1cQ32txw1WRPKTanNTmvRox3c7g4AlMuHhl+D20=;
        b=ti6dIJswRlQC1p3Msj1h788ZzYZ7jAwzT2XhtpCEyjMRVqT77AQfZ4N/hD4MBjk1C8
         9KpL3WQy6yViIc4j8XQYQzCqIKn8QN5ldwhoeW/AM0U7DqPCpj0g0jylTxklY7GFp4ZD
         i6y+YJbd06L46ZN+0EJG0yJqX3ve4F+xZjfA0jgQd1CZCDEpJsnnOq7V05tbkMpNRhUS
         JQ0b+Po2ieGC3Eqnl1Vobhtj0ABnZqLr/vGL1AB/fBAy2TH6zdFLYXhtpCZFcbAD/HmE
         17jaE06fWqFZf3pZxIED9XY5vXR2k1hhTeLexPYKnN/bHg3MOUo38VN3rgeIckTaMJdb
         pa3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU01Ki9UX/yx4T8O7wEaGDGzJxJba9PR5ulNDPZMVfJMTWjpcpS8y9zpzmDoHsc/ujEWYi/M4Fp1ZjGwx84lArL8LynTVow1fZkC7ewsQ==
X-Gm-Message-State: AOJu0Yw/CLz02i93mnwMXNa0rHYJZ/S/cV3Z5yCYtmtTdAsQWN2sguOg
	ItWG74uERwvJBaLWSmVqH7g/HE9UQP/r8bPdwBR6p8f1plWiLhyeSTBQi1eRSph4q+/H3oDbdxV
	uMSOmqt/x5MG9kpH3H4kDaLzPcjAquIvWzvb1ZA==
X-Google-Smtp-Source: AGHT+IG2MNKNNOGC761uBwvpqX9lGsPO6rQNPCNWhEy1V6ZqnINWb303gmPma/KMWKNSmIVuRVUQ+Leug+4DoYkVHJE=
X-Received: by 2002:a0c:f2cd:0:b0:6b4:f7bb:6d69 with SMTP id
 6a1803df08f44-6b56380939dmr109313566d6.32.1719486364821; Thu, 27 Jun 2024
 04:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com> <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
 <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com> <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
In-Reply-To: <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Thu, 27 Jun 2024 13:05:53 +0200
Message-ID: <CAG+cZ05uam3LkvLXG3xAc8FY_p6jx4p=zinNeWbkKUbcLxSTrg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240627_120630_314660_776AF33C 
X-CRM114-Status: GOOD (  32.49  )
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

T24gVHVlLCBKdW4gMjUsIDIwMjQgYXQgMTE6MTLigK9QTSBBbmRpIFNoeXRpIDxhbmRpLnNoeXRp
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGlvdHIsCj4KPiBPbiBGcmksIEp1biAyMSwgMjAy
NCBhdCAwMjowODowM1BNIEdNVCwgUGlvdHIgV29qdGFzemN6eWsgd3JvdGU6Cj4gPiBPbiBGcmks
IEp1biAyMSwgMjAyNCBhdCAxMjo1N+KAr0FNIEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDA3OjU2OjQxUE0gR01U
LCBQaW90ciBXb2p0YXN6Y3p5ayB3cm90ZToKPiA+ID4gPiBXaGVuIGRlbF90aW1lcl9zeW5jKCkg
aXMgY2FsbGVkIGluIGFuIGludGVycnVwdCBjb250ZXh0IGl0IHRocm93cyBhIHdhcm5pbmcKPiA+
ID4gPiBiZWNhdXNlIG9mIHBvdGVudGlhbCBkZWFkbG9jay4gVGhyZWFkZWQgaXJxIGhhbmRsZXIg
Zml4ZXMgdGhlIHBvdGVudGlhbAo+ID4gPiA+IHByb2JsZW0uCj4gPiA+ID4KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQaW90ciBXb2p0YXN6Y3p5ayA8cGlvdHIud29qdGFzemN6eWtAdGltZXN5cy5j
b20+Cj4gPiA+Cj4gPiA+IGRpZCB5b3UgcnVuIGludG8gYSBsb2NrZGVwIHNwbGF0Pwo+ID4gPgo+
ID4gPiBBbnl0aGluZyBhZ2FpbnN0IHVzaW5nIGRlbF90aW1lcigpLCBpbnN0ZWFkPyBIYXZlIHlv
dSB0cmllZD8KPiA+Cj4gPiBJIGRpZG4ndCBnZXQgYSBsb2NrZGVwIHNwbGF0IGJ1dCBjb25zb2xl
IHdhcyBmbG9vZGVkIHdpdGggd2FybmluZ3MgZnJvbQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3Rv
cnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTAtcmM0L2tlcm5lbC90aW1lL3RpbWVyLmMjTDE2NTUKPiA+
IEluIHRoZSBsaW51eCBrZXJuZWwgdjUuMTUgSSBkaWRuJ3Qgc2VlIHRoZXNlIHdhcm5pbmdzLgo+
ID4KPiA+IEknbSBub3QgYSBtYWludGFpbmVyIG9mIHRoZSBkcml2ZXIgYW5kIEkgZGlkbid0IGRv
IGFueSByZXNlYXJjaCBvbgo+ID4gd2hhdCBraW5kIG9mIGltcGFjdAo+ID4gd291bGQgaGF2ZSB1
c2luZyBkZWxfdGltZXIoKSBpbnN0YWQuIE1heWJlIFZsYWRpbWlyIFphcG9sc2tpeSB3aWxsIGtu
b3cgdGhhdC4KPgo+IFlvdXIgcGF0Y2ggaXMgZGVmaW5pdGVseSBjb3JyZWN0LCBubyBkb3VidCBh
Ym91dCB0aGF0Lgo+Cj4gQW5kIEkgZG9uJ3QgaGF2ZSBhbnl0aGluZyBhZ2luYXN0IGNoYW5naW5n
IGlycSBoYW5kbGVycyB0bwo+IHRocmVhZGVkIGhhbmRsZXJzLiBCdXQgSSB3b3VsZCBiZSBjYXJl
ZnVsIGF0IGRvaW5nIHRoYXQgZGVwZW5kaW5nCj4gb24gdGhlIHVzZSBvZiB0aGUgY29udHJvbGxl
ciBhbmQgZm9yIGFjY2VwdGluZyBzdWNoIGNoYW5nZSBJCj4gd291bGQgbmVlZCBhbiBhY2sgZnJv
bSBzb21lb25lIHdobyBrbm93cyB0aGUgZGV2aWNlLiBWbGFkaW1pciwKPiBwZXJoYXBzPwo+Cj4g
VGhlcmUgYXJlIGNhc2VzIHdoZXJlIHVzaW5nIHRocmVhZGVkIGhhbmRsZXJzIGFyZSBub3QgdG90
YWxseQo+IHJpZ2h0LCBmb3IgZXhhbXBsZSB3aGVuIHRoZSBjb250cm9sbGVyIGlzIHVzZWQgYXQg
ZWFybHkgYm9vdCBmb3IKPiBwb3dlciBtYW5hZ2VtZW50IGhhbmRsaW5nLiBJIGRvbid0IHRoaW5r
IGl0J3MgdGhlIGNhc2UgZm9yIHRoaXMKPiBkcml2ZXIsIGJ1dCBJIGNhbid0IGJlIDEwMCUgc3Vy
ZS4KPgo+IElmIHlvdSB3ZXJlIGFibGUgdG8gc2VlIHRoZSBmbG9vZCBvZiBXQVJOX09OJ3MsIHdv
dWxkIGJlCj4gaW50ZXJlc3RpbmcgdG8ga25vdyBob3cgaXQgYmVoYXZlcyB3aXRoIGRlbF90aW1l
cigpLiBNaW5kCj4gZ2l2aW5nIGl0IGEgdGVzdD8KPgo+IFRoYW5rcywKPiBBbmRpCgpJIHRvb2sg
c29tZSB0aW1lIHRvIHRha2UgYSBjbG9zZXIgbG9vayBhdCB0aGlzIGFuZCBpdCB0dXJucyBvdXQg
dGhhdCB0aGUKdGltZXIgaXMgdXNlZCBvbmx5IHRvIGV4aXQgZnJvbSB0aGUgd2FpdF9mb3JfY29t
cGxldGlvbigpLCBhZnRlciBlYWNoCmRlbF90aW1lcl9zeW5jKCkgdGhlcmUgaXMgYSBjb21wbGV0
ZSgpIGNhbGwuIFNvIEkgd2lsbCByZW1vdmUgdGhlIHRpbWVyCmFsbCB0b2dldGhlciBhbmQgcmVw
bGFjZSB3YWl0X2Zvcl9jb21wbGV0aW9uKCkgd2l0aAp3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVv
dXQoKQoKCi0tIApQaW90ciBXb2p0YXN6Y3p5awpUaW1lc3lzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
