Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44249E784AF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rSLtyhRWVgvEe1NUDXBQbbn/AP+W6edgT85Q5DAeJaE=; b=mhLafxSQR2ximkMxVOGM176QEI
	RFn7+YmtXxSHSJvpi4kIbDth/2WZ89ztLKvqSNZrTjnbw/b88OCYriNFIAFzW79QYmo+K8A+z5bwu
	z55xQAgoZipnnOId/p55YH3erb31XWO8yTlrgpGC24cCnpbsEY/2ALr9Vm9C88kivVYeD6VRKQzuo
	wTz7MoMMG0HgHDp65JBmMCpaDKfHtvbteniERHu6ddZe7vzjbauCZSOITU94ruQRD+uIl1NSJ8Ga8
	COHuwhtkjn4ldZwuu8qFyGt91yD5WQYyi+JjGzlAcWXt7DZdCmv75aq39NR2MSOWmoQGKxKGbvXxU
	2Qt1YQmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGA1-00CNXW-2B;
	Mon, 02 Oct 2023 10:28:21 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnG9z-00CNOE-0J
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 10:28:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6F5C76340E0F;
	Mon,  2 Oct 2023 12:28:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id R2MlX5OlKfnr; Mon,  2 Oct 2023 12:28:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E90E96340E0E;
	Mon,  2 Oct 2023 12:28:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BZ6x9ZbAQMuH; Mon,  2 Oct 2023 12:28:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8A0F56340DEB;
	Mon,  2 Oct 2023 12:28:06 +0200 (CEST)
Date: Mon, 2 Oct 2023 12:28:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Lee Jones <lee@kernel.org>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <43988304.25483.1696242486225.JavaMail.zimbra@nod.at>
In-Reply-To: <20231002101117.GA175828@google.com>
References: <CA+UBctD_w=75wChmePZHp7KsBSNPWYGDBtzHPRPPtaFoqhGvXA@mail.gmail.com> <977347543.226888.1682011999468.JavaMail.zimbra@nod.at> <CA+UBctA4fSbSdooQ9q9fwNuaHb_PnkfFuqJ7Q5vii-3-uCiUjw@mail.gmail.com> <412779912.228444.1682023015809.JavaMail.zimbra@nod.at> <ed510d18-47f1-7f46-03dd-84e043cab6d9@huawei.com> <1366603418.245114.1682236940160.JavaMail.zimbra@nod.at> <951e4cf7-a0ea-b3ec-931d-e6a394ddc2ab@huawei.com> <20231002101117.GA175828@google.com>
Subject: Re: BUG: divide error in ubi_attach_mtd_dev
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: divide error in ubi_attach_mtd_dev
Thread-Index: 62MkiFBp2u/sxgS3IlsUUBHcP38Ojw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_032819_308091_6EE73097 
X-CRM114-Status: UNSURE (   9.35  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkxlZSBKb25lcyIgPGxlZUBr
ZXJuZWwub3JnPgo+IEZvciBiZXR0ZXIgb3Igd29yc2UsIHNvbWVvbmUgaGFzIGFwcGxpZWQgdG8g
aGF2ZSB0aGlzIHJlcG9ydCBhc3NvY2lhdGVkCj4gd2l0aCBhIENWRSB3aGljaCBtZWFucyBhIGJ1
bmNoIG9mIGNvbXBhbmllcyBhbmQgaW5kaXZpZHVhbHMgYXJlIGdvaW5nIHRvCj4gYmUgdHJhY2tp
bmcgaXQuCj4gCj4gV2hhdCBpcyB0aGUgY3VycmVudCBzdGF0dXMgcGxlYXNlPwoKSSB3YXMgYWJv
dXQgdG8gYW5zd2VyIHRoYXQgdGhlIHBhdGNoIGlzIHVwc3RyZWFtLCBidXQgaXQncyBvbmx5IGlu
IGxpbnV4LW5leHQuIDotUwpBZnRlciBsdW5jaCBJJ2xsIGltbWVkaWF0ZWx5IHNlbmQgYSBQUi4g
SSBtZXNzZWQgdXAgZHVlIHRvIHRvbyBtdWNoIHRyYXZlbGluZwp0aGUgbGFzdCBtb250aHMuCiAK
PiBJcyB0aGlzIGRlZW1lZCB0byBiZSBhIHJlYWwgaXNzdWU/CgpJIGRvbid0IHRoaW5rIHNvLiBP
bmx5IHRoZSByZWFsIHJvb3QgY2FuIGluc3RhbGwgbmV3IE1URCBkZXZpY2VzIGFuZCBydW4gVUJJ
IGF0dGFjaC4KCj4gRGlkIHRoZSByZXBvcnQgY3VsbWluYXRlIGluIGEgcG9zdGVkIHBhdGNoPwoK
WWVzLiBBcyBJIHNhaWQgYSBwYXRjaCBpcyBpbiBuZXh0LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
