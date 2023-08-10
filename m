Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98153C04FE0
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y/6lHkhQF6w3WEU0Gh6Gex4uxrRWKhop95ZE5v6O3Lk=; b=pyZfB26FN5Ykkbgz6Ph52BhR/0
	vpNxAV27Pl7ebrWR3yM9HJMrrVqQBwaJeDHpxq7vpenyvFJ7okwWK5+mU1TLbDJLQC9uSPD1txHk4
	jw/OHC9IJPmR4R6KQK0tRJpu+jW4S3eBfVv7P5QnLWnqxjPILs5ypG0ghoKqi3FHFjujoo12TsmAH
	ZrZrr9fMgNMVmIoVvpWnwrpC0/U5mkmDvmm2xNLQsSNdG2X4AFCIuSrMRa0I1X2a2MbolMZYb3PF6
	nXkLvFn3STvPH7CaAYYMB1BSYnYzpaeesJf3ez8FaeD0bu7B08/FMdiqNKCHPPrn7InjZpaCyhSgc
	aq5bx9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBkE-008bRl-0K;
	Thu, 10 Aug 2023 19:54:54 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBkA-008bQC-1l
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 19:54:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9F9A7622F562;
	Thu, 10 Aug 2023 21:54:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Zau3YReFNhfe; Thu, 10 Aug 2023 21:54:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 02602622F56E;
	Thu, 10 Aug 2023 21:54:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LCroLhpcM-fu; Thu, 10 Aug 2023 21:54:46 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id CA9C5622F562;
	Thu, 10 Aug 2023 21:54:46 +0200 (CEST)
Date: Thu, 10 Aug 2023 21:54:46 +0200 (CEST)
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
Message-ID: <164102534.5258032.1691697286622.JavaMail.zimbra@nod.at>
In-Reply-To: <ZNUOjQVivR/5pFKE@infradead.org>
References: <20230810160019.16977-1-richard@nod.at> <20230810160019.16977-2-richard@nod.at> <ZNUK8nWnUYB6B4Kg@infradead.org> <298860961.5257332.1691684136772.JavaMail.zimbra@nod.at> <ZNUOjQVivR/5pFKE@infradead.org>
Subject: Re: [PATCH 1/7] ubi: block: Refactor sg list processing for highmem
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: Refactor sg list processing for highmem
Thread-Index: 1KQDP1L0ZIhn5gNyfCrsrXqi59LrWA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_125450_742146_37460CF9 
X-CRM114-Status: UNSURE (   9.01  )
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
IiA8aGNoQGluZnJhZGVhZC5vcmc+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+Cj4g
T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgMDY6MTU6MzZQTSArMDIwMCwgUmljaGFyZCBXZWluYmVy
Z2VyIHdyb3RlOgo+PiA+PiBUaGUgZm9sbG93dXAgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyB3aWxs
IHN3aXRjaCB0byBrbWFwX3NnKCkKPj4gPj4gYW5kIHdlIGNhbiByZW1vdmUgb3VyIG93biBoZWxw
ZXIgYW5kIHRoZSBib3VuY2UgYnVmZmVyLgo+PiA+IAo+PiA+IFBsZWFzZSBqdXN0IHVzZSBrbWFw
X2xvY2FsIGFuZCBhdm9pZCB0aGUgYm91bmNlIGJ1ZmZlcmluZy4KPj4gCj4+IFBhdGNoIDYgZG9l
cyB0aGlzLgo+IAo+IEJ1dCB3aHkgYWRkIHRoZSBib3VuY2UgYnVmZmVyaW5nIGZpcnN0IGlmIHlv
dSBjYW4gYXZvaWQgaXQgZnJvbSB0aGUKPiB2ZXJ5IGJlZ2lubmluZyBieSBqdXN0IHVzaW5nIGtt
YXBfbG9jYWwgaW5zdGVhZCBvZiBhZGRpbmcgYSBuZXcKPiBjYWxsZXIgZm9yIHRoZSBkZXByZWNh
dGUga21hcF9hdG9taWM/CgpCZWNhdXNlIEkgd2FudCB0aGlzIGZpeCBhbHNvIGluIGFsbCBzdGFi
bGUgdHJlZXMuIGttYXBfbG9jYWwoKSBpcyByYXRoZXIKbmV3LiBXaGVuIGJhY2sgcG9ydGluZyBw
YXRjaCAxLzcsIGJvdW5jZSBidWZmZXJzIGFuZCBrbWFwX2F0b21pYygpCmFyZSBuZWVkZWQgYW55
d2F5LgpCeSBkb2luZyB0aGlzIGluIHBhdGNoIDEvNyBJIGF2b2lkIGJhY2twb3J0IHRyb3VibGVz
IGFuZCBrZWVwIHRoZQpkZWx0YSBiZXR3ZWVuIHVwc3RyZWFtIGFuZCBzdGFibGUgdHJlZXMgbWlu
aW1hbC4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
