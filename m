Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21337C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 12:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DC92082F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 12:33:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOgIl8s/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRsDgUA8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DC92082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sJO4XZCf0JauZVf5TAWvIqFCX6Bc8LnHPWkMnXwJxg=; b=iOgIl8s/v7aCSA
	jWHKzbTnlQ+Y5CR0oweZzsDY911dy4fTeRCMrCseULZp1oXqzFXepvkYf1W8FTeepa51UNXhpih+z
	6LnVuQ4CE3FKzg1pzZ1xcu/qdt2JUdxi2inkOChiPpL7RLejgtFyrcoLs4Icu/bY06MxKVWnzT8tM
	c/D7rXb37lofZmG6f6mub8FFJdOyEe5H+3Ur4vkXBR/mGWANTXPHkovbf+KTBGV3qRHqiIEDV1qPV
	X0ZccvnE+3ojvjq2UY0fuYFwhabj01UczNyP7sFqW5vo0iGdqyI020uk/yDIvnCtir5SEBQy7Aox6
	dRFy6PvU/3EQuzTOs/5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqdQx-0001hq-6e; Mon, 04 Feb 2019 12:33:07 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqdQt-0001hN-Ih
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 12:33:05 +0000
Received: by mail-pf1-x443.google.com with SMTP id g62so6676057pfd.12
 for <linux-mtd@lists.infradead.org>; Mon, 04 Feb 2019 04:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wB9H8jqgyz2EUqzphuqcub7WdveCpX3EBCAZf+vLVx4=;
 b=GRsDgUA85radMr1fM2vbdJcXWXvtABynpRRs/x6Oeuap4jre1TrUXoWEAg/ZxGcQdE
 9gM4+IO2UzQYIP0TBy9gOG0d+E5DHvU+5UX4AObEK2YpaZ9r3UuedO8lWSLc9uTNOLCZ
 OzfuIEmylIfE/dVnKRUOTehkTw5WylYnk0sBgD7SnG6W9fI8BvkaND3VGOCafAiFRxHx
 rudWzpUGTvt227tBJC6XxoVlkFvGPtYDJ4EKxApLvRI1XTo0M4IWn/DRqHkn792SwK/U
 S9TCbLOddmbFLXhn7ic0hzSrdylwB401xKHRYyCnTzBt+pLajVRBhiPcbCzfyHTJshGD
 PV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wB9H8jqgyz2EUqzphuqcub7WdveCpX3EBCAZf+vLVx4=;
 b=I8LkKmXTfWVyImk1lmeNcXJ4hwstCbAJoslld7jN6KA/6Zt11s+RZbUOVC4VVx1KsV
 Mve0oD4DESl8z8WJyNXY5hE228MhIgA5FpDovB9Tk+qe4yOsGNXPeamksm21/61UxPcq
 6LnWHn8soUQexOpuiZeGw7okYBqtwcrUOmICfER4SqkrCH7pIsbluZhO7n0ul7Go5ZaN
 ANKJByJYsPK7Zs+dwe5H/l1Jher9vpgsMXT9QMymiQ4gJY+y8YrNlAtIWZRWhiNLuBxF
 iuauol451dbL5s3o4Ur6titulLgW5/mcW7Uc6gcyvOSookKYK9TBWiecwCzd+/uf7bGb
 7pkQ==
X-Gm-Message-State: AHQUAuZg/Go3pU9dP5XozK9nlTpEbaEVR7Z72RbAvId7aYhx5xy12Jap
 2yrL25AZQfISbQB4vhjUC9R/EcuqSsprT3LS0Ug=
X-Google-Smtp-Source: AHgI3IZSw1rIjh/+ufuN3We3ogfDte1s/L8oXUlOybDpy/1F438xeubtYnQse8LbOYWrH5uzptcGmePrZtze9LvtdQQ=
X-Received: by 2002:a63:ac1a:: with SMTP id v26mr12925120pge.293.1549283582574; 
 Mon, 04 Feb 2019 04:33:02 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR08MB5951FD3B8244ABBA72FF7430B86D0@MN2PR08MB5951.namprd08.prod.outlook.com>
