Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A282FC54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZ1QMAdKV7Wxald1+Dz1INNqa0o8TXFyUCmFKZbP9vY=; b=yz1+Ai0P87fICx
	gAA4CyxGNw7BNGFdHwNx1QlB29YeMUSbZKSuW07VS5IuI3XpOV1hdbhH1IF4BS40PE5Xnk5lAUURd
	Nv3JjVIqGG55pMyiVK04QX5x1csPCos5wSFnfRCOkw44AtJThxfARHrGey2wCdq5xBeC1iGWw5gXt
	ZmoCWJ1mXcM1urD1Y566Mr3iKgRkr6hUl2kFVSQomKdpysq51EBc/U0qlbaJ0PTkKsknAJ8PLdNV3
	fSLlC65BZWB9IKptcPmegjv1FW6kJ7FUE12ENcfHZGHGUwh/woFdpgWJXDNdS4Mt48coOWNwDxrMk
	WQf2gC/Yh8rfaSbuWs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfa-00000000SfX-2KHT;
	Mon, 26 Feb 2024 12:01:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTk-000000009NV-08uz;
	Mon, 26 Feb 2024 10:45:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F18C060005;
	Mon, 26 Feb 2024 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zL/Tgozd757x0uspKJ/QO1fI2sa1DUP6bzOx+70NEX0=;
	b=PbNfK+FefzTpRRZZaLv6nXskQ+mmjm6jtVHrDL7HRvcQUxrt/ON5CBHIra+IRzW5oSP3mC
	qL0rcEu5cs9tcn9SnBMBL/eM1OxBZfSwfB/j6BSbxCBBSPT6hoADU1JUblR3QK5LVJSHMF
	MhmzEaiQP7PPOzilGKqZR8Pxp1pjllqW51/TO2+/XDxIS1lzGDEMpvXjGzbNIOhYVx13eA
	S/xIGuK89v2kZwSrZJ0PAF4SxW3+AiVnLiFBfq6vNJwE0hVbsNPyME4lPuM/CUu/mGz3z2
	4ck9hwW45k2IESMkzf5Mdo+mppFvwVwPNaY81MpS+5bJR5rghPxnyXJmZ74hiA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Erick Archer <erick.archer@gmx.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	=?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Li Zetao <lizetao1@huawei.com>,
	=?utf-8?q?Uw?= =?utf-8?q?e_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: Prefer struct_size over open coded arithmetic
Date: Mon, 26 Feb 2024 11:44:56 +0100
Message-Id: <20240226104456.490065-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240211091633.4545-1-erick.archer@gmx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e395036504c4e19d15ba64543a4c3beca373f7a9'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024500_678892_E2F62B7D 
X-CRM114-Status: GOOD (  12.58  )
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

T24gU3VuLCAyMDI0LTAyLTExIGF0IDA5OjE2OjMzIFVUQywgRXJpY2sgQXJjaGVyIHdyb3RlOgo+
IFRoaXMgaXMgYW4gZWZmb3J0IHRvIGdldCByaWQgb2YgYWxsIG11bHRpcGxpY2F0aW9ucyBmcm9t
IGFsbG9jYXRpb24KPiBmdW5jdGlvbnMgaW4gb3JkZXIgdG8gcHJldmVudCBpbnRlZ2VyIG92ZXJm
bG93cyBbMV0uCj4gCj4gQXMgdGhlICJjaGlwIiB2YXJpYWJsZSBpcyBhIHBvaW50ZXIgdG8gInN0
cnVjdCBtdGtfbmZjX25hbmRfY2hpcCIgYW5kCj4gdGhpcyBzdHJ1Y3R1cmUgZW5kcyBpbiBhIGZs
ZXhpYmxlIGFycmF5Ogo+IAo+IHN0cnVjdCBtdGtfbmZjX25hbmRfY2hpcCB7Cj4gCVsuLi5dCj4g
CXU4IHNlbHNbXSBfX2NvdW50ZWRfYnkobnNlbHMpOwo+IH07Cj4gCj4gdGhlIHByZWZlcnJlZCB3
YXkgaW4gdGhlIGtlcm5lbCBpcyB0byB1c2UgdGhlIHN0cnVjdF9zaXplKCkgaGVscGVyIHRvCj4g
ZG8gdGhlIGFyaXRobWV0aWMgaW5zdGVhZCBvZiB0aGUgYXJndW1lbnQgInNpemUgKyBjb3VudCAq
IHNpemUiIGluIHRoZQo+IGRldm1fa3phbGxvYygpIGZ1bmN0aW9uLgo+IAo+IFRoaXMgd2F5LCB0
aGUgY29kZSBpcyBtb3JlIHJlYWRhYmxlIGFuZCBzYWZlci4KPiAKPiBMaW5rOiBodHRwczovL3d3
dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCNvcGVu
LWNvZGVkLWFyaXRobWV0aWMtaW4tYWxsb2NhdG9yLWFyZ3VtZW50cyBbMV0KPiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMTYwIFsyXQo+IFJldmlld2VkLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogRXJpY2sgQXJjaGVyIDxlcmljay5hcmNoZXJAZ214LmNvbT4KPiBBY2tlZC1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiBSZXZpZXdlZC1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMu
YmdnQGdtYWlsLmNvbT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBuYW5kL25leHQsIHRoYW5rcy4KCk1pcXVl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
