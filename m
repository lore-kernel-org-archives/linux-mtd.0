Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9A8D73E85
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 18:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMQzRDJ0SpNuEnunyhivkeyXe4xJ4GZ2rxZU65PNYhY=; b=tjkGP5EascRZ6n
	gz+XcJzSDt3NCDZv9ApHqc8+51Fk6/4EDtuSQPmYFdfRgFu+6Ikka2B0uvlZQ69hxOfp7APSdvOQ2
	xKjiWkhesxhvnoM93cBn7NsTr2hSE1WDzs5cC5B1hw9zXsfATqGrYi9O5EZHOzYKEGbSOK+wLzwm3
	w2vkifWTOFDu1Bfb7EH6mQK1BmHN2nFEcWAhh9lcqKnPJDQH2iGbm2ykEyJG3bKW7MwRDBjJH3fGT
	wXY13qaTcNWpXSBxBnFEQ7uwLBuvY8yLPirYMZWeboJtKd6SPFovU4ES4j6i4FXgiZoIbg6VRE94w
	df2qv56CL+FVIu2PJbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWgS-00000000W2F-0HAj;
	Thu, 29 Jan 2026 18:24:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWgO-00000000W1i-3065
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 18:23:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 893E6C22F4A;
	Thu, 29 Jan 2026 18:23:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72C9560746;
	Thu, 29 Jan 2026 18:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75F60119A880F;
	Thu, 29 Jan 2026 19:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769711023; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PwAfvLWWh+vXsUJysWI2dSAkatsBYIcqHbbEI9TtIXQ=;
	b=VXe7PT/gHSvQHqhDCuWuGxpwjardbAu9bpULdSZfiirUs14NdGeho4ivjzEcWsK7yl17Jr
	8xicnmreV2pohMU6Yb2GHuf7ODvdTuSQROGBbMJmQoSa+exJtUv0abo+bd6eYahRZNkQPd
	XUx9wePkVS6AO9JGjvV7CK7D+gZJGPMvnYK2TuyIsv2rNL0MPANiUSy9u8h9UNbeZ5XbpK
	2B9gbtCp+tcLK9f/LcgQbmXJB0UOgOtpJCcgk1LnNcjpd9tcZ3jQEeDPH+dB72LUv5wMxR
	ROzojCZrbqdhNt+E2yz8rDjS/ajK4ib5r/2U6y/QP4MMckmCSi3Y87nNPmI6rA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
In-Reply-To: <aXQak2FKyQpdQW2M@smile.fi.intel.com> (Andy Shevchenko's message
	of "Sat, 24 Jan 2026 03:04:19 +0200")
References: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
	<aXQak2FKyQpdQW2M@smile.fi.intel.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 19:23:39 +0100
Message-ID: <87ldhgl1lg.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_102357_619094_C1D8788F 
X-CRM114-Status: GOOD (  10.72  )
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

SGkgQW5keSwKCj4+IEZpeCB0aGlzIGJ5IGZhY3RvcmluZyBvdXQgZG9fd3JpdGVfYnVmZmVyX2xv
Y2tlZCgpLgo+Cj4gLi4uCj4KPj4gIAlYSVBfSU5WQUxfQ0FDSEVEX1JBTkdFKG1hcCwgaW5pdGlh
bF9hZHIsIGluaXRpYWxfbGVuKTsKPj4gIAlFTkFCTEVfVlBQKG1hcCk7Cj4KPiBJdCBzZWVtcyBt
b3JlIGxvZ2ljYWwgdG8gbGVhdmUgdGhlc2UgdHdvIGluIHRoZSBvcmlnaW5hbCBjYWxsLgo+Cj4g
Li4uCgpbLi4uXQoKPj4gKwlESVNBQkxFX1ZQUChtYXApOwo+Cj4gT3RoZXJ3aXNlIHRoaXMgd2ls
bCBzZWVtIGRhbmdsaW5nIGhlcmUuCj4KPj4gIAlwdXRfY2hpcChtYXAsIGNoaXAsIGNtZF9hZHIp
Owo+PiAgCW11dGV4X3VubG9jaygmY2hpcC0+bXV0ZXgpOwo+PiAgCXJldHVybiByZXQ7Cj4KPiAu
Li4KPgo+IEFub3RoZXIgYXBwcm9hY2ggaXMgdG8gbGVhdmUgZ290byBhcyBpcyBpbiB0aGUgX2xv
Y2tlZCgpIGFuZCBtb3ZlIERJU0FCTEVfVlBQKCkKPiB0aGVyZS4KPgo+IFRlbGwgbWUgd2hhdCBk
byB5b3UgcHJlZmVyPwoKV2hpbGUgSSBhbHNvIGZpbmQgbW9yZSBsb2dpY2FsIHRvIGtlZXAgdGhl
IEVOQUJMRV9WUFAvRElTQUJMRV9WUFAKdG9nZXRoZXIsIEkgZG8gbm90IG1pbmQgdG8gc2VlIHRo
ZW0gaW4gb25lIHNpZGUgb3IgdGhlIG90aGVyLiBJIHdvdWxkIGJ5CmRlZmF1bHQgbGV0IHRoZW0g
aW4gdGhlIG1haW4gY2FsbGVyIGFuZCBzdWZmaSB0aGUgaW5uZXIgZnVuY3Rpb24gd2l0aAoiX2xv
Y2tlZCgpIiBhcyB5b3UgZGlkLCBidXQgSSdtIGZpbmUgZWl0aGVyIHdheXMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
