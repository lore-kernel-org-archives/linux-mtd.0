Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21C2C4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJ1Izej96Hef4yvUw/Yh+WbMRXamLV9OtQtxsvFU7R0=; b=gP7nTrRrqbrZhX
	rG2AuDHWaZ1H08CoqGzz7thoxCpFzLbHHH6MtylS96jI7i3Gad/md05BC8HT/UUsRgah/1JVfo9Uo
	v9RgElUBGnnLU6Fy8t65TaDwtuvtuQ0M/GXtQoUUiDx9IHzXUHWdlrCMBFq1BUzofnlolyweN8rTj
	UNhJvbHmYNLMcNPXgM/F/IbFPGspf9T8mCnMquQgI3xai4k/waes2hh/8oNnVjsr9TWJsUjkftaTg
	wvauDvCV7edYVW9736b1FsrwUY9u6NGVVonrAS9UZ3FgAkJZeX5T0r61G1R8vpTnOTYpm6yiq+VG+
	focR0rfzJFJaw7Dlhg6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5Fn-002kM7-1W;
	Fri, 15 Dec 2023 10:17:11 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5Fk-002kL9-1N
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:17:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 680B860007;
	Fri, 15 Dec 2023 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702635416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8LSzPU419DcHPOBSlIFjlVD+3xwo2DSPCaE+1kmur2s=;
	b=eQ1k0BSCvr+L6QmKolSWPqT6RyFMefvgGiQiCzpd1Nh0KftMkTQ+WIKBNSeKfl2ApK7oJ/
	ugRgLjLATXELcsy3HeKGaX3zshPYcQhKa5fXa5iDusts3e9AssHvQZix6F2Z2Fevkn6iC3
	gGmCmnRnEE1bIBFYfZ+zN5tqyd4ruMgoeReaugdSyVhnQNeTm6Jpf+0+oFb/MvZkHFriOu
	9AcrFbEsp/CNN6IiKn6h2/FGm29C317TCzUUU4jMBwW8Gx2Ynh98MFKJZyF8CL6++vVZ1j
	6jIGg8SSwd2z5LEGI/zs1zCt7T4LaUmZnjXdCarIckvCCicrkE2acudx/CsbDw==
Date: Fri, 15 Dec 2023 11:16:48 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: <nikita.shubin@maquefel.me>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, Linus
 Walleij <linus.walleij@linaro.org>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
Message-ID: <20231215111648.196c0c46@xps-13>
In-Reply-To: <20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	<20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_021708_619810_7EBAD4CC 
X-CRM114-Status: UNSURE (   7.46  )
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

SGkgTmlraXRhLAoKZGV2bnVsbCtuaWtpdGEuc2h1YmluLm1hcXVlZmVsLm1lQGtlcm5lbC5vcmcg
d3JvdGUgb24gVHVlLCAxMiBEZWMgMjAyMwoxMToyMDozNyArMDMwMDoKCj4gRnJvbTogTmlraXRh
IFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5tZT4KPiAKPiBUZWNobm9sb2dpYyBTeXN0
ZW1zIGhhcyBpdCdzIG93biBuYW5kIGNvbnRyb2xsZXIgaW1wbGVtZW50YXRpb24gaW4gQ1BMRC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWtpdGEgU2h1YmluIDxuaWtpdGEuc2h1YmluQG1hcXVlZmVs
Lm1lPgoKSSdtIGZpbmUgd2l0aCB0aGlzIHZlcnNpb24sIEkgY291bGQgY29sbGVjdCBwYXRjaGVz
IDE5IGFuZCAyMCB0aHJvdWdoCm10ZCBidXQgSSBzYXcgbm8gY2xlYXIgYW5zd2VyIHRvIHRoZSBj
b3ZlciBsZXR0ZXIsIHJlZ2FyZGluZyB3aG8gc2hvdWxkCnBpY2t1cCB0aGUgcGF0Y2hlcy4gTGV0
IG1lIGtub3cgd2hhdCB5b3UgcHJlZmVyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
