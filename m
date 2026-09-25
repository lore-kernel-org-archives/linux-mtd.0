Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F390C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiLrKLyuuHE+WNQkIMGW1PDm1UNf8ol3I7zhGiSaqUA=; b=TCA6vIrM9WBMlW
	FNSFkbpkMPkLYhZeBQfCeWBr31c01/W2mb0pfOyxoVkhYl0Z5gL3Cj+irdBvW45AMt6iCH+BoFAOV
	vf/2pxLDpirm9Ys1bAlS5IIN0fK7FqbK4UXfbt2j7yy17WKk5xBirc8TNvawfrq8AW+z+6rXApyzc
	/vXBquRvSizeNhda/b/hvnVf50Eta9Aduf0Ewso3cxiUoRxWhBS3f8vWMZpayUGTSibryHTSYdqMF
	8U7f46UMsDPywzR5jZ+FHBYs2fODmcuSP9zMBOzRssU6RWx2O67YHi+63lAM55A7lQYr174i5Ahqj
	0srnRXWq78ZfxN2SVKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vQ-0000000DaGk-0BBY;
	Fri, 25 Sep 2026 14:29:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vP-0000000DaFS-0nxl
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Sep 2026 14:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yfCX8H+M35XhP8P+4I5oT/TqJldGzETIWgil3VkSoIU=; b=Dp6XKfY2UX90TU/zrb1vS3Jk8s
	N+prddR6RgB9OzBdLwmOVCVVStw1BMK60kK6fF764P4KTO3fy9DcDS+TMdX2oSTtaFMrXQih8vTbx
	lNerBkyoEL/oUOMtZYQLRkVGprD9Itc+fmXcaYXnAmvM75CW7owFqG/gw7mSmnlsRYGqmHQvSeWuE
	v2ScDR0D8eMLkqkxhaC/qaQdfH5Kt8eis+YtH6rnVhL2sSJ5aFzZz4N+nldYpvAoec0AKeqm4B4aM
	634+LPlJ4H3Xx4JyZPlapKEeQ+x0IHiFMCvHGnSBHI7g7JhVneszXyFx/5F0BOIS2Jz+PT0fIw5su
	j+MZZ0jQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA6vM-0000000H09S-1XGo
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6CE41C653F9;
	Fri, 25 Sep 2026 14:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A1DB6073B;
	Fri, 25 Sep 2026 14:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74849102F1E13;
	Fri, 25 Sep 2026 16:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346550; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yfCX8H+M35XhP8P+4I5oT/TqJldGzETIWgil3VkSoIU=;
	b=JjWHZhg31ZQVx1/oeHXBS40KM0R+ZGG/MgajUJMgoqzKeA1205BjTPajr3loued6vvyfjU
	Gn1jOil1XfQw5s2gJiMw/0iKqe06+Wq2XSovCu1hHuVaRKjBxXHWJtqYcl8SOJsJMBGvAt
	Js3M73SDAxShSZUt686hkNApdsJoA8DSJ+YD/MbNgNqJndc44WXAAxBb/TZbTOVpXo3mfM
	T10Y40nPysXBbkh9bTpbPg6J/beTW1m2jQQESu/Dg4BtYaLpLIm4IF+KEKyiNovnBWhQuV
	9wRjFMX/XhN0iGDvM/fHzPewpEZ+UDC/Ipz4hSywYSxXwjCscf/4fVGqHkzfZg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
 Karl Mehltretter <kmehltretter@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Breno Leitao <leitao@debian.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
References: <20260919130811.3041516-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: use assign_bit() where
 applicable
Message-Id: <179034654691.1166139.13579096219818232472.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_152916_484612_86DDD629 
X-CRM114-Status: UNSURE (   4.58  )
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

T24gU2F0LCAxOSBTZXAgMjAyNiAyMTowODowNiArMDgwMCwgUGVuZyBGYW4gKE9TUykgd3JvdGU6
Cj4gQ29udmVydCBvcGVuLWNvZGVkIGlmL2Vsc2Ugd2l0aCBzZXRfYml0L2NsZWFyX2JpdCB0byB0
aGUgYXNzaWduX2JpdCBBUEkuCj4gCj4gCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpb
MS8xXSBtdGQ6IGNmaV9jbWRzZXRfMDAwMTogdXNlIGFzc2lnbl9iaXQoKSB3aGVyZSBhcHBsaWNh
YmxlCiAgICAgIGNvbW1pdDogMzBjNzBlMDFmNzlmMDRiODAyODIxZDZkZTI0YTY0ODA1MzhlMzkw
OQoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2ls
bCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlu
cyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
