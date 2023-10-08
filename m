Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EC9E95A80
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Oct 2023 20:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zxw+ppucBAZUJO9Hb+HLUQnOuR8yYY5PqHVHbWauHMY=; b=P4cTdoPRzcOgXK
	vAcnM8tMm0d0gw8FCtzqI8zrXh/weNCyg8dzoQsU3jm9sBuczwsNwaZEzzur65eVsfXt70ngNFMVV
	nBF7xaDySda+OnctjpZ43p3fPjK6WXrnmTW8FpOWcxpnh4HhyOjdtPoiHXi7I8WVrUtcR7Vqq/iPe
	Lodctg8vXkn6ao2Oiox0H2w0qDswi7zRltSHSxUVJLA5BQW2K+83B3kHwLiyMhUt6uWg6Q/wNiNhD
	RgOtiU0aJrECuA6yOoSlRys7+KHkTwuOCUsBZurDKduZc86s4T9eFykKm9fOWx3jVgb7KB/tXFXic
	chlwvSAf7DMA92CyF9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpa0h-009FJ9-0n;
	Sun, 08 Oct 2023 20:04:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpa0f-009FIK-13
	for linux-mtd@bombadil.infradead.org;
	Sun, 08 Oct 2023 20:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3UzLw627FVkrRm5YPmsQ6qBqtgZcgxUtft/IhjYlx5g=; b=NQ0FuJaYOKIIJpHF6OBTCkfey8
	yTLXHvaiH/LYBECLsgrwzxAt6Bmw5W/ZbWc7Hfe0djZVcA/6VifnS4eaXTFL9ib1THUNKYge0lhHW
	FxQa4RlfF2KAmi7xaM4ROhaxMifJ2nRliUEnGr1i5GYODGB0u9QvlqOlJlytb62TfEtTrtxi8q4RV
	9mkENPb51FHAcf/VyiynT3l/uEyh7bhiVV+R4y3DOwG1Nkn7Z9YWpAaakcFN/9PviqiULdssiJV6h
	GhwTN5/iqQyu0ndy8R7GZNzvhwaZO7vraZ2kKf5BfTMyzzqjWhOwKwu7he1rfCGNagbOToNJz7r60
	DMpGayhw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpa0V-00Exag-2X
	for linux-mtd@lists.infradead.org;
	Sun, 08 Oct 2023 20:04:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyS-0001Rz-A6; Sun, 08 Oct 2023 22:02:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyL-000Ez8-3z; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpZyK-00Bezw-PY; Sun, 08 Oct 2023 22:01:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de,
	linux-kbuild@vger.kernel.org,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Joern Engel <joern@lazybastard.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Yangtao Li <frank.li@vivo.com>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Hui Tang <tanghui20@huawei.com>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/20] mtd: Convert to platform remove callback returning void
