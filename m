Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254B2C35FE7
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Sep 2024 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8LuHY9nF2/MLuxVrUzqz6/p2lKRzzcWgDmQ4l0kImM=; b=YrGMU18q0HMgss
	xeC/l8dTYjr1HD+AGQry1TQ/qEw4HwP7oGp5alN2bMaWYi3Vkc3V63zzCO613IsZVTh/gnZYHnZBo
	cGJLRufNwUiPEMJ6jtqHR/6kv6y31QALxbvF+v2VBLjzCpoD5MtvRpcfteY+ZEzNO0N4B4YTJRN9E
	miPgikZPMIjXqjTe8n45ViMbh3mTesU+qMQD3EWFB1+noiMSCpzoZIAtfzPmCMvlsi6G/SCURV6Sh
	7xxwhC5onfpIO24jVuLlzGtIVyKUIHvNPK73DOa4lHYJEIcXT4f0CctMjhtGcfZsmW0SaMX8Kyo97
	rLxxBPOT+I1/hOJBmJDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmrR-00000001zNV-3Cz2;
	Sun, 15 Sep 2024 10:52:09 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmrN-00000001zN2-2Ha7
	for linux-mtd@lists.infradead.org;
	Sun, 15 Sep 2024 10:52:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CFC540003;
	Sun, 15 Sep 2024 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726397522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VrmYltRviXZnT7bsxxmMTHHdQZAoaJko4RN83Px8hvM=;
	b=RJ+SRFpUDYVTPYiVNppzKIaKQJUDBevI7eMlMNmSb+vNFMolmqUEW1WLb1OtL+wkrLN/C9
	6jJC4NC+bcrvN+Utc2qtTbzKOeCOeGGt7sC+p0dKYAtU7fHRGUm58UNirff1xg0P0VbhlN
	q+S1et++tyUMs65lTwDBmqg8OwcOnf5/lhL1KhWYyHY59/LSl2evjWAfthVGo6yfssv1XA
	LOv/Y0M7s/mnFh3537/HpxrHYv9HRLH6khsbWYG53bUOB70Ipk5yx9LZcQ1+mgWiaQMt1u
	GYqEO8Qr13SUwHPZSc24tpfmDLMy2r4aP5UUkqt6syBUCkic+XoiT6OlgIyKhQ==
Date: Sun, 15 Sep 2024 12:51:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
 <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL v2] mtd: spi-nor: changes for v6.12
Message-ID: <20240915125140.64a7a2e2@xps-13>
In-Reply-To: <mafs0o74q9q7g.fsf@kernel.org>
References: <mafs0o74q9q7g.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_035205_755682_6C41B9FD 
X-CRM114-Status: UNSURE (   9.36  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIFNhdCwgMTQgU2VwIDIw
MjQgMTg6MDQ6MzUgKzAyMDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiBJIGhhdmUgcmViYXNlZCBteSBi
cmFuY2ggb250byB2Ni4xMS1yYzEgYW5kIGZvcmNlIHB1c2hlZCB0aGUgYnJhbmNoIGFuZAo+IHRh
Zy4gSGVyZSBpcyB0aGUgdXBkYXRlZCB2ZXJzaW9uIG9mIHRoZSBwdWxsIHJlcXVlc3QuCj4gCj4g
UmVnYXJkcywKPiBQcmF0eXVzaCBZYWRhdgo+IAo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgODQwMDI5MWUyODllZTZiMmJmOTc3OWZmMWM4M2EyOTE1MDFmMDE3YjoKPiAKPiAg
IExpbnV4IDYuMTEtcmMxICgyMDI0LTA3LTI4IDE0OjE5OjU1IC0wNzAwKQo+IAo+IGFyZSBhdmFp
bGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCB0YWdzL3NwaS1ub3Iv
Zm9yLTYuMTIKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYWM1YmZhOTY4YjYw
ZmJhNDA5OTQyYWI1OTRhZDk4NDc5YjRlMTIyMzoKPiAKPiAgIG10ZDogc3BpLW5vcjogZml4IGZs
YXNoIHByb2JpbmcgKDIwMjQtMDktMTQgMTc6NTY6MzEgKzAyMDApCgpQdWxsZWQgaW50byBtdGQv
bmV4dCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
