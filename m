Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A16C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+25hGxNVajLqAZCPB291l5Uj2r/z17QLd2ebhl6oGo8=; b=agr814qfwI24VS48z8ZiVIeSSQ
	QykaIG0aWGJ5kMWKlOq3TTELlnAx9Kt+4KwFDbthCpwmt0wEfgtQl4RRc9Avo09dpN+kMndCVvyDC
	L4e7QRE3dT2w9kmOPzqGQ669z3YwIznM0pZr5C7/ODyedSMMKqHPVKBsg3FF8pYTEg8o7VsDDMQLu
	N0q+teiarldDpaQxQjeym6LP9slrIBi0BtvUiWYgPduK01eXPXV3mAYbUWYOWH8gCl6JLigRbVft7
	rZMDxA6Rq7YhlWMWpt6b4eiPP8hnuvIP9nLiWH/ODVL7AJYnU29P2ETK3pUdLeQHJIZRuls22wI3T
	GJslStXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrue-000nOm-Ay; Tue, 14 Feb 2023 09:47:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrub-000nMm-B6
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 09:47:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 23131642ECB2;
	Tue, 14 Feb 2023 10:47:42 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id swn-jqLBS7hb; Tue, 14 Feb 2023 10:47:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C36D6642ECCC;
	Tue, 14 Feb 2023 10:47:41 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uXkoR1TOLuRd; Tue, 14 Feb 2023 10:47:41 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9F80B642ECB2;
	Tue, 14 Feb 2023 10:47:41 +0100 (CET)
Date: Tue, 14 Feb 2023 10:47:41 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: harshit m mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: harshit m mogalapalli <harshit.m.mogalapalli@gmail.com>, error27@gmail.com, 
	hch <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <2138680093.127537.1676368061456.JavaMail.zimbra@nod.at>
In-Reply-To: <20230214093801.1267044-1-harshit.m.mogalapalli@oracle.com>
References: <20230214093801.1267044-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH linux-next] ubi: block: Fix a possible use-after-free
 bug in ubiblock_create()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: Fix a possible use-after-free bug in ubiblock_create()
Thread-Index: iOg5GBWw/6+vOMMkTA/Bpi1ap7bSZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_014745_552761_130FC18C 
X-CRM114-Status: UNSURE (   9.37  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImhhcnNoaXQgbSBtb2dhbGFw
YWxsaSIgPGhhcnNoaXQubS5tb2dhbGFwYWxsaUBvcmFjbGUuY29tPgo+IFNtYXRjaCB3YXJuczoK
Pglkcml2ZXJzL210ZC91YmkvYmxvY2suYzo0MzggdWJpYmxvY2tfY3JlYXRlKCkKPgl3YXJuOiAn
JmRldi0+bGlzdCcgbm90IHJlbW92ZWQgZnJvbSBsaXN0Cj4gCj4gJ2RldicgaXMgZnJlZWQgaW4g
J291dF9mcmVlX2RldjosIGJ1dCBpdCBpcyBzdGlsbCBvbiB0aGUgbGlzdC4KPiAKPiBUbyBmaXgg
dGhpcywgZGVsZXRlIHRoZSBsaXN0IGl0ZW0gYmVmb3JlIGZyZWVpbmcuCj4gCj4gRml4ZXM6IDkx
Y2M4ZmJjYzhjNyAoInViaTogYmxvY2s6IHNldCBCTEtfTVFfRl9CTE9DS0lORyIpCj4gU2lnbmVk
LW9mZi1ieTogSGFyc2hpdCBNb2dhbGFwYWxsaSA8aGFyc2hpdC5tLm1vZ2FsYXBhbGxpQG9yYWNs
ZS5jb20+Cj4gLS0tCj4gRm91bmQgYnkgc3RhdGljIGFuYWx5c2lzKHNtYXRjaCkuIE9ubHkgQ29t
cGlsZSB0ZXN0ZWQuCj4gLS0tCj4gZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgfCAxICsKPiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
dWJpL2Jsb2NrLmMgYi9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+IGluZGV4IGY1ZDAzNjIwM2Zl
Ny4uNzYzNzA0YzhkMDVjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4g
KysrIGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBAQCAtNDI5LDYgKzQyOSw3IEBAIGludCB1
YmlibG9ja19jcmVhdGUoc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gCXJldHVybiAwOwo+
IAo+IG91dF9yZW1vdmVfbWlub3I6Cj4gKwlsaXN0X2RlbCgmZGV2LT5saXN0KTsKPiAJaWRyX3Jl
bW92ZSgmdWJpYmxvY2tfbWlub3JfaWRyLCBnZC0+Zmlyc3RfbWlub3IpOwo+IG91dF9jbGVhbnVw
X2Rpc2s6Cj4gCXB1dF9kaXNrKGRldi0+Z2QpOwoKR29vZCBjYXRjaCEKClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
