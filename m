Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75153E77179
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2M7IU0gdGdcAdAj49zatlwDXMYMOEj581BPDWfeOeJ0=; b=PPW9cDvEpM5e5c
	LHeFaaKikoPgLW4VlN8pBfecsXWjrCiqIz1CE4mUIFvurYyIuTG0+SHXIzXIGZmNGz634kaDkRjlw
	Z4swAnyI6AwewwliKJBWuJm0tldoPz654vNcftHkQZATpgin0Yo1Q6dnjTW8jy3ljR1tKwiOup0gt
	gj7CkUq1jyjH10Z7Pt7urHHOybrat+TPNOsjhsBcndkTgbruQmjaJDTO9GgyA0KNbXq3bExhmoMXi
	r9UvNwICYiYLDImer/E95CwbiOeVKyeB/MTt+vW6TpnKbRTuHdzwKHJqbzhOw+kwfRjlg4jY1XC/N
	/uNNycINrmzAo5J7Bceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVl-0000000FpjB-40gS;
	Thu, 05 Dec 2024 11:59:13 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ka-0000000FZwJ-1oFX;
	Thu, 05 Dec 2024 10:43:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92C6EFF80C;
	Thu,  5 Dec 2024 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tVOU/hBtES9NqNMn3b9b53d5oMMBwDCM8MS0sfrPHxw=;
	b=NJnHShKWQUPjsX2QhlM5RDC+Jzxsy8E7DP7gbzzy10uiSf8zLJzRgetftuIys0UKY5J3/z
	dZWX9tr5Ds/Wu8zUUSUTAIIGSpdwLF2mrHkqpInaACBaJCF7/pDxTfR00uHY4a+epFiWKI
	n18wVl8zCnBtflYJW/vJvYMwUOP/OmzQcVnqMAPbvI5iCIXz75fjvBb8GdFzARHOVBj86m
	zpfcoA5iQUn6ElWHAr4IjGQf2rl8GrRvtUbNYBeDcb+1j1dR37ufXae52mw3NwvlW/oOwh
	ma/3ujT1hBMvn7nnVZiscRbdLoXa4pYSkWvzaAvSSBNJFlydFY1B0v9aihF+Ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: fix double free in atmel_pmecc_create_user()
Date: Thu,  5 Dec 2024 11:43:25 +0100
Message-ID: <173339519112.766262.17129619892556491178.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
References: <7d809e5f-32e1-4438-9cc6-3167f27dd239@stanley.mountain>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024336_617940_0FDA66F3 
X-CRM114-Status: UNSURE (   5.97  )
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

T24gV2VkLCAyMyBPY3QgMjAyNCAxMTo0MDo1NiArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToK
PiBUaGUgInVzZXIiIHBvaW50ZXIgd2FzIGNvbnZlcnRlZCBmcm9tIGJlaW5nIGFsbG9jYXRlZCB3
aXRoIGt6YWxsb2MoKSB0bwo+IGJlaW5nIGFsbG9jYXRlZCBieSBkZXZtX2t6YWxsb2MoKS4gIENh
bGxpbmcga2ZyZWUodXNlcikgd2lsbCBsZWFkIHRvIGEKPiBkb3VibGUgZnJlZS4KPiAKPiAKCkFw
cGxpZWQgdG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGZpeCBkb3Vi
bGUgZnJlZSBpbiBhdG1lbF9wbWVjY19jcmVhdGVfdXNlcigpCgpQYXRjaGUocykgd2lsbCBiZSBh
dmFpbGFibGUgd2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
