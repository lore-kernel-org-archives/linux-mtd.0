Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E7CA100D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obm9KRuGV+KkjtU1+l59wWTRB2spdsunOA3sRjJmgNg=; b=meBy78losCo0T3
	85TlDon1kGiEk3YZKrBWkRDUaxgA2QnlPdLIAd4P3i4T/ZUbkThaUNE/NkxJ64lwEsJ1s1mrsSZp8
	Dh0T9ovAuHNJfra/X6cMaRrlTZUzNmXj/Q/P6527qVfZzRbH8zpzpGOKnHQgzfJ13pz2KGwwYEtWj
	ZnfwXaSdz0t65U6e5KnppoPHbFetqoMh0BYwuGs+34fUPX3onhCDy2gQc6qiorG8aYTXirJr4uqk0
	8azuHLIP5WH/LP8GZXsoBrj350QmnMRjNQtIB3E5XrC5+PuRpr7bcxWIm5c0tz1J6butPUPZYQyQi
	b0FMpabajpmYezZuVs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ah-0000000CzUi-19Ob;
	Mon, 01 Sep 2025 15:10:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3fP-0000000CTJU-2Zal
	for linux-mtd@lists.infradead.org;
	Mon, 01 Sep 2025 12:29:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7252D4E40C69
	for <linux-mtd@lists.infradead.org>; Mon,  1 Sep 2025 12:29:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A75560699;
	Mon,  1 Sep 2025 12:29:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3130D1C22D87C;
	Mon,  1 Sep 2025 14:29:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zHNXLKMq7EGcvkjeYCErHCNRC2gDYHZswCYoJ/fq0oA=;
	b=xTXs0bMyQ/U2Ww57PnaJAbHsO3qVlWkZJLxSEdPUUAiHkAIcVDqiMqBuSk6iuVuc7IxTVx
	hRfJzzMsuNZCklpfYFrsnXPRqpP8Y/WSPVcPXR4VJgzCdumiwgE8e9n+HFnKKprXyCjMFD
	otx4Q2sM9B2TVeZJqvh3u+iQ2CPFrNxMSJMfuPNfmoEdR0zWUDe9uZ24xklRlXtTDYbiPa
	95nhYknnH63iBFK6CDo0+EM7OZ9kiS/V1taL7wsSIl5JgcRixUJbMC1HhPkI77m78edpRb
	Yv9uw3lPy0Me8J757CwH+QnhrDMQCBflL9ccFlZA/5gO4h/uLzucFKqVSQwCYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20250808-mtd-ooblayout-sysfs-v2-1-fa620506d1ce@gmail.com>
References: <20250808-mtd-ooblayout-sysfs-v2-1-fa620506d1ce@gmail.com>
Subject: Re: [PATCH v2] mtd: core: expose ooblayout information via debugfs
Message-Id: <175672978510.48892.10136763977144565438.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:29:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052947_808074_062E5F15 
X-CRM114-Status: GOOD (  10.19  )
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

T24gRnJpLCAwOCBBdWcgMjAyNSAxMjoxMzo0NCArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
QWRkIHR3byBuZXcgZGVidWdmcyBmaWxlcyB3aGljaCBhbGxvd3MgdG8gZGV0ZXJtaW5lIHRoZSBP
T0IgbGF5b3V0Cj4gdXNlZCBieSBhIGdpdmVuIE1URCBkZXZpY2UuIFRoaXMgY2FuIGJlIHVzZWZ1
bCB0byB2ZXJpZnkgdGhlIGN1cnJlbnQKPiBsYXlvdXQgZHVyaW5nIGRyaXZlciBkZXZlbG9wbWVu
dCB3aXRob3V0IGFkZGluZyBleHRyYSBkZWJ1ZyBjb2RlLgo+IFRoZSBleHBvc2VkIGluZm9ybWF0
aW9uIGFsc28gbWFrZXMgaXQgZWFzaWVyIHRvIGFuYWx5emUgTkFORCBkdW1wcwo+IHdpdGhvdXQg
dGhlIG5lZWQgb2YgY3Jhd2xpbmcgb3V0IHRoZSBsYXlvdXQgZnJvbSB0aGUgZHJpdmVyIGNvZGUu
Cj4gCj4gVGhlIGNvbnRlbnQgb2YgdGhlIG5ldyBkZWJ1Z2ZzIGZpbGVzIGlzIHNpbWlsYXIgdG8g
dGhpczoKPiAKPiBbLi4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRk
OiBjb3JlOiBleHBvc2Ugb29ibGF5b3V0IGluZm9ybWF0aW9uIHZpYSBkZWJ1Z2ZzCiAgICAgIGNv
bW1pdDogNTRmOTIyZGU3MGJiY2QwOGEwNDRiMThjODYzNWY0NTc0ZWU3YTI5YgoKUGF0Y2hlKHMp
IHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9m
IHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4K
CktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
