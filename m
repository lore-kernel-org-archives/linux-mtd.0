Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FF1D59F73
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 20:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BenFy8g+bcV3MwxN/tGnQ+X/HkDy3RT2UtXzxCNJxNE=; b=DsHDm+ujoGTPgmLNOBGt5/BoGN
	wrUI6FChMvYkUMqwvEk4loxoq+vPLchSdKq7Bf9kOrd2aGonTLAjjtMz/NgQFV4sqelK0DOaACVO6
	XlFIqqVbP2Wq3c9KUAwxGyctrOSQ3W2eN8ZiRtkB1JhvNh45I4OobyggbsAcrnfza1sVEr9w37VIs
	wRIBJDWa56k92+uWfBImHMqdpsDknh254eJea0x9hR8DjLgAQBImPWCtXCOgHGFanEJwhxHaCWelv
	8VyirMPoYuZdmGHjjB/casJBBdytRnXn/PB63twwiEzCFukoL7RUPW1bpl6pGCF7zh2ZHK0Yf6yEs
	nRkpljnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mlk-00000004hZa-2ty8;
	Wed, 06 Nov 2024 20:36:48 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mjH-00000004h2M-2MwV
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 20:34:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3F47E2A87E1;
	Wed,  6 Nov 2024 21:34:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Yg7RI9VHJ_FG; Wed,  6 Nov 2024 21:34:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C6FD82A87EA;
	Wed,  6 Nov 2024 21:34:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fpDI535FjgW4; Wed,  6 Nov 2024 21:34:13 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id A34092A87E1;
	Wed,  6 Nov 2024 21:34:13 +0100 (CET)
Date: Wed, 6 Nov 2024 21:34:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Rickard X Andersson <rickard.andersson@axis.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	rickard314 andersson <rickard314.andersson@gmail.com>, 
	kernel <kernel@axis.com>
Message-ID: <1034679385.201190.1730925253564.JavaMail.zimbra@nod.at>
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
Subject: Re: [PATCH v3 01/10] ubi: Expose mean erase counter in sysfs
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF132 (Linux)/8.8.12_GA_3809)
Thread-Topic: Expose mean erase counter in sysfs
Thread-Index: CYqL4ieUH+hweP4x9xsLKY5ydsmECQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_123415_762472_72260E33 
X-CRM114-Status: UNSURE (   3.41  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlJpY2thcmQgWCBBbmRlcnNz
b24iIDxyaWNrYXJkLmFuZGVyc3NvbkBheGlzLmNvbT4KPiBUaGVyZSBleGlzdHMgbW9yZSBkZXRh
aWxlZCBpbmZvIGluIGRlYnVnZnMsIGJ1dCB0aGlzIGluZm9ybWF0aW9uIGlzCj4gb25seSBhdmFp
bGFibGUgZm9yIGRlYnVnIGJ1aWxkcy4KCklmIHRoZSBkZXRhaWxlZCBpbmZvIGlzIHVzZWZ1bCBm
b3IgcmVndWxhciB1c2Vyc3BhY2Ugd2UgY2FuIGFsc28gdGhpbmsKb2YgYWRkaW5nIGEgbm9uLWRl
YnVnZnMgaW50ZXJmYWNlIGZvciBpdC4KRS5nLiBhbiBpb2N0bCgpIHRoYXQgcmV0dXJucyB0aGlz
IGRhdGEgaW4gYmluYXJ5IGZvcm0uCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
