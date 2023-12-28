Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED7C3DA6E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kxbW9qaGbYurT6I5hJuGxQs9ee4fjnmf3A4ILCG4Ceg=; b=IjSS61+V0WjKK6ijDfUraOutl7
	884FWLJD/pMYyYlxTxGGmupal/jiEB4gEQbYO7Y0xhf1IsUyJgooODnuv3fGhzLhiaxZuYVb8nz27
	sPbrIdjHh1NEeVmDVuJCSITw8qLdFPutJAW4mcSeEifSsCoyoijyAuvjMp7Fxzla/nvfQaZOMMg2d
	lTRn34416J8eKf97CSdqCeITkvZcoTgWDKU5rE+x3S63g4nQIrtqyYgbooVORDPAqlZQFdWBMYKW3
	D9oDnOE77Naj9SF3JQQFcYgfxqJ+FhWmg2Z0Dc9TxcS1Tl4BmpTDR6Ie8PLwlm1AKijyftQD3mVj4
	ykoTL7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIoGs-00Gdk1-08;
	Thu, 28 Dec 2023 11:09:50 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIoGo-00GdjF-15;
	Thu, 28 Dec 2023 11:09:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 64FC36343B34;
	Thu, 28 Dec 2023 12:09:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QLKAjcGqlAWB; Thu, 28 Dec 2023 12:09:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 83EF66343B4D;
	Thu, 28 Dec 2023 12:09:38 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ho9bqT-b41NN; Thu, 28 Dec 2023 12:09:38 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 498246343B34;
	Thu, 28 Dec 2023 12:09:38 +0100 (CET)
Date: Thu, 28 Dec 2023 12:09:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, anton ivanov <anton.ivanov@cambridgegreys.com>, 
	Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>, 
	senozhatsky <senozhatsky@chromium.org>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-um <linux-um@lists.infradead.org>, 
	linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linux-bcache <linux-bcache@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <651248504.172152.1703761778190.JavaMail.zimbra@nod.at>
In-Reply-To: <20231228075545.362768-10-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de> <20231228075545.362768-10-hch@lst.de>
Subject: Re: [PATCH 9/9] mtd_blkdevs: use the default discard granularity
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: mtd_blkdevs: use the default discard granularity
Thread-Index: qBzbN7jF6yK+/MNDxaXtjyFFzypHWw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_030946_565391_38F7B65E 
X-CRM114-Status: UNSURE (   9.30  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhjaCIgPGhjaEBsc3QuZGU+
Cj4gQW46ICJKZW5zIEF4Ym9lIiA8YXhib2VAa2VybmVsLmRrPgo+IENDOiAicmljaGFyZCIgPHJp
Y2hhcmRAbm9kLmF0PiwgImFudG9uIGl2YW5vdiIgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5
cy5jb20+LCAiSm9zZWYgQmFjaWsiIDxqb3NlZkB0b3hpY3BhbmRhLmNvbT4sCj4gIk1pbmNoYW4g
S2ltIiA8bWluY2hhbkBrZXJuZWwub3JnPiwgInNlbm96aGF0c2t5IiA8c2Vub3poYXRza3lAY2hy
b21pdW0ub3JnPiwgIkNvbHkgTGkiIDxjb2x5bGlAc3VzZS5kZT4sICJNaXF1ZWwKPiBSYXluYWwi
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIlZpZ25lc2ggUmFnaGF2ZW5kcmEiIDx2aWdu
ZXNockB0aS5jb20+LCAibGludXgtdW0iCj4gPGxpbnV4LXVtQGxpc3RzLmluZnJhZGVhZC5vcmc+
LCAibGludXgtYmxvY2siIDxsaW51eC1ibG9ja0B2Z2VyLmtlcm5lbC5vcmc+LCBuYmRAb3RoZXIu
ZGViaWFuLm9yZywgImxpbnV4LWJjYWNoZSIKPiA8bGludXgtYmNhY2hlQHZnZXIua2VybmVsLm9y
Zz4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRl
dDogRG9ubmVyc3RhZywgMjguIERlemVtYmVyIDIwMjMgMDg6NTU6NDUKPiBCZXRyZWZmOiBbUEFU
Q0ggOS85XSBtdGRfYmxrZGV2czogdXNlIHRoZSBkZWZhdWx0IGRpc2NhcmQgZ3JhbnVsYXJpdHkK
Cj4gVGhlIGRpc2NhcmQgZ3JhbnVsYXJpdHkgbm93IGRlZmF1bHRzIHRvIGEgc2luZ2xlIHNlY3Rv
ciwgc28gZG9uJ3Qgc2V0Cj4gdGhhdCB2YWx1ZSBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+IGRyaXZlcnMvbXRkL210
ZF9ibGtkZXZzLmMgfCA0ICstLS0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMg
Yi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gaW5kZXggZmYxODYzNmUwODg5NzMuLjBkYTdi
MzM4NDk0NzFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiArKysg
Yi9kcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jCj4gQEAgLTM3NiwxMCArMzc2LDggQEAgaW50IGFk
ZF9tdGRfYmxrdHJhbnNfZGV2KHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpuZXcpCj4gCWJsa19x
dWV1ZV9mbGFnX3NldChRVUVVRV9GTEFHX05PTlJPVCwgbmV3LT5ycSk7Cj4gCWJsa19xdWV1ZV9m
bGFnX2NsZWFyKFFVRVVFX0ZMQUdfQUREX1JBTkRPTSwgbmV3LT5ycSk7Cj4gCj4gLQlpZiAodHIt
PmRpc2NhcmQpIHsKPiArCWlmICh0ci0+ZGlzY2FyZCkKPiAJCWJsa19xdWV1ZV9tYXhfZGlzY2Fy
ZF9zZWN0b3JzKG5ldy0+cnEsIFVJTlRfTUFYKTsKPiAtCQluZXctPnJxLT5saW1pdHMuZGlzY2Fy
ZF9ncmFudWxhcml0eSA9IHRyLT5ibGtzaXplOwo+IC0JfQoKQWNrZWQtYnk6IFJpY2hhcmQgV2Vp
bmJlcmdlciA8cmljaGFyZEBub2QuYXQ+CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
