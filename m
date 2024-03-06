Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08912C5475B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSCpWMZDrIMdziNgCrWf+hB43WW7O+TLSUYA2/gSiEw=; b=p8WUhubJNiJswo
	+qOP1Js57c7vGYa+0VVQG79ijP1pODM0odYgFK9J0wISebE4qlDErEUBgIW3YErTk1Mf0rljwF3M9
	tIZN7L/4XUT572Xm/NNem1aV9xmTET7b2MKLZbQe3A0SpWsujiPwNLzxBCoPp8PwC96RsWUwF0qXM
	41dEqzLb5vvobkg/SYmtoH+4A/DEHgy1ViootMgo+GUSbkJSbYVSR+Xm4QIxUDpAGeOfP7+s6qjtZ
	ij6IF4me1IWxiBK8W6WV4kVizBVACwyb2eQglw1QIRGJIWVhUY+qBjMBPNX9qGmAaLEukY4xc+wbu
	q12a8B7FqevtINPeyGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmU2-0000000GrWU-2mMa;
	Wed, 06 Mar 2024 08:18:38 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhmTy-0000000GrSq-1eI7
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 08:18:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84FD140004;
	Wed,  6 Mar 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709713110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8XXqk5f2pfXsGsB1q/7dSgEGxtkFADaEPnlSDZcT8k=;
	b=ZZtNRngSLTZ7iLkt8KhZOOWvfrzABaMm7oCChRAMU9i2c6I20DiH8SOKfXynxy8tGNOj+c
	UuEMY8EHwr6baHhTOt/oKz1Bhb7FxwlvaPdxoaN5401jjJOFHtS0pak5olY+CpV3DK1Tlu
	Tude/i9e6vYCFIrO1PBOLMy3A+J5/9qZ4AIa246Cn+Ev69FrlEA4Sn2ggs7yU9GCJDJO8Z
	+IYujJBcHKhykoj068hyRf7aUX7ScvjEzK0uhetUZschha5FyXBdOSIR7xfTeNQAauiA+t
	TqeYJP8phPra2c7T8gOwG5V1wLPoXHsJcSZ4xswL84yZbZdaB9m2ECcUu4Kv/A==
Date: Wed, 6 Mar 2024 09:18:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: ubi: make ubi_class constant
Message-ID: <20240306091828.04cf4d1e@xps-13>
In-Reply-To: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
References: <20240305-class_cleanup-mtd-v1-1-7861914e2218@marliere.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_001834_621419_53A30EB2 
X-CRM114-Status: UNSURE (   7.96  )
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

SGkgUmljYXJkbywKCnJpY2FyZG9AbWFybGllcmUubmV0IHdyb3RlIG9uIFR1ZSwgMDUgTWFyIDIw
MjQgMTY6MzU6MzggLTAzMDA6Cgo+IFNpbmNlIGNvbW1pdCA0M2E3MjA2YjA5NjMgKCJkcml2ZXIg
Y29yZTogY2xhc3M6IG1ha2UgY2xhc3NfcmVnaXN0ZXIoKSB0YWtlCj4gYSBjb25zdCAqIiksIHRo
ZSBkcml2ZXIgY29yZSBhbGxvd3MgZm9yIHN0cnVjdCBjbGFzcyB0byBiZSBpbiByZWFkLW9ubHkK
PiBtZW1vcnksIHNvIG1vdmUgdGhlIHViaV9jbGFzcyBzdHJ1Y3R1cmUgdG8gYmUgZGVjbGFyZWQg
YXQgYnVpbGQgdGltZQo+IHBsYWNpbmcgaXQgaW50byByZWFkLW9ubHkgbWVtb3J5LCBpbnN0ZWFk
IG9mIGhhdmluZyB0byBiZSBkeW5hbWljYWxseQo+IGFsbG9jYXRlZCBhdCBib290IHRpbWUuCj4g
Cj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4g
U3VnZ2VzdGVkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gQi4gTWFybGllcmUgPHJpY2FyZG9AbWFybGll
cmUubmV0PgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxp
bi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
