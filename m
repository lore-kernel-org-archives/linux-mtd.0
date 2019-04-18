Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CBEC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F0B20693
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 16:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHcPmS0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F0B20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbZhc+hnSlGtha04LIFqvET5GTEdL8sOYWRQMykOmYw=; b=SHcPmS0VO2ATGO
	HG1sWx+IkdiZNkiKkxag3nBq8wOO3GT+A+XIRa0a5H/uQ6rFVP0FCe3ZeD3Q4GJtRIZqA4DzViLIB
	stJSCWl/lC9/vbLFljU1Z95MCzlZNJLXMQ8bGP/KdbzeKsJPJVavf3L4CxcMBqZT9mSbwCgHbt63j
	R5ppdjqU8DLFec0DUrSGoHjy7k6zVgIeS/TKmkUgk1hI8QnpXZiaiWT0zEnAatAIC9hAlOjK3HMu0
	XVuOdWPx5aH1TM1pCoCDPlBJrtz65YDn6zIcD4Mw/HaO14vEEe3PBiwk1oWW9pAHSZmEvoZstjQ7g
	zo1QJlgL2XGXXK4roF7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH9ck-0002KI-Mf; Thu, 18 Apr 2019 16:10:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH9b0-0007MT-8P
 for linux-mtd@lists.infradead.org; Thu, 18 Apr 2019 16:09:25 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id F29872000A;
 Thu, 18 Apr 2019 16:09:02 +0000 (UTC)
Date: Thu, 18 Apr 2019 18:09:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] mtd: rawnand: Fix sphinx syntax
Message-ID: <20190418180901.45a1d17a@xps13>
In-Reply-To: <20190321235242.32158-1-j.neuschaefer@gmx.net>
References: <20190321235242.32158-1-j.neuschaefer@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_090906_892834_C9857198 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9uYXRoYW4sCgpKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0
PiB3cm90ZSBvbiBGcmksIDIyIE1hciAyMDE5CjAwOjUyOjQxICswMTAwOgoKPiBTcGhpbnggZG9l
c24ndCBoYW5kbGUgZXhwcmVzc2lvbnMgaW4gaWRlbnRpZmllciByZWZlcmVuY2VzLgo+IAo+IFRo
aXMgZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nczoKPiAKPiAuL2luY2x1ZGUvbGludXgvbXRk
L3Jhd25hbmQuaDoxMTg0OiBXQVJOSU5HOiBJbmxpbmUgc3Ryb25nIHN0YXJ0LXN0cmluZyB3aXRo
b3V0IGVuZC1zdHJpbmcuCj4gLi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmg6MTE4NjogV0FS
TklORzogSW5saW5lIHN0cm9uZyBzdGFydC1zdHJpbmcgd2l0aG91dCBlbmQtc3RyaW5nLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5u
ZXQ+Cj4gLS0tCgpBcHBsaWVkIHRvIApodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IApicmFuY2ggbmFuZC9uZXh0LgoKVGhhbmtzLCBN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
