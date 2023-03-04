Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8637DC64EC4
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Mar 2023 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tXyd5Bs4RbUjI+RGNqI6e1rxA2YwxU/0gUSdQoUTtro=; b=n3fSMp6V0t8gEmqziwS5oZ/Yrh
	Zs7NdbStpNeM+r0qgiOXufVqWl3nxYa6Y43CcJzJtq1CakkqWSVm6HSVO9pUW4SyEXXpqx2fytPeK
	4CjSJVwN+IwZklg4jLSyWd9qCy34gRIZvMVxtzaLGRffVOHYQQU9Bjy+lZBxPBXiiz1YgiQdHWUGz
	n1Cfn+7KqNhr08heMQPtX/7/7JJJtzGSDfNeCj+tYAJsOyjLDYhD+50x//g/MN/c31B/TA01qtzeR
	VH5TM2BtXePzp0aPP8N4OoAizYrj4yQ7wL939ern+2iuSW7j516/P2GGDWdPU1fCqAmtzKj5/rfA/
	4O90PthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVPg-009JaD-DA; Sat, 04 Mar 2023 17:11:16 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYVPe-009JZW-2W
	for linux-mtd@lists.infradead.org; Sat, 04 Mar 2023 17:11:15 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA78C6382F12;
	Sat,  4 Mar 2023 18:11:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id tujOCQGJaEPJ; Sat,  4 Mar 2023 18:11:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4FC5C608110B;
	Sat,  4 Mar 2023 18:11:11 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id srbd_RK3TTEX; Sat,  4 Mar 2023 18:11:11 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2F24F6382F12;
	Sat,  4 Mar 2023 18:11:11 +0100 (CET)
Date: Sat, 4 Mar 2023 18:11:10 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	George Kennedy <george.kennedy@oracle.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <272361861.203885.1677949870976.JavaMail.zimbra@nod.at>
In-Reply-To: <20230304074243.1348767-1-chengzhihao1@huawei.com>
References: <20230304074243.1348767-1-chengzhihao1@huawei.com>
Subject: Re: [PATCH v2] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix failure attaching when vid_hdr offset equals to (sub)page size
Thread-Index: JFEAvkKUA6ZhyQ6KCrIkdwi5G/GiZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_091114_288802_E4A7AC20 
X-CRM114-Status: UNSURE (   3.96  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+ICsJLyoKPiArCSAqIE1lbW9yeSBhbGxvY2F0aW9uIGZv
ciBWSUQgaGVhZGVyIGlzIHViaS0+dmlkX2hkcl9hbHNpemUKPiArCSAqIHdoaWNoIGlzIGRlc2Ny
aWJlZCBpbiBjb21tZW50cyBpbiBpby5jLgo+ICsJICogTWFrZSBzdXJlIFZJRCBoZWFkZXIgc2hp
ZnQgKyBVQklfVklEX0hEUl9TSVpFIG5vdCBleGNlZWRzCj4gKwkgKiB1YmktPnZpZF9oZHJfYWxz
aXplLCBzbyB0aGF0IGFsbCB2aWQgaGVhZGVyIG9wZXJhdGlvbnMKPiArCSAqIHdvbid0IGFjY2Vz
cyBtZW1vcnkgb3V0IG9mIGJvdW5kcy4KPiArCSAqLwo+ICsJaWYgKCh1YmktPnZpZF9oZHJfc2hp
ZnQgKyBVQklfVklEX0hEUl9TSVpFKSA+IHViaS0+dmlkX2hkcl9hbHNpemUpIHsKPiArCQl1Ymlf
ZXJyKHViaSwgIkludmFsaWQgVklEIGhlYWRlciBvZmZzZXQgJWQsIFZJRCBoZWFkZXIgc2hpZnQo
JWQpIgo+ICsJCQkiICsgVklEIGhlYWRlciBzaXplKCVkKSA+IFZJRCBoZWFkZXIgYWxpZ25lZCBz
aXplKCVkKS4iLAo+ICsJCQl1YmktPnZpZF9oZHJfb2Zmc2V0LCB1YmktPnZpZF9oZHJfc2hpZnQs
Cj4gKwkJCShpbnQpVUJJX1ZJRF9IRFJfU0laRSwgdWJpLT52aWRfaGRyX2Fsc2l6ZSk7CgpIbW0s
IHdoeSBhcmUgeW91IGNhc3RpbmcgdG8gaW50IGluc3RlYWQgb2YgdXNpbmcgJXp1IGFzIGZvcm1h
dCBzdHJpbmc/CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
