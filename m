Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91074D3F068
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 14:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak2MxpB3MKvFjFUNMyfMErmZ8VpycJHmkuw3g70Sp+Y=; b=1F9mUOFRRXHwL9
	DqOwjqMU11ivVnVJFOJWB98EDESJKarENKZI8XaNJLNK7DEMXBqN1WeMR8ToKTNCBu7cGRI01Lway
	yEoyXIFBBgYJiGUL4aHyD28ROSjYflhZknjvxX6vdhs0cWCAsLEMNCnkmpub9qDCOroCGGq84x+hK
	GMMICDIAgUqS/sYlTDrga8qokBxXRzJKRUjUYc0UpDOBM/u/qeWImLdTjOxkIrjP82IDNBadCXK5s
	mMn1GyzAp8O8+7icGG3Te4O5JyZmV1vIa+tUqAz3ErFNR/kI9U+qzWJF8eqku2XOXG6zpa5PDSwW5
	DN7atUaqDvXqev4R8+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6GX-0000000G90S-0jq5;
	Wed, 28 Jan 2026 14:11:29 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6GU-0000000G8zx-1DkO
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 14:11:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77E6FC211E7
	for <linux-mtd@lists.infradead.org>; Wed, 28 Jan 2026 14:11:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9D4C6071F;
	Wed, 28 Jan 2026 14:11:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F4D0119A880E;
	Wed, 28 Jan 2026 15:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769609481; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kRRWCWxAwezRe/igPPO9pv+PEvWw27k6O+gOZnNIfGA=;
	b=Hya5SHYrgfhz4uqrY21BH3TNjFVlN4mZDEzoTl8Zib/kwJFp5xm/liA+xe8pb+ZezLLlEB
	QqM7VhnYgqzMFUNP15BRtnaWLNkHnNbkQMnTPWgLzMa+1UDaM/5loJblvcOyT/ps0xaxg5
	DPkVu68xIPHcQMG+yz7nfjFdcnFaNO6gVJgXef4w7Fr9+wREqfTG9XirCDTBIa4hY990wj
	H4QXJ6E+waN1HDiEhsQHWqHvQOv1F372ymlZDGmNi63KCIXb8JCuCaj0y3pjTlyjb2GEDm
	IYRjIWGmffANlWrx65vtCpIqsuzlaRAkATHPd7w8mrLwRgamYzi4lr+ZPG8bqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Shiji Yang <yangshiji66@outlook.com>
Cc: linux-mtd@lists.infradead.org,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: swp: check SR_TB flag when getting tb_mask
In-Reply-To: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
	(Shiji Yang's message of "Wed, 28 Jan 2026 20:42:56 +0800")
References: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 28 Jan 2026 15:11:17 +0100
Message-ID: <87bjidn7y2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_061126_507563_68F4D147 
X-CRM114-Status: UNSURE (   6.68  )
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

T24gMjgvMDEvMjAyNiBhdCAyMDo0Mjo1NiArMDgsIFNoaWppIFlhbmcgPHlhbmdzaGlqaTY2QG91
dGxvb2suY29tPiB3cm90ZToKCj4gV2hlbiB0aGUgY2hpcCBkb2VzIG5vdCBzdXBwb3J0IHRvcC9i
b3R0b20gYmxvY2sgcHJvdGVjdCwgdGhlIHRiX21hc2sKPiBtdXN0IGJlIHNldCB0byAwLCBvdGhl
cndpc2UgU1IxIGJpdDUgd2lsbCBiZSB1bmV4cGVjdGVkbHkgbW9kaWZpZWQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBTaGlqaSBZYW5nIDx5YW5nc2hpamk2NkBvdXRsb29rLmNvbT4KCkdvb2QgcG9pbnQu
CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
