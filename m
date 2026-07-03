Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD99C43458
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jul 2026 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcRQ29jkmKg/BFovGcAJ6/YKUW0M1IHmRCBKcjDoR3c=; b=DbuUYqmFUPpB9T
	DaHMCQWIELhw0iuYLJxUBMqyVdtjSixaojLQ8gOwDPT0+kp3c5uAhOcoq+q/Dup6FWX5spZXmaxAl
	bwzrA8/Lt0P966AnWnBcy8EJIVap/EMq16JZ0utRik0u8FfoLj5XDteEK7gp1QhuEK0B2vBq68kHQ
	AuIZrjWhPOvpGbh4FqZO/HXT9ywgCOBDQ6BpqRZdjeIezFoTil/VVISdrBQC5e9npbpqMPIiOpuDz
	TgXZXn7Qa+uUDRmQ7R1/zBDTtqgozHi8lOSkarBg76IRyBPDgP4zjS4fQnFs3uob7GSQxkHV6eMIp
	huGrPhtFDKE9bDdOnO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcMA-00000006qdt-0WLp;
	Fri, 03 Jul 2026 11:46:54 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcM7-00000006qd1-1WRz
	for linux-mtd@lists.infradead.org;
	Fri, 03 Jul 2026 11:46:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 128E3C79ABE;
	Fri,  3 Jul 2026 11:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47CE660300;
	Fri,  3 Jul 2026 11:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69BCB104C948C;
	Fri,  3 Jul 2026 13:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UG+zoCgKPEafKRYJiQQaqScXAazAfh69SykFGcgr/A4=;
	b=T0olp4BWSqvPj19tQuYezFaQIFkeDO8uatlBlmcFjda6F3hlgchYay/CLWUAG43Mb4uPX+
	jRruOug1LwBwWM7d6KH7bEFxG+Ebiab29OrsYMLp1WKN1+5DiqGMZPAL5vXyoWqmmTXjEW
	bkfFOG26I7ZlUxsOZ9eyAta68Rz15VwfZX5WbCR3q73NU9keH/S2jE/FBIwBgp5GY8m4Wc
	eoOiqSGka7s8QtaLvMZ+W3Yvnl6cfpwhP19ULAJo2Q27TcPH7GFcxEeUG1THvARPHdeKk8
	69iV8Pcl8OiPnegCHS6+Mqa3fuo5bsLyzC91QqQbDsJVJ4ADb8EBxlG72MYNXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Ungerer" <gregungerer@westnet.com.au>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Randy Dunlap" <rdunlap@infradead.org>,
  "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  linux-m68k
 <linux-m68k@lists.linux-m68k.org>,  "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 25 Jun 2026 16:10:54 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
	<20260526103227.3152003-2-arnd@kernel.org>
	<b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
	<f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Jul 2026 13:37:51 +0200
Message-ID: <871pdknw1c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_044651_738235_F54972E8 
X-CRM114-Status: UNSURE (   5.07  )
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

SGVsbG8sCgo+PiBDYW4gd2UgZ2V0IHRoaXMgcmV2ZXJ0ZWQ/Cj4KPiBZZXMsIG9mIGNvdXJzZS4g
TWlxdWVsL1JpY2hhcmQvVmlnbmVzaCwgc2hvdWxkIEkgc2VuZCBhIHJldmVydCBvcgo+IGNhbiB5
b3UganVzdCBhcHBseSBvbmUgd2l0aCBHcmVnJ3MgZXhwbGFuYXRpb24gYW5kIG15IEFjaz8KPgo+
ICAgICAgQXJuZAoKSnVzdCBzZW50IGEgcmV2ZXJ0LCBJIGhvcGUgSSBnb3QgaXQgYWxsIHJpZ2h0
LgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjYwNzAzLXBlcnNv
LXJldmVydC11Y2xpbnV4LW1hcC12MS0xLTJiN2Q0NmYyMDQ2NUBib290bGluLmNvbS9ULyN1CgpD
aGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
