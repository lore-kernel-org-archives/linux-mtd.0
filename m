Return-Path: <SRS0=EMkS=QB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F316BC282C0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:07:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD7ED218DE
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Jan 2019 13:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sjtpl9qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD7ED218DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aeFDZURYHC6PJJjS+6VHCz/BL0vFSQGoH5B7r49LgA=; b=Sjtpl9qm3b9L/q
	DXtRR0qgtbvfeYnXz8SMrSTMhkBjt88ov7TDGS0ZFBC74N1ESEx0XUq02JIEydSajCvI4otzqUT8F
	YIC6UE1fOxZSamqLf0/EwPuAegRy3tGVFgpnqnoilzpJbyhbLa2BmqIRFoJB34a7K/mPlZjVs7BmR
	Y70DD9Pw1UuzVjZp6fH8PpTNczs1sqfbMKIQb1LPRCYwlkbwCkFsAmOfYUCc6TMwC60ZLwCNjndaV
	yIB4Ey7H3hV/O3nNcUn3spW2vqRVXjUzknquo98HRKV8t6siV7qx35ZyWQW3YoV4ZAnTl6lf4GmXL
	nCLk8GIgWr3Kkfc468Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn1CY-00031R-9z; Fri, 25 Jan 2019 13:07:18 +0000
Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn1CV-000316-Gp
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2019 13:07:16 +0000
Received: by mail.bootlin.com (Postfix, from userid 110)
 id 12996207AD; Fri, 25 Jan 2019 14:07:14 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr
 [90.88.29.206])
 by mail.bootlin.com (Postfix) with ESMTPSA id C1F2020397;
 Fri, 25 Jan 2019 14:07:03 +0100 (CET)
Date: Fri, 25 Jan 2019 14:07:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] mtd: rawnand: fsmc: Reset NAND timings on resume()
Message-ID: <20190125140703.7c53c2c0@xps13>
In-Reply-To: <20190118210604.8231-1-linus.walleij@linaro.org>
References: <20190118210604.8231-1-linus.walleij@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_050715_695035_7D12A883 
X-CRM114-Status: GOOD (  12.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3Rl
IG9uIEZyaSwgMTggSmFuIDIwMTkKMjI6MDY6MDQgKzAxMDA6Cgo+IFdoZW4gd2UgZ28gdGhyb3Vn
aCBhIHN1c3BlbmQvcmVzdW1lIGN5Y2xlIHRoZSBOQU5ECj4gdGltaW5ncyBtYXkgaGF2ZSBiZWVu
IGxvc3Qgc28gcmVzZXQgdGhlIGNoaXAuCj4gCj4gVGhpcyBoYXJkd2FyZSB3aWxsIGF1dG9ub21v
dXNseSBlbmFibGUvZGlzYWJsZSB0aGUKPiBjaGlwIHNlbGVjdHMgZGVwZW5kaW5nIG9uIHdoYXQg
bWVtb3J5IGlzIGFjY2Vzc2VkIGFuZAo+IGNoaXAgc2VsZWN0cyBhcmUgbm90IHNvZnR3YXJlIGNv
bnRyb2xsZWQsIHNvIHdlCj4gb25seSBsYXNzIGNoaXAgc2VsZWN0ICIwIiBmb3IgImFsbCBjaGlw
cyIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5h
cm8ub3JnPgoKUGxlYXNlIENjOiBtZSBpbiB5b3VyIHYyLgoKClRoYW5rcywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
