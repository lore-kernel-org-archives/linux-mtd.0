Return-Path: <SRS0=stAP=XB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50437C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 07:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B44721D7C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 07:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aioVMC5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B44721D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYitPqyNuQOFNmtYdA7NApi/Ea1vq8i1CvSLhfIhj3c=; b=aioVMC5GXMH5Sh
	pOI+rGdiK7URMZc9aiir5vF1MuybscmvraEI6xKjJ3X0Yg73fj/4VatIvXrQjhYzjL/fEtE2HT6Id
	1hrbi2oWbwsUoFpmbH0pn6BOHwaLSVxmL1+0eQQgHjzPqg6TOfuwAA5UHu6b3K65tID6HOtvzx3ZL
	6jp8YOoaXuQWUy1LvlP6ANxR6B7NSH0/AXbMUANXmI/6psvKgxcKB584mSb4D31ERp6samJAs2bsu
	B0EpbbnksguC6NdR5vFWbSmce4tdu/lOlOLy0fUOBPQc6JAePdDbn2VkRqjVyHITnxMRJW7gf9it0
	jVTKYOu18PNZsYM7StmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i68Hn-0000wY-Ur; Fri, 06 Sep 2019 07:04:00 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i68GC-0000Ql-4I
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2019 07:02:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E846960632C6;
 Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qeWP_mAy67Cu; Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 98D2A60F851D;
 Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Lzi2qj49-OVI; Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 72AEE606D4B2;
 Fri,  6 Sep 2019 09:02:06 +0200 (CEST)
Date: Fri, 6 Sep 2019 09:02:06 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: JH <jupiter.hce@gmail.com>
Message-ID: <131148461.92686.1567753326360.JavaMail.zimbra@nod.at>
In-Reply-To: <CAA=hcWT0=ny6hxDgxZVTU6jbAYS80nizw3+PVVWzgW6poXuMwQ@mail.gmail.com>
References: <CAA=hcWTrrC1a_WSNb62ftn60fAMnq1jywVsjwess1=vGufXjLw@mail.gmail.com>
 <CAFLxGvzqXs=m77Dmp+EVxYKM4gWc4AcU1ftW+S90rVtot1NvPg@mail.gmail.com>
 <CAA=hcWT0=ny6hxDgxZVTU6jbAYS80nizw3+PVVWzgW6poXuMwQ@mail.gmail.com>
Subject: Re: A big issue of NAND fragmentation
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: A big issue of NAND fragmentation
Thread-Index: uI9C0MKLsanD8PFR3yFD3Ym/jhav/Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_000220_696172_1D574486 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpIIiA8anVwaXRlci5oY2VA
Z21haWwuY29tPgo+IEFuOiAiUmljaGFyZCBXZWluYmVyZ2VyIiA8cmljaGFyZC53ZWluYmVyZ2Vy
QGdtYWlsLmNvbT4KPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPgo+IEdlc2VuZGV0OiBGcmVpdGFnLCA2LiBTZXB0ZW1iZXIgMjAxOSAwODowMzo1NQo+IEJl
dHJlZmY6IFJlOiBBIGJpZyBpc3N1ZSBvZiBOQU5EIGZyYWdtZW50YXRpb24KPiAKPiBZZXMsIEkg
dXNlIFVCSUZTLCB3YXMgeW91ciB3b3JkICJmb3JjZSIgbWVhbnMgIndyaXRlIiBvciBkaWQgeW91
Cj4gYWxsdWRlIHRoZXJlIHdvdWxkIGJlIGFuIGFsdGVybmF0aXZlIHRvIGF2b2lkIGZvcmNpbmcg
VUJJRlMgcGVyc2lzdAo+IDI1MCBieXRlcz8KPiAKPiBXYWl0aW5nIGZvciBvdXQgb2Ygc3BhY2Ug
d291bGQgYmUgdG9vIHJpc2ssIGFsdGVybmF0aXZlbHksIEkgc2hvdWxkCj4gaGF2ZSBhIFVCSUZT
IHBhcnRpdGlvbiBmb3IgdGhlIGRhdGEgc3RvcmFnZSwgaWYgaXQgcnVucyBvdXQgb2Ygc3BhY2Us
Cj4gaXQgd29uJ3QgaW1wYWN0IHRoZSByb290IGZpbGUgc3lzdGVtLgo+IAoKTm8sIGJ5IGZvcmNl
IEkgbWVhbiBmb3JjaW5nIHRoZSBmaWxlc3lzdGVtIHRvIHBlcnNpc3QgdGhlIGRhdGEuCkZvciBl
eGFtcGxlIGJ5IHVzaW5nIGZzeW5jKCksZmRhdGFzeW5jKCksIE9fU1lOQyBvciBhIHN5bmMgbW91
bnRlZApmaWxlc3lzdGVtLgpJZiB5b3UgZG9uJ3QgZG8gdGhpcywgZGF0YSB3aWxsIGJlIGNhY2hl
ZCBhbmQgY2FuIGJlIHBhY2tlZApsYXRlciB1cG9uIHdyaXRlLWJhY2suCgpUaGFua3MsCi8vcmlj
aGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
