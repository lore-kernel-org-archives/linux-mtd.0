Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08433C001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pdGAs2T34bUUNY6o310jaXuGzm67IlRInE8KEubbdCE=; b=YXyCwwxxjLdwKG3i/7cD/X1YBC
	3StRQtufgSxYDlatB8m8GjTz+8sUMnQB1if7jvZ6akvyDQZkQUnBzsuzrrpJwtZhbkeXgBO1txbRO
	PfCM8XRG2uDxdWy5361EZqDB72HE7952oQAaHsmURIRwyPMSECy9HggJvKz7MZlJGqlc2O87Cfa9o
	0w4biBoW/hodOzTPnsLhQwm9ZY4o70IhWsHP2dv0zaPJCB/rdyJ2fUE7g2Kp3rpeJExRHNTG6I1W/
	lM7qiyQl8cTIJAdCHCilz5rzDp4dXI3k7BbahiBNFVrzbI9ghV9tARap6IcLNoHUJAHdP9TbSHAUX
	D5hYhRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qupB0-006clO-2k;
	Mon, 23 Oct 2023 07:16:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qupAy-006ckr-1a
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:16:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3C89263DCAB7;
	Mon, 23 Oct 2023 09:16:35 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GhSGQ0lnLFwA; Mon, 23 Oct 2023 09:16:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id F04A663DCAB6;
	Mon, 23 Oct 2023 09:16:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ANGj1riZCLj9; Mon, 23 Oct 2023 09:16:34 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D5D4F6343CC3;
	Mon, 23 Oct 2023 09:16:34 +0200 (CEST)
Date: Mon, 23 Oct 2023 09:16:34 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <666729575.29280.1698045394797.JavaMail.zimbra@nod.at>
In-Reply-To: <739480f1-4899-6da7-c9ac-9d4fd26c2474@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com> <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at> <891e554b-c133-6378-3a65-836fc9147e54@huawei.com> <441107100.23734.1697904580252.JavaMail.zimbra@nod.at> <9b543be7-a858-c982-3fcf-408701ae4ac9@huawei.com> <1141312317.29142.1698043564332.JavaMail.zimbra@nod.at> <739480f1-4899-6da7-c9ac-9d4fd26c2474@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: spZ1ewmsFOBUVtjgTNaJFxPPvB9MNg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_001636_679839_F60D972B 
X-CRM114-Status: UNSURE (   3.30  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlpoYW9Mb25nIFdhbmciIDx3
YW5nemhhb2xvbmcxQGh1YXdlaS5jb20+Cj4gQnV0IHRoaXMgbW9kaWZpY2F0aW9uIHJlamVjdHMg
dGhpcyB1c2FnZS4gYW5kIHJlamVjdHMgb3RoZXIgYmxvY2sgZGV2aWNlCj4gZmlsZSBzeXN0ZW1z
IChzdWNoIGFzIGV4dDQpIGZyb20gd29ya2luZyBvbiBnbHVlYmkuCgpBcmUgeW91IHVzaW5nIGV4
dDQgb24gdG9wIG9mIGdsdWViaT8KUGxlYXNlIGV4cGxhaW4gaW4gZGV0YWlsIHdoeS4KClRoYW5r
cywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