Date: Sun,  8 Oct 2023 22:01:23 +0200
Message-Id: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4139; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aa6SE3gWpaHTuyfq4v/sxGd7EehqufNhl2EDrrsJWOQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlRlrnLPoKUeQvyaTxuFWZ/OXFizKe5m/A+PtikJ0Ukdr qwXpBI6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiISDD7PyWTOakmExfPWSyu v9voS6C7FXdan5pmyQrjiye/v9j25eHul21Nr2RPvF76tXMKo7r99v6sA01L3h1JfFq5xXyKZmz nubtHmtecskjM6rgf+/OK9MalV7taHt85zWKwpYQ3O960UJNNvLPf4JKPp3xLzIVQ2ZltTqVbmL xX9YS5JehVlj55ynxmpmKm2jJreyNnmeueYaK7xPdoyE9a7fj14LSCk9xc86dd8zDZ8vlH9/aa9 JRi9qb7k79lncjhuLcg5IK1HNunIy3HVfa4JC4ubfZ2MmYt/LjfwOmxmAOH2Y4T1mGGdafFjjme 2fEw+XFkwDdzR96WbSda7tWGiq1heTfNPzBV0e5R8Kt5AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_210410_450618_B3F0F9ED 
X-CRM114-Status: GOOD (  14.11  )
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL210ZCB0byB1c2UgdGhlCi5yZW1vdmVfbmV3KCkgY2FsbGJhY2suIENvbXBhcmVkIHRv
IHRoZSB0cmFkaXRpb25hbCAucmVtb3ZlKCkgY2FsbGJhY2sKLnJlbW92ZV9uZXcoKSByZXR1cm5z
IG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2ZXIKY29yZSBk
b2Vzbid0IChhbmQgY2Fubm90KSBjb3BlIGZvciBlcnJvcnMgZHVyaW5nIHJlbW92ZS4gVGhlIG9u
bHkgZWZmZWN0Cm9mIGEgbm9uLXplcm8gcmV0dXJuIHZhbHVlIGluIC5yZW1vdmUoKSBpcyB0aGF0
IHRoZSBkcml2ZXIgY29yZSBlbWl0cyBhCndhcm5pbmcuIFRoZSBkZXZpY2UgaXMgcmVtb3ZlZCBh
bnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKQp1c3VhbGx5IHlpZWxkcyBy
ZXNvdXJjZSBsZWFrcyBhbmQvb3IgdXNlLWFmdGVyLWZyZWUgYnVncy4KCkFsbCBkcml2ZXJzIHRv
dWNoZWQgaGVyZSByZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9uYWxseSBpbiB0aGVpciByZW1vdmUK
Y2FsbGJhY2ssIHNvIHRoZXkgY291bGQgYWxsIGJlIGNvbnZlcnRlZCB0cml2aWFsbHkgdG8gLnJl
bW92ZV9uZXcoKS4KClNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3ZpZGUg
YSByZW1vdmUgY2FsbGJhY2sgdGhhdApyZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVuZGVk
IGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwgZ29hbC4KCkFzIGFuIGFkZGVkIGJvbnVzIHRo
ZSBzZXJpZXMgc3RhcnRzIHdpdGggYSBtaW5vciBmaXggYW5kIGEKc2ltcGxpZmljYXRpb24gb2Yg
dGhlIHR4eDluZGZtYyBkcml2ZXIuCgpUaGUgb25seSBpbnRlcmRlcGVuZGVuY2llcyBpbiB0aGlz
IHNlcmllcyBpcyBiZXR3ZWVuIHRoZSB0aHJlZSB0eHg5bmRmbWMKcGF0Y2hlcy4gQXMgdGhlcmUg
YXJlIHN0aWxsIHF1aXRlIGEgZmV3IGRyaXZlcnMgdG8gY29udmVydCwgSSdtIGhhcHB5CmFib3V0
IGV2ZXJ5IHBhdGNoIHRoYXQgbWFrZXMgaXQgaW4uIFNvIGV2ZW4gaWYgdGhlcmUgaXMgYSBtZXJn
ZSBjb25mbGljdAp3aXRoIG9uZSBwYXRjaCB1bnRpbCB5b3UgYXBwbHkgKG9yIGEgZGlmZmVyZW50
IGNvbmNlcm4gdGhhdCBkb2Vzbid0CmFwcGx5IHRvIGFsbCBwYXRjaGVzKSwgcGxlYXNlIGFwcGx5
IHRoZSByZW1haW5kZXIgb2YgdGhpcyBzZXJpZXMgYW55aG93LgpJJ2xsIGNvbWUgYmFjayB0byB0
aGUgcGFydCB0aGF0IHlvdSAobWF5YmUpIHNraXBwZWQgYXQgYSBsYXRlciBwb2ludC4KCkJlc3Qg
cmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgyMCk6CiAgbXRkOiByYXduYW5kOiB0eHg5
bmRmbWM6IE1hcmsgZHJpdmVyIHN0cnVjdCB3aXRoIF9fcmVmZGF0YSB0byBwcmV2ZW50CiAgICBz
ZWN0aW9uIG1pc21hdGNoIHdhcm5pbmcKICBtdGQ6IHJhd25hbmQ6IHR4eDluZGZtYzogRHJvcCBp
ZiBibG9jayB3aXRoIGFsd2F5cyBmYWxzZSBjb25kaXRpb24KICBtdGQ6IGJjbTQ3eHhzZmxhc2g6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbXRk
OiBkb2NnMzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICBtdGQ6IHBocmFtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogIG10ZDogcG93ZXJudl9mbGFzaDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtdGQ6IHNwZWFyX3NtaTogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtdGQ6IHN0X3NwaV9mc206
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbXRk
OiBoeXBlcmJ1czogaGJtYy1hbTY1NDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sKICAgIHJldHVybmluZyB2b2lkCiAgbXRkOiBoeXBlcmJ1czogcnBjLWlmOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBtdGQ6IGxwZGRy
Ml9udm06IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lk
CiAgbXRkOiBtYXBzOiBsYW50aXEtZmxhc2g6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIG10ZDogbWFwczogcGh5c21hcC1jb3JlOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBtdGQ6
IG1hcHM6IHBsYXQtcmFtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcKICAgIHZvaWQKICBtdGQ6IG1hcHM6IHB4YTJ4eC1mbGFzaDogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbXRkOiBtYXBzOiBzYTEx
MDAtZmxhc2g6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwog
ICAgdm9pZAogIG10ZDogbWFwczogc3VuX3VmbGFzaDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbXRkOiByYXduYW5kOiB0eHg5bmRmbWM6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAog
IG10ZDogc3BpLW5vcjogaGlzaS1zZmM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZwogICAgdm9pZAogIG10ZDogc3BpLW5vcjogbnhwLXNwaWZpOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKCiBkcml2ZXJz
L210ZC9kZXZpY2VzL2JjbTQ3eHhzZmxhc2guYyAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJz
L210ZC9kZXZpY2VzL2RvY2czLmMgICAgICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMv
bXRkL2RldmljZXMvcGhyYW0uYyAgICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2RldmljZXMvcG93ZXJudl9mbGFzaC5jICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2RldmljZXMvc3BlYXJfc21pLmMgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2RldmljZXMvc3Rfc3BpX2ZzbS5jICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2h5cGVyYnVzL2hibWMtYW02NTQuYyAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2h5cGVyYnVzL3JwYy1pZi5jICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL2xwZGRyL2xwZGRyMl9udm0uYyAgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL21hcHMvbGFudGlxLWZsYXNoLmMgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL21hcHMvcGh5c21hcC1jb3JlLmMgICAgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy9t
dGQvbWFwcy9wbGF0LXJhbS5jICAgICAgICAgICAgICAgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJz
L210ZC9tYXBzL3B4YTJ4eC1mbGFzaC5jICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMv
bXRkL21hcHMvc2ExMTAwLWZsYXNoLmMgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL21hcHMvc3VuX3VmbGFzaC5jICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L3R4eDluZGZtYy5jICAgICAgICAgICAgfCAxNSArKysrKysrKystLS0tLS0K
IGRyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvaGlzaS1zZmMuYyAgfCAgNSArKy0tLQog
ZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9ueHAtc3BpZmkuYyB8ICA2ICsrLS0tLQog
MTggZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCgoKYmFz
ZS1jb21taXQ6IDBiYjgwZWNjMzNhOGZiNWE2ODIyMzY0NDNjMWU3NDBkNWM5MTdkMWQKLS0gCjIu
NDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
