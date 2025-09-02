Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A66BCA0FFE
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm0woFEtsOvIy29rdr/upKN3yW0lxPsOgki0DFMULc4=; b=Iw0q/YQKTFdTRc
	OCRl0c38zNCk73JUGsQALivMore1+RsCms24KbNzd71cQqpjoyhWJlDQtBQ4ZL5AWubbInLN9Bvwt
	iiZFYqMhb9M0B59fGrYILkx1//tcK3+DtkR3INN8EL4UR6CnkeK/u5XFu10P8jQ5jEIDisQkaVinG
	NHZJ9r2gqoURPbhAY+L37RVmUc5WrNifmeODTuTDIZQAP06kUjXROT4NcBjXF1iUqxmedM0s3G/Q4
	lzsPX+Lu5ssWF650HE44SA4CqNgXjeOimPtQuYx9TJsNXKJj6u11HDAL9leCj3LmW9ZzhCTDyIguR
	MmQ6CiTN1npSl6cqGA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ72-0000000HER6-1bWk;
	Tue, 02 Sep 2025 12:27:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNBe-0000000GKDu-1kfi
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 09:20:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B97E1A099C;
	Tue,  2 Sep 2025 09:20:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37F5360695;
	Tue,  2 Sep 2025 09:20:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D2421C22D61F;
	Tue,  2 Sep 2025 11:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756804819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YOvQGStceXvCa6+9l/nLVbzaS08FnkJ7K2s7/vOvOWg=;
	b=f7lDmIYHp1rBw3TWK91p4NcyZ1pzqRF/rgIW2Ij3Ej4QwRFl4EB38p4rCRLBqbh4Lm7YMZ
	tuR21DOaRaCVfvKta4qZgLoQZ/ID6UAahefrz4VynO2uaYoa+pZuwVJa0q3AzyHIYJNgHV
	FrOaZdO3sdsPhc9g9RxCi1zomXFFe55eR4FkhqDzfH+qHnoI2vaOtjNMvuouqUtZC49SAf
	TTwyE9qDsbwpsCHQRGFF2dbDw9p3ijgDELYXpGnFmMs5ZcOzg/Sp/xNTm9TG//seZdKN/e
	wipYWj/wmKSOAELGWNmAj7YVVDD3izGKhORLvy3Sn9YuqJCMPNmHw++NVX1jEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  chengzhihao1@huawei.com,
  yi.zhang@huawei.com,  yangerkun@huawei.com
Subject: Re: [PATCH] mtd: core: only increment ecc_stats.badblocks on
 confirmed good->bad transition
In-Reply-To: <732d629c-d1b9-4483-95c3-9a80bd7b2511@huaweicloud.com> (Wang
	Zhaolong's message of "Tue, 2 Sep 2025 17:03:54 +0800")
References: <20250902080117.3658372-1-wangzhaolong@huaweicloud.com>
	<87ms7dntlb.fsf@bootlin.com>
	<732d629c-d1b9-4483-95c3-9a80bd7b2511@huaweicloud.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 02 Sep 2025 11:20:02 +0200
Message-ID: <87zfbdmcsd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022022_603059_80EB28F8 
X-CRM114-Status: UNSURE (   6.25  )
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

SGVsbG8sCgo+PiBTYWlkIG90aGVyd2lzZSwgdGhlIHsgd2hpbGUgKCkgYmFkYmxvY2tzKysgfSBi
bG9jayBzaGFsbCByZW1haW4gb3V0c2lkZQo+PiBvZiB0aGUgaWYgKF9ibG9ja19pc2JhZCkgY29u
ZGl0aW9uIGFuZCByZW1haW4gdW50b3VjaGVkLiBKdXN0IGJhaWwgb3V0Cj4+IGVhcmx5IGlmIHlv
dSBhcmUgc3VyZSB0aGlzIGlzIG5vdCBuZWVkZWQuCj4+IAo+Cj4gSeKAmWxsIHNlbmQgYSBWMiBz
aG9ydGx5IHRoYXQ6Cj4KPiAtIENoZWNrcyBvbGQgc3RhdGUgd2hlbiBfYmxvY2tfaXNiYWQgZXhp
c3RzIGFuZCBiYWlscyBvdXQgZWFybHkgaWYgYWxyZWFkeSBiYWQKPiAtIE90aGVyd2lzZSBjYWxs
cyAtPl9ibG9ja19tYXJrYmFkKCkgYW5kIGluY3JlbWVudHMgdGhlIGNvdW50ZXIgb24gc3VjY2Vz
cywgd2l0aAo+ICAgdGhlIGluY3JlbWVudCBsZWZ0IG91dHNpZGUgb2YgdGhlIGNvbmRpdGlvbmFs
IGFzIHlvdSBzdWdnZXN0ZWQKCkxHVE0uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
