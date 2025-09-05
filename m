Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27160CA0FED
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1AtZMP/69eTELTo1yWSC9gbXky17K5m8kBVuH/3bAU=; b=kwhhr5PDH+6cF7
	h4G4tuY4X+HgAX38RgsIkqELBqs5Bt9/fXbsOTu8pI42QxFkCaEbOjC41woCOGnnK3tCTAzgk7R3p
	enXjuOTbILmNGOsP6MVIiE0473flfKVcrTP1JjZ1O6uUw3rnwdi2Z3c3I5LD1AFrQRwFyqKo0q8Fx
	nRxgZnSo0bn+CgV/foleDqlQySNmjGv3/bHscaMcSxLPm5O4yd0M2xLh92JiZ59bhkDC53myiJR1a
	uMG9nD+53KZRa81EInmhdCMyQfniMqOp+raANgl3ILeeEukRFii82V1fMSjO7NXiqTtpc4iKQ+yBZ
	SsSpwzvlEs5UCCLOeHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc55-000000046vj-1log;
	Fri, 05 Sep 2025 19:26:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXrI-00000002XMT-0Mjj
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 14:56:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD8F14E40BD9;
	Fri,  5 Sep 2025 14:56:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6FBB6060B;
	Fri,  5 Sep 2025 14:56:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 191B6102F28D6;
	Fri,  5 Sep 2025 16:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757084170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1jcGlcOV37H7WUoFdZdwjtSdPqibMZqqIq92pDZU1HM=;
	b=PRl0gyvYEeox1nfHU+C5KY3I3MLYo4v5cltyfjofp4ijrZJfuIFWSrbK4ikaKcfxPhst9K
	HJzYMyg6pj1PDPrFgvHsm5NOwO3O5xm3hVaG1gmorCN73D9HQY9vdVB07LqgpoqqLY6XBg
	Ioo9P9AMhWxkI6qKHRFp9n9XmtOX2mxH5CZHDHbeKQP/tbOuEtDuPZAyi4KsleG0gYJXzw
	P+hcRPXaoWCEp0L76zIVqJoz8Me0P2o5XlEwkozqDOvitatv0RQx80P1ZSQqAPMSNzi2Wq
	H3+zn/SQoFdK6jBDiAVQWAhwJ166/eEYho3/LwFB5mWu4Wak43zTVa781ZonBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chengzhihao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
In-Reply-To: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
References: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
Subject: Re: [PATCH V2] mtd: core: skip badblocks increment for blocks
 already known bad
Message-Id: <175708416143.334139.12983911214656984817.b4-ty@bootlin.com>
Date: Fri, 05 Sep 2025 16:56:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_075612_260103_6E4F2E2D 
X-CRM114-Status: UNSURE (   7.39  )
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

T24gVHVlLCAwMiBTZXAgMjAyNSAxNzoyNzozMiArMDgwMCwgV2FuZyBaaGFvbG9uZyB3cm90ZToK
PiBSZXBlYXRlZGx5IG1hcmtpbmcgdGhlIHNhbWUgZXJhc2VibG9jayBiYWQgaW5mbGF0ZXMKPiBt
dGQtPmVjY19zdGF0cy5iYWRibG9ja3MgYmVjYXVzZSBtdGRfYmxvY2tfbWFya2JhZCgpIHVuY29u
ZGl0aW9uYWxseQo+IGluY3JlbWVudHMgdGhlIGNvdW50ZXIgb24gc3VjY2Vzcywgd2hpbGUgc29t
ZSBpbXBsZW1lbnRhdGlvbnMgKGUuZy4KPiBOQU5EKSByZXR1cm4gMCBib3RoIHdoZW4gdGhlIGJs
b2NrIHdhcyBhbHJlYWR5IGJhZCBhbmQgd2hlbiBpdCBoYXMganVzdAo+IGJlZW4gbWFya2VkWzFd
Lgo+IAo+IEZpeCBieSBjaGVja2luZyBpZiB0aGUgYmxvY2sgaXMgYWxyZWFkeSBiYWQgYmVmb3Jl
IGNhbGxpbmcKPiAtPl9ibG9ja19tYXJrYmFkKCkgd2hlbiBfYmxvY2tfaXNiYWQgaXMgYXZhaWxh
YmxlLiBPbmx5IHNraXAgdGhlIGNvdW50ZXIKPiBpbmNyZW1lbnQgd2hlbiB3ZSBjYW4gY29uZmly
bSB0aGUgYmxvY2sgd2FzIGFscmVhZHkgYmFkLiBJbiBhbGwgb3RoZXIKPiBjYXNlcyBjb250aW51
ZSBpbmNyZW1lbnRpbmcgdGhlIGNvdW50ZXIuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25l
eHQsIHRoYW5rcyEKClsxLzFdIG10ZDogY29yZTogc2tpcCBiYWRibG9ja3MgaW5jcmVtZW50IGZv
ciBibG9ja3MgYWxyZWFkeSBrbm93biBiYWQKICAgICAgY29tbWl0OiAxYjJkZDE3ZGQ1MTRiNjk5
ODE4YWZlYWMxYjUxMzY1MWIwMDNlYzEwCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBv
biBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVk
IHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
