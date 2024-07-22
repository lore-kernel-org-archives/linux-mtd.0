Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858BAC3DA70
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 15:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mJTepxwAjabLkXgJqOSOviRKSP3AkA0hoftWZHr5raU=; b=2Bi3t+heP9JS35lP+W/FUO/1IC
	RNlhtAsXWfb95W/fgiLNHSVUwu9lsk/hchUu3Yc32IWeTv1qa6Lyq7sizEUkcSoNGwAmgo/zjVmu/
	P8R2VLM2yhDjm3O9iNbP+AL9+1V7GWesiLGy04dnFNg5doabeCM4x6U5l9wPi+7Pn/COgyFPnCjiP
	yza+/WdKgy21PJ/+cKOCEinVXU6oDMus8m4QhdW477VdO58SjAfSD/KoKsSvLnRUo8M5cXLq2T+ga
	6xaO8F8QBX+FhG/zUaF4E2/rqRD8y9Ku9Dv86MZtCzya3lW6eC9H2wH2Q15DtAHFtP/y7OhRaGrz1
	kOXyZDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuqx-00000009vR2-2XDj;
	Mon, 22 Jul 2024 15:21:31 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVuqt-00000009vQ9-1wR8
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 15:21:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D89626196A4A;
	Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Qza8hDRPG0nx; Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3DB0E609184C;
	Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q9HYSQTFU0cQ; Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 10D4E6196A4A;
	Mon, 22 Jul 2024 17:21:22 +0200 (CEST)
Date: Mon, 22 Jul 2024 17:21:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	Knop Ryszard <ryszard.knop@intel.com>
Message-ID: <1868573045.102281.1721661681881.JavaMail.zimbra@nod.at>
In-Reply-To: <20240719152542.1554440-1-jfalempe@redhat.com>
References: <20240719152542.1554440-1-jfalempe@redhat.com>
Subject: Re: [PATCH] mtd: mtdoops: Fix kmsgdump parameter renaming.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtdoops: Fix kmsgdump parameter renaming.
Thread-Index: TphXISdImxx2iJrcLR4C9m8Leyhpgw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_082127_666313_CF0E44BA 
X-CRM114-Status: GOOD (  14.31  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEJldHJlZmY6IFtQQVRDSF0gbXRkOiBt
dGRvb3BzOiBGaXgga21zZ2R1bXAgcGFyYW1ldGVyIHJlbmFtaW5nLgoKPiBXaGVuIHRoZSBrbXNn
X2R1bXBlciBjYWxsYmFjayBwYXJhbWV0ZXIgY2hhbmdlZCwgdGhlIHJlYXNvbiB2YXJpYWJsZQo+
IGluIG10ZG9vcHNfZG9fZHVtcCgpIHdhcyBub3QgdXBkYXRlZCBhY2NvcmRpbmdseS4KPiBUaGlz
IGJyZWFrcyB0aGUgYnVpbGQgd2l0aCBtdGRvb3BzLgo+IAo+IEZpeGVzOiBlMWEyNjFiYTU5OWUg
KCJwcmludGs6IEFkZCBhIHNob3J0IGRlc2NyaXB0aW9uIHN0cmluZyB0byBrbXNnX2R1bXAoKSIp
Cj4gUmVwb3J0ZWQtYnk6IEtub3AgUnlzemFyZCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+Cj4gLS0t
Cj4gCj4gVGhlIG9mZmVuZGVkIGNvbW1pdCBpcyBpbiB0aGUgZHJtLW1pc2MgdHJlZSwgYmVjYXVz
ZSBpdCB3YXMgbmVlZGVkCj4gYnkgZHJtX3BhbmljLiBTbyBJIHdpbGwgcHVzaCB0aGUgZml4IHRo
ZXJlIHRvby4KPiAKPiBkcml2ZXJzL210ZC9tdGRvb3BzLmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9tdGRvb3BzLmMgYi9kcml2ZXJzL210ZC9tdGRvb3BzLmMKPiBpbmRleCA4NmQ0
OWRiOTE5NmQuLjdiZjM3NzdlMWYxMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRvb3Bz
LmMKPiArKysgYi9kcml2ZXJzL210ZC9tdGRvb3BzLmMKPiBAQCAtMzA1LDcgKzMwNSw3IEBAIHN0
YXRpYyB2b2lkIG10ZG9vcHNfZG9fZHVtcChzdHJ1Y3Qga21zZ19kdW1wZXIgKmR1bXBlciwKPiAJ
c3RydWN0IGttc2dfZHVtcF9pdGVyIGl0ZXI7Cj4gCj4gCS8qIE9ubHkgZHVtcCBvb3BzZXMgaWYg
ZHVtcF9vb3BzIGlzIHNldCAqLwo+IC0JaWYgKHJlYXNvbiA9PSBLTVNHX0RVTVBfT09QUyAmJiAh
ZHVtcF9vb3BzKQo+ICsJaWYgKGRldGFpbC0+cmVhc29uID09IEtNU0dfRFVNUF9PT1BTICYmICFk
dW1wX29vcHMpCj4gCQlyZXR1cm47Cj4gCj4gCWttc2dfZHVtcF9yZXdpbmQoJml0ZXIpOwo+IEBA
IC0zMTcsNyArMzE3LDcgQEAgc3RhdGljIHZvaWQgbXRkb29wc19kb19kdW1wKHN0cnVjdCBrbXNn
X2R1bXBlciAqZHVtcGVyLAo+IAkJCSAgICAgcmVjb3JkX3NpemUgLSBzaXplb2Yoc3RydWN0IG10
ZG9vcHNfaGRyKSwgTlVMTCk7Cj4gCWNsZWFyX2JpdCgwLCAmY3h0LT5vb3BzX2J1Zl9idXN5KTsK
PiAKPiAtCWlmIChyZWFzb24gIT0gS01TR19EVU1QX09PUFMpIHsKPiArCWlmIChkZXRhaWwtPnJl
YXNvbiAhPSBLTVNHX0RVTVBfT09QUykgewoKQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8
cmljaGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
