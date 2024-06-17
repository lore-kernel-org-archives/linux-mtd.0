Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DA8C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CHqVtmimHdCsf5CJO52UpRf3W7w7E4c6saYFcmMYTP4=; b=WlX2WvxAL+KXuZNQm1AGz0zxvt
	Marvrp4jtCgU9taE6Nszle2wgW78S2mAmLqTs+rMTXttLIeCvicqaP8pB2wZpq2o6fb8h197f7d4m
	djr+g7ym3ZZUm+Kd1tqlcoPxOJDtVJ+V7sLCFjJn2FLJv8UtbT/22ixFDd6iBvOEcb/NNPQADl6yb
	fOefuRu2irK/Aw6hdDhnW+c38uLiQKUL0V3D0CvUdwYSvS5APd5BvmFsOJEgWT3SGpJr5wjAMNTP7
	FiLSqc1VMM2gS1kmbrjMP23RQocuJiQRw1/OvOJtVGdxEWVyVUdlph3Ii76E8Kee2hUsrhbZa7n2k
	1gLRpEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFb6-0000000Bpqm-1SMt;
	Mon, 17 Jun 2024 16:52:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFb2-0000000BpoX-1GbF
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 16:52:46 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 619E26195FC1;
	Mon, 17 Jun 2024 18:52:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rVZusyb9lOqr; Mon, 17 Jun 2024 18:52:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0EE376195FC6;
	Mon, 17 Jun 2024 18:52:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Srg5VmlXEUGF; Mon, 17 Jun 2024 18:52:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DF1846195FC1;
	Mon, 17 Jun 2024 18:52:40 +0200 (CEST)
Date: Mon, 17 Jun 2024 18:52:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <1802911356.251780.1718643160760.JavaMail.zimbra@nod.at>
In-Reply-To: <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com> <561660214.251562.1718638970757.JavaMail.zimbra@nod.at> <14779870-BA54-4ABF-8ABF-FF1D23D172A7@mac.com> <1641029267.251608.1718640023954.JavaMail.zimbra@nod.at> <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: CeaQ9NY8GO3IkkuxNvz0If8vASUkgg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_095244_544464_C7BFFB10 
X-CRM114-Status: UNSURE (   7.19  )
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
bHlAbWFjLmNvbT4KPiBpIGRvbuKAmXQgdGhpbmsgbXkgYXJ0aWN1bGF0aW9uIGlzIGNvcnJlY3Qg
aWYgeW91IGludGVycHJldGVkIGl0IGFzIHRoYXQuCj4gCj4gYXMgaSB1bmRlcnN0YW5kIGl0LCBn
bHVlYmkgc2ltcGx5IG1ha2VzIGl0IGhhbmR5IHdoZW4geW91IGhhdmUgYSBmaWxlc3lzdGVtCj4g
cGFja2VkIHdpdGhpbiBhIHViaSBmaWxlLCBhbmQgaXQgd2lsbCB0YWtlIHRoYXQgZmlsZSBhbmQg
bW91bnQgaXRhcyBhIGJsb2NrCj4gZGV2aWNlLgoKVGhlcmUgaXMgbm8gc3VjaCB0aGluZyBhcyBh
biBVQkkgZmlsZS4gVUJJIGhvc3RzIHZvbHVtZXMuCllvdSBjYW4gaW5zdGFsbCBpbnRvIHRoZXNl
IHZvbHVtZXMgd2hhdGV2ZXIgeW91IHdhbnQuCkFsc28gYSBmaWxlIHN5c3RlbSBzdWNoIGFzIFVC
SUZTLCBidXQgdGhpcyBzZWVtcyBub3QgdG8gYmUgdGhlIGNhc2UgaGVyZS4KCj4gc28gaSB3b3Vs
ZCBzYXkgaXTigJlzIG5vdCBNVEQtPlVCSS0+R0xVRUJJLT5NVEQtPk1UREJMT0NLCj4gCj4gaXTi
gJlkIHNheSBpdOKAmXMgbW9yZSBNVEQtPkdMVUVCSS0+TVREQkxPQ0sKCk5vLiBHTFVCSSBlbXVs
YXRlcyBhIE1URCBvbiB0b3Agb2YgYW4gVUJJIHZvbHVtZS4KU28gZXZlcnkgcmVhZC93cml0ZSBv
cGVyYXRpb24gb2YgdGhlIGZpbGVzeXN0ZW0gd2lsbCBmaXJzdCB0byB0aHJvdWdoOgoKMS4gYmxv
Y2sgbGF5ZXIKMi4gTVREQkxPQ0sgKGFuZCBtdGQpCjMuIEdMVUJJCjQuIFVCSQo1LiBNVEQgKHRo
aXMgdGltZSB0aGUgcmVhbCBvbmUpCgpJcyB0aGlzIHJlYWxseSBhIHNldHVwIE9wZW5XUlQgaXMg
dXNpbmc/CkknbSBub3Qgc2F5aW5nIGl0J3MgaW1wb3NzaWJsZSwgYnV0IGZhciBmcm9tIGlkZWFs
LgpXZSBoYXZlIFVCSUJsb2NrIGZvciByZWFzb25zLgoKQW55d2F5LCBzaW5jZSB0aGUga2VybmVs
IGhhcyB0byBiZSB1c2VyIHNwYWNlIGZyaWVuZGx5IGFuZAp1c2VycyBzZWVtcyB0byB1c2Ugc3Vj
aCAib2RkIiBzdGFja2luZ3MgSSBjb25zaWRlciByZXZlcnRpbmcgdGhpcyBwYXRjaC4KWmhhb0xv
bmcgV2FuZywgd2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
