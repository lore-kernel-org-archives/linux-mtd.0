Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98853C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 23:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBE62190A
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 23:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q67io+P+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="EHyw4e57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBE62190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rg+M8RSqt+u2KW/CzdQPQYO+ibsOr4Ngip/KYE0ltIM=; b=Q67io+P+EgRVYa
	8KLYi0uasuuOhRuGfOxxcqN5CmwDB5cwJjMZX2YkvyqEMZCIMtqapzvf3Wvzd+5WwkYbzoGKPtLRh
	oyl631aiahO5IGJZQn+F15XS5uXUHXYZgDOLf9R+u9o8pRdW7tODn1GTCes0djtMqGV9/zQj2v38I
	Ld/IF+1GBe8WUVYNNcUBuDQ8wXuNNaH4JceQDlNywyogz0sMR68wt+BXFnrSTfcSTLa59xEhsq5vd
	bgMcA/QDwcoA/wCyBk3taM7zGcJEI+pmjr02D80F2oeKn7h4VV1aKVymsbUrYVLO8Qwc1FlpIbeqt
	Pl1UPpKwCS6u4IxzBgmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h77Ui-00025e-Ga; Thu, 21 Mar 2019 23:53:08 +0000
Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h77Uc-00025C-64
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 23:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1553212372;
 bh=KvMXmUIknsxmOD93e4AfGwjNqhHVey3dIGojC8KMH6A=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EHyw4e57dHq8DS7yvsre1vpzbBUXAOVJ38BC1pxV+eGfFgegU3F2XB1RCpY0qlLS/
 pBccOzRUHH9D8fR0Y6xUl1pqpPVITR2B0pLjx2Jlt8z+CcmFR6tr6ucerKUkCR87Hv
 BWER7xXzAtTB5Xeqm/Uweo/HLGN/ve/0J/uwOI+Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.232.48]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MDymt-1hDR9f1Tih-00HNbY; Fri, 22
 Mar 2019 00:52:52 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: Fix sphinx syntax
Date: Fri, 22 Mar 2019 00:52:41 +0100
Message-Id: <20190321235242.32158-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:0AaLLJgmSTpYH9NYOZvdnVlm7P1tfYcngyPtOXxJj1wMzdJMd27
 UXesPorUZkzGiQPoVStWGH5S+wlNuSzfeo4WzcpXKxGhs1MH49tq6dsEh7Z0zVUwrC0YoSJ
 PZNcTjzdCxUajsL+Btl6CZaWby7GlLfQRJwQpMA36yyRggAaseLPWipZmyGkcXzK0EXgNhw
 44aV7qNbqZDDlnrX7VpIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iq4lttArJ0Q=:u1awK5EQ4/0I2xq7k3EcFk
 GbPzDvNWYirNcVPtAR4tDGAuzDXgYv3jHmsNqbH2NJwbUWiEIR5Y4wxmFxGdUftcose0vp/QG
 rdPX6OtCvFE/C+m9L0TKvgHAxLSnnJwHwXYSbtRyTQ8Yof8cy8Y8BgAj4d2iZ1X2ObTSOhsi1
 JZOqOr54uAB6kWmvKtpVNBQ8MelYP+GUPuT6AbDe+xOzUIWcOS2PWM8PUi7+vZVZ1vydC7gt3
 cDTJwWGbSlt3RDlLEpZTfrS/LvkCuzU+GeqhJRvLin0RbhkkI/AGyyksCUbHeEJZ96VwrZu//
 YkqCQG3Rw5OSoyGDykU+2GAO2bgPr7Ihh0qFygGbAqnDvwgykyuh7Id6zHf2J3F4dQZUy4Yk8
 NEiU4MJTEa1xlM2guOWhpxKIX3EmtAh5H7K93Eke3HYCzuOnEh+GoPxPgmnU2DhZSyCGK+MTO
 kIJPGDOasZB8NXGZdXHSRr2HIVqKLkkqWM+zKbRjwYunqFOFlcl5JVpVgAyTtjA+a4KPiEriw
 8YqfDr8cChcVi6UuyH0LN+3kiUvnnoxGIcv+eUlHTycMnE1YMpbifI+02z31+Ugc5KzVa+9/O
 1/J7biJGKEfukr0q4k1RukkJBrddOcz2a71V08rmLiriPwfYYQ6WfOk5yQIinob9yUeWg95j1
 WvKVs5EYpBihrQIk2nignfPlt7w5387ZboGw9rciIEeTmWN00R6tKKQ8ykQ1w8HqJSc8EaBDR
 3z6I/Q8KxeD5Vd+SAtXTyQO2BRlyOAzjO8JR8NWFnn5gU7OLfdwgwaz33Pcs6E2cTaVRdirVu
 y7c71WkZCZJAYZBtTpCdWoufVpIPcqZ8I1G9yTZJ6WOSdjdcy4zdZa1CDWK2KwDk7xgjIkb4K
 NhrbAmoHXGaNNO91NdpEblq9zlyBk2gw90D9vfdlEVZD+z3oiqNjrVRMgnYgr5MD9mNdW4398
 huC0rOYyiLg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_165302_576071_F3BDBE56 
