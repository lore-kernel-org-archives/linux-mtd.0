Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2058FC433E3
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 08:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF01206C1
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 08:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoFApPfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF01206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OUwIsf9nnggxW9MZB1Cakhdad1tcZ7irbTo7LJRgfXg=; b=FoFApPfbx1zHTY3AEKbsb4fXX
	OLvislOoBspT3JnALN4l6R6E7rbBcT+SQWs47hvtdgSmnG7PAph7MMP5GEhGcEerqvpTVYIjp6gSh
	egUHGJHxl8BM2kDJuch9ENummjlfsUk+lEMGTj2qrLZhvfjeA8lOwJ9wr40jF+GBtzF4qg3zBnW0x
	utaZ/T9HQI0lylDqmeA5ChVldWu4yfBdMoPGsBrgxZbw8FoN1YuxEEUjgz2x7lcsGi9yHRFlYJc91
	A7w9tOO/wSD+oqUnidfkDYUFTY+uFBK/TehgJznQMpWhLDH4hZ8AXX//pvEBlOjtTdyBkztJk7J7y
	5X538kh6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzFJ8-0008Kr-HM; Sat, 25 Jul 2020 08:13:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzFJ6-0008Jp-N2
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 08:13:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F303D6071A74;
 Sat, 25 Jul 2020 10:13:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mmZdptfRQbs3; Sat, 25 Jul 2020 10:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EC4D26071A7C;
 Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7pjzFcqw8NDv; Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id C40136071A74;
 Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
Date: Sat, 25 Jul 2020 10:13:12 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <265316380.171213.1595664792652.JavaMail.zimbra@nod.at>
In-Reply-To: <20200725063701.GA1058480@kroah.com>
References: <20200725063416.172037-1-weiyongjun1@huawei.com>
 <20200725063701.GA1058480@kroah.com>
Subject: Re: [PATCH -next] mtd: fix missing unlock on error in
 mtdchar_compat_ioctl()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: fix missing unlock on error in mtdchar_compat_ioctl()
Thread-Index: unRYG1XOaa/d55A4orlZmW/yp+6gkg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_041324_862858_64474471 
X-CRM114-Status: UNSURE (   4.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdyZWcgS3JvYWgtSGFydG1h
biIgPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFuOiAiV2VpIFlvbmdqdW4iIDx3ZWl5
b25nanVuMUBodWF3ZWkuY29tPgo+IENDOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+LCAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0PiwgIlZpZ25lc2ggUmFnaGF2
ZW5kcmEiIDx2aWduZXNockB0aS5jb20+LAo+ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMu
aW5mcmFkZWFkLm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnPiwgImtlcm5lbC1qYW5pdG9ycyIKPiA8a2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9y
Zz4sICJIdWxrIFJvYm90IiA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gR2VzZW5kZXQ6IFNhbXN0YWcs
IDI1LiBKdWxpIDIwMjAgMDg6Mzc6MDEKPiBCZXRyZWZmOiBSZTogW1BBVENIIC1uZXh0XSBtdGQ6
IGZpeCBtaXNzaW5nIHVubG9jayBvbiBlcnJvciBpbiBtdGRjaGFyX2NvbXBhdF9pb2N0bCgpCj4g
SSB0aGluayBSaWNoYXJkIGFscmVhZHkgcmVzb2x2ZWQgdGhpcyBpbiBoaXMgdHJlZSwgYnV0IEkg
Y291bGQgYmUgd3JvbmcuCgpZZXMsIGZpeGVkIGluIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9maXhlcwphbmQgc2hvdWxkIGJl
IHZpc2libGUgaW4gbGludXgtbmV4dCB2ZXJ5IHNvb24uCiAKPiBBbmQgbmljZSBkZXRlY3Rpb24g
YnkgeW91ciBib3QsIHRoYXQncyBnb29kIHRvIHNlZS4KClllYWgsIGdvb2QgdG8gc2VlIHRoYXQg
c3VjaCBpc3N1ZXMgYXJlIGJlaW5nIGRldGVjdGVkIGF1dG9tYXRpY2FsbHkuCgpUaGFua3MsCi8v
cmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
