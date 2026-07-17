Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B13C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsbBClJIlj3rZNWmjXq+hlxsQBDQ1oII770yeLcnVSY=; b=BttO7ZySfVF/b0
	PCS7AN56izUAGWzo0a5Z7M8Bfa2XM6SBUxVyor5Z1d+/Iz7df+JZ3GVse5XHFciwpEayEm2h7+rO7
	Qp0kyl8vkcci3Jc3PNQV7YpuicYzCfuY8w5COV/Zx0TUwWk9AU/D858/V1JqjDVZX8qnJxj96ikLI
	4Dsp48cTvRSVmsAThVTMOe0vEHRQN0T6B7ZHeFcmpIFTGVE+Uxk15k1+cpcC51Uni03sU7Q3XWtBI
	MQTF9afH+WL+1FNynAbBZT/u6C7qSm9jeSqXKr5SDKyGi5I8RPQO0WlQhEaeznrREG9w0xd1azrY7
	YXjUtZQELbG/kMAqTAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkoC-00000002el8-0YXS;
	Fri, 17 Jul 2026 15:49:04 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkko7-00000002ei3-3sME
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:49:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7044F4E40E1D;
	Fri, 17 Jul 2026 15:48:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E08F60361;
	Fri, 17 Jul 2026 15:48:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46FB011BD091E;
	Fri, 17 Jul 2026 17:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rXUKGd0CefBHlNa26GYz+8HIcjphc3fFTrkk3krfy4Q=;
	b=uBBp258N1dS462nx7T93EuWV2F4RKXV+Aj0MRduK2/LROsK3K5f9/Pt2Mn67CRpHzUVeiH
	OlrwNd1uEArMokBzl2fDj//9cUUiAhz1M8Nz/K7IpyhAGqY6FgWvIQ8Y5+ue0H6EIwFzOX
	LxvYL9emY5usSXxc8RD3OMQyUZaR1C7OtkwYGX/afa3I4vBSpoZmq2Hqyy9Qf3HizIi3nh
	K8p5OeBwlVJC4oqtm0fd8EwjIjRlCDkK4wcQkDe+qYQbZjhm7A/7/hOvK2I3rnmOjH60jc
	sx9am7QzRer6Obh0efruenVCh3bFxy7buq89tNenZ4iuzZ5Q2pr/euB/cfI4Tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260715011808.633587-1-james.hilliard1@gmail.com>
References: <20260715011808.633587-1-james.hilliard1@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: add Toshiba TC58NVG1S3H
Message-Id: <178430333683.4128272.2650038035417038318.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:48:56 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084900_101199_52A3A423 
X-CRM114-Status: UNSURE (   6.85  )
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

T24gVHVlLCAxNCBKdWwgMjAyNiAxOToxODowMCAtMDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gV2l0aG91dCBhIGZ1bGwtSUQgZW50cnksIHRoZSBub24tT05GSSBUQzU4TlZHMVMzSCBmYWxs
cyBiYWNrIHRvIHRoZQo+IGdlbmVyaWMgMHhkYSBleHRlbmRlZC1JRCBkZWNvZGluZy4gSXQgaXMg
dGhlcmVmb3JlIGlkZW50aWZpZWQgb25seSBhcyBhCj4gZ2VuZXJpYyAyNTYgTWlCIFRvc2hpYmEg
TkFORC4gV2l0aG91dCBhIG1vZGVsLXNwZWNpZmljIGludGVyZmFjZQo+IGNvbmZpZ3VyYXRpb24s
IHRoZSBjb3JlIGxlYXZlcyBpdCBpbiB0aGUgY29uc2VydmF0aXZlIHJlc2V0IHRpbWluZyBtb2Rl
Lgo+IAo+IEFkZCBpdHMgZnVsbCBmaXZlLWJ5dGUgSUQgd2l0aCB0aGUgZGF0YXNoZWV0IGdlb21l
dHJ5LCBPT0Igc2l6ZSBhbmQgRUNDCj4gcmVxdWlyZW1lbnRzLiBJdHMgaW50ZXJmYWNlIHRpbWlu
Z3MgbWF0Y2ggdGhlIG1vZGUtNC1kZXJpdmVkIHByb2ZpbGUKPiBhbHJlYWR5IHVzZWQgYnkgdGhl
IHJlbGF0ZWQgVEg1OE5WRzJTM0hCQUk0IGFuZCBUSDU4TlZHM1MwSEJBSTQsIHNvCj4gc2hhcmUg
dGhhdCBwcm9maWxlIGFuZCBzZWxlY3QgaXQgZm9yIHRoZSBuZXcgbW9kZWwuCj4gCj4gWy4uLl0K
CkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGFkZCBU
b3NoaWJhIFRDNThOVkcxUzNICiAgICAgIGNvbW1pdDogMGVlMjdkOGU0Yzk5NzY1MjE1ZDkwNmI0
ZWExZmI2YmY3ZTk2NTBkNwoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xp
bnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5v
IHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
