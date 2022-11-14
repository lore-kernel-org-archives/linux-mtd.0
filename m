Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC30C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qFYwPMzAMpINzLyVjFKuJJYf4wIHAmeR0H31KdfJ1I=; b=N2DGyPpDzLO+Uj
	fUqfQxbX8o99xncOkkMAZJueaFZa3ECLbahGk+lo/Bi9/F1rtKJMViyq2nBfuXm/Aa1Xwtp+Trnaf
	kAdr9N6zLso0ErLhseAM8SiwAW8Lt7GD5yah2yS819GJjX/kESW/lCKUGBX720pbPQnp26sOJJWdB
	NFB0koCPi0QyLvxRs+ghfdOz9zJ5ES0VfUgDOo6pjjqrYpl0shzh/5r9XGxVwBjEwUdVIOWaGkOqc
	6WK1lrk8eO7oekGnVbchm3eqHbDi10rban6M8DVmx1u9YuO6HzOseqZoCeJOymYG4sKDg5Hc7nfyA
	fLwbowj5ou0SfuKR2/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVVz-00H7sG-QF; Mon, 14 Nov 2022 09:12:27 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVVN-00H7HG-JO
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:11:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E39A920005;
	Mon, 14 Nov 2022 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668417104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oefpXQZ78GLAz1anvLhttjOAXOHcfMpJNoz4KuWwVco=;
	b=FrU2LK/9bUSuSobXoWO5LUBNUAQgXIVHXvVe9LmiuYaQMk56k39iKg5NYqyroJXGPeyQDT
	UNVDH+z+P1BtPpD++MnFW8LvzB2bTIMCQWQm6qqj5yFmTvE+Su4ZRgN8MdK6/3sOVUQH3M
	4xkvCx8sAV8K/MAGX1gJguMYsiuT9pSFJWTek3xjK66EW1YK8J41Wt2FLbxR+N0E9/8vCl
	BdMcgcR1MhBSysrAkcZIlKg8AUBrmZjba5D/m1hkrbR1uG+F+zlXdLCMYOg6R1ARRKiFcD
	OhfhmNBYYYzdrmJyZ9s91m92bh5GxY9TvRK/uvxjA3KYudQrJ+OmZr4nbpsIyw==
Date: Mon, 14 Nov 2022 10:11:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v6.1-rc6
Message-ID: <20221114101140.339e0d2e@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_011149_881767_69EF5048 
X-CRM114-Status: UNSURE (   6.77  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGFub3RoZXIgc21hbGwgZml4ZXMgUFIgZm9yIHRoZSBuZXh0
IDYuMS1yYyBjeWNsZS4KClRoYW5rcywKTWlxdcOobAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCAzMGEwYjk1YjEzMzVlMTJlZmVmODlkZDc4NTE4ZWQzZTRhNzFhNzYzOgoKICBM
aW51eCA2LjEtcmMzICgyMDIyLTEwLTMwIDE1OjE5OjI4IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IHRhZ3MvbXRkL2ZpeGVzLWZvci02LjEtcmM2
Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYzcxN2I5YjdkNmRlOWUwMjRlNDdmN2Nk
NWJiZmY0OWY1ODFkM2RiOToKCiAgbXRkOiBvbmVuYW5kOiBvbWFwMjogYWRkIGRlcGVuZGVuY3kg
b24gR1BNQyAoMjAyMi0xMS0wNyAxNjo1MzowNCArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUmF3IE5BTkQgZml4
ZXM6CiogUGxhY2F0ZSAiJFZBUklBQkxFIGlzIHVzZWQgdW5pbml0aWFsaXplZCIgd2FybmluZ3MK
KiBvbWFwMjogQWRkIG1pc3NpbmcgZGVwZW5kZW5jeSBvbiBHUE1DCiogcWNvbTogSGFuZGxlIHJl
dCBmcm9tIHBhcnNlIHdpdGggY29kZXdvcmRfZml4dXAKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQWRhbSBCb3Jvd3NraSAo
MSk6CiAgICAgIG10ZDogcmF3bmFuZDogcGxhY2F0ZSAiJFZBUklBQkxFIGlzIHVzZWQgdW5pbml0
aWFsaXplZCIgd2FybmluZ3MKCkNocmlzdGlhbiBNYXJhbmdpICgxKToKICAgICAgbXRkOiByYXdu
YW5kOiBxY29tOiBoYW5kbGUgcmV0IGZyb20gcGFyc2Ugd2l0aCBjb2Rld29yZF9maXh1cAoKS3J6
eXN6dG9mIEtvemxvd3NraSAoMSk6CiAgICAgIG10ZDogb25lbmFuZDogb21hcDI6IGFkZCBkZXBl
bmRlbmN5IG9uIEdQTUMKCiBkcml2ZXJzL210ZC9uYW5kL29uZW5hbmQvS2NvbmZpZyAgfCAgMSAr
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYyAgfCAgNCArKy0tCiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAxMiArKysrKysrLS0tLS0KIDMgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