In-Reply-To: <MN2PR08MB5951FD3B8244ABBA72FF7430B86D0@MN2PR08MB5951.namprd08.prod.outlook.com>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Mon, 4 Feb 2019 13:32:50 +0100
Message-ID: <CAO1O6sejw4zYeh7iewT3gRZz=C5K3iOXhY-kO6FgSJNRHOBuKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spinand: micron: Support for all Micron SPI NAND
 flashes
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_043303_641300_F06C6398 
X-CRM114-Status: GOOD (  14.86  )
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
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpEZW4gbcOlbiA0IGZlYi4gMjAxOSBrbCAxMjoxOCBza3JldiBTaGl2YW11cnRoeSBTaGFz
dHJpIChzc2hpdmFtdXJ0aHkpCjxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT46Cj4KPiBEcml2ZXIg
aXMgcmVkZXNpZ25lZCB1c2luZyBwYXJhbWV0ZXIgcGFnZSB0byBzdXBwb3J0IGFsbCB0aGUgTWlj
cm9uCj4gU1BJIE5BTkQgZmxhc2hlcy4KPgo+IFBhcmFtZXRlciBwYWdlIG9mIE1pY3JvbiBmbGFz
aGVzIGlzIHNpbWlsYXIgdG8gT05GSSBwYXJhbWV0ZXIgdGFibGUgYW5kCj4gZnVuY3Rpb25hbGl0
eSBpcyBzYW1lLCBzbyBjb3BpZWQgc29tZSBvZiB0aGUgY29tbW9uIGZ1bmN0aW9ucyBsaWtlIGNy
YzE2Cj4gYW5kIGJpdF93aXNlX21ham9yaXR5IGZyb20gbmFuZF9vbmZpLmMuCj4KPiBUaGlzIGRy
aXZlciBpcyB0ZXN0ZWQgdXNpbmcgTVQyOUYyRzAxQUJYR0QsIE1UMjlGNEcwMUFCWEZELCBNVDI5
RjhHMDFBRFhGRCwKPiBNVDI5RjFHMDFBQlhGRC4KPgoKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBz
cGluYW5kX2luZm8gbWljcm9uX3NwaW5hbmRfdGFibGVbXSA9IHsKPiAtICAgICAgIFNQSU5BTkRf
SU5GTygiTVQyOUYyRzAxQUJBR0QiLCAweDI0LAo+IC0gICAgICAgICAgICAgICAgICAgIE5BTkRf
TUVNT1JHKDEsIDIwNDgsIDEyOCwgNjQsIDIwNDgsIDIsIDEsIDEpLAoKPiArICAgICAgIGRldmlj
ZWluZm8ubWVtb3JnLmVyYXNlYmxvY2tzX3Blcl9sdW4gPQo+ICsgICAgICAgICAgICAgICBwYXJh
bXMtPmJsb2Nrc19wZXJfbHVuICogcGFyYW1zLT5sdW5fY291bnQ7Cj4gKyAgICAgICBkZXZpY2Vp
bmZvLm1lbW9yZy5wbGFuZXNfcGVyX2x1biA9IHBhcmFtcy0+bHVuX2NvdW50Owo+ICsgICAgICAg
ZGV2aWNlaW5mby5tZW1vcmcubHVuc19wZXJfdGFyZ2V0ID0gMTsKPiArICAgICAgIGRldmljZWlu
Zm8ubWVtb3JnLm50YXJnZXRzID0gMTsKCj4gKyAgICAgICBfX2xlMzIgYmxvY2tzX3Blcl9sdW47
Cj4gKyAgICAgICB1OCBsdW5fY291bnQ7Cj4gKyAgICAgICB1OCBhZGRyX2N5Y2xlczsKPiArICAg
ICAgIHU4IGJpdHNfcGVyX2NlbGw7Cj4gKyAgICAgICBfX2xlMTYgYmJfcGVyX2x1bjsKCkkgaGF2
ZSBhIHF1ZXN0aW9uIGFib3V0IHRoZSBsdW5fY291bnQuIEFzIGl0IGlzIG5vdywgdGhlCnBsYW5l
c19wZXJfbHVuIHBhcmFtZXRlciBpcyBpbml0aWFsaXplZCB0byAyIGluIE5BTkRfTUVNT1JHLiBJ
biB5b3VyCnBhdGNoLCBpdCBpcyBpbnN0ZWFkIGluaXRpYWxpemVkIGZyb20gdGhlICJsdW5fY291
bnQiIHByb3BlcnR5IGZyb20KdGhlIHBhcmFtZXRlciB0YWJsZS4gQnV0IEkgbG9va2VkIGF0IGEg
ZGF0YXNoZWV0IEkgZm91bmQgYnkgYSBzaW1wbGUKR29vZ2xlIHNlYXJjaCAoaHR0cHM6Ly93d3cu
Z29vZ2xlLnNlL3NlYXJjaD9xPW1pY3JvbituYW5kK3NwaStkYXRhc2hlZXQpLAp0aGUgZmlyc3Qg
aGl0IGlzIHRvIHRoZSAxIEdiIGZsYXNoIE1UMjlGMUcwMUFBQURELiBUaGF0IGRldmljZSBjbGVh
cmx5CmhhcyB0d28gcGxhbmVzIHBlciBsdW4gKHlvdSBuZWVkIHRoZSAicGxhbmUgc2VsZWN0IiBi
aXQgaW4gdGhlCnJlcXVlc3RzKSwgYnV0IHN0aWxsLCBhY2NvcmRpbmcgdG8gdGhlIHBhcmFtZXRl
ciBwYWdlIGRhdGEgc3RydWN0dXJlLApieXRlIDEwMCwgTnVtYmVyIG9mIGxvZ2ljYWwgdW5pdHMg
aXMgc2V0IHRvIDAxaC4gQWxzbywgdGhlICJibG9ja3MgcGVyCmx1biIgY291bnQsIHdoaWNoIGlz
IGNhbGxlZCAiYmxvY2tzIHBlciB1bml0IiBpcyAxMDI0LCB3aGljaCBzaG91bGQgYmUKNTEyIGlm
IHRoaXMgcGFyYW1ldGVyIHJlYWxseSBtZWFudCAiYmxvY2tzIHBlciBwbGFuZSIgYW5kIHRoZQpj
YWxjdWxhdGlvbiBpbiB0aGUgcGF0Y2ggd2FzIGNvcnJlY3QuCgpBcyBhIHJlZmVyZW5jZSwgdGhl
IDIgR2IgdmVyc2lvbiBvZiB0aGUgTWFjcm9uaXggZmxhc2gKKGh0dHA6Ly93d3cubWFjcm9uaXgu
Y29tL0xpc3RzL0RhdGFzaGVldC9BdHRhY2htZW50cy82ODY2L01YMzVMRjJHRTRBQiwlMjAzViwl
MjAyR2IsJTIwdjEuNS5wZGYpLAphbHNvIGhhcyB0d28gcGxhbmVzIHBlciBsdW4uIEl0IGFsc28g
c2V0cyBieXRlIDEwMCwgTnVtYmVyIG9mIGxvZ2ljYWwKdW5pdHMgdG8gMDFoLgoKU28gd2hhdCBJ
J20gd29uZGVyaW5nIGlzIG9mIGNvdXJzZSBpZiB0aGlzIHBhcmFtZXRlciBpcyB0aGUgY29ycmVj
dApvbmUgdG8gdXNlIGZvciBwbGFuZXNfcGVyX2x1bi4gSSB0cmllZCB0byBsb2NhdGUgdGhlIGNv
cnJlY3QgInBsYW5lcwpwZXIgbHVuIiBwYXJhbWV0ZXIgaW4gdGhlIHRhYmxlLCBidXQgZGlkbid0
IGZpbmQgYW55b25lLiBNYXliZSBpdCdzCnRoZSB1bmZvcnR1bmF0ZSBmYWN0IHRoYXQgInBsYW5l
cyBwZXIgbHVuIiBpc24ndCBleHBvc2VkIGluIHRoZQpwYXJhbWV0ZXIgdGFibGU/CgovRW1pbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
