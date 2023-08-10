Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9E4C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JVRGAITWbu0Hbr3GS5AehRo96cg/+TC2L2xEEX6r9hY=; b=bS6UD6Do73oL7nWTzTHFLZPYYQ
	Bbl7WMrA4iGQ11+ujGyNGsz00PMXqOR8mR1HVwH54/kJM6Gxa8w0yVQjcbEpIAvURaqpsoSHGRIHm
	Of5QdDJTTJAOBQ6EsivbdcMhLxmM49EFB7j2iQvXnHq1SgpoBzq9n8ExoqgqOBfwlTg5cI6udziMb
	4+SGc8T+hY2JFP5+wx01xiRYkU0lCWtAFxy2r+VFiDYXQFa77x5XoHfuohcBdv5HU+hygoFfaIjqc
	6FEChGc/ZN65q4aut6FSm46KAIhyXwPdo3mzxMgwP647pcY4mszB2ULfbTqb23q5pUta3eTZWxfZP
	5xlYYmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8K4-008AME-2j;
	Thu, 10 Aug 2023 16:15:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU8K2-008AL8-3B
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 16:15:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 76729622F562;
	Thu, 10 Aug 2023 18:15:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id smA3OYxeUDzS; Thu, 10 Aug 2023 18:15:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0F795622F56E;
	Thu, 10 Aug 2023 18:15:37 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5mrpLoPTvxi8; Thu, 10 Aug 2023 18:15:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D925E622F562;
	Thu, 10 Aug 2023 18:15:36 +0200 (CEST)
Date: Thu, 10 Aug 2023 18:15:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Stephan Wurm <stephan.wurm@a-eberle.de>, 
	stable <stable@vger.kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>, 
	Jamie Lenehan <lenehan@twibble.org>, 
	James Bottomley <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-scsi <linux-scsi@vger.kernel.org>
Message-ID: <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at>
In-Reply-To: <ZNUK8nWnUYB6B4Kg@infradead.org>
References: <20230810160019.16977-1-richard@nod.at> <20230810160019.16977-2-richard@nod.at> <ZNUK8nWnUYB6B4Kg@infradead.org>
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: Refactor sg list processing for highmem
Thread-Index: 8dyYm2xXARBKErxuajcdul9nN/entQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_091539_177065_3E6E99FC 
X-CRM114-Status: UNSURE (   5.75  )
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
IiA8aGNoQGluZnJhZGVhZC5vcmc+Cj4+IFJlZmFjdG9yIHViaV9lYmFfcmVhZF9sZWJfc2coKSB0
byB1c2Uga21hcF9hdG9taWMoKSBmb3Igc2cgbGlzdAo+PiBhY2Nlc3MuCj4+IFNpbmNlIGttYXBf
YXRvbWljKCkgZGlzYWJsZXMgcHJlZW1wdCBhIGJvdW5jZSBidWZmZXIgaXMgbmVlZGVkLgo+PiBr
bWFwX2xvY2FsX3BhZ2UoKSBpcyBub3QgdXNlZCB0byBhbGxvdyBlYXN5IGJhY2twb3J0aW5nIG9m
IHRoaXMgcGF0Y2gKPj4gdG8gb2xkZXIga2VybmVscy4KPj4gCj4+IFRoZSBmb2xsb3d1cCBwYXRj
aGVzIGluIHRoaXMgc2VyaWVzIHdpbGwgc3dpdGNoIHRvIGttYXBfc2coKQo+PiBhbmQgd2UgY2Fu
IHJlbW92ZSBvdXIgb3duIGhlbHBlciBhbmQgdGhlIGJvdW5jZSBidWZmZXIuCj4gCj4gUGxlYXNl
IGp1c3QgdXNlIGttYXBfbG9jYWwgYW5kIGF2b2lkIHRoZSBib3VuY2UgYnVmZmVyaW5nLgoKUGF0
Y2ggNiBkb2VzIHRoaXMuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
