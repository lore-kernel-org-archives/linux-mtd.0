Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17917F53D70
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mBpO1hFkVIhR4A2F9JruLt/2YCRVoYfUreLmHATM7M=; b=f3MaJxpGw9gnRw
	hHqz+vNo9GwYHNMkbgt1++4oobXEP1xh+4WrGg9pVv3PibHVbP7oVtkfgaZn1QRTsO3QrE0W3ajbb
	G2uAnHlJDOZyfFPgwm/beIGk4TN67C3JlAznO07Z6Ia9tzVHFkDIkVnK9Ja9Gx/HzkFnsyBhD+UNn
	WzvZlpbZykJMumf8E2BX/GvecmNrvuFCN1ZbeQWGEPAjmC43AJBZygWb8KGBmAr51rZfyhsEPpKFK
	xvdNpHMi1XEYLMrkZwE23iB0y6O/j/ECuTQLGWAqc3RfBQ73Hac4LV85CJr/TRbQJDolat7BpRrQs
	MMqDWFFbq1XOGW4xIBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Aws-00000004TK4-1kyQ;
	Mon, 16 Mar 2026 16:37:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Awp-00000004TJR-1Ndu
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 16:37:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 084131A2E70;
	Mon, 16 Mar 2026 16:37:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD5185FC4A;
	Mon, 16 Mar 2026 16:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 865CA103721FE;
	Mon, 16 Mar 2026 17:37:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773679058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dvVMeITPtgPkUpFh4ig5rTxZCHMHxmPJ/z+4JGRTcLo=;
	b=StJZrd4VbcHwkTwmYj1aPFLySYohsGgcVlajNXmEsHVsuvvU4te0djn6ISdIsYy9m+fl48
	UEhTDv0B6kgk9T8kwHXMXm+2+PLFKHvXm4ouXo7+h37U4HKZKrz3jAXW5sFSBxFzd2twIt
	4CvydloqaiP+KYn3gD9rJZmmTRRxkQ0RQ5JiqpvXHffSirSJO4b312IL19aWNetwQep0jq
	xXoYEcxx3mENrdFEoavvMq//1y9EtY+xPVRGkmfs/wvI7zyYVzlFCjn79WRYoHw8V6iY2Z
	drRSYZF8KNrOYnqZ+kVb6lslZfwWdF6pI7XxMEFrukr14gFCzlhddwL8RcwBDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Kees Cook <kees@kernel.org>, 
 Weigang He <geoffreyhe2@gmail.com>, Daniel Palmer <daniel@thingy.jp>, 
 Benjamin Krill <ben@codiert.org>, 
 David Woodhouse <David.Woodhouse@intel.com>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260311153957.1984446-1-cosmin-gabriel.tanislav.xa@renesas.com>
Subject: Re: [PATCH 0/2] MTD fixes for OF node refcounting
Message-Id: <177367905372.156388.16440643358794352938.b4-ty@bootlin.com>
Date: Mon, 16 Mar 2026 17:37:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_093743_503171_17EA3F70 
X-CRM114-Status: UNSURE (   9.76  )
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

T24gV2VkLCAxMSBNYXIgMjAyNiAxNzozOTo1NSArMDIwMCwgQ29zbWluIFRhbmlzbGF2IHdyb3Rl
Ogo+IFRoaXMgc2VyaWVzIGZpeGVzIGFuIGlzc3VlIG9ic2VydmVkIHdoaWxlIHJlcGVhdGVkbHkg
YmluZGluZyAvIHVuYmluZGluZwo+IHRoZSBTUEkgY29udHJvbGxlciBkcml2ZXIgdG8gd2hpY2gg
YSBTUEkgTk9SIGZsYXNoIG1lbW9yeSBpcyBhdHRhY2hlZCwKPiBjYXVzZWQgYnkgY29tbWl0IDdj
Y2U4MWRmN2QyNiAoIm10ZDogcGFyc2Vyczogb2ZwYXJ0OiBmaXggT0Ygbm9kZQo+IHJlZmNvdW50
IGxlYWsgaW4gcGFyc2VfZml4ZWRfcGFydGl0aW9ucygpIikuIFNlZSBwYXRjaCAyIGZvciBtb3Jl
Cj4gZGV0YWlscy4KPiAKPiBQYXRjaCAxIGlzIHRoZSBmaXggZm9yIGFub3RoZXIgdGhlb3JldGhp
Y2FsIGlzc3VlIEkgaGF2ZSBub3RpY2VkIHdoaWxlCj4gZGVidWdnaW5nIHRoZSBtYWluIGlzc3Vl
Lgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8yXSBtdGQ6IHBh
cnNlcnM6IG9mcGFydDogY2FsbCBvZl9ub2RlX3B1dCgpIG9ubHkgaW4gb2ZwYXJ0X2ZhaWwgcGF0
aAogICAgICBjb21taXQ6IDBjODdkZWExYWFiODYxMTYyMTFjYjM3Mzg3YzQwNGM5ZTkyMzFjMzkK
WzIvMl0gbXRkOiBwYXJzZXJzOiBvZnBhcnQ6IGNhbGwgb2Zfbm9kZV9nZXQoKSBmb3IgZGVkaWNh
dGVkIHN1YnBhcnRpdGlvbnMKICAgICAgY29tbWl0OiBlODgyNjI2YzE3NDc2NTNmMWYwMWVhOWQx
MmUyNzhlNjEzYjExZDBmCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGlu
dXguZ2l0IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8g
cm9ib3QgY29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
