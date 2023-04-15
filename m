Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE06C77B73
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Apr 2023 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k13vmowBuF5T3Zag4qbJ9108cwBoT+ZknjaszDEDcjU=; b=z+LCDkPQPgA5zxcs+GlS8H9Mhu
	ffTpD7c+jTomOB8zPEQhQAmIeSLY5XI22iYN4Sh0wkoEsxU1DVcefxvjPgk77YT/BQ7o4bmVUcZ5c
	Pn0kPQmJfkfEBeyTJkibxe6KrdkcpdxtjwiyaFkQt1kQ26fCM4jt8fb0PcaSvZHN/hgpZU8D7iO8o
	6/7dbAmhbyokg0X5dczbI2A5e3Uv5pU0uObxp7LWnPe5VJB2hsCkLuC8VwhBVZ48aRZSyNFEvHFkr
	0xp18h00Q5x7gljUzWTXu955KLIedzDNMro8c1U8mx7ArOx7DSBJfSWFgIYS22zxvsWpl0U/IFzwa
	VYBe83wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkaO-00Cb0x-1Q;
	Sat, 15 Apr 2023 18:25:20 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnkaL-00Cb0W-32
	for linux-mtd@lists.infradead.org;
	Sat, 15 Apr 2023 18:25:19 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A872F61989EA;
	Sat, 15 Apr 2023 20:25:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HXrk2pd79Qkr; Sat, 15 Apr 2023 20:25:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2977B622623A;
	Sat, 15 Apr 2023 20:25:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eyX8kgN0v4NL; Sat, 15 Apr 2023 20:25:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0433D61989EA;
	Sat, 15 Apr 2023 20:25:16 +0200 (CEST)
Date: Sat, 15 Apr 2023 20:25:15 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Nicolas Schichan <nschichan@freebox.fr>, 
	George Kennedy <george.kennedy@oracle.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	yi zhang <yi.zhang@huawei.com>
Message-ID: <779964919.69416.1681583115948.JavaMail.zimbra@nod.at>
In-Reply-To: <ZDnd7KmiRDhFuhhF@makrotopia.org>
References: <20230306013308.3884777-1-chengzhihao1@huawei.com> <20230324161923.1456371-1-nschichan@freebox.fr> <2c2c2ce9-795b-4f76-cde9-db4a4066dcc1@huawei.com> <20230329175421.3bd4906e@xps-13> <53992166.434647.1680125620704.JavaMail.zimbra@nod.at> <ZDnd7KmiRDhFuhhF@makrotopia.org>
Subject: Re: [PATCH -next v3] ubi: Fix failure attaching when vid_hdr offset
 equals to (sub)page size
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix failure attaching when vid_hdr offset equals to (sub)page size
Thread-Index: rtoansel+CM2fzJM4ah0aJIUiE8Hxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_112518_131185_B08BCAE8 
X-CRM114-Status: UNSURE (   3.19  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBcyBzdGFibGUgbGludXggdHJlZXMgYXJlIGFmZmVjdGVk
IEkgd29uZGVyIHdoZW4gdGhpcyB3aWxsIGhpdAo+IGxpbnV4LXN0YWJsZSwgaWUuIHdpbGwgaXQg
YmUgcGFydCBvZiA1LjE1LjEwOCwgZm9yIGV4YW1wbGU/CgpKdXN0IHNlbnQgb3V0IHRoZSBQUiB0
byBMaW51cy4KQXMgc29vbiBpdCBpcyBwYXJ0IG9mIHRoZSBuZXh0IC1yYywgc3RhYmxlIG1haW50
YWlucyBjYW4gcGljayB1cCB0aGUgZml4LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
