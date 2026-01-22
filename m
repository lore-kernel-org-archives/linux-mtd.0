Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC9D3EE6A
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EWP1okcrxyxeVDaOrm8WAetYu5MAfUs9PFVmZEiTlg=; b=B5DvmqjHqa1nwe
	ErYk2NQS0EItvqTxx6qpGSq+6Ybb06KipMpGlUsQxvdX87U3aFylft9IIErMz+ez5eVlfG7LvsOZP
	z5t3V9r2fCp0cSxcfX49JZxIsnG9fv/rRJ0P+pHOOxG4878dx/+4IVROfMl2acZQFMxPmVX+3/Sfh
	FSTJEdb7QhHLsLTE9b4fBq6mBAuX5ZqRhTdvl3Kuk6DSW9o6PuGYZaVMb/mCZL8K4yQRpmnO6pBO5
	jcJsrHEHWe9xYBOewa+VhFC8InlmFCQTxzCqAaS5L+TXAVBNi07NnTKhsZwby+O07ZNh6sXYN8sAm
	rTmf5oeKRf6fv+M/ezHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN6-00000007CkE-1KDS;
	Thu, 22 Jan 2026 14:09:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivN3-00000007Cj5-3QDJ
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 14:09:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 028BFC21AA6
	for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2026 14:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B218606B6;
	Thu, 22 Jan 2026 14:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03346119B8240;
	Thu, 22 Jan 2026 15:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769090949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iHO7nBudIFAHyupSEh4DusTlJ57oYBSwMMC588DWM9c=;
	b=aosF5l9ux0Dq40Eqr5Bmo0ioYdhFqmE84eK+LnOR59VV1VujK4FsrIwP0XpY7VDFyljNbl
	8oOlmxXuurcHNmPxD9jecSrSpUAZGixzdue6rxUaUidWv4dVewYdCxhLEmq5lETA57CbWQ
	tj7L5HaxnpGEUTjv/6oqLYlQuf9PnaWZSVxo7NDcTdTfSk+04bQYhdgaIR+IP0bz5gCv1O
	qKxA/vK11CDHngnHgYXhl4iVuiZK9uKGKVEyCDqKI3WxdWyfof14o37e2r52tX4FWGXuec
	M1WBlY3ZqvF4qaKC10PUXruQuhEdXJTDiliUyBZU/3iwUWuuiDWPoCnMxQCo9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
In-Reply-To: <20260122130950.758563-1-zilin@seu.edu.cn>
References: <20260122130950.758563-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] mtd: parsers: Fix memory leak in
 mtd_parser_tplink_safeloader_parse()
Message-Id: <176909094718.3112602.6286521531293114573.b4-ty@bootlin.com>
Date: Thu, 22 Jan 2026 15:09:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_060913_995194_74B73E4E 
X-CRM114-Status: UNSURE (   8.32  )
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

T24gVGh1LCAyMiBKYW4gMjAyNiAxMzowOTo1MCArMDAwMCwgWmlsaW4gR3VhbiB3cm90ZToKPiBU
aGUgZnVuY3Rpb24gbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9wYXJzZSgpIGFsbG9jYXRl
cyBidWYgdmlhCj4gbXRkX3BhcnNlcl90cGxpbmtfc2FmZWxvYWRlcl9yZWFkX3RhYmxlKCkuIElm
IHRoZSBhbGxvY2F0aW9uIGZvcgo+IHBhcnRzW2lkeF0ubmFtZSBmYWlscyBpbnNpZGUgdGhlIGxv
b3AsIHRoZSBjb2RlIGp1bXBzIHRvIHRoZSBlcnJfZnJlZQo+IGxhYmVsIHdpdGhvdXQgZnJlZWlu
ZyBidWYsIGxlYWRpbmcgdG8gYSBtZW1vcnkgbGVhay4KPiAKPiBGaXggdGhpcyBieSBmcmVlaW5n
IHRoZSB0ZW1wb3JhcnkgYnVmZmVyIGJ1ZiBpbiB0aGUgZXJyX2ZyZWUgbGFiZWwuCj4gCj4gWy4u
Ll0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcGFyc2VyczogRml4
IG1lbW9yeSBsZWFrIGluIG10ZF9wYXJzZXJfdHBsaW5rX3NhZmVsb2FkZXJfcGFyc2UoKQogICAg
ICBjb21taXQ6IDk4MGNlMmIwMmRkMDZhNGZkZjVmZWUzOGIyZTE0YmVjZjljZjdiOGIKClBhdGNo
ZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFy
dCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhl
bikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
