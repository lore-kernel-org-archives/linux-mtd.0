Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58293CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tD5Ck9ThLrnqb0NDYppILcVj5IuluqW5Ygd4ppU6crU=; b=STsA8oe1ijZGlRP2omwIIqd1Ul
	pZ88Ovjb0smFQ+uGoCsKmkNgFmYBD+hWBBxF3rFR/uJAjaxTZ0DNiGhMI/sHzVYqxn/2IP+SYEmVG
	m5ZMH/74/+KEsFycbVlp/6afaHc5Bvq/LclMPNQfKqyEtkseZHfubPUe9h2LKWz6w6HrE+iw9epbr
	/kbgG+tz3PG+bUkmOu10AFVEJm/FDzdzOEDUc+L0VpkRbbjjXXED5L7xACVtO9hVKJHuB1vYNhXtI
	1raGD32+aV5MGDymku0xTFIomCht9R6pn10FJLi/f1qN5Mxa8sUgluWWp0tDEPOSpW6kDCgFETe/5
	hhzKUD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qupAA-006cgP-30;
	Mon, 23 Oct 2023 07:15:46 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qupA8-006cfL-0t
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 07:15:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 86C496343CC3;
	Mon, 23 Oct 2023 09:15:42 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id jzIxp6FNQNy6; Mon, 23 Oct 2023 09:15:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EA21263DCAB6;
	Mon, 23 Oct 2023 09:15:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6rUs1NLI9QuN; Mon, 23 Oct 2023 09:15:41 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C413C6343CC3;
	Mon, 23 Oct 2023 09:15:41 +0200 (CEST)
Date: Mon, 23 Oct 2023 09:15:41 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Message-ID: <879960555.29268.1698045341596.JavaMail.zimbra@nod.at>
In-Reply-To: <93b2d5ab-e36c-be08-7343-ef4ca16f991d@huawei.com>
References: <20231018121618.778385-1-wangzhaolong1@huawei.com> <1381458025.20897.1697747248632.JavaMail.zimbra@nod.at> <891e554b-c133-6378-3a65-836fc9147e54@huawei.com> <441107100.23734.1697904580252.JavaMail.zimbra@nod.at> <93b2d5ab-e36c-be08-7343-ef4ca16f991d@huawei.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: w2v3m0BEzKt4F2H6jp2F1AuzbEeVBQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_001544_493216_1146BD2C 
X-CRM114-Status: UNSURE (   6.88  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+Pj4gSWYgd2UgYWRkIG5ldyBpb2N0bHMgdG8gY29udHJv
bCBjcmVhdGlvbi9kZXN0cm95aW5nIG9mIGdsdWViaSwgdGhlbgo+Pj4gZ2x1ZWJpIG10ZCB3b24n
dCBiZSBhdXRvbWF0aWNhbGx5IGNyZWF0ZWQgd2hlbiBVQkkgdm9sdW1lIGlzIGFkZGVkLiBJJ20K
Pj4+IG5vdCBjZXJ0YWluIHdoZXRoZXIgdGhpcyBjaGFuZ2Ugd2lsbCBlZmZlY3QgZXhpc3Rpbmcg
c3RhcnR1cCBwcm9jZXNzCj4+PiB0aGF0IGRlcGVuZHMgb24gZ2x1ZWJpLgo+PiAKPj4gTGV0J3Mg
dGFrZSBhIHN0YWNrIGJhY2suIFRoZSBzb2xlIHB1cnBvc2Ugb2YgZ2x1ZWJpIGlzIHByb3ZpZGlu
Zwo+PiBhIHdheSB0byBydW4gSkZGUzIgb24gdG9wIG9mIFVCSS4KPiAKPiBJcyBpdCBwb3NzaWJs
ZSB0aGF0IHNvbWVvbmUgcnVucyBleHQ0IG9uIG10ZGJsb2NrIGJhc2VkIG9uIGdsdWViaSwgZm9y
Cj4gdGhlIGFkdmFudGFnZSBvZiB3ZWFyLWxldmVsaW5nPwoKVW5sZXNzIHRoZXkgd2FudCB0byBr
aWxsIHRoZWlyIE5BTkQgaW1tZWRpYXRlbHksIG5vLgpVQklibG9jayBoYXQgaW5pdGlhbGx5IGFu
IFJXLU1vZGUgYnV0IGl0IHdhcyByZWplY3RlZCBiZWNhdXNlClVCSSBpcyBub3QgYW4gRlRMIGFu
ZCB3aWxsIGFsbCBkYW5nZXJvdXMgc2V0dXBzLgoKV2hhdCBJJ20gdHJ5aW5nIHRvIHNheSBpcywg
SSdkIGxpa2UgdG8gYXZvaWQgYWRkaW5nIGNvbXBsaWNhdGVkIHNvbHV0aW9ucwpvciB3b3JrYXJv
dW5kcyBqdXN0IHRvIG1ha2UgYXJ0aWZpY2lhbCBzdGFja2luZyBvZiBvdXRkYXRlZCBNVEQgY29t
cG9uZW50cwpwb3NzaWJsZS4KTGV0J3Mga2VlcCB0aGUgYmlnIHBpY3R1cmUgaW4gbWluZC4KClRo
YW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
