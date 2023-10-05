Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A3E9371C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Oct 2023 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KzaJKKVGOCEuvhhlG/0SjQMNGYGEB4MuI3K4OC5iYxA=; b=3pLj1fzTN5SSynkaZqMN0sT7Bd
	XmxlchUAsDCpxc/4TcGLeX6hJGqwMGqvg0oPPujx5x0mYwWA/kzjAxT6Lsw5OdmWeWRtK8HAcOFrv
	8LcIbkEa1sdnbJi9TOixOM54lKGPVkK9SF96EQsLQT78y5Dur5COfo3ZIdkRFlGlwV9CsD0RKoqAO
	HkEz1wiN1N2k0Eh/8Ll2uKada/ag/PI46hLrn/KuVpOlIsjxiI5N+F1HZvZb1Sqazvm9iB0x/yM8k
	ZvlLVrtDSPI+cRnGWN7JkL5/3FgtTTRKeCPewRnKM+uTUFLPJccngUAlPYNosUzsQ1BBuZxo2NvmH
	N/esBLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoVFL-004TUX-0q;
	Thu, 05 Oct 2023 20:46:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoVFH-004TR4-1w
	for linux-mtd@lists.infradead.org;
	Thu, 05 Oct 2023 20:46:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3C9B06340DEC;
	Thu,  5 Oct 2023 22:46:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id pxjMnQh4blOb; Thu,  5 Oct 2023 22:46:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BEEE46340DF3;
	Thu,  5 Oct 2023 22:46:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4Jkbwh50XZ7F; Thu,  5 Oct 2023 22:46:41 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 895696340DEC;
	Thu,  5 Oct 2023 22:46:41 +0200 (CEST)
Date: Thu, 5 Oct 2023 22:46:41 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1863543078.49676.1696538801349.JavaMail.zimbra@nod.at>
In-Reply-To: <226381209.31782.1696362327615.JavaMail.zimbra@nod.at>
References: <cover.1691717480.git.daniel@makrotopia.org> <df8cfc16a0047c1041a8f8d0069c6312bb83da0d.1691717480.git.daniel@makrotopia.org> <226381209.31782.1696362327615.JavaMail.zimbra@nod.at>
Subject: Re: [PATCH v4 5/8] mtd: ubi: attach MTD partition from device-tree
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: attach MTD partition from device-tree
Thread-Index: kqr0xqm+jR+lBv0FwDpbk9UYfLM3MSkaKwBk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_134655_809901_AAE4B7C1 
X-CRM114-Status: UNSURE (   9.23  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInJpY2hhcmQiIDxyaWNoYXJk
QG5vZC5hdD4KPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC91YmkvYmxvY2suYyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4+IGlu
ZGV4IGUwNjE4YmJkZTM2MTMuLjk5YjVmNTAyYzlkYmMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
bXRkL3ViaS9ibG9jay5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4+IEBAIC00
NzAsNyArNDcwLDcgQEAgaW50IHViaWJsb2NrX3JlbW92ZShzdHJ1Y3QgdWJpX3ZvbHVtZV9pbmZv
ICp2aSwgYm9vbCBmb3JjZSkKPj4gCX0KPj4gCj4+IAkvKiBGb3VuZCBhIGRldmljZSwgbGV0J3Mg
bG9jayBpdCBzbyB3ZSBjYW4gY2hlY2sgaWYgaXQncyBidXN5ICovCj4+IC0JbXV0ZXhfbG9jaygm
ZGV2LT5kZXZfbXV0ZXgpOwo+PiArCW11dGV4X2xvY2tfbmVzdGVkKCZkZXYtPmRldl9tdXRleCwg
U0lOR0xFX0RFUFRIX05FU1RJTkcpOwo+IAo+IFRoZSB1c2FnZSBvZiBtdXRleF9sb2NrX25lc3Rl
ZCgpIGluIHRoaXMgcGF0Y2ggbG9va3MgZmlzaHkuCj4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRl
IGEgYml0IG1vcmUgd2h5IGFsbCB0aGVzZSBtdXRleGVzIGNhbiBiZSB0YWtlbiB0d2ljZT8KPiAo
QW55IHdoeSBub3QgbW9yZSBvZnRlbikuCgpJIHRoaW5rIEkgZmlndXJlZCBteXNlbGYuCnViaWJs
b2NrX29wcy0+b3BlbigpIGFuZCAtPnJlbGVhc2UoKSBhcmUgYm90aCBjYWxsZWQgd2l0aCBkaXNr
LT5vcGVuX211dGV4IGhlbGQuCnViaWJsb2NrX29wZW4oKSBhbmQgdWJpYmxvY2tfcmVsZWFzZSgp
IHRha2UgZGV2LT5kZXZfbXV0ZXguClNvLCB0aGUgbG9ja2luZyBvcmRlciBpcyBvcGVuX211dGV4
LCBmb2xsb3dlZCBieSBkZXZfbXV0ZXguCgpPbiB0aGUgb3RoZXIgaGFuZCwgdWJpYmxvY2tfcmVt
b3ZlKCkgaXMgY2FsbGVkIHZpYSBVQkkgbm90aWZ5LgpJdCB0YWtlcyBmaXJzdCBkZXZfbXV0ZXgg
YW5kIHRoZW4gY2FsbHMgZGVsX2dlbmRpc2soKSB3aGljaCB3aWxsIHRyaWdnZXIgdWJpYmxvY2tf
b3BzLT5yZWxlYXNlKCkKdW5kZXIgZGlzay0+b3Blbl9tdXRleCBidXQgdGFrZXMgZGV2X211dGV4
IGFnYWluLgpTbywgd2UgdGhpcyBub3Qgb25seSB0YWtlcyBhIGxvY2sgdHdpY2UgYnV0IGFsc28g
aW4gcmV2ZXJzZSBvcmRlci4KbXV0ZXhfbG9ja19uZXN0ZWQoKSBtaWdodCBzaWxlbmNlIGxvY2tk
ZXAgYnV0IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMgc2FmZSBhdCBhbGwuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
