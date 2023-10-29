Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B3DC4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Oct 2023 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=G81biUqzgqIJWvgrXEGp86WN2wWbSfSYqa+r0jxVYyg=; b=XgxK5fhmabwVyKXgpwzxC8GNyW
	KMRyHSJsM48jLRw0jyJXlc/kLSCpllRfFeUR9Z8LE2KJhJ+GeRY8/Vlk09wVovRl0o9Lf4x0vaxI8
	3icNEiavgKIoR1NzfQXgb3nyzyvPh8dj0qu/BqGce+NkoOIxRVi1rAEmscVoq9ypujx3VCzbjIwNt
	SiJBFnftEle5ncfH7E7XkRidUHDvZpvOTudrUXQsSvCx/SDS00ZkEql+uTwduxU7iRswblU17cXfI
	vfcl0Wi/bhbQZSYQYAdm4p9HjSt/1JytE9mDEMBFQcspk3j/jO10LXbAc2Sb5q7I21Cj3IVSqU6BH
	DGo/q9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx7tH-001rvm-0E;
	Sun, 29 Oct 2023 15:39:51 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx7tC-001rv2-1H
	for linux-mtd@lists.infradead.org;
	Sun, 29 Oct 2023 15:39:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BC2B7622F591;
	Sun, 29 Oct 2023 16:39:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id NFBs-rp-B3AA; Sun, 29 Oct 2023 16:39:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5158B623488E;
	Sun, 29 Oct 2023 16:39:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zabHgERD03US; Sun, 29 Oct 2023 16:39:34 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 28FAE622F591;
	Sun, 29 Oct 2023 16:39:34 +0100 (CET)
Date: Sun, 29 Oct 2023 16:39:33 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <142222867.20038.1698593973984.JavaMail.zimbra@nod.at>
In-Reply-To: <20231029145033.0ad2682a@xps-13>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com> <20231027194026.1bc32dfe@xps-13> <174426702.13324.1698438610904.JavaMail.zimbra@nod.at> <20231029145033.0ad2682a@xps-13>
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix gluebi NULL pointer dereference caused by ftl notifier
Thread-Index: fvJCmV8fRlPNgwN6SsR/AdyXQB8pjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_083946_614690_FA5AAA35 
X-CRM114-Status: UNSURE (   2.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IEFjay4gSSdsbCBxdWV1ZSB0aGlzIG9uY2UgdGhl
IGxvZyBmaXhlZCBhbmQgeW91ciBvZmZpY2lhbCBBY2stYnkKPiByZWNlaXZlZCBmb3IgbXRkL25l
eHQgYWZ0ZXIgLXJjMSBpcyBvdXQuCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
