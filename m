Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811AFCA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMll/nMm1UxJqmoCkbe0s8wcA/3iW43bU73nxSloEq8=; b=wJwSABi+jx7tl/
	uHuoNQiBgSXAvNOVjIQbZ2hS+FsA20+8kD005WDbAGVJ14TzwdB9mU0WyiJRDHT9U7WsWu2fhi8/d
	SpauhI10sTLyhKoxtDieox2oAhHNkoGBTFxh7tP3Ls08n/e3fyD4DxciXnQojVajSc+cmGnZXvLpc
	2LuqpuuU+3ubvsWaa08TJUJ/kERImovD6Fzj9/eFu34bLHCjjhaP8N1MGfhJbdytuHqOhTNXhGvw1
	HLgPRu6inVGHmbMuK7Bba+LGy/1FATJacWxkLRrM+lLqiKOtYs8Kv+1twJiiTOdEyTV/M3+A5QLV0
	tVFGflejI7UJ63e0o4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcQq-0000000Ba9v-2jiG;
	Fri, 02 Oct 2026 12:32:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcQo-0000000Ba9n-22u9
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D71BC60A8E;
	Fri,  2 Oct 2026 12:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1791F00898;
	Fri,  2 Oct 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944325;
	bh=ZHC2G7Dqj4RURbiI1DmU8aCMw9IuodpVw5CWt6N1StU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TXf51IByO6TJ4sixU60Qd8VoJH42RU6CgKrQNGOo4lJJmM13swdOxawDL8fT/arLw
	 DbokJ95rQ/pK7BE+94dUmed08L4vceILPAg1XH+ZZZxgYxBK/RJZWznucPMoy4Y/tQ
	 +eWg3yReUVSKzd1lAu8EYEtucKR+oZPiV3xEWX3Sp/eIzMsb3viZ7/KVJDUH6l5BHQ
	 DNxwH0OUmQcdxSB2MsVtbU7Ax4GfCDI0Sdn3JDKo9QWiHb1Sh+BKAyr0Cmim58jz5o
	 RDSIKhikGoE6BNc7jS/F6viZMByN1PP2cGsehGpgjpW48UIUdDkYHPa4UdQGYMSo9d
	 1sitZWByln8gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/15] mtd: spi-nor: winbond: Add support for
 W35T51NW-C/E
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, "Steam
 Lin" <STLin2@winbond.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-13-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-13-a22a2f95c26e@bootlin.com>
