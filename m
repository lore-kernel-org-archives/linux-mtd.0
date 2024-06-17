Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB0DC27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hLxXfsrQHuAf9xOGz1SQjVCHuK05q12OZUJoxiR/a4c=; b=cH2l0BK+3kOYzYhx9nUNxp1lmd
	rDK3P6fErV1Gps/LPV9rzUQEQ7J89RdpMzgOMhrwVTlt+FIZubI9eWjo6K63GzSfFvRs4g0tdSao8
	EsHbjvs9gEogCXREkworxa/1GVf7iCreibAvgl/7gQQKICziMetphyupKLgDZSzsZl/qtOUy7bzVy
	QJ/Gi8je+c/XcVo4d2pjLLvpvVKTN24+VMyLsqUJ80Y/QoqhfimYXLvlH0HsQF5VgmmyNYv1SKB1b
	MGo1KIMYNGGtVaF2rIsaVqSUnfjhoNqxUm99N6XJ4T63HjqOP+sdVI1xoF0iu5M5rh5Wr1bwTmysO
	Y0aJnuKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEVU-0000000BXPK-2x7s;
	Mon, 17 Jun 2024 15:42:56 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEVR-0000000BXOD-30cf
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 15:42:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6ED3A61966A6;
	Mon, 17 Jun 2024 17:42:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id CTtxrfEOwEul; Mon, 17 Jun 2024 17:42:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 16FC461966CF;
	Mon, 17 Jun 2024 17:42:51 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qKE-5wzepDVX; Mon, 17 Jun 2024 17:42:51 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E9C1561966A6;
	Mon, 17 Jun 2024 17:42:50 +0200 (CEST)
Date: Mon, 17 Jun 2024 17:42:50 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <561660214.251562.1718638970757.JavaMail.zimbra@nod.at>
In-Reply-To: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: 4cwvQidh1qjlS/CdlD07cpKCQzRcAw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_084253_925507_04A15787 
X-CRM114-Status: UNSURE (   7.24  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdhZ2FuIFNpZGh1IiA8YnJv
bHlAbWFjLmNvbT4KPiB0eXBpY2FsbHkgd2hhdCBoYXBwZW5zIGlzIHdlIHdpbGwgd3JhcCBhIHNx
dWFzaGZzIGZpbGVzeXN0ZW0gaW5zaWRlIGEgVUJJIGxheWVyLgo+IG9wZW53cnQgcGVvcGxlIGNh
bGwgdGhpcyDigJx1YmluaXNpbmfigJ0gdGhlIHJvb3QgZmlsZXN5c3RlbS4KPiAKPiB0aGVuLCBh
ZnRlciB3ZSBsYWJlbCB0aGUgYXBwcm9wcmlhdGUgbmFuZCBwYXJ0aXRpb25zIGFzIOKAmHVpbWFn
ZSxmd+KAmSB0byBjYWxsIHRoZQo+IHJpZ2h0IG10ZHNwbGl0LCB0aGUgbXRkX3ViaSBzdWJzeXN0
ZW0gd29ya3MgaXRzIG1hZ2ljIGF1dG9tYXRpY2FsbHksIGFzIGxvbmcgYXMKPiB0aGUgcm9vdCBw
YXJ0aXRpb24gaXMgbmFtZWQg4oCccm9vdGZz4oCdLgo+IAo+IGF0IHRoYXQgcG9pbnQsIHRoZSBy
b290ZnMgd2lsbCBiZSAqQVVUT01BVElDQUxMWSogbW91bnRlZCBBTkQgYm9vdGVkIGZyb20gQlkg
VEhFCj4gS0VSTkVMLiB0aGF0IGlzLCBubyBjbWRsaW5lIGhhY2tzIGFyZSByZXF1aXJlZC4KPiAK
PiB0aGlzIHBhdGNoIGJyZWFrcyB0aGF0IGJlaGF2aW91ciBzaW5jZSBtciB3YW5n4oCZcyBhZGRp
dGlvbmFsIGNvbmRpdGlvbnMgcmVzdWx0IGluCj4gdGhlIGZhaWx1cmUgb2YgdGhlIHBhcnRpdGlv
biB0byBnZXQgYWRkZWQgdG8gdGhlIG10ZCBsaXN0LCBhbmQgdGh1cyBmYWlscwo+IG1vdW50Lgo+
IAoKUGxlYXNlIGhlbHAgbWUgdW5kZXJzdGFuZGluZyB0aGUgbGF5ZXJpbmcuClNvLCB5b3UgaGF2
ZSBzcWF1c2hmcyBpbnNpZGUgYW4gVUJJIHZvbHVtZSBhbmQgY3JlYXRlIGEgVUJJIGJsb2NrIGRl
dmljZSBmcm9tIHRoYXQ/CkFuZCB5b3UgaGF2ZSBlbmFibGVkIGdsdWViaSB0byBoYXZlIHRoZSBz
YWlkIFVCSSB2b2x1bWUgYXMgTVREIChhbmQgdGh1cyBhcyBtdGRibG9jayB0b28pPwoKVGhhbmtz
LAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
