Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D41DD5C0CD
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Dec 2025 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cp/EFJOMmTC395hUiA7gZWoK3ycFszh52coFuV+i2I=; b=sDUrDRQQlkzohh
	/j+KlOJxD74KIZsI6gV2eOR22NUL2eTEfNNyUTNzgluHT0MEtDVt459+BPmJDdqyKfQBjB6e7uIFG
	kudCvBHbKdfBbx+mcDvnKwCGYDKGfjpCJ2zmsPtHfgjVKlVzktJROZ49D4hehAzyc2pOI/AkeSIT9
	6Jvwt6gMqBXX7t26Dwx9lN7qV+ev+M3wV7qV4409Jo9ff+5Ix5QSTq9j9MY7b/E0dtNhSUlhmNhlz
	Pjl/sBl7yGa9v7NFite5iza4uAa+Pmgf+cOMPHIYLxFLRljxpoTlt14P3pytz2VujyOF/4Rmw38UP
	Uf+qidfPKL71GCl36Eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ6H-00000004tqQ-41Q5;
	Tue, 16 Dec 2025 08:08:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ6F-00000004tpV-1BIW
	for linux-mtd@lists.infradead.org;
	Tue, 16 Dec 2025 08:08:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5C024E41C28;
	Tue, 16 Dec 2025 08:08:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 881E36072F;
	Tue, 16 Dec 2025 08:08:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 611A911942FCC;
	Tue, 16 Dec 2025 09:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765872480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RHz8iH3yLjZSj3vhUgRlWaweVH1IO38WEpnpNpCWtgA=;
	b=pf8rxSBGLIO6tuV5JQC9qcHmqClcrsTpkL+mjX1APgXfZGJg8MuOFEbnNzoZ4UqhWXdNBB
	jpYx2iPanodMtIGjc6JlQgWPdIdWguSOZEREeQSRbJ1amvlpcfL5jotnrhwfvk4XbS5oj0
	pxG8w4QgTMv5jhvoYNGW1t9QPmYSSN14EKI3Aw6azBhTvYTWYes+XQw3lz+5LwgYn8chUT
	+t7ouYrg0VGpnkP18Xx/s/4BveZNnIFsML5oTfJKnDfD21euxVz3oXp3udcVG6py2ulN/y
	VVnn4jff45o3IsaAR8pVshhOc41CBw+PHLq20eaIN+q+L7/c5f8dWIKBgfp/iQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Ziyang Huang <hzyitc@outlook.com>,  quic_mdalam@quicinc.com,
  richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  mmkurbanov@salutedevices.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
In-Reply-To: <BL4PR19MB8902CF825EF35C4F145300BF9DA2A@BL4PR19MB8902.namprd19.prod.outlook.com>
	(George Moussalem's message of "Mon, 8 Dec 2025 13:26:21 +0400")
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
	<87wm2x74pz.fsf@bootlin.com>
	<BL4PR19MB8902CF825EF35C4F145300BF9DA2A@BL4PR19MB8902.namprd19.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 16 Dec 2025 09:07:56 +0100
Message-ID: <87cy4esvc3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_000803_701179_E660CBC5 
X-CRM114-Status: UNSURE (   9.25  )
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

SGksCgo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkZDI2NDAyNjQyYTA4OTlmZGU1OWVhNmIwODUy
ZmFkM2Q3OTliNGNjLgo+Pj4KPj4+IFRoZSBpc3N1ZSBHZW9yZ2UgbWV0IGlzIGR1ZSB0byB0aGUg
bGltaXQgb2YgUVBJQywgbm90IHRoZSBpc3N1ZSBvZiB0aGUKPj4+IGZsYXNoIGNoaXAuCj4+Pgo+
Pj4gUVBJQyBvbmx5IHN1cHBvcnRzIDQgYnl0ZXMgSUQuIFNvIHRoZSBmaWZ0aCBieXRlIGlzIGFs
d2F5cyAwLgo+Pj4KPj4+IElmIHdlIHVzZSBzcGktZ3BpbywgdGhlIGZpZnRoIGJ5dGUgY2FuIGJl
IHJlYWQgY29ycmVjdGx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5
aXRjQG91dGxvb2suY29tPgo+Pj4gLS0tCj4+IAo+PiBTbyBob3cgZG8gd2Ugc29sdmUgdGhhdD8K
Pj4gCj4+IElzIHRoZXJlIGFueXRoaW5nIHRoYW4gY2FuIGJlIGRvbmUgb24gdGhlIHFwaWMgc2lk
ZT8KPgo+IEhpIEFsYW0sCj4KPiBJcyB0aGUgaGFyZHdhcmUgaXRzZWxmIGxpbWl0ZWQgdG8gcmVh
ZGluZyA0IElEIGJ5dGVzIG9ubHkgb3IgaXMgaXQgYQo+IGRyaXZlciBsaW1pdGF0aW9uPwoKRllJ
IEkgd2lsbCBwaWNrIHRoZSByZXZlcnQsIGJlY2F1c2UgaW5kZWVkIHRoZSBvcmlnaW5hbCBmaXgg
aXMgd3JvbmcgYW5kCmFueSBkZXZpY2Ugd2l0aCA1IElEIGJ5dGVzIHdvdWxkIG5lZWQgYSBzaW1p
bGFyIGNoYW5nZSAod2hpY2ggaXMgbm90CnBvc3NpYmxlKSwgYW5kIGxldCB5b3UgZmlndXJlIG91
dCBhIHF1aXJrIGZvciB0aGUgUXBpYyBkcml2ZXIuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
