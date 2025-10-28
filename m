Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597BCCCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fy/7/ZWilqvFBc+RiqAI8jB+8ZQlmqE/SfIw/aVWy8=; b=hVg4Ml6PqZqj9m
	/A/+vFDFa8GiXXtWskxnftb+D+cUCpORlLtn2qRDjyZBekB8W2ryCQOIaC/IIkspsxIQwwCO2+uXz
	/465/npo/T4j5gtxwA93B3JXc7V3a00lRocMc8w5Z/ZUq7d/hK4IB5080oN3oXF5ee1Rcf7UK+lsW
	iW+m4+fpK0QO2b6y+U/cENlsEnjH1ug66du33FgdD0TOlwrb9a+kYICsySBouNWrETjQWGfSokGhH
	JVVKeL53hb3BOViFzowko98Vi3eL8yV8We473jMTeO3DIdiULTmTblsRBAhLcCEOj3jKBx83T+Ray
	yN4Y4sHHZEAd0YFPEuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmgG-0000000GL9S-0BlC;
	Tue, 28 Oct 2025 16:36:20 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmgC-0000000GL8p-0yXo
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 16:36:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9D1A6C0BEA4;
	Tue, 28 Oct 2025 16:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D88BE606AB;
	Tue, 28 Oct 2025 16:36:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4412D102F2428;
	Tue, 28 Oct 2025 17:36:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761669373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Jy+hJl/47FF6YCBFsdI0OKPe5NPf2NSP+WXuhFA827s=;
	b=O178C92kv0neOXHpUUG93PzeK+Yj7CrkAj0A22eXLcL0wouUiRTksR2zSf7SMaJBP+x7Tl
	PCOXlXO1tkF6GXT273wlmPLQj/jNgsQ4L46FnONQEISHtzXJLKpGqQ/pjutEK29/FO00WJ
	bD1VTQ90XeRpwI0YZK8/VXSLeyPzNEPMqZaB9BRbKdhY9kfT4n7jhtIl6Xk1hhPs+RNA5Q
	LG5LvbFlMx9XsOh1h+foQHanN47Y/yF4WQQ7SaSrs4lBEiQE/KVnz5qiH7OPvzFwoSi1bK
	OTM6GmddaysBzYwaIt4U+Fxj8STjINIcEvRbMSOVJ4rM4Q21yiI+ly5alA1DXQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Reuven Abliyev <reuven.abliyev@intel.com>
In-Reply-To: <20251023122103.3922113-1-alexander.usyskin@intel.com>
References: <20251023122103.3922113-1-alexander.usyskin@intel.com>
Subject: Re: [PATCH v3] mtd: intel-dg: wake card on operations
Message-Id: <176166936945.372081.4265876378064521705.b4-ty@bootlin.com>
Date: Tue, 28 Oct 2025 17:36:09 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_093616_884619_D62BA7D5 
X-CRM114-Status: UNSURE (   8.58  )
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

T24gVGh1LCAyMyBPY3QgMjAyNSAxNToyMTowMyArMDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3Jv
dGU6Cj4gVGhlIEludGVsIERHIGNhcmRzIGRvIG5vdCBoYXZlIHNlcGFyYXRlIHBvd2VyIGNvbnRy
b2wgZm9yCj4gcGVyc2lzdGVudCBtZW1vcnkuCj4gVGhlIG1lbW9yeSBpcyBhdmFpbGFibGUgd2hl
biB0aGUgd2hvbGUgY2FyZCBpcyBhd2FrZS4KPiAKPiBFbmFibGUgcnVudGltZSBQTSBpbiBtdGQg
ZHJpdmVyIHRvIG5vdGlmeSBwYXJlbnQgZ3JhcGhpY3MgZHJpdmVyCj4gdGhhdCB3aG9sZSBjYXJk
IHNob3VsZCBiZSBrZXB0IGF3YWtlIHdoaWxlIG52bSBvcGVyYXRpb25zIGFyZQo+IHBlcmZvcm1l
ZCB0aHJvdWdoIHRoaXMgZHJpdmVyLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0
aGFua3MhCgpbMS8xXSBtdGQ6IGludGVsLWRnOiB3YWtlIGNhcmQgb24gb3BlcmF0aW9ucwogICAg
ICBjb21taXQ6IDNlOWM0OWQ0YzMwNjNkY2Y3ZGRjZGVhNGM1ZTNhYTIxZWFlMzU5ZDAKClBhdGNo
ZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFy
dCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhl
bikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
