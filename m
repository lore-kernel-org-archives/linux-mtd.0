Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74855C30653
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 21:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VEbw//AVrOtZ+zVoeGBDIIc6PRGLtu81rtiHijdoqwk=; b=otfS/aJTqj1E1w
	3RuIxuTyhFyL/whHy30ZPlA2wFkHlWLueGtOfzIvlv1uM4C09vqY7nJkxAd8Hq4IfNVDLFPofr4LU
	Aeu6QbmADuM3+5zTIPN9x0A8IYN/2EnJAj+LxzaloW5R/u2IeaWqJov6HqHQas+duxJ37Tq/1e0c6
	9oHtfPsCSet1FogrdUtMhKrf6nOFDvlbtu0VbIhBKlXmTtIXsuhIbrVV2ap1+X5FwQ7OWom7a1HUY
	KMl5ybMMm386QYQAaeV7DT3SCAVe3tA980+/cF2zGSZnWHP99a9O18dGxXr9aMHdZIt0zt6DI2caT
	pTghOPnKIxqrLLuU14Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDSl-00000004WWR-3YAG;
	Tue, 25 Jun 2024 21:12:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDSe-00000004WUa-1RJr;
	Tue, 25 Jun 2024 21:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4626CCE1F2C;
	Tue, 25 Jun 2024 21:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F61C32781;
	Tue, 25 Jun 2024 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719349937;
	bh=hyygwZzV0TA9MeTrczY+xfhnsSFmoluW/aMTxSPPF7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ArcIuk0uRfsESHfkGfkKUOWRPGGQRoYshDAKXgfL7RAidYC2yoPUOF4EOIWRth/zx
	 ykHnbRshuPVKR4UsTmEqJpfbjR7Lxb1MgohaxTO7sN4G186OXUULYfjTSoMk/JACVy
	 rDH4YFTTQFVhxEeWdIOOD5ronHyHYn5GlVnw+3JtZFiKhbLmGLU7w1aHq4GtR8VqXx
	 zOrwlDLRr/Fxt5QON7ooh6qk8zgpeQFn4BGJ4f8p9B/da2ub1m3VU/0NxxHk78cBsC
	 Ylf78UIPjF87TiTkhrpWjEAnrqweWrfQoiMdjHdFmTSchTgaZPSVi6dGjUTTadSf7V
	 tnFI4Gu0p7ohg==
Date: Tue, 25 Jun 2024 23:12:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yangtao Li <frank.li@vivo.com>, Li Zetao <lizetao1@huawei.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from
 del_timer_sync()
Message-ID: <73yvglxha45d5ft74m3y5fdmkgatm2yftvhza2msg4ombjz42f@wz43pubhbpdz>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com>
 <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
 <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_141220_761332_2867D640 
X-CRM114-Status: GOOD (  23.37  )
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

SGkgUGlvdHIsCgpPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAwMjowODowM1BNIEdNVCwgUGlvdHIg
V29qdGFzemN6eWsgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTI6NTfigK9BTSBB
bmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gT24gVGh1LCBKdW4g
MjAsIDIwMjQgYXQgMDc6NTY6NDFQTSBHTVQsIFBpb3RyIFdvanRhc3pjenlrIHdyb3RlOgo+ID4g
PiBXaGVuIGRlbF90aW1lcl9zeW5jKCkgaXMgY2FsbGVkIGluIGFuIGludGVycnVwdCBjb250ZXh0
IGl0IHRocm93cyBhIHdhcm5pbmcKPiA+ID4gYmVjYXVzZSBvZiBwb3RlbnRpYWwgZGVhZGxvY2su
IFRocmVhZGVkIGlycSBoYW5kbGVyIGZpeGVzIHRoZSBwb3RlbnRpYWwKPiA+ID4gcHJvYmxlbS4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGlvdHIgV29qdGFzemN6eWsgPHBpb3RyLndvanRh
c3pjenlrQHRpbWVzeXMuY29tPgo+ID4KPiA+IGRpZCB5b3UgcnVuIGludG8gYSBsb2NrZGVwIHNw
bGF0Pwo+ID4KPiA+IEFueXRoaW5nIGFnYWluc3QgdXNpbmcgZGVsX3RpbWVyKCksIGluc3RlYWQ/
IEhhdmUgeW91IHRyaWVkPwo+IAo+IEkgZGlkbid0IGdldCBhIGxvY2tkZXAgc3BsYXQgYnV0IGNv
bnNvbGUgd2FzIGZsb29kZWQgd2l0aCB3YXJuaW5ncyBmcm9tCj4gaHR0cHM6Ly9naXRodWIuY29t
L3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTAtcmM0L2tlcm5lbC90aW1lL3RpbWVyLmMjTDE2NTUK
PiBJbiB0aGUgbGludXgga2VybmVsIHY1LjE1IEkgZGlkbid0IHNlZSB0aGVzZSB3YXJuaW5ncy4K
PiAKPiBJJ20gbm90IGEgbWFpbnRhaW5lciBvZiB0aGUgZHJpdmVyIGFuZCBJIGRpZG4ndCBkbyBh
bnkgcmVzZWFyY2ggb24KPiB3aGF0IGtpbmQgb2YgaW1wYWN0Cj4gd291bGQgaGF2ZSB1c2luZyBk
ZWxfdGltZXIoKSBpbnN0YWQuIE1heWJlIFZsYWRpbWlyIFphcG9sc2tpeSB3aWxsIGtub3cgdGhh
dC4KCllvdXIgcGF0Y2ggaXMgZGVmaW5pdGVseSBjb3JyZWN0LCBubyBkb3VidCBhYm91dCB0aGF0
LgoKQW5kIEkgZG9uJ3QgaGF2ZSBhbnl0aGluZyBhZ2luYXN0IGNoYW5naW5nIGlycSBoYW5kbGVy
cyB0bwp0aHJlYWRlZCBoYW5kbGVycy4gQnV0IEkgd291bGQgYmUgY2FyZWZ1bCBhdCBkb2luZyB0
aGF0IGRlcGVuZGluZwpvbiB0aGUgdXNlIG9mIHRoZSBjb250cm9sbGVyIGFuZCBmb3IgYWNjZXB0
aW5nIHN1Y2ggY2hhbmdlIEkKd291bGQgbmVlZCBhbiBhY2sgZnJvbSBzb21lb25lIHdobyBrbm93
cyB0aGUgZGV2aWNlLiBWbGFkaW1pciwKcGVyaGFwcz8KClRoZXJlIGFyZSBjYXNlcyB3aGVyZSB1
c2luZyB0aHJlYWRlZCBoYW5kbGVycyBhcmUgbm90IHRvdGFsbHkKcmlnaHQsIGZvciBleGFtcGxl
IHdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgdXNlZCBhdCBlYXJseSBib290IGZvcgpwb3dlciBtYW5h
Z2VtZW50IGhhbmRsaW5nLiBJIGRvbid0IHRoaW5rIGl0J3MgdGhlIGNhc2UgZm9yIHRoaXMKZHJp
dmVyLCBidXQgSSBjYW4ndCBiZSAxMDAlIHN1cmUuCgpJZiB5b3Ugd2VyZSBhYmxlIHRvIHNlZSB0
aGUgZmxvb2Qgb2YgV0FSTl9PTidzLCB3b3VsZCBiZQppbnRlcmVzdGluZyB0byBrbm93IGhvdyBp
dCBiZWhhdmVzIHdpdGggZGVsX3RpbWVyKCkuIE1pbmQKZ2l2aW5nIGl0IGEgdGVzdD8KClRoYW5r
cywKQW5kaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
