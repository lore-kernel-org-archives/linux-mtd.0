Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387FFC55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ke5l6q2WbwUlF5Hn6CwPOfEyHLBmvtQiOUqQU8k9VmQ=; b=zQRmTCxbnuUBdl
	M0sFbVuTVhsPxMMI3cosKlXJVWmoblDmVYVHrycrP9KsvbuyKjUhd84FQQEcQT15+ebRDtb6PL87r
	pAwlTEzOepPqvhY/dthHt4iipTSM4aHtGJytFGTrVkGDUS/XAYs+Isu15lCqNjq2avlAg0SuRVWj9
	753Y+Ifw7TNEGyaoVJcfuIZ9q6E97dF/KFmmz+FZAdOmziX4XE1pOoYLQ6JZ5hup0yZKrYidrkE4i
	Q9GVIEtPwIMkFS2t/wMwuZ3PEbYe+0/l49dU+R3iIF0e2XyphS8wvwqDjqy+q+dKa75vUVRNkeoe7
	uGupW4rxLPsZA36Bbjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWXJ-00000003RyC-42aD;
	Wed, 05 Aug 2026 07:59:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWXG-00000003RxY-1mlz
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 07:59:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6E5121A13BB;
	Wed,  5 Aug 2026 07:59:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 421FC602AB;
	Wed,  5 Aug 2026 07:59:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32F2E11C34345;
	Wed,  5 Aug 2026 09:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uWYyIPxQNQm763CnWMRXE8mFe9yxvDxkksTzR9Z2h10=;
	b=GgxyBVQKG06TgXBohXqvqs2wdfNRclcLClOu5brAcuVwqFJMhhvgnsKU2kDIo9LT96PB40
	VUnqQcxsyCz1g8el+duwkt5Mgo135U+ecLeJPthKxhi0hQci654lnSaQj1UrLf2qMh2sBF
	pfcEvLknIsmX0WJckfDo9zBkl/kfu8VZ43Sl1u/05X6kqfhTbwnKGdrC+noJLLkF19f5Ht
	PszP+eW7s42JEemyRIkytRnOOoKo0+CS5NzjPFuxMx7lRm218fmqv7N46s3aTLibKHJPaf
	AkwoouriJvbM6KENPTcBhTCEblVpe4Q16OF0RqrRS1NWDAtBIDDZFgAxl8MK2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/28] mtd: spi-nor: Clean Winbond W25QxxJV family
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
	(Miquel Raynal's message of "Tue, 04 Aug 2026 16:04:22 +0200")
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 05 Aug 2026 09:59:15 +0200
Message-ID: <87a4r1f164.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_005934_640655_090A5688 
X-CRM114-Status: GOOD (  10.66  )
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

SGVsbG8sCgpPbiAwNC8wOC8yMDI2IGF0IDE2OjA0OjIyICswMiwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IFRoYW5rcyB0byBXaW5ib25kIGNvbGxh
Ym9yYXRpb24sIEkgd2FzIGFibGUgdG8gdGVzdCBhbG1vc3QgdGhlIGVudGlyZSBKVgo+IFNQSSBO
T1IgZmFtaWx5LiBBIGZldyBjaGlwcyBjb3VsZCBub3QgYmUgc291cmNlZCwgSSBkZWNpZGVkIHRv
IGFwcGx5IHRoZQo+IHZlcnkgc2FtZSBsb2dpYyB0aGFuIHRoZSBvdGhlciBjaGlwcywgYWxsIG9m
IHRoZW0gYmVoYXZlIGlkZW50aWNhbGx5IGFzCj4gc2hvd24gaW4gYWxsIHRoZSBsb2dzIHRoYXQg
SSBhbSBzaGFyaW5nIGluIGVhY2ggYW5kIGV2ZXJ5IGNvbW1pdC4KPgo+IFRoaXMgc2VyaWVzIGlz
IHByZXR0eSBzdHJhaWdodGZvcndhcmQsIGl0IGlzIGhlcmUgdG8gY2xlYW51cCB0aGUgSlYKPiBl
bnRyaWVzIGJ5Ogo+IC0gQWxpZ25pbmcgdGhlIGNvbW1lbnRzIGFuZCAiZml4aW5nIiB0aGUgY2hp
cCBuYW1lcyBpbiB0aGVtCj4gLSBSZW9yZGVyaW5nIHRoZSBjaGlwcyBieSBkZW5zaXR5IGFuZCBm
YW1pbHkKPiAtIFRlc3RpbmcgYW5kIHNob3dpbmcgYWxsIHRoZSBTRkRQIGNvbnRlbnQgYW5kIHBh
c3NpbmcgYWxsIHRoZSBTUEkgTk9SCj4gICB0ZXN0cyB0byBlbnN1cmUgYSBnb29kIGxldmVsIG9m
IHN1cHBvcnQuCj4gLSBBZGRpbmcgYWxsIHRoZSBsb2NraW5nIGluZm9ybWF0aW9uIHdoZW4gaXQg
aXMgbWlzc2luZy4KPgo+IFNpbmNlIHYzLCB0aGVzZSBXaW5ib25kIGNoYW5nZXMgYXJlIHByZWZp
eGVkIHdpdGggY29yZSBjaGFuZ2VzLCB0byBtYWtlCj4gdGhlIHdob2xlIHN1cHBvcnQgd29yayB3
aXRoIGxlZ2FjeSBjaGlwcyBhbmQgU0ZEUCBjb21wbGlhbnQgY2hpcHMgYXQgdGhlCj4gc2FtZSB0
aW1lLgoKSSBjbGVhcmVkIHRoZSB3cm9uZyB2ZXJzaW9uIG9mIHRoZSBzZmRwIHRhYmxlIHBvaW50
ZXIgaW4gbXkgdjQsIFNhc2hpa28KY29tcGxhaW5zIGFkIG5hdXNlYW0gYWJvdXQgdGhhdC4gT3Ro
ZXJ3aXNlLCB0aGUgb3RoZXIgY29tbWVudHMgYXJlCmJ1bGxzaGl0LgoKSSdsbCBzZW5kIGEgdjUg
d2l0aCB0aGF0IHBvaW50ZXIgYXNzaWdubWVudCBmaXhlZC4KClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
