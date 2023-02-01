Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A2DC636CD
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 12:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3Ot5ZInlm2pMFNJD9ZwnFyS2AM3r7hEDbn/oeSdfRd8=; b=yWaSy2bvFkMLlcFng8hvEBgNp6
	U8aGL+E1FfWw4V8RfttbEFOsdAQJBj+/g3FCei8sk4ftiV+gbQzOSHWZiqJYBdpDzPZeT6Z/MIPul
	YWc02HMBH0VoxdWRhDTB805vzAshH/xqtPvQZFuCGxCrvszHHiiSRJyBm1mwbMLlG5cajgKy+4xhN
	i4LED9os3GZ2LYLibjxpE2vuBA++d6WlfNqYGyRReyxok7b7kOJzcQcQ1aT5wxyFtRUyqcTYW1VhY
	xugs44C2v4ODJKTtFekpZwAVexip08m732vCfM8I+Mp6WHiml6Y/CSvLaHqa8DCkNdX4JrMECCN14
	Dx9Y1OrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNC00-00Bfdc-4l; Wed, 01 Feb 2023 12:14:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBzw-00Bfar-L4
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 12:13:58 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BBD91639922E;
	Wed,  1 Feb 2023 13:13:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GouAGRHGtuwG; Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8E56D6399237;
	Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7w43NCUZ1Lft; Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 60FB5639922E;
	Wed,  1 Feb 2023 13:13:43 +0100 (CET)
Date: Wed, 1 Feb 2023 13:13:43 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Grant Likely <grant.likely@linaro.org>, 
	Wolfram Sang <wsa@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, 
	Peter Rosin <peda@axentia.se>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	linux-i2c@vger.kernel.org, kernel <kernel@pengutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <771653773.86636.1675253623278.JavaMail.zimbra@nod.at>
In-Reply-To: <20221118224540.619276-497-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-497-uwe@kleine-koenig.org>
Subject: Re: [PATCH 496/606] mtd: maps: pismo: Convert to i2c's .probe_new()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: maps: pismo: Convert to i2c's .probe_new()
Thread-Index: DGoCIC9lu7BoF5uiWp7aeGNcBSO7dw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_041356_878529_6A791EEF 
X-CRM114-Status: UNSURE (   4.35  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlV3ZSBLbGVpbmUtS8O2bmln
IiA8dXdlQGtsZWluZS1rb2VuaWcub3JnPgo+IEFuOiAiQW5nZWwgSWdsZXNpYXMiIDxhbmcuaWds
ZXNpYXNnQGdtYWlsLmNvbT4sICJMZWUgSm9uZXMiIDxsZWUuam9uZXNAbGluYXJvLm9yZz4sICJH
cmFudCBMaWtlbHkiCj4gPGdyYW50Lmxpa2VseUBsaW5hcm8ub3JnPiwgIldvbGZyYW0gU2FuZyIg
PHdzYUBrZXJuZWwub3JnPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiwgInJpY2hhcmQiCj4gPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEi
IDx2aWduZXNockB0aS5jb20+LCAiU2ViYXN0aWFuIFJlaWNoZWwiIDxzZWJhc3RpYW4ucmVpY2hl
bEBjb2xsYWJvcmEuY29tPiwKPiAiTWF4aW1pbGlhbiBMdXoiIDxsdXptYXhpbWlsaWFuQGdtYWls
LmNvbT4sICJQZXRlciBSb3NpbiIgPHBlZGFAYXhlbnRpYS5zZT4sICJCZW5qYW1pbiBNdWduaWVy
Igo+IDxiZW5qYW1pbi5tdWduaWVyQGZvc3Muc3QuY29tPgo+IENDOiBsaW51eC1pMmNAdmdlci5r
ZXJuZWwub3JnLCAia2VybmVsIiA8a2VybmVsQHBlbmd1dHJvbml4LmRlPiwgIlV3ZSBLbGVpbmUt
S8O2bmlnIiA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiwKPiAibGludXgtbXRkIiA8
bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRnJlaXRhZywgMTguIE5vdmVtYmVyIDIw
MjIgMjM6NDM6NTAKPiBCZXRyZWZmOiBbUEFUQ0ggNDk2LzYwNl0gbXRkOiBtYXBzOiBwaXNtbzog
Q29udmVydCB0byBpMmMncyAucHJvYmVfbmV3KCkKCj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAKPiBUaGUgcHJvYmUgZnVuY3Rpb24g
ZG9lc24ndCBtYWtlIHVzZSBvZiB0aGUgaTJjX2RldmljZV9pZCAqIHBhcmFtZXRlciBzbyBpdAo+
IGNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVp
bmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpBY2tlZC1ieTogUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KCkZlZWwgZnJlZSB0byBjYXJyeSBpdCB0
aG91Z2ggdGhlIGkyYyB0cmVlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
