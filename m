Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F929D49205
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arADhc9RO38Jpa8mTG/3Y491QTkCAonYwphs5biqWU8=; b=afrBtebksRs8px
	PGY9vP73GfHqrPWIxwn9DtCOLUnq6jBMLcqhdPzQiPFE0HxUwtc9XqwkS9ltBUzTWWjfLpEr3pHiQ
	CkSesDCJt2OAmwILj0BK1ibYnCSJXsPJoDYBF7u2g6GJJ7gVX+pR7GSWXELHughyaTqmRVtNXyAQM
	6eTTA3ZqHwTfEIj8VNpSMcYg18z1wt0Etb5cu0aJ9z5VjJVBieNmO+m7BYKsCAUI3Svj+JaJWqlgf
	Za1C4/VZMjQjFbh3LX9u9BU3JRCm+vJZUrHWeTvtD6jRu1MY902c18PyPpIACb5Li4soBWwV+iVuY
	REoOYU72V4I++kL9rZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCynQ-000000092oT-0uDE;
	Mon, 18 Nov 2024 10:15:52 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCymg-000000092gA-41Ec
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:15:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 525706000D;
	Mon, 18 Nov 2024 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731924903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fj2uUiFmkbeg5lVUVotw2IvijW0/06lt3zzXM5D2Ujw=;
	b=W/gS2zREqtrfpNSW72krlOAfn9iQRConqSvn+kdOfPrTcQB8GJzFhSg2+P0NscuMYeXgzV
	S/FpK1uNsYgCprZjbE883iThzxF5F3yIU7xGz5Xvc5mbj4BPsM9KliPc3kX5nN8ksSycaw
	mBXuPAMXuMjbnjKIZIv6KQQlFCygbphfp0VCxORF/2cNNkXkDruMBgvGwoGo6Gc1FwUe7m
	hePPjRcHA8UBPIxuqYTcK/4uEP3dhd1P1MvNlf/eyDv8ABbuJpxvqvyb1uhjNcgc4Wdmm8
	qvrufwDD6ScN1oZGZhG4tuuXFFVaXteHCmSy0y3a+LjhvC/hExlStSTE9Dj+3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andreas Oetken <ennoerlangen@gmail.com>
Cc: Andreas Oetken <andreas.oetken@siemens-energy.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: core/part: trying to delete partition with
 usecount > 0 corrupt partition
In-Reply-To: <20241115085516.1852668-1-andreas.oetken@siemens-energy.com>
	(Andreas Oetken's message of "Fri, 15 Nov 2024 09:55:13 +0100")
References: <20241115085516.1852668-1-andreas.oetken@siemens-energy.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:15:00 +0100
Message-ID: <87ldxg26hn.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_021507_139130_8D863FFF 
X-CRM114-Status: UNSURE (   7.36  )
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

SGkgQW5kcmVhcywKCk9uIDE1LzExLzIwMjQgYXQgMDk6NTU6MTMgKzAxLCBBbmRyZWFzIE9ldGtl
biA8ZW5ub2VybGFuZ2VuQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IENoZWNrIGZvciB1c2Vjb3VudCBi
ZWZvcmUgZGVsZXRpbmcgZGVidWdmcyBhbmQgc3lzZnMgZW50cmllcy4KPiBPdGhlcndpc2UgZGVs
ZXRpbmcgdGhlIHBhcnRpdGlvbiBhIHNlY29uZCB0aW1lIGxlYWRzIHRvIGEga2VybmVsCj4gcGFu
aWMuCgpXaGF0IGtlcm5lbCB2ZXJzaW9uIGFyZSB5b3UgdXNpbmc/IEkgYmVsaWV2ZSB0aGlzIGJ1
ZyBubyBsb25nZXIgZXhpc3RzCmluIG1haW5saW5lLiBMZXQgbWUga25vdyBpZiBJIGRpc3JlZ2Fy
ZGVkIHNvbWV0aGluZyB0aG91Z2guCgpUaGFua3MgZm9yIHRoZSBwYXRjaCBhbnl3YXksIGl0IHdh
cyBjbGVhbi4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
