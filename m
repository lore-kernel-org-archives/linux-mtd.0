Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16DC104950C
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDzXnLYQPv7l++iCD1/tof1tzXY8DsS5HIvPkFfW69k=; b=IOy7FInP1dmNi8
	N0aktH3tWqYaCceU8ek7VLztp15L1q/OguKp8945PNvGzr10YS0tc3h2RYO9xnXYJH8F611aS6B34
	B2L+0TaQIavk2BCIBjk7u1MqXi57tOJ1e8zcO1f2yOiNkzOao4MlqWaAv/IWa0yNJUjkiplTSzuRj
	+fvnX1DILUa9Yfjew5C4Usj+bL0DNaeAdDAj6ZUgQCSTOkuViZ0rnHPwsxjUr0bLJDU/r3yU5T2ug
	F4eQyxKWEnheuGbGR7E1vFamgYToIQKiFVvZvo1+DE2PXDmTQ+0h1I641HHpbZ9dnpYqEBObmqYbl
	DotYx7hANp6QK67RE84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FZZ-0000000BEPl-0XiB;
	Wed, 11 Mar 2026 09:09:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FZV-0000000BEOb-3o2j
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 09:09:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D7E02C41586
	for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2026 09:09:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBC660004;
	Wed, 11 Mar 2026 09:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0600C103688EF;
	Wed, 11 Mar 2026 10:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773220178; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NXXBa7gfYJPSSz7i+5CSrIO1QdFi6SPXZ/DMiVtq8sE=;
	b=kdi0oC0pE947/DHSgqNwUdEgdrUS5fpagrZm/62qzDwqPw4pIBw9AfpAbQdeLSIvPpA0OB
	neAr8G26Ms4XHAepzwDZXFp9e510k8BFJEHH9XanGrPR+vEZCD1BcDDw9e7Vu/ftn9T5Jq
	r/0OyocCVFoci3MGA7nz8yOWMOPUfT4m6HFxy1AkO8LFQYFT9prQpiTcfrHGMvtPr8Re6C
	4PAyY9a0onoYtcIKFL3vxXuOjQlxajNCJ9GnbULSXrFoTkKbSFxr79q3OYDbOZ2XtQmRvs
	R++V4bwyBo390D293ADBRXAyS3Otu/RMtU8CV+dsHS4sREhaxBAyjCQltAY7bg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 1/1] mtd: physmap: physmap-bt1-rom: Remove
 not-going-to-be-supported code for Baikal SoC
In-Reply-To: <abAEN7_1aQjSxYhc@ashevche-desk.local> (Andy Shevchenko's message
	of "Tue, 10 Mar 2026 13:44:55 +0200")
References: <20260225162406.3815267-1-andriy.shevchenko@linux.intel.com>
	<abAEN7_1aQjSxYhc@ashevche-desk.local>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 11 Mar 2026 10:09:35 +0100
Message-ID: <875x72n35c.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_020942_084590_1BD18CD8 
X-CRM114-Status: UNSURE (   8.85  )
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

T24gMTAvMDMvMjAyNiBhdCAxMzo0NDo1NSArMDIsIEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKCj4gT24gV2VkLCBGZWIgMjUsIDIwMjYg
YXQgMDU6MjM6MzRQTSArMDEwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+PiBBcyBub3RpY2Vk
IGluIHRoZSBkaXNjdXNzaW9uIFsxXSB0aGUgQmFpa2FsIFNvQyBhbmQgcGxhdGZvcm1zCj4+IGFy
ZSBub3QgZ29pbmcgdG8gYmUgZmluYWxpemVkLCBoZW5jZSByZW1vdmUgc3RhbGUgY29kZS4KPgo+
IENhbiB0aGlzIGJlIG1vdmVkIGZvcndhcmQ/CgpZZXMsIEkgcmV2aWV3ZWQgaXQgYW5kIEkgcGxh
biB0byBhcHBseSBpdC4gSSB3aWxsIGRvIGEgcm91bmQgb2YKYXBwbGllZC90aGFua3Mgc29vbi4K
CkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
