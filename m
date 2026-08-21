Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AEAC5DF88
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2026 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6Yx5K+TsZQohtQ10bo/Myrq1Ea6jKASeIPPFyR/kSn0=; b=QBnWkqk25xlAumERbCiS70jwDt
	FmLvYJEEgIG4pB2iD96MhzEktLHyK+vXCnEhWoHa2KFMBA7xwv7TY/oBUwVTDn11CarBNYZ2igQvV
	5DMef0jPlBtUp1QTB4Ltjfqd8xJMunFatuelb6UVrzdmqQEvgfpzZ5xhkwYbxlZ1OX9x3hGQUCu8j
	H3nrdYEmXIlWMzlC2SV9omQzZoa/IqpHZEWUbpNPcCMzpm/mlhvJL3HJAHV2iRCtSMLpn/QvxOLvS
	Ucn9P+Dbux81L0+E0YBQOUapDSd+4cBGY6zlMN9ubPdM+dTL1FTMn7FOV/FeDNQxtHRvtpc5RDcIp
	NVBsI3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxImw-0000000CcZI-0fpT;
	Fri, 21 Aug 2026 06:31:38 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxImt-0000000CcYY-1diK
	for linux-mtd@lists.infradead.org;
	Fri, 21 Aug 2026 06:31:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BEB402698F4;
	Fri, 21 Aug 2026 08:31:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 36vrECOgASb6; Fri, 21 Aug 2026 08:31:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4D0982698F0;
	Fri, 21 Aug 2026 08:31:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jFQln7SZk_V7; Fri, 21 Aug 2026 08:31:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2F3D2317B49;
	Fri, 21 Aug 2026 08:31:31 +0200 (CEST)
