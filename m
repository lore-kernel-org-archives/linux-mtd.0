Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE39C43217
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TGKSlzEUZ9y85GkNNBqEu5PqIH7JlP31THyfZKgWMcU=; b=geiOh/nTqEU1PQa4XNYYwbttIh
	S/f4Fl7A3qx4/387dOG8tVf3Kck3r9uoqBizo3EFhKYVjhExXiwF18Marj6A3zA5Dq0Keqgx/Kjlh
	vz8i5I+1W1DOqUn+WCk37ZMJk2SFUFf5MXPWWevBcN8Pqa3+FiUU/hywn6vWeTySadvOKF8THomDs
	JIZnWoMgdXQ9Rf/HKoByWvPRyRGeIqPduu0K2rFQ5O1laUEA8v54KFbs1tFgGihjw0gvSnWQ1/BIQ
	bfW5pP+nf5xkDI+IvbaTySI19wmJlulSe5C4qP1Cg/gQ0MrvUkeOHP2XF01+zUeThz000NeMXPb5e
	saiiymTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovYjB-00Awjj-4r; Thu, 17 Nov 2022 06:50:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovYj8-00Awe2-Af
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 06:50:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0BA0063E5142;
	Thu, 17 Nov 2022 07:50:10 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id C-8DFjzXAIMN; Thu, 17 Nov 2022 07:50:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id BD56263E514E;
	Thu, 17 Nov 2022 07:50:08 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SXXDuArp9_Qv; Thu, 17 Nov 2022 07:50:08 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 868FA63E5142;
	Thu, 17 Nov 2022 07:50:08 +0100 (CET)
Date: Thu, 17 Nov 2022 07:50:08 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Christoph Hellwig <hch@infradead.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Jens Axboe <axboe@kernel.dk>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, 
	Michal Orzel <michalorzel.eng@gmail.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <271114315.250800.1668667808308.JavaMail.zimbra@nod.at>
In-Reply-To: <Y3XN+fDTjHz09qEE@infradead.org>
References: <cover.1668548123.git.daniel@makrotopia.org> <7526fc5a461a0d68eb1dab575f9c1950638fc21a.1668548123.git.daniel@makrotopia.org> <Y3R8oQXRQ8uq8p4P@infradead.org> <Y3V9/pmHs7ypE7lb@makrotopia.org> <Y3XN+fDTjHz09qEE@infradead.org>
Subject: Re: [PATCH v5 3/4] partitions/efi: add support for uImage.FIT
 sub-partitions
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: partitions/efi: add support for uImage.FIT sub-partitions
Thread-Index: ujVCwDZmDXzDbx5XljCrk+OdLhc8MQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_225022_540722_A1A0B239 
X-CRM114-Status: UNSURE (   8.51  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNocmlzdG9waCBIZWxsd2ln
IiA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gT24gVGh1LCBOb3YgMTcsIDIwMjIgYXQgMTI6MTk6MTBB
TSArMDAwMCwgRGFuaWVsIEdvbGxlIHdyb3RlOgo+PiBXaGlsZSB3ZWlyZG5lc3MgaXMgY2VydGFp
bmx5IHN1YmplY3RpdmUsIHVJbWFnZS5GSVQgaXMgbm90IGp1c3QgYQo+PiByYW5kb20gaW1hZ2Ug
Zm9ybWF0IGJ1dCB1c2VkIGJ5IGEgZ3JlYXQgbWFqb3JpdHkgb2YgaGVhZGxlc3MgZW1iZWRkZWQK
Pj4gTGludXggZGV2aWNlcyBvdXQgdGhlcmUuIEl0J3MgdGhlIGRlZmF1bHQgaW1hZ2UgZm9ybWF0
IG9mIG1hbnkgb2YgdGhlCj4+IFNES3MgZGlzdHJpYnV0ZWQgYnkgY2hpcCB2ZW5kb3JzIHN1Y2gg
YXMgQWxsd2lubmVyLCBNYXJ2ZWxsLCBNZWRpYVRlaywKPj4gTlhQLCBRdWFsY29tbS9BdGhlcm9z
LCAuLi4KPiAKPiAiTG9vayBzZWUsIG15IHdlaXJkIGZvcm1hdCBpcyB1c2VkIGJ5IGFsbCB0aGVz
ZSBjb21wYW5pZXMgYnVpbGRpbmcKPiBjcmFwcHkgU09DcywgaXQgaXMgbm90IHdlaXJkLi4iCgpX
ZWxsLCBGSVQgaXMgbm90IHNvbWV0aGluZyBzdHJhbmdlIGludmVudGVkIGJ5IFNvQyBjb21wYW5p
ZXMsIGl0IGNvbWVzIGZyb20gdS1ib290CmFuZCBpcyBtb3JlIG9yIGxlc3MgYSBkZS1mYWN0byBz
dGFuZGFyZC4KV2hpbGUgSSBhZ3JlZSB0aGF0IHVzaW5nIHRoZSBibG9jayBsYXllciBmb3IgcGFy
dGl0aW9uIHBhcnNpbmcgaXMgcXVlc3Rpb25hYmxlCkkgdGhpbmsgc3VwcG9ydGluZyB0aGVzZSBp
bWFnZXMgaW4gTGludXggaXMgYSB3b3J0aHdoaWxlIGdvYWwuCgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
