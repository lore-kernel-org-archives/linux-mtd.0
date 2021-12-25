Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A8DC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=INMUdFn5sCo44uCyzGr/N2QXRkoLEJeTNMroSPc5yR4=; b=cUUs1fOGvfYVhfJf6D4J8KPESu
	sD1CWwG1rT0oxdLXy4aR3pEZzzC5c4qT/kQiDaxqgjdX5tQBT1PIEhM99CLKox6IHs78dGTK20m64
	unaqLruyUyj7KfkZyWwkxenlroORW5ieASgJ2bgAmJz7pBCzr8LTPfqBxsUT0e+Bw6Yd1BcNOaWmL
	xAiDnHjZIMJv+hjA+xukkT7+ACs5aZJ4KrI6HWTqB5/o2zhHJPV+eJmYnH78ApNVytReh9UresHiZ
	I51QLFCSnx776q/1wLk78stLEFCcEBhHqejYQ07a5H7jNZltw+VGcmT0bckzI+mspv0tG75byN0nr
	gswFvSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1EQ1-00F828-1P; Sat, 25 Dec 2021 21:17:33 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1EPy-00F81d-Qa
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 21:17:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4490962DA5F2;
 Sat, 25 Dec 2021 22:17:29 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ER1zF47diept; Sat, 25 Dec 2021 22:17:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B70D962DA600;
 Sat, 25 Dec 2021 22:17:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id KSE9GrPRarJd; Sat, 25 Dec 2021 22:17:28 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8D66062DA5F2;
 Sat, 25 Dec 2021 22:17:28 +0100 (CET)
Date: Sat, 25 Dec 2021 22:17:28 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: s921975628@gmail.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <812386103.202031.1640467048454.JavaMail.zimbra@nod.at>
In-Reply-To: <20211225100713.119089-1-s921975628@gmail.com>
References: <20211225100713.119089-1-s921975628@gmail.com>
Subject: Re: [PATCH 3/3] mtd: rawnand: nandsim: Add NS_PAGE_BYTE_SHIFT macro
 to replace the repeat pattern
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF95 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: nandsim: Add NS_PAGE_BYTE_SHIFT macro to replace the
 repeat pattern
Thread-Index: 61fjJvrGx171vI1AaR1kcOjcbGH3ZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_131731_037951_B7F169E8 
X-CRM114-Status: UNSURE (   7.37  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogczkyMTk3NTYyOEBnbWFpbC5j
b20KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJh
IiA8dmlnbmVzaHJAdGkuY29tPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+
LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJSaW5IaXph
a3VyYSIKPiA8czkyMTk3NTYyOEBnbWFpbC5jb20+Cj4gR2VzZW5kZXQ6IFNhbXN0YWcsIDI1LiBE
ZXplbWJlciAyMDIxIDExOjA3OjEzCj4gQmV0cmVmZjogW1BBVENIIDMvM10gbXRkOiByYXduYW5k
OiBuYW5kc2ltOiBBZGQgTlNfUEFHRV9CWVRFX1NISUZUIG1hY3JvIHRvIHJlcGxhY2UgdGhlIHJl
cGVhdCBwYXR0ZXJuCgo+IEZyb206IFJpbkhpemFrdXJhIDxzOTIxOTc1NjI4QGdtYWlsLmNvbT4K
PiAKPiBUaGUgKG5zLT5yZWdzLmNvbHVtbiArIG5zLT5yZWdzLm9mZikgcGF0dGVybiByZXBlYXRz
IGEgbG90IHdoaWNoCj4gcmVwcmVzZW50cyB0aGUgYnl0ZSBzaGlmdCBpbiBuZXh0IHBhZ2UgdG8g
YWNjZXNzLiBXZSBjYW4gcmVwbGFjZSBpdAo+IHdpdGggYSBtYWNybyB0byBpbXByb3ZlIHRoZSBy
ZWFkYWJpbGl0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSaW5IaXpha3VyYSA8czkyMTk3NTYyOEBn
bWFpbC5jb20+Cj4gLS0tCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jIHwgMTkgKysr
KysrKysrKystLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2Qu
YXQ+CgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
