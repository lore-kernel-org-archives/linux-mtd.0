Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D38F3381B
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 09:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMDocgfvOkb8Nb5rfHX8N9KZX0oPAO2nEgr6vZ+QeF4=; b=SSUz/ZhlO1Cz/j
	08A0MnrvZA6++YcpnikgqZ2O95ivU2j8qwtgRUZ4aDUDSj5yRHb94oStMHM2Xig9pI2Bm6S4l2CCn
	cWihWCPOU34hA7bFxJJT3iGmbCgxrqWNu2VxUwp3+A6fcemrd9bEFhShCumlBkGdBGNSLsCbtz08n
	u3gtk9y7f3yEVYCGFcLiREg60NHzQ9Nk4RjE/+oJVxxDUkU6ueExyR5G9OjolgRfvJO9sj66riumi
	W5eht3nvd6b3UYcEvha93mDnAS1a4SqubOWJRueVImtRlG/6UmybV2nL0uQbpi7Z7kwE86bluYXAo
	RYirdSzagqm5kYrFiXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qbt-00000005rG2-3sFG;
	Tue, 17 Mar 2026 09:21:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qbt-00000005rFp-0oVl
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Mar 2026 09:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xuh1ow4bBaeBlDeqjPY2Bd2zdgxnIdoEvBTi0BMDkBY=; b=HvkKSxoFhZ86sUlxiYIBywXyAo
	b1wtsI24nVGB0LF6W2Q9hYNGdxSUz5Oi5yquZOubG8Y582r2XFeNlDHryoRLTI3Im5rEJcWRg44Nk
	R/IU+MlMElrrAmxLQgvR7XfxNxGxbehrpBbIGUFstpoTW4wLmlJb4XwUxHk9KVeVSV1ZRZK3v0H7/
	4Vtot95zZJkQTfI7TDSpuZ5jGJLo0fLtbXlh/1GVlDMr4wQUkZP/5Vp5euoMslOGD4nsHJyaWKn4R
	izfg38DoD5rgXdlUprXAfCnjGHpsHfF7TppdOsZk/F9JZ4TUaJYiVV/F1Slw+CKbjdQj36ya11OSw
	wqDfqxvw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Qbp-00000002RDq-3iQp
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 09:21:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF4111A2D92;
	Tue, 17 Mar 2026 09:20:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B72C25FC9A;
	Tue, 17 Mar 2026 09:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C03C410450425;
	Tue, 17 Mar 2026 10:20:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773739255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xuh1ow4bBaeBlDeqjPY2Bd2zdgxnIdoEvBTi0BMDkBY=;
	b=I1maje0PcPSWF8ul04uGXonn8pWip2dBTTx06srbGg9xnip7CS4JJ0LUuZzNctLHo+3xgm
	TCl0latTErS/AI+QNfhymyvOcVInyQQfKRPfsJOMHpkNcvCfuXtvQKfi63itcNKu4W16Du
	e18mXBUubaMnu3DW7tasQ/lk3ouvp6mV+Maozu7Ct/kTFeHQzs+M03/ks2tCKhc8q+NZWP
	KcAekB8TPvmM/wW25o9TimttaWO8DAWjMHv0sitWcZiMLeru/KdB3lALyzuEaX5PbwAcnH
	Vddu7WhWOWg+ScDgiEVFoWeR1eYj1enswxpXgR9M4P/9LCgrO/ZHnLov21VfoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Jakub Czapiga
 <czapiga@google.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
In-Reply-To: <acc9c661-d102-4302-a276-fd8de20562db@linaro.org> (Tudor
	Ambarus's message of "Tue, 10 Mar 2026 11:24:56 +0200")
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
	<873429oxwf.fsf@bootlin.com>
	<acc9c661-d102-4302-a276-fd8de20562db@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 10:20:50 +0100
Message-ID: <87y0jqerrh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_092105_975982_E411A721 
X-CRM114-Status: UNSURE (   9.69  )
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

SGVsbG8sCgo+Pj4gVGhlc2Ugd2lsbCBhbHdheXMgZmFpbCBiZWNhdXNlIHRoZXJlCj4+PiBpcyBu
b3cgYW4gaW5jb25zaXN0ZW5jeTogdGhlIGFkZHJlc3MgY3ljbGVzIGFyZSBmb3JjZWQgdG8gNCAo
dGhlbiAzKQo+Pj4gYnl0ZXMsIGJ1dCB0aGUgYnVzIHdpZHRoIGR1cmluZyB0aGUgYWRkcmVzcyBj
eWNsZXMgcmlnaHRmdWxseSByZW1haW5zIDA6Cj4+PiBpbXBvc3NpYmxlLCB0aGUgb3BlcmF0aW9u
IGlzIGludmFsaWQuCj4KPiBJIGxpa2UgQ2hlbmcncyBkZXRhaWxzIG9uIGhvdyBpdCdzIGZhaWxp
bmcuIFdvdWxkIHlvdSBwbGVhc2UgYWRkIHdoYXQgaGUKPiBkZXRhaWxlZCB0aGVyZT8KPiBgYGAK
PiBUaGlzIG1vZGlmaWVkIG9wZXJhdGlvbiBpcyB0aGVuIHJlamVjdGVkIGJ5IHNwaV9tZW1fY2hl
Y2tfb3AoKSBpbiB0aGUKPiBjb3JlIHNwaS1tZW0uYyBiZWNhdXNlIGl0IGhhcyBhIG5vbi16ZXJv
IGFkZHJlc3MgbGVuZ3RoIGJ1dCBhIHplcm8gYWRkcmVzcwo+IGJ1c3dpZHRoLCB3aGljaCBpcyBh
biBpbnZhbGlkIGNvbWJpbmF0aW9uLgo+IGBgYAoKSSd2ZSBhZGRlZCB0aGUgcHJlY2lzaW9uIGFi
b3V0IHRoZSBpbnZhbGlkIGNvbWJpbmF0aW9uIG9mIG5vbi16ZXJvCmFkZHJlc3MgbGVuZ3RoIGFu
ZCB6ZXJvIGJ1cyB3aWR0aC4gSSBmZWVsIGxpa2UgaXQncyBhIHJlcGV0aXRpb24gb2YgbXkKcHJl
dmlvdXMgc2VudGVuY2UsIGJ1dCBJJ20gZmluZSB3aXRoIGl0IGlmIGl0IGNsYXJpZmllcy4KClRo
YW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
