Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DFC27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 18:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vHfBnwRLedosHzxtA6nXnzLUBuTVLvqc8BmaPEglgV4=; b=rRCAjyoOY0Qhg9I2vwu6bj0lUq
	8nG0gh1Q6kGBRVQmgvticyCwJx2S1CZ6UTQuaR0nBpnjxCaTMalruMAjNP0XhZzmrFTvCx4cpWN6x
	VSvSKs2R5tlqcIHvx1em8hmCGJPFwXW+rzw6tLhJXFbnkHbK/Nm0YhG/xtKH/rrojC2v6F9yShty5
	b8MCx8iD8GjajW/FZ42Y/KpZ3ZA9TMzB1LE6UivdupcHb8SS4slOOxpgT04S0zZMGIF5cWWv1naG9
	cEV7bDSPKmMcwe8FrC0CCvnqna+3kr7WmAh/v51rksbRdaAhmQjpq6OMnjlXEZNCBp//nvi/4syTD
	2TCRyZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJH9m-0000000CCiC-1se5;
	Mon, 17 Jun 2024 18:32:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJH9f-0000000CCgK-1RTP
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 18:32:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C21D96195FC1;
	Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id uj6G_8ViNRWY; Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 60BD26195FC9;
	Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ua9djD9Zizs6; Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2ACF76195FC1;
	Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
Date: Mon, 17 Jun 2024 20:32:33 +0200 (CEST)
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
Message-ID: <296007365.252185.1718649153090.JavaMail.zimbra@nod.at>
In-Reply-To: <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com> <65E62DA3-EF16-44BD-8E51-E751BD2C496F@mac.com> <1802911356.251780.1718643160760.JavaMail.zimbra@nod.at> <E3E2C13C-1E52-46F2-BE2D-D2592C3369DB@mac.com> <F2DCFCE7-68FA-4C09-AE5B-09F2233575F1@mac.com> <48D8B89B-0402-4D8B-B045-86104C0C797F@mac.com> <303502000.252057.1718647746641.JavaMail.zimbra@nod.at> <90A90DA4-8B68-432D-9577-0D3635AF84BB@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: HOqizlmOCpgWy2ydOysUW2cuHjp5xg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_113235_558735_1B865039 
X-CRM114-Status: UNSURE (   7.85  )
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
bHlAbWFjLmNvbT4KPj4gQUZBSUNULCB0aGlzIGxvZyBsaW5lIGlzIG5vdCBwYXJ0IG9mIHRoZSBt
YWlubGluZSBrZXJuZWwuCj4gCj4gdGhpcyBpcyBtYWlubGluZS4gaXTigJlzIGp1c3Qgbm90IDYu
eC4gaXTigJlzIDQuMTQuCgpJJ3ZlIGRvdWJsZSBjaGVja2VkIGFuZCBkaXNhZ3JlZS4KVGhpcyBs
aW5lIGNvbWVzIGZyb206Cmh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53cnQvb3Blbndy
dC5naXQ7YT1ibG9iO2Y9dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy00LjE0LzQ4MC1tdGQt
c2V0LXJvb3Rmcy10by1iZS1yb290LWRldi5wYXRjaDtoPTZjZGRhZjAxYjc1Y2I1OGNmYjM3N2Y1
NjhmMmMzNzVhZjg3ZTJmMWI7aGI9YzNiZDEzMjFkZTFlMGQ4MTRmNWNmYzRmNDk0ZjZiMmZiMWY1
MTMzYgoKSW4gcmVjZW50IE9wZW5XUlQga2VybmVscyBJIHNlZToKaHR0cHM6Ly9naXQub3Blbndy
dC5vcmcvP3A9b3BlbndydC9vcGVud3J0LmdpdDthPWJsb2I7Zj10YXJnZXQvbGludXgvZ2VuZXJp
Yy9wZW5kaW5nLTUuMTUvNDkzLXViaS1zZXQtUk9PVF9ERVYtdG8tdWJpYmxvY2stcm9vdGZzLWlm
LXVuc2V0LnBhdGNoO2g9MjY2YTYzMzFjMmFjYzBmN2MxN2Q5YWM3MmY1NDY1OWQzMWI1NjI0OTto
Yj1IRUFECgpMb29rcyBsaWtlIGluIHJlY2VudCB2ZXJzaW9ucyB0aGUgcGF0Y2ggaW4gcXVlc3Rp
b24gZG9lcyAqbm90KiBjYXVzZSBhIHJlZ3Jlc3Npb24uCgo+PiAoMzEsIDEyKSB3b3VsZCBiZSBt
dGRibG9jazEyLgo+PiBIb3cgZG9lcyB5b3VyIGtlcm5lbCBrbm93IHRoYXQgbXRkYmxvY2sxMiBz
aGFsbCBiZSB0aGUgcm9vdGZzPwo+IAo+IHRoaXMgaXMgYW4gb3BlbndydCBhcHByb2FjaDogaHR0
cHM6Ly9vcGVud3J0Lm9yZy9kb2NzL3RlY2hyZWYvZmlsZXN5c3RlbXMgKHVuZGVyCj4g4oCcdGVj
aG5pY2FsIGRldGFpbHPigJ0sIHRoaXJkIHBhcmFncmFwaCkKPiAKPiBlc3NlbnRpYWxseSB0aGVy
ZeKAmXMgYSBmZWF0dXJlIHRoZXkgYWRkIHRvIHRoZSBrZXJuZWwgKHZpYSBwYXRjaCkgd2hlcmUg
eW91IGNhbgo+IGVuYWJsZSBhIGZlYXR1cmUgdGhhdCBzZXRzIHRoZSByb290IGRldmljZSBiYXNl
ZCBvbiB0aGUgbmFtZSBvZiB0aGUgcGFydGl0aW9uLgoKU28sIHRoaXMgaXMgYWxsIG5vdCBtYWlu
bGluZS4gOi0vCiAKPiBpbiB0aGlzIGNhc2UgYXMgbG9uZyBhcyB0aGUgdm9sdW1lIHdpdGhpbiB5
b3VyIHViaSBmaWxlIGNvbnRhaW5zIHRoZSBuYW1lCj4g4oCccm9vdGZz4oCdLCBvcGVud3J0IHdp
bGwgZm9sbG93IGl0IGFzIGl0IGdldHMgdW5wYWNrZWQgYW5kIHNldCB0aGF0IGFzIHRoZQo+IHJv
b3RkZXZpY2UgZm9yIHlvdS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
