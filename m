Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1941DC3601A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQCsFfH6UdlBLc6avi8afy6Ar0QpUTSIrdJ1BwuZYKo=; b=Y/7+npPt/mtrb3
	3gQ6TXfaGM/0FTGqzIA9YXTvAYsUGldLDfcGOT+HIEAZcXS/pIDNF7w+SX3Yt6oFtmB4ZsFdkqce+
	aGJ3+oTXAyoqf4WFEioGw8jiGPnT558DLmf1Y1hW9ezHpCL5oAaRM26aDQBv5oYiJPQaJKON/H7iX
	S7kCZ5Yg/oW5qZaCC8byskacjBRJ5rujbMTYGD6JWxWMmgcR7FUTTrYyTb5N0OGAkjUGXk6Oct+Hw
	LURSS6u/nwsTukKYywwhMBGaaLczt2NEd35uyiVfZjBDE2Q12CoG8TPpWLbTQNCfMqsXTu3hJ+2rz
	2If7oJi72iduaCcEX+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gSB-0000000Geg0-0TJA;
	Mon, 07 Apr 2025 06:59:31 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gS9-0000000GeeV-18N8
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 06:59:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D76F443DA;
	Mon,  7 Apr 2025 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744009166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i77a18b8DHyXJfu0GSCELdfxc3KxO2HbjqVar89BgXk=;
	b=aG1AmnqNQwZeR9+mRpbOuKXsFtckCy6zp6uZf1lsIJSQxh+owa4t1tRSPH1veoL41dGMxH
	77YW8xWg5TYGmEHr6bC2gZQTb1k4J8mASCchVNKYPYf5uuTQu38IMuvXeZnk1fx0AFoKo5
	U+q2FNjROUzpgMqWS87BLSZVkSlTlHGvI9PcqmZkLDgqWi2p5JHOYr7heU90Evo5dhAJ0c
	3x5SW68AdOFY0XqPibm3YCBi0zZkPg4hrz/kmssZkAMiHJFbN3rhkUpnp3KT0E51Gu5NTG
	ooLsRZPxSShbKkkVLlxD908H6pQF1GlfEeagbKPHoUm28n8CCm6YJ8euSyxE3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
In-Reply-To: <20250407020917.1242-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Mon, 7 Apr 2025 10:09:16 +0800")
References: <20250407020917.1242-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 08:59:23 +0200
Message-ID: <87tt70h2yc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelhedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_235929_440144_3CE5D141 
X-CRM114-Status: UNSURE (   6.51  )
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

SGVsbG8gTGlhbmcsCgpPbiAwNy8wNC8yMDI1IGF0IDEwOjA5OjE2ICswOCwgV2VudGFvIExpYW5n
IDx2dWxhYkBpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFRoZSBmdW5jdGlvbiBtYXJ2ZWxsX25mY19o
d19lY2NfYmNoX3JlYWRfY2h1bmsoKSBjYWxscyB0aGUgZnVuY3Rpb24KPiBtYXJ2ZWxsX25mY19l
bmRfY21kKCksIGJ1dCBkb3NlIG5vdCBjaGVjayBpdHMgcmV0dXJuIHZhbHVlLiBTaW5jZSBpdAo+
IGlzIGluY29ycmVjdCB0byBiYWlsIGZyb20gdGhlIGxvb3AgaWYgdGhlIG1hcnZlbGxfbmZjX2Vu
ZF9jbWQoKSBmYWlscywKPiBhbiBlcnJvciBsb2cgaXMgbmVjZXNzYXJ5IHRvIHByZXZlbnQgc2ls
ZW50IGZhaWx1cmUuCgpUaGUgZmFpbHVyZSB3aWxsIG5vdCBiZSBzaWxlbnQsICpfcmVhZF9jaHVu
aygpIGlzIGNhbGxlZCBpbgptYXJ2ZWxsX25mY19od19lY2NfYmNoX3JlYWRfcGFnZSgpIG9ubHks
IHdoZXJlIHRoZSB2YWxpZGl0eSBvZiB0aGUgZGF0YQp3aWxsIGJlIGNoZWNrZWQuIElmIHlvdSBy
ZWFsbHkgd2FudCB0byBtYWtlIGl0IHZpc2libGUgKnRoZXJlKiBJIGJlbGlldmUKdGhlIGNvcnJl
Y3QgYXBwcm9hY2ggaXMgdG8gY2hhbmdlIHRoZSBjYWxsZXIgcHJvdG90eXBlIGFuZCBmb3J3YXJk
IHRoZQplcnJvciBpbnN0ZWFkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