Date: Fri, 02 Oct 2026 12:32:04 +0000
Message-Id: <20261002123205.0A1791F00898@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
dW5pbml0aWFsaXplZCBtZW1vcnkgcmVhZCBpbiB3cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2tf
Y2FyZWZ1bCgpCi0tCgpjb21taXQgZGIwNDYzMjQyYzFiODk1ZjFhODcyOWU5ODMwNDllNTAxMDU3
MWM2ZApBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgpt
dGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBwb3J0IGZvciBXMzVUNTFOVy1DL0UKClRoaXMg
Y29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIFdpbmJvbmQgVzM1VDUxTlctQy9FIFNQSS1OT1Ig
Zmxhc2gKZGV2aWNlcy4gSXQgZGVmaW5lcyB0aGVpciBKRURFQyBJRCBhbmQgY29uZmlndXJlcyBm
ZWF0dXJlcyBsaWtlIGJsb2NrCnByb3RlY3Rpb24gYW5kIGxvY2tpbmcgYnkgc2V0dGluZyBTUElf
Tk9SX0hBU19MT0NLIGFuZCByZWxhdGVkIGZsYWdzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvc3BpLW5vci93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYwo+IGlu
ZGV4IDA1YTgwYWYzYTZiOTMuLjBlMzUwZGNmYmI3NTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci93aW5ib25kLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQu
YwpbIC4uLiBdCj4gQEAgLTYzMyw2ICs2MzMsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFz
aF9pbmZvIHdpbmJvbmRfbm9yX3BhcnRzW10gPSB7Cj4gIAkJLmlkID0gU05PUl9JRCgweGVmLCAw
eDViLCAweDE5KSwKPiAgCQkuZmxhZ3MgPSBTUElfTk9SX0hBU19MT0NLIHwgU1BJX05PUl9IQVNf
VEIgfCBTUElfTk9SX1RCX1NSX0JJVDYgfAo+ICAJCQkgU1BJX05PUl80QklUX0JQLAo+ICsJfSwg
ewo+ICsJCS8qIFczNVQ1MU5XLUMvRSAqLwo+ICsJCS5pZCA9IFNOT1JfSUQoMHhlZiwgMHg1Yiwg
MHgxYSksCj4gKwkJLmZsYWdzID0gU1BJX05PUl9IQVNfTE9DSyB8IFNQSV9OT1JfSEFTX1RCIHwg
U1BJX05PUl9UQl9TUl9CSVQ2IHwKPiArCQkJIFNQSV9OT1JfNEJJVF9CUCwKCltTZXZlcml0eTog
SGlnaF0KRG9lcyBlbmFibGluZyBTUElfTk9SX0hBU19MT0NLIG9uIHRoaXMgY2hpcCBsZWFkIHRv
IGFuIHVuaW5pdGlhbGl6ZWQgbWVtb3J5CnJlYWQgYW5kIHJhbmRvbSBmYWlsdXJlcyBkdXJpbmcg
bG9jay91bmxvY2sgb3BlcmF0aW9ucz8KClNpbmNlIFczNVQgY2hpcHMgZGlzYWJsZSByZWFkaW5n
IFNSMiB2aWEgd2luYm9uZF93MzV0eHhud19ub3JfbGF0ZV9pbml0KCkKYnkgc2V0dGluZyBub3It
PnBhcmFtcy0+b3Bjb2Rlcy5yZWFkX3NyMiA9IDAsIGxvY2sgb3BlcmF0aW9ucyBldmVudHVhbGx5
IHJlYWNoCnNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjJfYW5kX2NoZWNrX2NhcmVmdWwoKSB3aXRo
IGFuIHVuaW5pdGlhbGl6ZWQgYnVmZmVyOgoKZHJpdmVycy9tdGQvc3BpLW5vci9zd3AuYzpzcGlf
bm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVja19jYXJlZnVsKCkgewoJdTggdG1wWzJdOwoJ
aW50IHJldDsKCS4uLgoJcmV0ID0gc3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyX2NhcmVmdWwobm9y
LCB0bXApOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoKCWlmIChzclswXSAhPSB0bXBbMF0gfHwg
c3JbMV0gIT0gdG1wWzFdKQoJCXJldHVybiAtRUlPOwp9CgpCZWNhdXNlIHJlYWRfc3IyIGlzIDAs
IHNwaV9ub3JfcmVhZF9zcjJfY2FyZWZ1bCgpIHNhZmVseSByZXR1cm5zIDAgYnV0IGxlYXZlcwp0
bXBbMV0gY29tcGxldGVseSB1bmluaXRpYWxpemVkLgoKV2hlbiB0aGUgY29kZSB1bmNvbmRpdGlv
bmFsbHkgZXZhbHVhdGVzIGlmIChzclsxXSAhPSB0bXBbMV0pLCB0bXBbMV0gY29udGFpbnMKc3Rh
Y2sgZ2FyYmFnZSwgd2hpY2ggd2lsbCByYW5kb21seSBub3QgbWF0Y2ggc3JbMV0uIENhbiB0aGlz
IGNhdXNlIHNwdXJpb3VzCi1FSU8gZmFpbHVyZXMgZm9yIGxvY2sgYW5kIHVubG9jayBmdW5jdGlv
bmFsaXR5IG9uIHRoZXNlIGNoaXBzPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8v
c2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwMi13aW5ib25kLW1hc3Rlci1zcGktbm9yLXcz
NXQtdjEtMC1hMjJhMmY5NWMyNmVAYm9vdGxpbi5jb20/cGFydD0xMwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
