Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C24C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Aokdq4+2/u4pNP/sUWZk7Vlso3MGIjsOu9EJ5C/+lE=; b=zf09BiEN6o1Pxv
	5+G2sJ2SzFpMHtEHBKXUE1chn9ngoMGcMB4HNvxfMBKbpGUj4GSBGPgNgXG3VQp63HeylMaLW+mYi
	vwXFeN1ojgZl0HcHQPRhOdclK9EHpxJbceJCHfg3MM5shLQd7ukNQMg8PO6yruDpl6CSZUYiTcunm
	gVKK5PcJmO09pnx4M5nKvoP1z/CfmbEl1sdCLDSXwXV/8ZYx4oWltpr8T4V8Zlv5LZz/+RPA9ez3y
	rS3GHhoGmny4UVbd52F5thhq0dqOzxkFvN9FQJsGAN1a/EXZkZcls6VwwOKoDUIrTcVHA39LWxlsx
	t2mtHFdnYOwIDhPG/1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHyU-0022od-Jy; Thu, 09 Jun 2022 13:13:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHv1-0020Zc-4X
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 18EF220007;
	Thu,  9 Jun 2022 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtAyRDhTJgIhkrG262A5fXKtaaa+yjh5oWKebesVuHk=;
	b=EhkCQLk/w0mXNAe5q93tqnQ+7Ka0f5emQd8x+2LepgDyCIT8IJ2opapTsC4S5CL1Hxou6m
	kRvpN8+6T8weZUqsNH2Z5rcDZePTO8s8/oi1UiGc+VP/yOxOeBh2uSSG7TADizVvQxdmHD
	s4ROJoEYZxiPtP0MEq+QS/xm9+16Yl2cT9tHdsQu1rQzSKVnNSFtO0PqZI/uMCw7BmIcgB
	Iilq7UXpmKLOV3t/6WZt6oJGIWFGAHc3Z4JNkoV55wZRa1V+WQKy6cXn/1iERFt1kMlgxa
	pf0Q61NIfryXB1rZJTL71XzsJ4ak7LtCGTY8O2ujYsUg8QBtHEAxh3TvkNbZkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: kernel@pengutronix.de,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 07/14] mtd: spear_smi: Drop if with an always false condition
Date: Thu,  9 Jun 2022 15:09:44 +0200
Message-Id: <20220609130944.293310-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220603210758.148493-8-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'279d719be39d8edb37c9178c15e167a94c7bc0a0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060947_341709_9DE69A09 
X-CRM114-Status: UNSURE (   7.94  )
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

T24gRnJpLCAyMDIyLTA2LTAzIGF0IDIxOjA3OjUxIFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IFRoZSByZW1vdmUgY2FsbGJhY2sgaXMgb25seSBjYWxsZWQg
YWZ0ZXIgcHJvYmUgY29tcGxldGVkIHN1Y2Nlc3NmdWxseS4KPiBJbiB0aGlzIGNhc2UgcGxhdGZv
cm1fc2V0X2RydmRhdGEoKSB3YXMgY2FsbGVkIHdpdGggYSBub24tTlVMTCBhcmd1bWVudAo+IGFu
ZCBzbyBkZXYgaXMgbmV2ZXIgTlVMTC4KPiAKPiBUaGlzIGlzIGEgcHJlcGFyYXRpb24gZm9yIG1h
a2luZyBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2tzIHJldHVybiB2b2lkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
