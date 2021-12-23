Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48631C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 21:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yy75XZbQBvqy4+2MK1pM9FMkrKVpvX6KsLy77tzPagg=; b=YPxkmQwIJZEEFQSvQ4gqUg6HgK
	xD2gEcYIRdxtbO/Pho4l8OUJnqFmhtT4KgwXnAX+6ROlyaZpp2dsLvtO/ZilGdNDHxvTAby2RN5ml
	bwtgPkCIRaHJGvfho/G+/DnPPkjHf61tYCuRmKdVhMSVLE0IM2l8wa8cHMECUv/AE1TGBZ0WQ0MjP
	EhWYjKVZPLHVYoqOIpAv0nfOU5TMbmiFYXzS7CNfwVWviKaegCl+j9OzaR/AKtuNDjDpu+k3xiuPy
	Dxu/jz0UU3Zctu7F6kZrQwPrRiP6L1AijR0oZt52NTIb9k9zvs4Xwd7pwKsSV68Gp8Q8nUPFuX7uM
	bF/hlmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0VI7-00DRe7-2E; Thu, 23 Dec 2021 21:06:23 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0VI3-00DRdG-Og
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 21:06:21 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1E40F62DA5F6;
 Thu, 23 Dec 2021 22:06:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id HYtd7jlW3cum; Thu, 23 Dec 2021 22:06:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CDAF962DA606;
 Thu, 23 Dec 2021 22:06:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id m-sTyrv93os1; Thu, 23 Dec 2021 22:06:08 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id A94BD62DA5F6;
 Thu, 23 Dec 2021 22:06:08 +0100 (CET)
Date: Thu, 23 Dec 2021 22:06:08 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: "libaokun (A)" <libaokun1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, yukuai3@huawei.com, 
 Hulk Robot <hulkci@huawei.com>
Message-ID: <509065063.197038.1640293568550.JavaMail.zimbra@nod.at>
In-Reply-To: <7e00eda5-3b35-6d3c-29fb-664b12cca6dd@huawei.com>
References: <20211105093022.1360601-1-libaokun1@huawei.com>
 <7e00eda5-3b35-6d3c-29fb-664b12cca6dd@huawei.com>
Subject: Re: [PATCH -next V3] ubi: fix race condition between
 ctrl_cdev_ioctl and ubi_cdev_ioctl
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
Thread-Index: slnxfsVHQxu1KgdXyEQFACaCLfZ3WA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_130619_996776_EEA58787 
X-CRM114-Status: UNSURE (   6.26  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImxpYmFva3VuIChBKSIgPGxp
YmFva3VuMUBodWF3ZWkuY29tPgo+IOWcqCAyMDIxLzExLzUgMTc6MzAsIEJhb2t1biBMaSDlhpnp
gZM6Cj4gCj4gcGluZwoKVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlLgogCj4+IEh1bGsgUm9ib3Qg
cmVwb3J0ZWQgYSBLQVNBTiByZXBvcnQgYWJvdXQgdXNlLWFmdGVyLWZyZWU6CgpbLi4uXQoKPj4g
VGhlIGNhdXNlIG9mIHRoaXMgcHJvYmxlbSBpcyB0aGF0IGNvbW1pdCA3MTRmYjg3ZThiYzAgbWFr
ZSBkZXZpY2UKPj4gImF2YWlsYWJsZSIgYmVmb3JlIGl0IGJlY29tZXMgYWNjZXNzaWJsZSB2aWEg
c3lzZnMuIFRoZXJlZm9yZSwgd2UKPj4gcm9sbCBiYWNrIHRoZSBtb2RpZmljYXRpb24uIFdlIHdp
bGwgZml4IHRoZSByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuCj4+IHViaSBkZXZpY2UgY3JlYXRpb24g
YW5kIHVkZXYgYnkgcmVtb3ZpbmcgdWJpX2dldF9kZXZpY2UgaW4KPj4gdm9sX2F0dHJpYnV0ZV9z
aG93IGFuZCBkZXZfYXR0cmlidXRlX3Nob3cuVGhpcyBhdm9pZHMgYWNjZXNzaW5nCj4+IHVuaW5p
dGlhbGl6ZWQgdWJpX2RldmljZXNbdWJpX251bV0uCj4+Cj4+IHViaV9nZXRfZGV2aWNlIGlzIHVz
ZWQgdG8gcHJldmVudCBkZXZpY2VzIGZyb20gYmVpbmcgZGVsZXRlZCBkdXJpbmcKPj4gc3lzZnMg
ZXhlY3V0aW9uLiBIb3dldmVyLCBub3cga2VybmZzIGVuc3VyZXMgdGhhdCBkZXZpY2VzIHdpbGwg
bm90Cj4+IGJlIGRlbGV0ZWQgYmVmb3JlIGFsbCByZWZlcmVuY2UgY291bnRpbmcgYXJlIHJlbGVh
c2VkLgo+PiBUaGUga2V5IHByb2Nlc3MgaXMgc2hvd24gaW4gdGhlIGZvbGxvd2luZyBzdGFjay4K
CnViaV9nZXRfZGV2aWNlKCkgaW4gZGV2X2F0dHJpYnV0ZV9zaG93KCkgaXMgdXNlZCB0byBkZXRl
Y3Qgd2hldGhlcgp0aGUgdWJpIGRldmljZSBnb3QgZGV0YWNoZWQgd2hpbGUgdGhlIHN5c2ZzIGZp
bGUgaXMgb3Blbi4KCkhtbS4gSSB0aG91Z2h0IGZvciBzeXNmcyB0aGlzIGlzIG5vdCB0aGUgY2Fz
ZSBzaW5jZSBzeXNmcyBkb2VzIG5vdCBpbXBsZW1lbnQKYSByZWxlYXNlKCkgbWV0aG9kLiBTbyBr
ZXJuZnNfZHJhaW5fb3Blbl9maWxlcygpIHdpbGwgcmV0dXJuIGVhcmx5LgpCdXQgdGhlcmUgaXMg
YSBnb29kIGNoYW5jZSB0aGF0IEkgZG9uJ3QgZ290IGFsbCBrZXJuZnMvc3lzZnMgZGV0YWlscy4K
ClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
