Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470A5E77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sK9z3Gr5aBKaMQWSDMJADCirCBU2Z3Xu+e7wtVVEGoY=; b=XGLBf7PMIzQC1q46ejEF13jwb+
	F8imJWEV61CIht9Vb+9oGSA5h0QHB04ApQY0gTTz9o499c5BUD6Hjuy6kKqGB1BVMYiW/CW0eDryy
	6f0R6L/dmwaIo1C+cow2690pEriRadl0mHaPH3Ju5cLt1eFGgLMHpwp0mg0jUdtAI0wgOg8G1GCOg
	Z03Os7gzlO4iITSNsSNjKvGzWJVibcCgyJDOFF8f32q0JpRTa1HaN2rwnIvW5lKMZS9XhMjvp1Y2/
	hgw3N6KwTB8dWnXnbbSpWuKf2l7x/CjpHcsNWxMw8P6hK4FUhn5I9KsUl+N3PgSoRZjqOg6TvBcmz
	pD24XHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaLE-0000000784p-3hGz;
	Mon, 09 Dec 2024 09:46:12 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaJs-000000077pn-44X6
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 09:44:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 535552F3327;
	Mon,  9 Dec 2024 10:44:37 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id P7KrILsazXog; Mon,  9 Dec 2024 10:44:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4EA602F3306;
	Mon,  9 Dec 2024 10:44:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zCm92uNp-0qj; Mon,  9 Dec 2024 10:44:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 248B42A3C71;
	Mon,  9 Dec 2024 10:44:36 +0100 (CET)
Date: Mon, 9 Dec 2024 10:44:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard x Andersson <rickaran@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Rickard X Andersson <rickard.andersson@axis.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <396062056.55129624.1733737475747.JavaMail.zimbra@nod.at>
In-Reply-To: <0f58f594-5bc5-bf05-9563-ebf0b9481860@axis.com>
References: <20241206115127.2304701-1-rickard.andersson@axis.com> <20241206115127.2304701-2-rickard.andersson@axis.com> <adeb2ad0-f922-9bb6-db68-deaf7983704b@huawei.com> <745357310.45555475.1733558789826.JavaMail.zimbra@nod.at> <0f58f594-5bc5-bf05-9563-ebf0b9481860@axis.com>
Subject: Re: [PATCH v3 2/2] ubi: Implement ioctl for detailed erase counters
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Topic: Implement ioctl for detailed erase counters
Thread-Index: cWbptK638RKU6K2yBno/y8cLGhEWuQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014449_147272_7523A91C 
X-CRM114-Status: UNSURE (   4.28  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgeCBBbmRlcnNz
b24iIDxyaWNrYXJhbkBheGlzLmNvbT4KPj4gUGxlYXNlIGFsc28gcnVuIGNoZWNrcGF0Y2gucGws
IHRoZXJlIGFyZSBzb21lIGNvZGluZyBzdHlsZSBpc3N1ZXMuCj4+IE92ZXJhbGwgdGhlIGNoYW5n
ZSBsb29rcyBnb29kIHRvIG1lIGFuZCBjYW4gYmUgbWVyZ2VkIHNvb24hCj4gCj4gSSBoYXZlIGFj
dHVhbGx5IGJlZW4gcnVubmluZyBjaGVja3BhdGNoLnBsLCBidXQgaXQgZ2l2ZXMgbm8gd2Fybmlu
Z3Mgb3IKPiBlcnJvcnMuCj4gCgpPa2F5LiBUaGVuIEkndmUgaW50ZXJwcmV0ZWQgbXkgcGVyc29u
YWwgdGFzdGUgdG9vIG11Y2ggaW50byB0aGUgcGF0Y2guIDotRApJZiBjaGVja3BhdGNoLnBsIGlz
IGhhcHB5LCBJJ20gYWxzbyBoYXBweS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
