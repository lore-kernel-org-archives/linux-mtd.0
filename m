Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BF7C61DBD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lWJxXYYa1yTNqZGXdLXS1I7/S7GcuB/oH0oCBSq1RM=; b=Oqyvya/89/5eeJ
	/6JFGecBNmN5XXaXd9XcrbOwSTu6KJ2QGJy8yNZqf3ZUJyKSDKe7oKN4puxvU9JwWF/uMZLPxjn3u
	wKjXdfoasD7aWRVEWfryQCwhWJXEfrEgMxnVPtZBeeXIyhCwJ7oefWiW73tVRBdKy9WZCO3QfdDTP
	U2t1zafM0fkizR108iQZ+MU9KRJh/pfqTTSB4jny02/PV4dVOdnPaymNxDhG1moFo6/S7DPxDTTce
	zssxZbM+qWRBQbEz85XBpgpbimfd9qikVXXwzoeBaM7sWszXe4HDKfvytUOR53RO72MOmJUwcYtUR
	ZIMF1ZN4UXQfbJyZgR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqNd-00000000mv7-1fgg;
	Tue, 25 Aug 2026 12:35:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyqNa-00000000mtY-1e6O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 12:35:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 533C94E4137A;
	Tue, 25 Aug 2026 12:35:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F16B604C4;
	Tue, 25 Aug 2026 12:35:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F364511C79335;
	Tue, 25 Aug 2026 14:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787661343; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3OJtt0xiX5fif9iuFEdnCMWb/FO+kzZFhvV69mHkujE=;
	b=qB5nr1hGxRMJp5K42Q1o9VLQkUe+S2RA+Mhwnzs7h684WHWsHKYPEcQpALHoVnlWLVPzlp
	M7NkFFctUQkDZ4P9u+yAtfn24u1Teblk0g5octp6h9TLQxt07NE0d41Zj1+ZKEotQZPXIG
	rdctE91h/NSRoS47wYpjCcgNBCDzxsa1HjaHrq6ZGFJFTSix/G7iBxZp6NC/vZ9YBYySje
	wnTeCZMLif+mch2cQRTTl3vL2pq0chzkVBNlRvw0QVWJi2Y2WqulBQMnANqagtBgDbTmOx
	+PlHA2q1Stu6UOqPsyVaPA7JNBDlaFAI97acQeCFxtUt5JTtqje0o21Rv2Xjmw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Lukas Wunner <lukas@wunner.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: shrink do_write_buffer() stack frame
In-Reply-To: <20260824085632.2dd08ba9@pumpkin> (David Laight's message of
	"Mon, 24 Aug 2026 08:56:32 +0100")
References: <20260824014703.56502-1-kmehltretter@gmail.com>
	<20260824085632.2dd08ba9@pumpkin>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 14:35:33 +0200
Message-ID: <87o6eqgyy2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_053550_629093_5541252F 
X-CRM114-Status: GOOD (  11.70  )
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

SGkgRGF2aWQgJiBWaWduZXNoLAoKT24gMjQvMDgvMjAyNiBhdCAwODo1NjozMiArMDEsIERhdmlk
IExhaWdodCA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwg
MjQgQXVnIDIwMjYgMDM6NDc6MDMgKzAyMDAKPiBLYXJsIE1laGx0cmV0dGVyIDxrbWVobHRyZXR0
ZXJAZ21haWwuY29tPiB3cm90ZToKPgo+PiBhcm0zMiBhbGxtb2Rjb25maWcgZmFpbHMgdG8gYnVp
bGQgd2l0aCBnY2M6Cj4+IAo+PiAgIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMS5j
OjE4ODM6MTogZXJyb3I6IHRoZSBmcmFtZSBzaXplIG9mIDEyOTYKPj4gICBieXRlcyBpcyBsYXJn
ZXIgdGhhbiAxMjgwIGJ5dGVzIFstV2Vycm9yPWZyYW1lLWxhcmdlci10aGFuPV0KPj4gCj4+IFdp
dGggTVREX01BUF9CQU5LX1dJRFRIXzMyIGEgbWFwX3dvcmQgaXMgMzIgYnl0ZXMsIGFuZCB3aXRo
IEtBU0FOX1NUQUNLCj4+IGV2ZXJ5IHRlbXBvcmFyeSBnZXRzIGl0cyBvd24gcmVkem9uZWQgc2xv
dC4gIGRvX3dyaXRlX2J1ZmZlcigpIGJ1aWxkcyBhCj4+IG1hcF93b3JkIGZvciBlYWNoIG9mIHRo
ZSB0d2VsdmUgY29tbWFuZHMgaXQgaXNzdWVzLCBhbmQgdGhvc2UgdGVtcG9yYXJpZXMKPj4gZG9t
aW5hdGUgaXRzIGZyYW1lLgo+Cj4gTG9va3MgdG8gbWUgbGlrZSBwcmV0dHkgbXVjaCBhbGwgb2Yg
bXRkL21hcC5oIHNob3VsZCBiZSByZWFsIGZ1bmN0aW9ucwo+IGFuZCBub3QgI2RlZmluZXMgb3Ig
aW5saW5lcy4KPgo+IFRoZSBibG9hdCBmcm9tIGFsbCB0aG9zZSBleHBhbnNpb25zIGlzIGdvaW5n
IHRvIGJlIHNpZ25pZmljYW50Lgo+IFRoZXkgb25seSB0aW1lIHRoZXkgZ2V0IG9wdGltaXNlZCB0
byBhbnl0aGluZyBzbWFsbCBpcyB3aGVuIG9ubHkKPiBDT05GSUdfTVREX01BUF9CQU5LX1dJRFRI
XzEgaXMgc2V0Lgo+Cj4gVGhlIGV4ZWN1dGlvbiB0aW1lIG9mIGFsbCB0aG9zZSB0aGF0IGRvIHJl
YWwgaW8gKGVzcGVjaWFsbHkgcmVhZHMpCj4gd2lsbCBiZSBkb21pbmF0ZWQgYnkgdGhlIGlvIGFj
Y2VzcyBpdHNlbGYuCgpEYXZpZCwgbWF5IEkgYXNrIGlmIHlvdSBhY2tub3dsZWRnZSB0aGUgZml4
PwoKVmlnbmVzaCwgc2FtZSBxdWVzdGlvbiwgbWF5YmUgeW91IGFsc28gdGVzdCB0aGF0IHRoZXJl
IGlzIG5vIGFwcGFyZW50CnJlZ3Jlc3Npb24/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
