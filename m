Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA751C43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0J1U7KvhefGT0i8o/HMPWZ4T2E+pF2f9CwqkDbyma0E=; b=pamJc8YlOuQVfV
	5wU2BrozwwRatp2BO2EvKySH96EY0ONQnWCWQYN3/ypzCigPM4q6hzWMxiC8paAnQo3Hvh2xj0g7J
	FZVaj2jNeG2ll8V9WaPZXaEUVCvOv/Sn3x4iAYGeaXu9Y0O53YeJhFZeutxSP/m9yV3EUPLXMPAJh
	nXpaBQj9E5XOa7tVtxu7qBEZLpbe2X9LSe1C9xI5SoE9MZBUvlzdYp71IhM1oIuzghX2hLO7HKUHT
	S7MwMr/reYX+uuluj8eI1HCwyZAOBno8etIh3e0j9EAyr+dlGUYlUl8x97sir5FnL1La6b0pXl/k4
	moxhzXiQoHqIgIpaZZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkbG-0000000CnSk-1vkw;
	Mon, 06 Jul 2026 14:47:10 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkbD-0000000CnRo-2bIt
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:47:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75F484E40CB5
	for <linux-mtd@lists.infradead.org>; Mon,  6 Jul 2026 14:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41FEE601A2;
	Mon,  6 Jul 2026 14:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BB7911BBA5C8;
	Mon,  6 Jul 2026 16:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783349224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P/Hl+OBEfaz8g8NpQn3WmEYW359iotcUYJ2AqubcXrE=;
	b=UOiiabNceAba+QHR7BK91h9WhY4TzqkGRH1IoE7RPJFLPYChgEZyPh+7TaChUFATF+QgDV
	8KVLmgAT22X5vLxGwL2aicV1EkQRKWFg2TlsgdCb1LPSr7oqgSmNtwMY98wbeZ40fkieMp
	ypaLV8XgwW8mCtbukS912hf1UYeCJggefbOzfYH4edqR+VkmCzWkZb3XY6HcdgUZ9oeCz0
	tcgaJeJD0GreV3M5jgvq1kSwvU6qz+R3nxLLv/zXhhNnSVrterDtNfmN1FIVe0Z1MFqkXb
	86VAi4NeVk904PYLlURzHJwq4wP5vUJJytgAFqAAFbjO4C0UAZfd1bQd3ZlrMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: afs: validate v2 image info bounds
In-Reply-To: <20260706094059.82323-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Mon, 6 Jul 2026 17:40:59 +0800")
References: <20260706094059.82323-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:47:01 +0200
Message-ID: <87se5wjhui.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_074707_818501_DA29FE0E 
X-CRM114-Status: UNSURE (   7.91  )
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

T24gMDYvMDcvMjAyNiBhdCAxNzo0MDo1OSArMDgsIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNj
YXMuYWMuY24+IHdyb3RlOgoKPiBUaGUgQUZTIHYyIHBhcnNlciB1c2VzIGZvb3Rlcls4XSB0byBs
b2NhdGUgdGhlIGltYWdlIGluZm9ybWF0aW9uIGJsb2NrCj4gaW5zaWRlIHRoZSBjdXJyZW50IGVy
YXNlIGJsb2NrLCB0aGVuIHVzZXMgdGhlIGltYWdlIGluZm9ybWF0aW9uCj4gcmVnaW9uX2NvdW50
IHRvIHdhbGsgZW50cmllcyBmcm9tIGEgZml4ZWQgbG9jYWwgYXJyYXkuIFRoZSBmb290ZXIgb2Zm
c2V0Cj4gYW5kIHJlZ2lvbiBjb3VudCBjb21lIGZyb20gZmxhc2ggY29udGVudHMgYW5kIHdlcmUg
bm90IGNoZWNrZWQgYWdhaW5zdCB0aGUKPiBlcmFzZSBibG9jayBvciB0aGUgbG9jYWwgaW1hZ2Ut
aW5mbyBhcnJheSBiZWZvcmUgdXNlLgo+Cj4gUmVqZWN0IHYyIGVudHJpZXMgd2hvc2UgaW1hZ2Ug
aW5mb3JtYXRpb24gb2Zmc2V0IHdvdWxkIHVuZGVyZmxvdyB0aGUgZXJhc2UKPiBibG9jayBjYWxj
dWxhdGlvbiwgYW5kIHJlamVjdCByZWdpb24gY291bnRzIHRoYXQgY2Fubm90IGZpdCBpbiB0aGUg
bG9jYWwKPiBpbWFnZS1pbmZvIGFycmF5IGJlZm9yZSB3YWxraW5nIHJlZ2lvbiBlbnRyaWVzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkkn
bGwgbGV0IHlvdSBndWVzcyB3aGF0IGlzIG1pc3NpbmcgaW4gdGhpcyBjb250cmlidXRpb24/CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
