Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6C7C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f5xkpLNuPzDlmbYO/84AdRE6wd2CLBtxLGbQ90hLRxE=; b=Joua3PQhG59A+U
	SB13aLT7/sAKTBGO+en9FcTcoTeQTP9sg/DEv2tNwdWtyZzyWqv67o8gZnnot+wlNlVM6/PYg6IgU
	wYES1kr02tNcWNFRnw2R91s3wMXUDWfnt96LZos1NikV5AUrBeW3SnsJMYBDuaYleopD8PJ5Ujrv9
	358GYccUwYtcCLjCvxmM5Nmo3L0GlOb71ZSPWKJY6wGKZ7Cq6ilv6CRZjR+K5joSjwPUlIEzI6IzU
	Mg16+525rZWr+Ze98nF2zZWkLz/7JLgkzeoQk6C8A9GL2iXLaXmCfpa/Gtg3AqilQ4294/E7BDig+
	ab67Fatk5oP5Jw7/8xfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9y0-006zt8-DX; Thu, 10 Nov 2022 15:59:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9xx-006zpG-Jf
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:59:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C151FF80E;
	Thu, 10 Nov 2022 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YkqJy/6vvpHJ7UFmY9Ekm1vENwnqC9BORv60O2CwqPk=;
	b=CFfU6Nq3dGZV6+yPX6Atanh2zuYDFx3eIRp0ws+L1kEmW/x4VK0TqfrBpJJ9Q5XrZCOYFq
	sz0OhELk78AkNIj3ZGEqyGtDZHIemYCAV3EDqCbteOND8ijQ+mtu/r/kTjufG12FBEdIrb
	M+PqTzHK9q8DklMO1XxjaO50jMAsQheiJ2rGVOKDTL+3s3wgfHClk+UnZhg+B1fp4xdJun
	ckj0pybm4PTYyHVLomvAN4XcB8e2mywf+9uhvoiWGWqZysrLNTDzEU3bjBGR43lBuvtCcC
	JoTJ+4yhoFn8pO2Hf8nmcnt/+6ApZwSvqk9ySKn+LXoWUzJmE/4BBgRLEC1E6g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] Measure read while write latency
Date: Thu, 10 Nov 2022 16:59:36 +0100
Message-Id: <20221110155938.820334-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075945_796556_DD2034AA 
X-CRM114-Status: GOOD (  11.23  )
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

