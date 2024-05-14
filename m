Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD68C25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 11:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWVoLua8PDtMe/ML/OY7OrByzoJ2J1M96KdV9PotLdI=; b=N3XrvsJgfisjk3
	jbcaDE+zjo99Pg1krOC10d4SRl6LxXvHU2zYrZtKtwXoji84G24PlFMW9Hs63OCA+LxOiQ0dwcf1t
	F5JZXlUgaqBJqGjglAZGU9fszOMVtrMaSNZdq9yua0T1/TDpLxsgZaB8916PIfSR6S9jHD33/efqL
	DfBS3q8MalgD1qVx7sP90T3OqIv7pgiHYBJcmUbOUel9oGXw+6CAk8pWSmECiJxGaDA/eu74Amxpw
	j78sD15fY1r7Dzg0i2SKnauRVDOKqPSXIehTUf8hThz3YvGJEv31D/1U3nc4efdSqPG+U8pp8QqnV
	xN/Jbo9M0fK7Nq1EVxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6qij-0000000FmLZ-2Q0a;
	Tue, 14 May 2024 11:53:25 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6qig-0000000FmKp-1pFE
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 11:53:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 770941BF208;
	Tue, 14 May 2024 11:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715687597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPTrF1J6wwPZ22GARVdc+ob8xKhQub7S1uLBMtPZCMk=;
	b=nn/g/wZ4SfPBeSzgdg1d6a97S+7VaWksALvIj7q3HktU9mUe0EJmtFG298BcpyN3htR6lM
	AY0E4ThcJMldqm85Wa/mgeel+yXVZX/yaZXmo14WrVCXaNo9w6buUZMUtDOBbJhFlIP3JL
	+kZ7sSrqhYybVW5pb3ATvfMR/G/b/j4vH+kgkyoDsnNq9JUyVrtbV9aQu8x07KqETjcKAw
	UTqtxZBhwzCvUnkjUZtI6tFP8o+RCFDuOk/N8gjPWIuO9VuhqC76A+65vk1J1qmc2InqDd
	QuGitTd3Ky5/rHrKTJCFtb0+77sGJ0Zax942TZMNmh0v7vIl6W6nCl+WR//Qeg==
Date: Tue, 14 May 2024 13:53:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Using nand_change_read_column_op() in nand_onfi_detect()
Message-ID: <20240514135316.4940a7b6@xps-13>
In-Reply-To: <ZkNPkzKmwMWzbyWJ@pengutronix.de>
References: <ZkNPkzKmwMWzbyWJ@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_045322_830584_437F4986 
X-CRM114-Status: GOOD (  14.11  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBUdWUsIDE0IE1heSAy
MDI0IDEzOjQ4OjM1ICswMjAwOgoKPiBIaSBhbGwsCj4gCj4gSSBhbSBjdXJyZW50bHkgc3R1bWJs
aW5nIG92ZXIgdGhpcyBpbiBuYW5kX29uZmlfZGV0ZWN0KCk6Cj4gCj4gCWZvciAoaSA9IDA7IGkg
PCBPTkZJX1BBUkFNX1BBR0VTOyBpKyspIHsKPiAJCWlmICghaSkKPiAJCQlyZXQgPSBuYW5kX3Jl
YWRfcGFyYW1fcGFnZV9vcChjaGlwLCAwLCAmcGJ1ZltpXSwKPiAJCQkJCQkgICAgICBzaXplb2Yo
KnBidWYpKTsKPiAJCWVsc2UgaWYgKHVzZV9kYXRhaW4pCj4gCQkJcmV0ID0gbmFuZF9yZWFkX2Rh
dGFfb3AoY2hpcCwgJnBidWZbaV0sIHNpemVvZigqcGJ1ZiksCj4gCQkJCQkJdHJ1ZSwgZmFsc2Up
Owo+IAkJZWxzZQo+IAkJCXJldCA9IG5hbmRfY2hhbmdlX3JlYWRfY29sdW1uX29wKGNoaXAsIHNp
emVvZigqcGJ1ZikgKiBpLAo+IAkJCQkJCQkgJnBidWZbaV0sIHNpemVvZigqcGJ1ZiksCj4gCQkJ
CQkJCSB0cnVlKTsKPiAJCS4uLgo+IAl9Cj4gCj4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5fb3Ao
KSBoZWF2aWx5IHVzZXMgbXRkLT53cml0ZXNpemUgYW5kIGJhaWxzIG91dAo+IHdpdGggYW4gZXJy
b3Igd2hlbiB0aGUgd3JpdGVzaXplIGlzIDAuIG10ZC0+d3JpdGVzaXplIGlzIHN0aWxsCj4gdW5p
bml0aWFsaXNlZCBhdCB0aGF0IHBvaW50LCBpdCdzIGluaXRpYWxpemVkIGEgZmV3IGxpbmVzIGZ1
cnRoZXIgZG93bgo+IGluIHRoZSBzYW1lIGZ1bmN0aW9uLiBJdCBsb29rcyBsaWtlIHRoaXMgY29k
ZSBuZXZlciB3b3JrZWQgYXMgZXhwZWN0ZWQuCj4gCj4gQWxzbyBpdCBzZWVtcyB1c2VfZGF0YWlu
IGlzIGFsd2F5cyAwLCBzZWUgMSksIHNvIGV4aXN0aW5nIGNvZGUgb25seSBldmVyCj4gcmVhZHMg
dGhlIGZpcnN0IHBhcmFtZXRlciBwYWdlLgo+IAo+IFRoZSBzYW1lIHBhdHRlcm4gaXMgaW4gbmFu
ZF9qZWRlY19kZXRlY3QoKSBhcyB3ZWxsLgo+IAo+IE5vdCBzdXJlIHdoYXQgd2UgbWFrZSBmcm9t
IHRoaXMuCj4gCj4gU2FzY2hhCj4gCj4gMSkgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkLzIwMjQwNTE0MTAzMzU1LjgxNzA1Ni0xLXMuaGF1ZXJAcGVuZ3V0cm9uaXguZGUvVC8jdQo+
IAoKU29ycnkgZm9yIG5vdCBtZW50aW9uaW5nIHRoYXQgYmVmb3JlLCBJIHNlbnQgdHdvIGZpeGVz
IGFib3V0IHRoYXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI0MDUwNzE2
MDU0Ni4xMzAyNTUtMS1taXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tL1QvI3QKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