Date: Fri, 21 Aug 2026 08:31:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: zhouminqiang <zhouminqiang2@huawei.com>
Cc: David Woodhouse <dwmw2@infradead.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <1421509427.8290.1787293890858.JavaMail.zimbra@nod.at>
In-Reply-To: <2ca192b7-f903-41ba-8ffe-e8bfe9f79125@huawei.com>
References: <20260820105003.2525647-1-zhouminqiang2@huawei.com> <852434244.6574.1787252301788.JavaMail.zimbra@nod.at> <2ca192b7-f903-41ba-8ffe-e8bfe9f79125@huawei.com>
Subject: Re: [PATCH 0/6] jffs2: extend write verification to all write paths
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF153 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: extend write verification to all write paths
Thread-Index: OKixXLUauFClroTi+LLJhjc4DHpniw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_233135_607100_C01C4D27 
X-CRM114-Status: GOOD (  14.09  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogInpob3VtaW5xaWFuZyIgPHpo
b3VtaW5xaWFuZzJAaHVhd2VpLmNvbT4KPiBUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCBm
ZWVkYmFjay4KPiAKPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbiBjYXVzZWQgYnkgbXkgY292ZXIg
bGV0dGVyLiBXZSBhcmUgbm90IHVzaW5nCj4gSkZGUzIgb24gTkFORCBmbGFzaCBkZXZpY2VzLiBP
dXIgcHJpbWFyeSBnb2FsIGlzIHRvIGV4dGVuZCB3cml0ZQo+IHZlcmlmaWNhdGlvbiB0byB0aGUg
Tk9SIGZsYXNoIHBhdGggYmVjYXVzZSB3ZSBoYXZlIGVuY291bnRlcmVkIGRhdGEKPiBjb3JydXB0
aW9uIGluY2lkZW50cyBpbiBwcm9kdWN0aW9uIGVudmlyb25tZW50IGFuZCBjdXJyZW50bHkgbGFj
ayBhCj4gcXVpY2sgZGlhZ25vc3RpYyB0b29sIHRvIGlzb2xhdGUgdGhlIGNhdXNlLiBXaGlsZSBy
ZXZpZXdpbmcgdGhlCj4gY29kZSBmbG93LCB3ZSBub3RpY2VkIHRoYXQgdGhlIE5BTkQgYnVmZmVy
ZWQgd3JpdGUgcGF0aCBhbHNvIGxhY2tlZAo+IHZlcmlmaWNhdGlvbiwgc28gd2UgdG9vayB0aGUg
b3Bwb3J0dW5pdHkgdG8gZXh0ZW5kIGl0IGFzIHdlbGwuCj4gCj4gQWx0aG91Z2ggSkZGUzIgaXMg
aW4gIk9kZCBmaXhlcyIgbWFpbnRlbmFuY2UgbW9kZSwgdGhlcmUgYXJlIHN0aWxsCj4gYSBzaWdu
aWZpY2FudCBudW1iZXIgb2YgZGV2aWNlcyBpbiBwcm9kdWN0aW9uIHRoYXQgcmVseSBvbiBKRkZT
MiwKCk9rYXksIHRoaXMgbWFrZXMgbW9yZSBzZW5zZS4KCj4gYW5kIHdlIGFyZSBlbmNvdW50ZXJp
bmcgZGF0YSBjb3JydXB0aW9uIGlzc3VlcyBvbiBsaXZlIG5vZGVzLgo+IEV4dGVuZGluZyB3cml0
ZSB2ZXJpZmljYXRpb24gdG8gdGhlIE5PUiBmbGFzaCBwYXRoIHdvdWxkIHByb3ZpZGUgYQo+IGRp
YWdub3N0aWMgdG9vbCBmb3IgZmF1bHQgaXNvbGF0aW9uLiBXZSBub3RpY2UgdGhhdCBXQlVGX1ZF
UklGWSBoYXMKPiBleGlzdGVkIHNpbmNlIDIwMDcgKGE2YmM0MzJlMjk2ZCksIHNvIHdlIHdhbnQg
dG8gZXh0ZW5kIHRoZSBzYW1lCj4gZGlhZ25vc3RpYyBmYWNpbGl0eSB0byBjb3ZlciB0aGUgd3Jp
dGUgcGF0aHMgaXQgbWlzc2VkLCBzbyB0aGF0IGl0Cj4gY2FuIHNlcnZlIG9uZ29pbmcgcHJvZHVj
dCBpc3N1ZSBkaWFnbm9zaXMuIElNSE8sIHRoaXMgaXMgYQo+IGRlYnVnZ2luZy9tYWludGVuYW5j
ZSBmZWF0dXJlLCBub3QgaW50cm9kdWNpbmcgbmV3IGZ1bmN0aW9uYWxpdHkuCj4gCj4gV2UgcmVz
cGVjdCB5b3VyIGp1ZGdtZW50IGFuZCB3aWxsIGxlYXZlIHRoZSBmaW5hbCBkZWNpc2lvbiB0byB5
b3UuCgpUaGVzZSBkYXlzIG1hbnkgcGF0Y2hlcyBhcmUgY3JlYXRlZCBieSBhbiBMTE0gd2hlcmUg
cGVvcGxlIGNoYW5nZSBzb2Z0d2FyZQpmb3IgdGhlIHNha2Ugb2YgY2hhbmdpbmcuCkJ1dCBpZiBp
dCBzb2x2ZXMgYSByZWFsIHByb2JsZW0geW91J3JlIGZhY2luZyBpbiBwcm9kdWN0aW9uIHRoaW5n
cyBhcmUgZGlmZmVyZW50LApvZiBjb3Vyc2UuCgpQbGVhc2UgaGF2ZSBhIGxvb2sgYXQgU2FzaGlr
byByZXZpZXcsIG1heWJlIGl0J3MgdXNlZnVsIChtYXliZSBub3QuLi4pCmFuZCByZXNlbmQgd2l0
aCBhbiB1cGRhdGVkIGNvdmVyIGxldHRlci4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
