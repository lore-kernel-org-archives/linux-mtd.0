Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24287C4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D428723DC4
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D428723DC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xonez6ZisEcRasMc6Q7Hrye7u3CTeR32pwDDS/dgSIg=; b=cvvI+OSt+Ji2aelMG6V2eSgZY
	ctR4exO8p8EUU2ZgwRZZocIfJ2DQPfFC71J87+Qxtbq1BNCGXNxDe0PiYtRLSiri8XUbXGHBtIHt+
	+bWdTiimRXHpfi+/c30Z8tQPWnpYd4O6WRcKTAkl9nsM7kSjQ3Ak/E6F6olVdPLk0Glt0jTGcVdlo
	p73u0Vu5l6tWjikDdxNDMCKs6M8CYQl0FF6EEil+pJQmspGlWifdbodl1YvXQn7OdPmY85cNeX+7t
	20nPF4sTasqUf1Ie0+wL9QQUxKFegbIqlrjsKiKsvboRQXbFpEvzVbmx3xHTbwSHsqsfyvZtnaeme
	HhsBK9x0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTZd-0005xq-W6; Thu, 10 Dec 2020 21:34:06 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTZD-0005oj-MY
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:33:48 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6D735240002;
 Thu, 10 Dec 2020 21:33:34 +0000 (UTC)
Date: Thu, 10 Dec 2020 22:33:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YouChing Lin <ycllin@mxic.com.tw>
Subject: Re: [PATCH 1/2] mtd: nand: ecc-bch: Fix the size of
 calc_buf/code_buf of the BCH
Message-ID: <20201210223333.204062b1@xps13>
In-Reply-To: <1607570529-22341-2-git-send-email-ycllin@mxic.com.tw>
References: <1607570529-22341-1-git-send-email-ycllin@mxic.com.tw>
 <1607570529-22341-2-git-send-email-ycllin@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_163339_894499_9F471B64 
X-CRM114-Status: GOOD (  16.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW91Q2hpbmcsCgpZb3VDaGluZyBMaW4gPHljbGxpbkBteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAxMCBEZWMgMjAyMCAxMToyMjowOAorMDgwMDoKCj4gSWYgZWNjYnl0ZSBleGNlZWRzIDY0
IGJ5dGVzLCB0aGUgcmVhZCBvcGVyYXRpb24gd2lsbCBnZXQgd3JvbmcgcmVzdWx0cy4KPiBGb3Ig
ZXhhbXBsZTogRmxhc2ggd2l0aCBhIHBhZ2Ugc2l6ZSBvZiA0MDk2IGJ5dGVzIChlY2NieXRlOiAx
MDQgYnl0ZXMpLgo+IER1cmluZyB0aGUgcmVhZCBvcGVyYXRpb24sIGFmdGVyIGV4ZWN1dGluZyBu
YW5kX2VjY19zd19iY2hfY2FsY3VsYXRlKCksCj4gc2luY2UgdGhlIGNhbGNfYnVmL2NvZGVfYnVm
IHJhbmdlcyBvdmVybGFwIGVhY2ggb3RoZXIsIHRoZSBsYXN0IHRocmVlCj4gc3RlcHMgb2YgZWNj
X2NvZGUgKHJlYWQgZnJvbSBvb2IpIHdpbGwgYmUgY2hhbmdlZC4KPiAKPiBUaGUgcm9vdCBjYXVz
ZSBpcyB0aGF0IHRoZSBzaXplIG9mIGNhbGNfYnVmL2NvZGVfYnVmIGlzIGxpbWl0ZWQgdG8gNjQK
PiBieXRlcywgYWx0aG91Z2ggc2l6ZW9mKG10ZC0+b29ic2l6ZSkgcmV0dXJucyA0LCBremFsbG9j
KCkgd2lsbCBhbGxvY2F0ZQo+IDY0IGJ5dGVzIChjYWNoZSBzaXplIGFsaWdubWVudCkuCj4gCj4g
U28gd2UgY29ycmVjdCB0aGUgc2l6ZSBvZiBjYWxjX2J1Zi9jb2RlX2J1ZiB0byBtdGQtPm9vYnNp
emUuCj4gCj4gU2lnbmVkLW9mZi1ieTogWW91Q2hpbmcgTGluIDx5Y2xsaW5AbXhpYy5jb20udHc+
Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvZWNjLXN3LWJjaC5jIHwgNCArKy0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvZWNjLXN3LWJjaC5jIGIvZHJpdmVycy9tdGQvbmFuZC9lY2Mt
c3ctYmNoLmMKPiBpbmRleCA0ZDhhOTc5Li4wYTBhYzExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvZWNjLXN3LWJjaC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9lY2Mtc3ctYmNo
LmMKPiBAQCAtMjM3LDggKzIzNyw4IEBAIGludCBuYW5kX2VjY19zd19iY2hfaW5pdF9jdHgoc3Ry
dWN0IG5hbmRfZGV2aWNlICpuYW5kKQo+ICAKPiAgCWVuZ2luZV9jb25mLT5jb2RlX3NpemUgPSBj
b2RlX3NpemU7Cj4gIAllbmdpbmVfY29uZi0+bnN0ZXBzID0gbnN0ZXBzOwo+IC0JZW5naW5lX2Nv
bmYtPmNhbGNfYnVmID0ga3phbGxvYyhzaXplb2YobXRkLT5vb2JzaXplKSwgR0ZQX0tFUk5FTCk7
Cj4gLQllbmdpbmVfY29uZi0+Y29kZV9idWYgPSBremFsbG9jKHNpemVvZihtdGQtPm9vYnNpemUp
LCBHRlBfS0VSTkVMKTsKPiArCWVuZ2luZV9jb25mLT5jYWxjX2J1ZiA9IGt6YWxsb2MobXRkLT5v
b2JzaXplLCBHRlBfS0VSTkVMKTsKPiArCWVuZ2luZV9jb25mLT5jb2RlX2J1ZiA9IGt6YWxsb2Mo
bXRkLT5vb2JzaXplLCBHRlBfS0VSTkVMKTsKClZlcnkgbmljZSBjYXRjaCEgSWYgeW91IGRvbid0
IG1pbmQgSSB3aWxsIG1lcmdlIHRoaXMgZml4IHdpdGggdGhlCmZhdWx0eSBjb21taXQgKHN0aWxs
IGluIG5leHQpIGFuZCBJIHdpbGwgYWxzbyBicmluZyB0aGUgZml4IHRvIEhhbW1pbmcKd2hpY2gg
d2lsbCBzdWZmZXIgZnJvbSB0aGUgc2FtZSBlcnJvci4KClRoZW4gSSB3aWxsIGFwcGx5IHRoZSBz
ZWNvbmQgcGF0Y2guCgo+ICAJaWYgKCFlbmdpbmVfY29uZi0+Y2FsY19idWYgfHwgIWVuZ2luZV9j
b25mLT5jb2RlX2J1Zikgewo+ICAJCXJldCA9IC1FTk9NRU07Cj4gIAkJZ290byBmcmVlX2J1ZnM7
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
