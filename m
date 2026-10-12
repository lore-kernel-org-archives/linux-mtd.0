Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67A6CC6B1A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MA7Cx4SygFXDVmU+pb/FSRAbN8X5TSlmL8WJ0UeCb6M=; b=OEl9ykO3TCDdHb
	PNS3+n0WzWm5j4eGfgIiT3fdok8dsgHEbeqb8Nin90nO853K1PD5xbZoYI2fPrzbscnjUDbUnk0vd
	eWK8rTm9EK46qAXZpfZojzZAIriHhV9heth7qG+Atqk+LZEm2ck0v7JGQVodJL7EctWD7smGmP8eF
	z9hwxq/8D3wii0U3Y0Hsxghy8CNfMUEPyKT+VlPeCcWhFSeELA9dBqI0CdXtwlo0Pzh8k6RCUe9en
	IFkGuieetpGagBSNI+kBqEMEJ7jwAbwACoNGtOCXiv7JR0hZfb8LLHUCbj8Zz8e8n6km39r8aSsP6
	6b6l/8bMnhrphdhcn+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgh6-0000000DlfL-19o9;
	Tue, 13 Oct 2026 17:53:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgh3-0000000Dle8-20t8
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 17:53:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 543EF1A1201
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:53:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 286CC60362
	for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 17:53:39 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id AC88111D71897; Tue, 13 Oct 2026 19:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WLOt1kpHNOrE5Y8+o6WbHWE6KAm2hhvawu4L3tPSlRI=;
	b=017Wa2EDJLJ0rHWNVWL/aG2JF9yG6vZqb6xqlvY0z5F+mcPZxxiOV/Ihr1c8urQP9yblAQ
	qFCyyFvrIfh7XEC3PqdkCu+FAWtQLDk/YllPqJDdeDabjDy6wmdQFTj6MCTtMmH3RPyVpn
	Vc1BlOHt5MVkqsUU4O3QM6bT+DjbnYYgGPMYQmoobxvMAXIUPgIlGfgLU95vCYeuHSEKJA
	eoXIOdIhqIIG9DHw5GKiZnYG8kZTKICZrxyN7y834+/eQA8kzwmcsTkSGCmzo/GGQfBFro
	IsXYvJ2W7EI9UWOeHM2JkG/rfDyZJclKvHqdpR6cQved5IE8Z4MUUGSEvWHm2A==
Authentication-Results: mail.galae.net;
	none
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruslan Vagner <rusya92266@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at
Subject: Re: [PATCH] mtd: fix comment typos in UBI and NAND headers
In-Reply-To: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
	(Ruslan Vagner's message of "Tue, 15 Sep 2026 05:55:58 -0700")
References: <CAF9RqJ45HPa1HpJdZp3=G6QAxyNSFo4D1cpkPQhN5YmHbSdmSQ@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 20:24:04 +0200
Message-ID: <87wlrmzsjf.fsf@bootlin.com>
MIME-Version: 1.0
X-TUID: Z6oYiQ2BatgE
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: AC88111D71897
X-Spamd-Result: default: False [-1.30 / 30.00];
	BAYES_HAM(-1.20)[82.69%];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	BCC(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid];
	RCPT_COUNT_THREE(0.00)[3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105341_657133_7CB3C1C3 
X-CRM114-Status: UNSURE (   5.14  )
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

SGkgUnVzbGFuLAoKT24gMTUvMDkvMjAyNiBhdCAwNTo1NTo1OCAtMDcsIFJ1c2xhbiBWYWduZXIg
PHJ1c3lhOTIyNjZAZ21haWwuY29tPiB3cm90ZToKCj4gRml4IHRoZSBzcGVsbGluZyBpbiBjb21t
ZW50cy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNsYW4gVmFn
bmVyIDxydXN5YTkyMjY2QGdtYWlsLmNvbT4KClNvcnJ5IGJ1dCBJIGZhaWxlZCB0byBhcHBseSB0
aGlzIHBhdGNoLiBTaW5jZSB5b3UnbGwgaGF2ZSB0byByZXNlbmQsCnBsZWFzZSBzZW5kIG1lIHRo
ZSBtdGQgYml0cyBhbmQgdG8gcmljaGFyZCAtaW4gYW5vdGhlciBwYXRjaC0gdGhlIFVCSQpvbmUu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
