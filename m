Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F365CD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzX/2ehPJdEOyxF7unQQAlftYDWskUOIVRu2Dl5c5qs=; b=KqjQiIePGbXBXp
	t7Mqkj92zoAX7zV18HZ5iuc85YX+rjWa6t7KdiQB2j/tbGcePqm0COipGf5s0YMu75+13mF03ygW5
	XE0mmCzdl8cWFBrV6wof7k1TCPuO5297jBrXamvup4qp7CaolmArQPoGeCONr0LEwLwjqEeA7plAR
	ZaKrvUYOFMFMpZ8dCweIqwei36oH599pkZxxSDbLIP/OYthlOnXt6ttk0Uqor4iRE7JPJGViCGYtg
	vaydHEQnNZgdysoO1yDPHD8wPh1rh2Qj/pOlq8t1xrN8IRe3rIKJvsax5GmfeQtKJeXUmzH/0MAz8
	8+AL83GzbRgw4eNrnCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANq-00000003cG3-1PDB;
	Wed, 27 May 2026 09:17:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSANm-00000003cDd-3x9K
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:17:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AABA5C2C65F;
	Wed, 27 May 2026 09:16:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF7A3601A1;
	Wed, 27 May 2026 09:16:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09E8E10888BC5;
	Wed, 27 May 2026 11:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GbTDcyRN+pwYIqHwBuEVnkoEGZMsjo4Wi5DFh923zPQ=;
	b=DdYo1G6agQWVQ4ekkmNvAiDoFsiHpwvD99qANiJYuLEhL1fm4HK5jKZ2z6dTkyiNXPnofP
	Xaw3IHsppHxCdyH+83DnWv+cqAYFf48Y21hLUA3uV6oMDKDAR4UIXwRin1epD87Y3RBws8
	RdyNTIHpFTxD+s+ld2jvDeXtRwuWi40f+8z/srR29KnYTDVnK3HWjbI0d29dlNUlI7B66d
	E1XtjxZH12MgEDXkcs0CQZKGH7Bmtdpqwb7QaLID6CYBP/E/BVu08/l2J+gfAlnU10iCK+
	8NlctyWmHP4C93W4i1k7v9FndqZmn2IQEU7eF8Y99zWvJKjmsPxpFNOO2wI8SA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Li Xinyu <xinyuili@126.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260526094540.1974076-1-xinyuili@126.com>
References: <20260526094540.1974076-1-xinyuili@126.com>
Subject: Re: [PATCH] mtd: inftlmount: convert printk(KERN_WARNING) to
 pr_warn
Message-Id: <177987341393.3989888.4597384360688320284.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:16:53 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_021659_140061_34A112B3 
X-CRM114-Status: UNSURE (   5.56  )
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

T24gVHVlLCAyNiBNYXkgMjAyNiAxNzo0NTo0MCArMDgwMCwgTGkgWGlueXUgd3JvdGU6Cj4gUmVw
bGFjZSBhbGwgcHJpbnRrKEtFUk5fV0FSTklORyAuLi4pIGNhbGxzIHdpdGggcHJfd2FybigpIHRv
IGZvbGxvdwo+IHRoZSBrZXJuZWwncyByZWNvbW1lbmRlZCBsb2dnaW5nIHN0eWxlIGFuZCByZXNv
bHZlIGNoZWNrcGF0Y2ggd2FybmluZ3MuCj4gQWxzbyBjb252ZXJ0IG9uZSBiYXJlIHByaW50aygp
IHRoYXQgd2FzIG1pc3NpbmcgYSBsb2cgbGV2ZWwuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
Cj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDog
aW5mdGxtb3VudDogY29udmVydCBwcmludGsoS0VSTl9XQVJOSU5HKSB0byBwcl93YXJuCiAgICAg
IGNvbW1pdDogZmYxMTFkYzIxNTg1NjJkZGM1ZTk5ODhjMjZiNGMwYTljZDlmOTc4YwoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
