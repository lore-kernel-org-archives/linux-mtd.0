Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDFCCDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLNXjtcZUhe8DqLjYYSeWs0p57o0bZNe65aFGBWLlUE=; b=YtsE9QQoLeiwuT
	59gqQqvcokYKiqDkdQpPwWwMLlbM2XhnrGF1oxp9Vus90QfODDwj02Pxq4xyim3ueoflQG/Z4qohZ
	IqzVSv3ejo/0HmOrYLGLneGyC1zVloNBqhfhbFZ5HmEHjQN5nG1op2sf1alvR6Tv5qxdVm3ODyqbi
	mkfiv+KW+CoLTtpi63HpXO0rtzPFE3vkd7RREN5jjM1DLfvX1MKWKdC+x4U9qyntrlRWUXkNOGydO
	MCXh9ozj6MAC5xtb+aKviUUyUfwPSTVrWUenmCPSBvaDFGJ7704kgJa4gwJjeNO5FtmQXUsoX32Tw
	YyUVUUk/xlnFharmJWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuT-0090ao-13;
	Mon, 16 Oct 2023 09:29:13 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuL-0090UR-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:29:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB9DC24000A;
	Mon, 16 Oct 2023 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TuNlvIpMbf7XAhkSz7avcE0kB/TU7asqjzSOyPcOKqM=;
	b=OaZh3V0rsK90e4ilUI5miK/f+Lz5ZQ+hE1Q33BJcULlt6z/XTXo41wgmizD0KdSfi209Ek
	p0Cr5yKogYu/nL67vGtqi4qRPV3PB6PSiAswfhLp+ywFIdZ6cHmJ08gW4QD2jXZvkV0Vzv
	PU+UPl2f98Kyupf0XBmvd9XKf+aFCjHLcBcbPxsu8bULmgFc+EirZ6xHCwkZMvpyvH5Cfo
	5UgN47FOZEAke4AKyZ4j1KSleEIaehPb1aN/QzGrr8AisruQfFBY8NLcera/tE++ER0k8V
	Ai0x0hksV04y7nKXVMks4tAybjLgvWOFBtckTmja/GNFiifFGssiPL5jU3KgUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Kees Cook <keescook@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Roger Quadros <rogerq@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Valentin Korenblit <vkorenblit@sequans.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: rawnand: cadence: Annotate struct cdns_nand_chip with __counted_by
Date: Mon, 16 Oct 2023 11:28:59 +0200
Message-Id: <20231016092859.289086-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231006201734.work.060-kees@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4c1f363777ac8fa7c54a408868b6f88c9795ef59'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022905_374491_5F0AD541 
X-CRM114-Status: UNSURE (   8.40  )
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

T24gRnJpLCAyMDIzLTEwLTA2IGF0IDIwOjE3OjM0IFVUQywgS2VlcyBDb29rIHdyb3RlOgo+IFBy
ZXBhcmUgZm9yIHRoZSBjb21pbmcgaW1wbGVtZW50YXRpb24gYnkgR0NDIGFuZCBDbGFuZyBvZiB0
aGUgX19jb3VudGVkX2J5Cj4gYXR0cmlidXRlLiBGbGV4aWJsZSBhcnJheSBtZW1iZXJzIGFubm90
YXRlZCB3aXRoIF9fY291bnRlZF9ieSBjYW4gaGF2ZQo+IHRoZWlyIGFjY2Vzc2VzIGJvdW5kcy1j
aGVja2VkIGF0IHJ1bi10aW1lIHZpYSBDT05GSUdfVUJTQU5fQk9VTkRTIChmb3IKPiBhcnJheSBp
bmRleGluZykgYW5kIENPTkZJR19GT1JUSUZZX1NPVVJDRSAoZm9yIHN0cmNweS9tZW1jcHktZmFt
aWx5Cj4gZnVuY3Rpb25zKS4KPiAKPiBBcyBmb3VuZCB3aXRoIENvY2NpbmVsbGVbMV0sIGFkZCBf
X2NvdW50ZWRfYnkgZm9yIHN0cnVjdCBjZG5zX25hbmRfY2hpcC4KPiAKPiBDYzogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBDYzogUmljaGFyZCBXZWluYmVyZ2Vy
IDxyaWNoYXJkQG5vZC5hdD4KPiBDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGku
Y29tPgo+IENjOiAiR3VzdGF2byBBLiBSLiBTaWx2YSIgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4K
PiBDYzogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KPiBDYzogTmljb2xhcyBGZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgo+
IENjOiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiBDYzogWWFuZyBZaW5nbGlhbmcgPHlhbmd5aW5nbGlh
bmdAaHVhd2VpLmNvbT4KPiBDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgo+IENjOiBWYWxlbnRpbiBLb3JlbmJsaXQgPHZrb3JlbmJsaXRAc2Vx
dWFucy5jb20+Cj4gQ2M6IHllIHhpbmdjaGVuIDx5ZS54aW5nY2hlbkB6dGUuY29tLmNuPgo+IENj
OiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1oYXJkZW5pbmdAdmdl
ci5rZXJuZWwub3JnCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2tlZXMva2VybmVsLXRvb2xz
L2Jsb2IvdHJ1bmsvY29jY2luZWxsZS9leGFtcGxlcy9jb3VudGVkX2J5LmNvY2NpIFsxXQo+IFNp
Z25lZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgo+IFJldmlld2Vk
LWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+CgpBcHBsaWVk
IHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9s
aW51eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
