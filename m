Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4561DC4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 20:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rB03b0jPLqlkHgP9W4rxop3+zUUzJtlzetjMCDrBXfo=; b=jriENIzKzSeZEdn7TB5SjSuMhj
	3upSC4UTIB5w1GIxttgvtgIIZZ6hJRC9miFW4yMX7GQAAUtKBVhhW/kPH4sYSw/hxV56aPi2yIl34
	PMVWazGN/vHoI2I0pthI6qI0BUpw6VdKhp5WuJLaxcV25ta7Pvtn8dbVcKxNzxGsotBFL1mSGRFmz
	h7yTQwcE+7kQD8OLbh1c9AHNmz8s8nBzC1j6tYUXebDsd1GXLJavY+QLu5LIHrTMQ+TZxDVEX4zR4
	Ggg+aH1jWlMLKSwL575RW97kpRWVfx/tceNnSPC5cqTM0rwUun2WWrEIyGVvEUQ3qNAU1A7NfOv7G
	nxXO2tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raikh-000000007dP-2wHx;
	Thu, 15 Feb 2024 20:54:39 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raikd-000000007aP-1IgA
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 20:54:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5B8C064507CE;
	Thu, 15 Feb 2024 21:54:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id q3mLhC1ce3T7; Thu, 15 Feb 2024 21:54:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 02A0C64507E9;
	Thu, 15 Feb 2024 21:54:30 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dun440M87JlY; Thu, 15 Feb 2024 21:54:29 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA10D64507CE;
	Thu, 15 Feb 2024 21:54:29 +0100 (CET)
Date: Thu, 15 Feb 2024 21:54:29 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <625776491.56064.1708030469766.JavaMail.zimbra@nod.at>
In-Reply-To: <Zc54F3q6O1gYiMA4@casper.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org> <Zc54F3q6O1gYiMA4@casper.infradead.org>
Subject: Re: [PATCH 00/15] ubifs folio conversion
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs folio conversion
Thread-Index: abpGAu6gZm6xIHnvBkhcr716Rf5v6Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_125435_549332_DA69B27E 
X-CRM114-Status: UNSURE (   6.89  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hdHRoZXcgV2lsY294IiA8
d2lsbHlAaW5mcmFkZWFkLm9yZz4KPiBPbiBTYXQsIEphbiAyMCwgMjAyNCBhdCAxMTowODowOFBN
ICswMDAwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSB3cm90ZToKPj4gVGhpcyBwYXRjaHNldCBj
b252ZXJ0cyB1YmlmcyB0byB1c2UgZm9saW9zIHRocm91Z2hvdXQuICBJIG1hZGUgc29tZQo+PiBh
dHRlbXB0IHRvIHN1cHBvcnQgbGFyZ2UgZm9saW9zLCBidXQgbW9yZSB3b3JrIGRlZmluaXRlbHkg
bmVlZHMgdG8gYmUKPj4gZG9uZSBiZWZvcmUgaXQgY2FuIGJlIGVuYWJsZWQuICBJdCdzIG5vdCBj
bGVhciB0byBtZSB3aGV0aGVyIGl0J3Mgd29ydGgKPj4gZG9pbmcsIHNvIEkndmUgbGVmdCB0aGF0
IGZvciB5b3UgOy0pCj4gCj4gSXQncyBiZWVuIGZvdXIgd2Vla3MgLi4uIGRvIEkgbmVlZCB0byBk
byBhbnl0aGluZyB0byBtYWtlIHN1cmUgdGhpcyBoaXRzCj4gdGhlIG5leHQgbWVyZ2Ugd2luZG93
PwoKTm9wZSwgSSdsbCBhZGQgaXQgdG8gdWJpZnMvbmV4dCBzb29uLiA6LSkKClRoYW5rcywKLy9y
aWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
