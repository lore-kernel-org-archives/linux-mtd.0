Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93107CA0EE4
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XMy81x+CtV3WU5cP4vcKSRLe7RkVV3dpWpxshVGPzuQ=; b=tf0hYV0wIDt2svtqpqUTF1yzkV
	avYinW5Rl7eeytSSq/fC/dCh5OXQl3mfu+V1u2tg3WA4YS49fMtHmAYLV57JjbzR0sOL9fW2bMsAf
	kCXNpz0V9GXSTvHjZ5i0i26Tccq2vLl5LP4AAEZSw+bRe4KDdsrTlgpkmg0soRCqd9dF0UGuV1+BS
	OD9XZnDh5/A87ddSp8pUwipPAU0m9ciJ4lt/VkrmqQ3Zay7jPIepvb1YSUoktDNokym56Ps7f9Jx6
	uqL6i/q2SuJd/e5RyWlQBxaoEgr6MSOXuU6zfrmgZU6b6t5b7n1YUAafDrFiyw4iy9LjNn8U9NFQu
	dc3NUCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYzM-0000000HGWz-2vJT;
	Thu, 14 Aug 2025 14:31:32 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umWA5-0000000GkOl-3PGn
	for linux-mtd@lists.infradead.org;
	Thu, 14 Aug 2025 11:30:27 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C38D32FFDA5;
	Thu, 14 Aug 2025 13:30:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id XP9eaYOi19Kn; Thu, 14 Aug 2025 13:30:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 33BBC2FFDA9;
	Thu, 14 Aug 2025 13:30:14 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OGe52fzWuMNR; Thu, 14 Aug 2025 13:30:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E51A62FFDA5;
	Thu, 14 Aug 2025 13:30:13 +0200 (CEST)
Date: Thu, 14 Aug 2025 13:30:13 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu <leoyu@mxic.com.tw>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Message-ID: <608935583.115196.1755171013804.JavaMail.zimbra@nod.at>
In-Reply-To: <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
References: <20250812051949.983040-1-linchengming884@gmail.com> <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: skip programming unused bits in ubi headers
Thread-Index: 63S535GLvQTJB7IX1iFPElc1JTBAaQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_043025_991207_575BFF74 
X-CRM114-Status: UNSURE (   5.95  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNoZW5nIE1pbmcgTGluIiA8
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4KPj4gSSBoYXZlIGJlZW4gdG9sZCB0aGF0IHdyaXRp
bmcgMHhGRiBieXRlcyB0byBOQU5EIHNob3VsZCBiZSBhdm9pZGVkLgo+PiBUaGlzIGlzIGFsc28g
d2h5IFVCSSBpbml0aWFsaXplcyB0aGVtIHRvIDB4MDAuCj4gCj4gTm9ybWFsbHksIGFmdGVyIGEg
TkFORCBmbGFzaCBibG9jayBpcyBlcmFzZWQsIGFsbCBiaXRzIGFyZSBpbiB0aGUgMHhGRgo+IHN0
YXRlLiBQcm9ncmFtbWluZyAweEZGIGluIHRoaXMgY2FzZSB3aWxsIG5vdCBhY3R1YWxseSBjaGFu
Z2UgdGhlIE5BTkQKPiBjZWxscywgYXMgdGhlIGRldmljZSBjYW4gaW5oaWJpdCBwcm9ncmFtbWlu
Z+KAlGVpdGhlciBieSByYWlzaW5nIHRoZQo+IGJpdGxpbmUgdm9sdGFnZSBvciB1c2luZyBhIHNl
bGYtYm9vc3RlZCBwcm9ncmFtIGluaGliaXQgbWVjaGFuaXNtLgo+IFRoZXJlZm9yZSwgcHJvZ3Jh
bW1pbmcgMHhGRiBpcyBhIG5vcm1hbCBhbmQgaGFybWxlc3Mgb3BlcmF0aW9uIGZvciBOQU5ECj4g
Zmxhc2guCgpUaGF0J3MgdGhlIGNydWNpYWwgcXVlc3Rpb24uIElzIHRoaXMgdHJ1ZSBmb3IgYWxs
IE5BTkQgY2hpcHM/CkRvIGF2b2lkIGxhcmdlciB3cml0ZXMgb2YgMHhGRiBwYXR0ZXJucyBmaWxl
IHN5c3RlbXMgc3VjaCBhcyBVQklGUwphbHNvIHVzZSBjb21wcmVzc2lvbiBhIGxvdC4KQXQgbGVh
c3QgdGhhdCdzIHdoYXQgSSBoYXZlIGJlZW4gdG9sZCB3aGVuIEkgYXNrZWQgMTArIHllYXJzIGFn
bwpob3cgVUJJIHdvcmtzLgoKVGhhbmtzLAovL3JpY2hhcmQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
