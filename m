Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BBC83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HDqj0BGVRb4L88wrd4ch8lNZj5b39QGyZHF/j8i+tLE=; b=WXNKse7tHPqQiv3lmN/JuOlLd9
	Bode/z5Iiwn8UqpcSYoqhO4OZMML3SgkOLi+JY8Sb4/MVnunE/avtRqraB8FvNlOc7LMxeHyWUZSM
	P4qkkVIntqWl917vLzGqK8UF0HIG2Wlhm5K9oRQ3yxO1kYgW66Bb//nTz2VxJDeq7Q4yiqbafqOtQ
	GOuZXlT6+rKhnAiMwxhqv3oGiZNIIGrmfZlF+4haEtS/U5lnIYKLmwVGUA2u+RtSeYyjaa4DnPYlQ
	wjZ4Zf8cVTNpYXb7P2GaDz2k4a2oOPfadLLayYIcRk3Vyq52J/XvgIWgHOuDa7X3R5BhN7rzyJXUV
	to1futuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIF2-00DCJs-0c;
	Wed, 30 Aug 2023 10:16:04 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIEy-00DCJW-1X
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 10:16:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 843EE623488E;
	Wed, 30 Aug 2023 12:15:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id eD9wWK5irV8B; Wed, 30 Aug 2023 12:15:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 72C286234893;
	Wed, 30 Aug 2023 12:15:52 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 42i6GJN1hRBV; Wed, 30 Aug 2023 12:15:52 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 50A97623488E;
	Wed, 30 Aug 2023 12:15:52 +0200 (CEST)
Date: Wed, 30 Aug 2023 12:15:52 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christian Brauner <brauner@kernel.org>
Cc: hch <hch@lst.de>, Jan Kara <jack@suse.cz>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Message-ID: <19741192.1872587.1693390552117.JavaMail.zimbra@nod.at>
In-Reply-To: <20230830-strahl-turnier-8e082a720041@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org> <20230830-strahl-turnier-8e082a720041@brauner>
Subject: Re: [PATCH 0/2] mtd: switch to keying by dev_t
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: switch to keying by dev_t
Thread-Index: gLm1MSB29DqL9EllbJF1u7ydMC9EOg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_031601_095453_E9FC185B 
X-CRM114-Status: UNSURE (   5.81  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdGlhbiBCcmF1bmVy
IiA8YnJhdW5lckBrZXJuZWwub3JnPgo+IEFuOiAiaGNoIiA8aGNoQGxzdC5kZT4sICJKYW4gS2Fy
YSIgPGphY2tAc3VzZS5jej4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4gQ0M6ICJNaXF1
ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJWaWduZXNoIFJhZ2hhdmVu
ZHJhIiA8dmlnbmVzaHJAdGkuY29tPiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAibGludXgtZnNkZXZlbCIgPGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwu
b3JnPgo+IEdlc2VuZGV0OiBNaXR0d29jaCwgMzAuIEF1Z3VzdCAyMDIzIDExOjUwOjU4Cj4gQmV0
cmVmZjogUmU6IFtQQVRDSCAwLzJdIG10ZDogc3dpdGNoIHRvIGtleWluZyBieSBkZXZfdAoKPj4g
SSBwbGFuIG9uIHRha2luZyB0aGlzIHVwc3RyZWFtIGFzIGEgZml4IGR1cmluZyB0aGUgbWVyZ2Ug
d2luZG93Lgo+IAo+IEJ0dywgSSB0ZXN0ZWQgdGhpcyBhbGwgd2l0aCBqZmZzMjoKPiAKPiBzdWRv
IGZsYXNoX2VyYXNlIC1qIC9kZXYvbXRkMCAwIDAKPiBzdWRvIG1vdW50IC10IGpmZnMyIG10ZDAg
L21udAo+IAo+IGFuZCB0aGVuIHNvbWUgdmFyaWFudHMgd2l0aCByYWNpbmcgdW1vdW50cyBhbmQg
bW91bnRzLgoKR29vZCB0byBrbm93IQpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNo
YXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
