Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFAACAC5B9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3GezbjHBYGPcDL6yo9FGAjJbmNG/VOh7q599hFrCtk=; b=VSeJE0owBmxvyi
	bJV5n3/+j7E/cuZnU1HNKoPFOJEY3Ah6wURbUC/Mbx68WvlE//wtsedVfCLxw3ED6kg1k6m2OfCh8
	GHXYQLn0ujRYNICZxA0TjWvs8++uFUbzev1CsBGkXioxVK4D7JGshgEeS5bRYg+NqN9I91uufE8fA
	6fY4dayoOw2lhWIYQpTuuXQUZu5KFFyYZSyt3/sP+/b0I8soJln3So77oBaDR7f0f1henS0gBffCc
	WegtN4wOJvWSl8fIZ/2U8jju0GrNaYEmGPTI75fk2VISs3YxfrIq6eE6iuigAvonQEVkbQdeGw4tU
	neaqjdh2z2K+8LNMV81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLe-00000002tKE-3gC8;
	Mon, 29 Sep 2025 16:03:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLb-00000002tHl-47Hp
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 16:03:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AE741A0F7A;
	Mon, 29 Sep 2025 16:03:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61195606AE;
	Mon, 29 Sep 2025 16:03:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D69F102F1892;
	Mon, 29 Sep 2025 18:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161809; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tk1eZV5jzVZvv4lv795Qh576K4MgQIfXrsJ1ER9BklY=;
	b=KU88oRo48SOjQw8HL39BM8Jw3frtT7XIBLMjNW8pXg5WB6qmZ/HTDO27NhxE07Ae8g7K7Z
	So5jC/XrVEmIbCuTZ/rdWsdexRXKgsn25Vctc+aYcY9bSjr/Zb964TrUuTSgWa1kQBVLj0
	/y7j4ldcM/c1IwSvEYZrwKeni7NFkXIgVjIo65N0574ovq1h6JAPppOG0epLc3SOjvfvCi
	Me7vycgfT+V7f2NmFAbV8YVSddFq7NWgPTMZESJy8QB4NICkB/qZ6AyE5zV/nCsgsaE04N
	MnQUA076ZO6dSLOWw+i33RG2uMxb/Y4/c2lxGXh9q3F6HMyww/O6GP+0UvnGgA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Hovold <johan@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250922153107.16381-1-johan@kernel.org>
References: <20250922153107.16381-1-johan@kernel.org>
Subject: Re: [PATCH 0/8] mtd: drop unused module aliases
Message-Id: <175916179659.52129.17423940507748789517.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 18:03:16 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090332_149551_6266E55C 
X-CRM114-Status: UNSURE (   7.92  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAxNzozMDo1OSArMDIwMCwgSm9oYW4gSG92b2xkIHdyb3RlOgo+
IFdoZW4gZml4aW5nIGEgZGV2aWNlIGxlYWsgaW4gdGhlIG9tYXAyIHJhd25hbmQgZHJpdmVyIEkg
bm90aWNlZCBpdCBoYWQKPiBhIG5vIGxvbmdlciB1c2VkIHBsYXRmb3JtIG1vZHVsZSBhbGlhcy4K
PiAKPiBUaGlzIHNlcmllcyBkcm9wcyB1bnVzZWQgbW9kdWxlIGFsaWFzZXMgZnJvbSBtdGQgZHJp
dmVycyB0aGF0IG5ldmVyCj4gc3VwcG9ydGVkIGFueXRoaW5nIGJ1dCBPRiBwcm9iaW5nIG9yIHRo
YXQgbm8gbG9uZ2VyIGRvLgo+IAo+IEpvaGFuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25l
eHQsIHRoYW5rcyEKClsxLzhdIG10ZDogaHlwZXJidXM6IGhibWMtYW02NTQ6IGRyb3AgdW51c2Vk
IG1vZHVsZSBhbGlhcwogICAgICBjb21taXQ6IDE5MmY5ODFjMTRiZmFkNDI0MTQ0NjU0NGNmMGQy
N2I5ZmExMWE3YmQKWzIvOF0gbXRkOiBvbmVuYW5kOiBvbWFwMjogZHJvcCB1bnVzZWQgbW9kdWxl
IGFsaWFzCiAgICAgIGNvbW1pdDogY2M3NGMzZjhlNGJjMDFlY2Y5ODQ5YTJiMjI3MDZiYTk2YTI5
Zjc0OQpbMy84XSBtdGQ6IHJhd25hbmQ6IGF0bWVsOiBkcm9wIHVudXNlZCBtb2R1bGUgYWxpYXMK
ICAgICAgY29tbWl0OiA3YTNmM2M1YmRlY2ZlM2NmNmNkZDM1MDczYzI3MjlhNDY4OTRhMzRkCls0
LzhdIG10ZDogcmF3bmFuZDogb21hcDI6IGRyb3AgdW51c2VkIG1vZHVsZSBhbGlhcwogICAgICBj
b21taXQ6IGIxYTVjNmRlOTdiNGM4NjFjMWFkMWU3YWQzODE4ZWJkMzJiZTE5MGUKWzUvOF0gbXRk
OiByYXduYW5kOiBwbDM1MzogZHJvcCB1bnVzZWQgbW9kdWxlIGFsaWFzCiAgICAgIGNvbW1pdDog
MWY3MDA1ZDM4MmY1NjdiMjVjZmI5NmQ5ZjIwMWY1NDQ4Y2Y2N2Y5YQpbNi84XSBtdGQ6IHJhd25h
bmQ6IHJvY2tjaGlwOiBkcm9wIHVudXNlZCBtb2R1bGUgYWxpYXMKICAgICAgY29tbWl0OiA2MTE2
M2U3MzczZjY3OGM0NTNhNDUwNTg2NWUwZjhiMjdlNTA2ZGU4Cls3LzhdIG10ZDogcmF3bmFuZDog
c3RtMzJfZm1jMjogZHJvcCB1bnVzZWQgbW9kdWxlIGFsaWFzCiAgICAgIGNvbW1pdDogMmYwNWMx
MDg2NjQwNTZmOTFlNWY5MTcxMTY5YzY4NWY1MTdhYzU2OApbOC84XSBtdGQ6IHJhd25hbmQ6IHN1
bnhpOiBkcm9wIHVudXNlZCBtb2R1bGUgYWxpYXMKICAgICAgY29tbWl0OiAzNjJmODRjODllMTM2
NTM5YjhjM2VkYjQ3ZjQyZmIwNmNlMzdiYWNmCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJs
ZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3Zp
ZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1
w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
