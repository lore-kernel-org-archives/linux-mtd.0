Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF55C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Dec 2021 21:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kU/xmW0gTTq18KOClBQ8PuEI0hpPKRE734ex6OapaGw=; b=cL1+BeYpqaruGFyIZU3lxb/rLu
	Uqwry2vdIPguPzXsRbRK5fqO0LszgFW85al8eY9HBCtxogl/nAywQomIxUqXFLQESSFFpq/lkF2bU
	kwXHQE0PLgKKscbK9u2FxrdjejQLcPAz2NaTiB3Hee5bC1qaSmgd7011hF1tWyq39dhXL/kKtPe9s
	M/ZAM3+atnsgerKzTXUs6bi5Gm7uuCmFO9WxCuQsJzyzYIBhJpgC1Ry3m++P8BsVteVV1DyywWU3G
	i4+cAj13gFL8VXu9JmlgP5v6QnGHoDgtLUEOQ9nv8cvw4QHcOz1+O5p6BGcfqiRcuV5b7NW1W1v7k
	WEf5rYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n332S-005GbC-IY; Thu, 30 Dec 2021 21:32:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n332Q-005GaZ-0k
 for linux-mtd@lists.infradead.org; Thu, 30 Dec 2021 21:32:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0C10E62DA600;
 Thu, 30 Dec 2021 22:32:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CDWpsNvsvLyP; Thu, 30 Dec 2021 22:32:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 15CA662DA5EE;
 Thu, 30 Dec 2021 22:32:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7LKtuEGIan3H; Thu, 30 Dec 2021 22:32:27 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D76E760CEF32;
 Thu, 30 Dec 2021 22:32:27 +0100 (CET)
Date: Thu, 30 Dec 2021 22:32:27 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: libaokun <libaokun1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 yukuai3 <yukuai3@huawei.com>, Hulk Robot <hulkci@huawei.com>
Message-ID: <1652249414.215435.1640899947744.JavaMail.zimbra@nod.at>
In-Reply-To: <b8f6bbf3-cca4-9bfa-f70a-393f04edd21f@huawei.com>
References: <20211105093022.1360601-1-libaokun1@huawei.com>
 <7e00eda5-3b35-6d3c-29fb-664b12cca6dd@huawei.com>
 <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
 <b8f6bbf3-cca4-9bfa-f70a-393f04edd21f@huawei.com>
Subject: Re: [PATCH -next V3] ubi: fix race condition between
 ctrl_cdev_ioctl and ubi_cdev_ioctl
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
Thread-Index: En5gbrYa7pIAKtQJ78T6QAbo6TQZYg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_133242_250460_ACDC8B00 
X-CRM114-Status: UNSURE (   3.03  )
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
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IGtlcm5mc19kcmFpbigpIHdpbGwgd2FpdCAncm9vdC0+
ZGVhY3RpdmF0ZV93YWl0cScgaWYKPiBhdG9taWNfcmVhZCgma24tPmFjdGl2ZSkgbm90IGVxdWFs
cyB0byBLTl9ERUFDVElWQVRFRF9CSUFTLgo+IAo+IFRoZSBVQkkgc2VxX3Nob3cgY2FsbGJhY2sg
aXMgaW52b2tlZCB3aXRoIGF2dGl2ZSBjbnQgdGFrZW46Cj4gdmZzX3JlYWQKPiAgIGtlcm5mc19m
b3BfcmVhZF9pdGVyCj4gICAgIHNlcV9yZWFkX2l0ZXIKPiAgICAgICBtLT5vcC0+c3RhcnQgKGtl
cm5mc19zZXFfc3RhcnQpICAgLy8ga2VybmZzX2dldF9hY3RpdmUob2YtPmtuKQo+ICAgICAgIGtl
cm5mc19zZXFfc2hvdwo+ICAgICAgICAgZGV2X2F0dHJpYnV0ZV9zaG93IFt1YmldCj4gICAgICAg
bS0+b3AtPnN0b3AgKGtlcm5mc19zZXFfc3RvcCkgICAgIC8vIGtlcm5mc19wdXRfYWN0aXZlKG9m
LT5rbikKPiAKPiBUaGUga2VybmZzX2RyYWluKCkgaXMgc3R1Y2sgYXQgd2FpdF9ldmVudCgpIHVu
dGlsIHN5c2ZzIHJlYWRpbmcKPiBmaW5pc2hlZCwgaW4gbXkgbG9jYWwgdGVzdC4KCllvdSBhcmUg
cmlnaHQuIFRoaXMgbWVhbnMgVUJJIGRvZXMgdGhpcyBleHRyYSBjaGVjayBpbiB2YWluLgpNYXli
ZSBldmVuIHNpbmNlIGV2ZXIuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