TWFjcm9uaXggU1BJLU5PUiBmbGFzaGVzIGhhdmUgUmVhZC1XaGlsZS1Xcml0ZSAoUldXKSBjYXBh
YmlsaXRpZXMuIFdoZW4gcHJvZ3JhbW1pbmcvZXJhc2luZyBiaWcgY2h1bmtzIG9mIGRhdGEsIGEg
c3Vic2VxdWVudCByZWFkIHdvdWxkIHRha2UgYWdlcyBiZWZvcmUgYmVpbmcgZXhlY3V0ZWQuIElm
IHRoZSBhcmVhIGFjY2Vzc2VkIGJ5IHRoZSByZWFkIGlzIG5vdCBvbiB0aGUgc2FtZSBiYW5rIG9m
IHRoZSBwcm9ncmFtIG9yIGVyYXNlLCB0aGUgcmVhZCBtYXkganVzdCBoYXBwZW4gZHVyaW5nIHRo
ZSBwcm9ncmFtbWluZyBzdGVwICh0aGUgYnVzIGJlaW5nIHRoZSBib3R0bGVuZWNrKS4gTGV0J3Mg
YWRkIGEgd2F5IHRvIG1lYXN1cmUgdGhlIGxhdGVuY3kgZ2FpbiB3aXRoIGFuIGFkZGl0aW9uYWwg
Zmxhc2hfc3BlZWQgdGVzdC4KCkJ5IHByb3ZpZGluZyAnLWIgPHg+IC1rIDx5PiAtYyA8ej4gLS1k
ZXN0cnVjdGl2ZScsIHJlYWRzIHdpbGwgYmUgYXR0ZW1wdGVkIG9uIGJsb2NrcyBbeTsgeSt6XSBq
dXN0IGFmdGVyIHN0YXJ0aW5nIHdyaXRlcyBvbiBibG9ja3MgW3g7IHgrel0uIFRoZSB0ZXN0IHRv
b2wgZ2l2ZXMgdGhlIHRvdGFsIHRpbWUgb2YgdGhlIG9wZXJhdGlvbiAoY2xvc2UgdG8gbWFraW5n
IGEgd3JpdGUgdGhlbiBhIHJlYWQsIHNlcmlhbGx5KSBhcyB3ZWxsIGFzIHRoZSB0aW1lIHdoZW4g
dGhlIHJlYWQgd2FzIG92ZXIuIElmIHRoZSBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCB0aGUgUldX
IGZlYXR1cmUsIG9yIGlmIHRoZSByZWFkcyBhbmQgd3JpdGVzIHRhcmdldCB0aGUgc2FtZSBiYW5r
LCB0aGUgcmVhZCB3aWxsIGVuZCBsYXN0IGF0IHRoZSBlbmQgb2YgdGhlIGZ1bGwgb3BlcmF0aW9u
LiBPdGhlcndpc2UsIHdoZW4gdGhlIFJXVyBmZWF0dXJlIGlzIGxldmVyYWdlZCwgdGhlIHJlYWQg
ZW5kcyBtdWNoIGVhcmxpZXIuCgpFeGFtcGxlIHdpdGggYSBNYWNyb25peCBNWDI1VVc1MTI0NUcg
d2l0aCBiYW5rIGFuZCBSV1cgc3VwcG9ydDoKCiAgICAgLy8gVGVzdGluZyB0aGUgdHdvIGFjY2Vz
c2VzIGluIHRoZSBzYW1lIGJhbmsKICAgICAkIGZsYXNoX3NwZWVkIC1iMCAtazAgLWMxMCAtZCAv
ZGV2L210ZDAKICAgICBbLi4uXQogICAgIHRlc3RpbmcgcmVhZCB3aGlsZSB3cml0ZSBsYXRlbmN5
CiAgICAgcmVhZCB3aGlsZSB3cml0ZSB0b29rIDUxbXMsIHJlYWQgZW5kZWQgYWZ0ZXIgNTFtcwoK
ICAgICAvLyBUZXN0aW5nIHRoZSB0d28gYWNjZXNzZXMgd2l0aGluIGRpZmZlcmVudCBiYW5rcwog
ICAgICQgZmxhc2hfc3BlZWQgLWIwIC1rNDA5NiAtYzEwIC1kIC9kZXYvbXRkMAogICAgIFsuLi5d
CiAgICAgdGVzdGluZyByZWFkIHdoaWxlIHdyaXRlIGxhdGVuY3kKICAgICByZWFkIHdoaWxlIHdy
aXRlIHRvb2sgNTFtcywgcmVhZCBlbmRlZCBhZnRlciAyMG1zCgpUaGFua3MsCk1pcXXDqGwKCk1p
cXVlbCBSYXluYWwgKDIpOgogIG10ZC11dGlsczogZmxhc2hfc3BlZWQ6IFJld29yayB0aGUgdGlt
ZSBjb3VudGluZyBoZWxwZXJzCiAgbXRkLXV0aWxzOiBmbGFzaF9zcGVlZDogTWVhc3VyZSByZWFk
IHdoaWxlIHdyaXRlIGxhdGVuY3kKCiB0ZXN0cy9tdGQtdGVzdHMvTWFrZW1vZHVsZS5hbSB8ICAg
NSArLQogdGVzdHMvbXRkLXRlc3RzL2ZsYXNoX3NwZWVkLmMgfCAxNjUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygrKSwg
MjAgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
