Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17FCCCF9E3
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DAJfx1QEqADFWjhUwWPMS3OMaBFmFc5pBnh9VSFB3tg=; b=VSFqRYS0Zxfadq2nMesvUWNwjU
	AsNSUXBA9gJd2ZGZUTJjpaglIouScJoDZpapJv1h8Jrir+E+xoWH0HoD8QlpK8GehkJXjKUBo7dZH
	fr6HtPfwXruaT7mBdPn19ZTy/RcQEKRqnAqn2Pv4gzEw3CXtvrqeWY0O7CRfw+TPpz5GyDXb9iuZp
	mYnS8uKWcyR4Hrmoeqy2l4mBwuPp+jsgKohglxGMYsG8joXiWR9E8lhsrdjgHfQtzCvsaIaOdlcB9
	VMxEfepCC+BlCN+DFV6qFqDLR2NHOwUeEBRh82EIDItCJoGAB192b+7scmZwXi2W5v4Kn+uP6RpK9
	yKj9xSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIWS-0000000GwbR-49OZ;
	Fri, 07 Nov 2025 09:12:44 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIWQ-0000000GwZg-0xEm
	for linux-mtd@lists.infradead.org;
	Fri, 07 Nov 2025 09:12:44 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B4DFE2CFC87;
	Fri,  7 Nov 2025 10:12:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8ebayicaHm3t; Fri,  7 Nov 2025 10:12:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C6CB2CFC9B;
	Fri,  7 Nov 2025 10:12:36 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2zSpx9lpBYSw; Fri,  7 Nov 2025 10:12:36 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1B2CD2CFC87;
	Fri,  7 Nov 2025 10:12:36 +0100 (CET)
Date: Fri, 7 Nov 2025 10:12:35 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu <leoyu@mxic.com.tw>, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Message-ID: <954318808.156230.1762506755899.JavaMail.zimbra@nod.at>
In-Reply-To: <CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com>
References: <20251106054940.2728641-1-linchengming884@gmail.com> <20251106054940.2728641-2-linchengming884@gmail.com> <87o6pf8r24.fsf@bootlin.com> <CAAyq3Sb8-FRC+bZt_bEvOdBNVSN4xa5F_TpBbKF__HzhVPEpTw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: ubi: skip programming unused bits in ubi
 headers
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143 (Linux)/8.8.12_GA_3809)
Thread-Topic: skip programming unused bits in ubi headers
Thread-Index: e7dABj2Yaus8tdMWVqv/NCXl+sHf6A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_011242_410986_00FB225B 
X-CRM114-Status: UNSURE (   7.25  )
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
bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4KPj4gSGVyZSBJIGFtIHJlYWNoaW5nIHRoZSBsaW1p
dHMgb2YgbXkgVUJJIGtub3dsZWRnZSwgc28gSSB3b3VsZCBwcmVmZXIKPj4gUmljaGFyZCB0byAo
aW4pdmFsaWRhdGUgd2hhdCBJIGFtIHNheWluZywgYnV0IEFGQUlVLCB0aGUgVklEIGhlYWRlciBj
YW4KPj4gYmUgbGl0ZXJhbGx5IGFueXdoZXJlIGluIHRoZSBwYWdlLCBub3QganVzdCBhdCB0aGUg
c3RhcnQgb3IgZW5kIG9mIGEKPj4gc3VicGFnZSwgc28gaW4gdGhlIHZpZF9oZHJfc2hpZnQgSSB3
b3VsZCBleHBlY3Qgc29tZSBleHRyYSBtYXRocyB0bwo+PiBoYXBwZW4sIG5vPwoKR29vZCBjYXRj
aCEKSSBoYWQgdG8gcmVhZCB0aGUgY29kZSBjaGFuZ2UgdHdpY2UgdG8gc2VlIHRoZSBwcm9ibGVt
LCB0aG91Z2guIDotUwoKPiBJIHVuZGVyc3RhbmQgeW91ciBwb2ludCBub3cuIElmIHRoZSBWSUQg
aGVhZGVyIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlCj4gYXQgdGhlIHN0YXJ0IG9yIGVuZCBvZiBh
IHN1YnBhZ2UsIHRoZW4geWVzLCBteSBjdXJyZW50IGxvZ2ljIG5lZWRzIHRvIGJlCj4gcmV3b3Jr
ZWQgdG8gY292ZXIgdGhhdCBjYXNlLgoKWWVzLiBUaGlzIGNhbiBiZSBjb25maWd1cmVkIHVzaW5n
IHViaWF0dGFjaCAtLXZpZC1oZHItb2Zmc2V0IC4uLgpXaXRoIG5hbmRzaW0geW91IGNhbiB0ZXN0
IGFsbCBraW5kIG9mIGNvbWJpbmF0aW9ucy4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
