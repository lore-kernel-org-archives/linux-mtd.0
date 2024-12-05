Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7767E77170
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjOdT9HC4GMnqOCzpBKYFt5XU2i3XSr2AxRsSIc3u8s=; b=X0+duOmFh8aakJ
	1qzm9/wrb2k+WkFJnRD2YWyNCyIjrjAWyotWfJ3OnrdQhz97j6yHiXpWtVD+KJWN1dQyKbGkoVfGP
	vElFLFfJuj3TbsP8vm7UdqVNSq3AGe74za2FbogdJ3VKvMIOZXBcdAU+KnjcWrE5jG3pOKh/K7K+o
	URcLhmuhECt04zQhqnGZeljLKoWUNqf3PEYPhkHtXRVaTxN7UB0bhtOpaXUYxeSZiYgd+3wlscACe
	n/edL4Wg0DWbr2pQE3uTbdZH/ueaXqFWxgxjBecp4dH1gP1anAQ5WLpHIxcrf4GOs2+OBmrFkQwHG
	cl/tIWDcFtJoJDMILZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVq-0000000Fpne-0nFw;
	Thu, 05 Dec 2024 11:59:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Kf-0000000FZzQ-102y
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97683FF81A;
	Thu,  5 Dec 2024 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wu9sHg5vcrBeKKUlB5bJl4UwuotFEnp384Lb4gvhaW0=;
	b=Wi0ENRctm3qA3NsLpn8vukK7rs+4Px0my9U+4TG6MbHOXMnfIHTlC0eD09DHPM9pDnC5oa
	48cCOJusf4pLP8xx/trLgCqZoKgTtyI0+dihZHpjv+9EFHXnOQdt6S4E0U2vKj3x9V7qWF
	aczRLWDNWWT+hNCVqu3lCi/MninqmBqKWx4XKELdX/NQM6cCpwzPNDgBlUTvXyOS67Jl57
	hX5TnHPOMW+Cqgyjnw3/V6zEpH6TBmlLNlbylTJ0M7AKB/9Gt+iCnsQDcwmCjN/Iv0QlUF
	A2A4mp4EXIvd54+Qaqk1DXE40FyINVb3HoVFP595S+uH9OhGWgnPNbw7Pyrq8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at,
	vigneshr@ti.com,
	arnd@arndb.de,
	dinghao.liu@zju.edu.cn,
	Gax-c <zichenxie0106@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] mtd: diskonchip: Cast an operand to prevent potential overflow
Date: Thu,  5 Dec 2024 11:43:31 +0100
Message-ID: <173339519114.766262.17486555724920350115.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023211310.13015-1-zichenxie0106@gmail.com>
References: <20241023211310.13015-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024341_403590_BD7C766C 
X-CRM114-Status: UNSURE (   6.50  )
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

T24gV2VkLCAyMyBPY3QgMjAyNCAxNjoxMzoxMCAtMDUwMCwgR2F4LWMgd3JvdGU6Cj4gVGhlcmUg
bWF5IGJlIGEgcG90ZW50aWFsIGludGVnZXIgb3ZlcmZsb3cgaXNzdWUgaW4gaW5mdGxfcGFydHNj
YW4oKS4KPiBwYXJ0c1swXS5zaXplIGlzIGRlZmluZWQgYXMgInVpbnQ2NF90IiAgd2hpbGUgbXRk
LT5lcmFzZXNpemUgYW5kCj4gaXAtPmZpcnN0VW5pdCBhcmUgZGVmaW5lZCBhcyAzMi1iaXQgdW5z
aWduZWQgaW50ZWdlci4gVGhlIHJlc3VsdCBvZgo+IHRoZSBjYWxjdWxhdGlvbiB3aWxsIGJlIGxp
bWl0ZWQgdG8gMzIgYml0cyB3aXRob3V0IGNvcnJlY3QgY2FzdGluZy4KPiAKPiAKCkFwcGxpZWQg
dG8gbXRkL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSBtdGQ6IGRpc2tvbmNoaXA6IENhc3QgYW4gb3Bl
cmFuZCB0byBwcmV2ZW50IHBvdGVudGlhbCBvdmVyZmxvdwoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZh
aWxhYmxlIHdpdGhpbiBob3VycyBvbjoKbXRkL2xpbnV4LmdpdAoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
