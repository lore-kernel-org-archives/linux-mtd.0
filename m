Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106EEC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 07:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8mXcxBASrTjnrqP44W1AfWWrdWsxcl128/rlgohuZM=; b=40kH/0CWLhqmV1
	W2lJ7hKqibcsOdbd9PY7N/fCBoDdtRDi4Y6Rxuyx6RB1pGEufIIx/SEFcVASeiX+zkTIbn0stZ+ON
	poTDnns27eburBsN0zIyXrAV9V5fVBMzIG8E1w7YNPJRMB9yRD5WKE4p36get1peJyhszs7jBzMgj
	6aPHq2EFSTfsV6chceK/AP+zz4kOrkk6475ZXyRQhoApMqZQxkjx2ry+cl2qQ4b9YkrAuydZAFRQ9
	kykbmwtdyCyLRflGfFG7TFVOzVF98riJjltcXU8eQbgtMN8vjc0WTLY5xUie/YJ6tI5C9bLrZriVS
	A+33mwKSLbOhTMNfiryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVVf-006Xz0-LT; Mon, 16 May 2022 07:51:19 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVVd-006Xy1-BJ
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 07:51:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6F4036001B;
 Mon, 16 May 2022 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652687471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcRXTnUer1M5l+X0FoLehOx+DusdiUpQF8ofo2RLrEA=;
 b=TBZ2hEoT6M2chW4inuB16T5f/3DlqDh9AqCVC7x/DRhhqNXu4dIblVMtwm5X6G6vqcQU0q
 QU7bwd8pYoMgOqNWK4SJ0Vlr1eBda2RnDDFqlOHRXNcJH219lJB/SbGSOTofrjAAELkUhy
 170b12prFonWwq7xBhiUEUD09IbjObHKYHycxnzHCwqxmY5d5HZGjq9K+M217ePYOR+Pu+
 NjrVBZXJLdx4RUaZbxYWBEcUIfChRnFomKaZl3vSWS3K9l1nMsFgmqqbxQTH7m7FqX/clk
 JIYdvTSjdu8lYZDFzSlJb6nz5UYfa1JbjriK17SCJZJFffJQeHt6gLUFu87XXw==
Date: Mon, 16 May 2022 09:51:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: st_spi_fsm: add missing
 clk_disable_unprepare() stfsm_remove()
Message-ID: <20220516095108.4ec6d0d9@xps13>
In-Reply-To: <0d7ee262-6286-ec41-884e-3ab5863b68b4@huawei.com>
References: <20220513100322.2664431-1-yangyingliang@huawei.com>
 <20220513122248.146d6944@xps13>
 <0d7ee262-6286-ec41-884e-3ab5863b68b4@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_005117_573311_5DDD7D0C 
X-CRM114-Status: UNSURE (   9.58  )
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

SGVsbG8sCgp5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20gd3JvdGUgb24gU2F0LCAxNCBNYXkgMjAy
MiAxMDoxMjo1NSArMDgwMDoKCj4gSGksCj4gCj4gT24gMjAyMi81LzEzIDE4OjIyLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4geWFuZ3lpbmdsaWFuZ0BodWF3ZWkuY29tIHdy
b3RlIG9uIEZyaSwgMTMgTWF5IDIwMjIgMTg6MDM6MjIgKzA4MDA6Cj4gPiAgCj4gPj4gQ2xvY2sg
c291cmNlIGlzIHByZXBhcmVkIGFuZCBlbmFibGVkIGJ5IGNsa19wcmVwYXJlX2VuYWJsZSgpCj4g
Pj4gaW4gcHJvYmUgZnVuY3Rpb24sIGJ1dCBubyBkaXNhYmxlIG9yIHVucHJlcGFyZSBpbiByZW1v
dmUgZnVuY3Rpb24uICAKPiA+IAkJCSBub3QgZGlzYWJsZWQgb3IgdW5wcmVwYXJlZAo+ID4KPiA+
IE90aGVyd2lzZSBsb29rcyBnb29kLiAgCj4gRG8gSSBuZWVkIHRvIHJlc2VuZCBpdCA/CgpZZXMs
IHBsZWFzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