X-CRM114-Status: GOOD (  11.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U3BoaW54IGRvZXNuJ3QgaGFuZGxlIGV4cHJlc3Npb25zIGluIGlkZW50aWZpZXIgcmVmZXJlbmNl
cy4KClRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKCi4vaW5jbHVkZS9saW51eC9t
dGQvcmF3bmFuZC5oOjExODQ6IFdBUk5JTkc6IElubGluZSBzdHJvbmcgc3RhcnQtc3RyaW5nIHdp
dGhvdXQgZW5kLXN0cmluZy4KLi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmg6MTE4NjogV0FS
TklORzogSW5saW5lIHN0cm9uZyBzdGFydC1zdHJpbmcgd2l0aG91dCBlbmQtc3RyaW5nLgoKU2ln
bmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4K
LS0tCiBpbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9tdGQvcmF3bmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCmluZGV4IGI3
NDQ1YTQ0YTgxNC4uMjdjMmRiOGU0YTFmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9y
YXduYW5kLmgKKysrIGIvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oCkBAIC0xMTgwLDkgKzEx
ODAsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKm5hbmRfZ2V0X21hbnVmYWN0dXJlcl9kYXRhKHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXApCiAgKiBAbmFtZTogYSBodW1hbi1yZWFkYWJsZSBuYW1lIG9m
IHRoZSBOQU5EIGNoaXAKICAqIEBkZXZfaWQ6IHRoZSBkZXZpY2UgSUQgKHRoZSBzZWNvbmQgYnl0
ZSBvZiB0aGUgZnVsbCBjaGlwIElEIGFycmF5KQogICogQG1mcl9pZDogbWFudWZlY3R1cmVyIElE
IHBhcnQgb2YgdGhlIGZ1bGwgY2hpcCBJRCBhcnJheSAocmVmZXJzIHRoZSBzYW1lCi0gKiAgICAg
ICAgICBtZW1vcnkgYWRkcmVzcyBhcyBAaWRbMF0pCisgKiAgICAgICAgICBtZW1vcnkgYWRkcmVz
cyBhcyBgYGlkWzBdYGApCiAgKiBAZGV2X2lkOiBkZXZpY2UgSUQgcGFydCBvZiB0aGUgZnVsbCBj
aGlwIElEIGFycmF5IChyZWZlcnMgdGhlIHNhbWUgbWVtb3J5Ci0gKiAgICAgICAgICBhZGRyZXNz
IGFzIEBpZFsxXSkKKyAqICAgICAgICAgIGFkZHJlc3MgYXMgYGBpZFsxXWBgKQogICogQGlkOiBm
dWxsIGRldmljZSBJRCBhcnJheQogICogQHBhZ2VzaXplOiBzaXplIG9mIHRoZSBOQU5EIHBhZ2Ug
aW4gYnl0ZXM7IGlmIDAsIHRoZW4gdGhlIHJlYWwgcGFnZSBzaXplIChhcwogICogICAgICAgICAg
ICB3ZWxsIGFzIHRoZSBlcmFzZWJsb2NrIHNpemUpIGlzIGRldGVybWluZWQgZnJvbSB0aGUgZXh0
ZW5kZWQgTkFORAotLQoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
