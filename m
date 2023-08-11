Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D0C04A6A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WoGPva/vbOt8s+HFA2539vEHM44gnGQqHkHHgvBUMoI=; b=1J0QKrT7YozBgfrc4CHu0QtB0f
	kkqDIK/BmvZd7792Z8/gHfq04YmucWT+6NT8W3bx4YNm8InA4XNAPBbEz3b2zrowxERY2RqIqBeE6
	3zpb3i0MPdPUP9LAeIO6yWUfe6rgVEylFxS/HRdBWkqLWZTiSwbhTqviJfKeT7ibHKoPxjMIelOjt
	X/VBV292+MJDd9C2r2NPrMuVj0Chv1dHF2jnHB16vc/MI6sOe85ZGFF6wmpLFH8xgAz2COVzu8jTS
	1TgZM5Wb41aHUeAFd05UjhmSlr5ATFN7Qt5ahP6MVDzNrPo7A86iMghrHZkKiWlt5d1ZI67nARrFW
	Dz0Os04g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNbq-009rZs-2C;
	Fri, 11 Aug 2023 08:35:02 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUNbm-009rYK-34
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 08:35:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CDC58635D298;
	Fri, 11 Aug 2023 10:34:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id gWYbKucqjmIx; Fri, 11 Aug 2023 10:34:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 61490622F58E;
	Fri, 11 Aug 2023 10:34:53 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1iVyzkI06y4o; Fri, 11 Aug 2023 10:34:53 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 26A06622F562;
	Fri, 11 Aug 2023 10:34:53 +0200 (CEST)
Date: Fri, 11 Aug 2023 10:34:52 +0200 (CEST)
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
Message-ID: <156807159.5281174.1691742892935.JavaMail.zimbra@nod.at>
In-Reply-To: <ZNXtdpUbhj7mVu11@infradead.org>
References: <20230810160019.16977-1-richard@nod.at> <20230810160019.16977-2-richard@nod.at> <ZNUK8nWnUYB6B4Kg@infradead.org> <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at> <ZNUOjQVivR/5pFKE@infradead.org> <164102534.5258032.1691697286622.JavaMail.zimbra@nod.at> <ZNXtdpUbhj7mVu11@infradead.org>
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: Refactor sg list processing for highmem
Thread-Index: 3zEdItUFC1BXLJjJLxUA1x/tImNOyg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_013459_145564_F7CFBB9B 
X-CRM114-Status: UNSURE (   7.83  )
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
IiA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gT24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMDk6NTQ6NDZQ
TSArMDIwMCwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+PiA+IEJ1dCB3aHkgYWRkIHRoZSBi
b3VuY2UgYnVmZmVyaW5nIGZpcnN0IGlmIHlvdSBjYW4gYXZvaWQgaXQgZnJvbSB0aGUKPj4gPiB2
ZXJ5IGJlZ2lubmluZyBieSBqdXN0IHVzaW5nIGttYXBfbG9jYWwgaW5zdGVhZCBvZiBhZGRpbmcg
YSBuZXcKPj4gPiBjYWxsZXIgZm9yIHRoZSBkZXByZWNhdGUga21hcF9hdG9taWM/Cj4+IAo+PiBC
ZWNhdXNlIEkgd2FudCB0aGlzIGZpeCBhbHNvIGluIGFsbCBzdGFibGUgdHJlZXMuIGttYXBfbG9j
YWwoKSBpcyByYXRoZXIKPj4gbmV3LiBXaGVuIGJhY2sgcG9ydGluZyBwYXRjaCAxLzcsIGJvdW5j
ZSBidWZmZXJzIGFuZCBrbWFwX2F0b21pYygpCj4+IGFyZSBuZWVkZWQgYW55d2F5Lgo+PiBCeSBk
b2luZyB0aGlzIGluIHBhdGNoIDEvNyBJIGF2b2lkIGJhY2twb3J0IHRyb3VibGVzIGFuZCBrZWVw
IHRoZQo+PiBkZWx0YSBiZXR3ZWVuIHVwc3RyZWFtIGFuZCBzdGFibGUgdHJlZXMgbWluaW1hbC4K
PiAKPiBKdXN0IHVzZSBwbGFpbiBrbWFwIGZvciB0aGUgaGlzdG9yaWMgYmFja3BvcnRzLgoKSG0s
IHllcy4gRm9yIFVCSWJsb2NrIGttYXAgc2hvdWxkIGJlIHRvbyBleHBlbnNpdmUuCgpUaGFua3Ms
Ci8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
