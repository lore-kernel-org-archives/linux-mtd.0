Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B39ACD342C
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2026 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rse9hfHyR3ENWOvmFhQuvFs/e49RCONDGnD0JkgA8WM=; b=T9vRX04oWBpVrx
	q6fsTDwKN4q4Wr1aCMErOye80dx61rtcJLEsf1gdrtrBENabe/W1PNiiJeotngjtM+TBd6QlRIy97
	N3tQ73ut0F8mphx2B0/p3g7Xc8tx2E/wUgZbjUQlZpr7m3ymodc0NriJig2/LiFDa9344Bui4JVMb
	Et9KckPCcpca4kyehQHoi6QmU3CNcjKMqZ60Pc+xnLvn4Caj/s/VokDfwdVoe3/oVTI9t62DU8PFF
	NRFRZVKmOz8fOXeFHeX9LAgNF30dM9hDq7w0mqRqUFaG9IcETHN/PMdI8bOz/cUPGiennEDFlpm07
	o3Fg15olVcuiJCvkcx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpj-00000000CBK-0tJI;
	Wed, 06 May 2026 08:42:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpg-00000000CAm-4C6v
	for linux-mtd@lists.infradead.org;
	Wed, 06 May 2026 08:42:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57EB91A3551;
	Wed,  6 May 2026 08:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B9136053C;
	Wed,  6 May 2026 08:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79AE8102F225A;
	Wed,  6 May 2026 10:42:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778056934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1j2OwQNIlx64QT21MfQW28rM8o9wlhGOk4TyUaj1rlY=;
	b=KbeZ/GIZRqwuNT2eZoXLP/denZ7bkA/a4/2d+eU2HPVKUPU71N8KIXF1Uttslj1QZVnfSJ
	LMTrzvFZ3rrqXIlgCbLjsOALeA02bxqPsxB29/em+WgSXwWhFI0NKAM7opZGvxHh8xkv8k
	arEK5t1hGehf5WVoRVHufFNx8/De1SbWQqsYDYT8CKRYC9WoGR3HpYFZqw1ercd3z002q9
	qoBAYmwFHp8Iohrs8VCgNJOkn24KxO7Bbzii1eGgCz0eWnI4bjKH7KWyqg4I37SMjS5L5+
	iV9ISQuNH5s6EFcXYxTubTDczqwchuSrZDqsFrF+CPM/kkSmvYRWtoogh0B1Ww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,
  Sean Anderson <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/27] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
In-Reply-To: <2vxzfr4527bx.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	05 May 2026 17:40:18 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-7-833dab5e7288@bootlin.com>
	<2vxzfr4527bx.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 06 May 2026 10:42:09 +0200
Message-ID: <87zf2dlyji.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014217_170696_FE9DD8F6 
X-CRM114-Status: UNSURE (   6.39  )
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

Cj4+ICsvKgo+PiArICogVGhlc2UgaW9jdGxzIGJlaGF2ZSBhY2NvcmRpbmcgdG8gdGhlIGZvbGxv
d2luZyBydWxlczoKPj4gKyAqIC0+bG9jaygpOiBOZXZlciBsb2NrcyBtb3JlIHRoYW4gd2hhdCBp
cyByZXF1ZXN0ZWQsIGllLiBtYXkgbG9jayBsZXNzCj4+ICsgKiAtPnVubG9jaygpOiBOZXZlciB1
bmxvY2tzIG1vcmUgdGhhbiB3aGF0IGlzIHJlcXVlc3RlZCwgaWUuIG1heSB1bmxvY2sgbGVzcwo+
PiArICogLWlzX2xvY2tlZCgpOiBDaGVja3MgaWYgdGhlIHJlZ2lvbiBpcyAqZnVsbHkqIGxvY2tl
ZCwgcmV0dXJucyBmYWxzZSBvdGhlcndpc2UuCj4+ICsgKiAgICAgICAgICAgICAgIFRoaXMgZmVl
YmFjayBtYXkgYmUgbWlzbGVhZGluZyBiZWNhdXNlIHVzZXJzIG1heSBnZXQgYW4gInVubG9ja2Vk
Igo+PiArICogICAgICAgICAgICAgICBzdGF0dXMgZXZlbiB0aG91Z2ggYSBzdWJwYXJ0IG9mIHRo
ZSByZWdpb24gaXMgZWZmZWN0aXZlbHkgbG9ja2VkLgo+PiArICovCj4KPiBXZSBhbHJlYWR5IGhh
dmUgc29tZSB0ZXh0IHdoZXJlIHN0cnVjdCBzcGlfbm9yX2xvY2tpbmdfb3BzIGlzIGRlZmluZWQu
Cj4gQ2FuIHdlIG1vdmUgdGhpcyBpbmZvcm1hdGlvbiB0aGVyZT8KCk9rLCBJIHdpbGwgdWRwYXRl
IHRoZSBwb3NpdGlvbiBvZiB0aGUgY29tbWVudC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
