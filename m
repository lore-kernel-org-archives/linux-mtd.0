Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07F7161053
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07F7161053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mEO5L4xuKXXFQ7H/K+7896Kci4Ontu8akweCSdzEJE=; b=LMF84WWW/XXM4l
	p5J/IFWj6NAn5DnVW4iVR47M3dyumA4Dfu89zGalRK20JK1fx/M7/TZbuNLwKVZH455jcFKZplqSz
	UOTEk7m9WixDB7D8m4j7oTrIIYfLGFy/RE8S3x6UiCGAKcsbE8aWEWXiYbrEamQcvvzoooWV+gnYo
	klFwPUPz/DRrxbGSeWsxZ3OGMmhWTm1cMuulauJAwMcSaLz3wXbupKAgmDeaxTE/thvdCFSp3bp5M
	SqRMsiIPkJ+JFBeXvCTjoB/Z3BMOjB9n8Ijcq9FipFwv8hQTVyIGGpzXAP9UtH187cvwGCC+8rsXW
	moUJZy7X32zx0e1eqP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhpLL-000xYJ-Me; Tue, 02 Nov 2021 08:40:31 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhpLI-000xXY-Km
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 08:40:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4E021C0005;
 Tue,  2 Nov 2021 08:40:24 +0000 (UTC)
Date: Tue, 2 Nov 2021 09:40:23 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <p.yadav@ti.com>, <michael@walle.cc>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as the SPI NOR co-maintainer
Message-ID: <20211102094023.768bc021@xps13>
In-Reply-To: <4f4d36f5-8939-fda1-9c75-cbffbe587451@microchip.com>
References: <20211029181157.20623-1-p.yadav@ti.com>
 <4f4d36f5-8939-fda1-9c75-cbffbe587451@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_014028_852579_0A3760EA 
X-CRM114-Status: GOOD (  13.92  )
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

SGkgUHJhdHl1c2gsCgpUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGUgb24gVHVlLCAy
IE5vdiAyMDIxIDA4OjEzOjQ4ICswMDAwOgoKPiBIaSwgUHJhdHl1c2gsCj4gCj4gT24gMTAvMjkv
MjEgOToxMSBQTSwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gPiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUKPiA+IAo+ID4gSSBoYXZlIGJlZW4gcmV2aWV3aW5nIHBhdGNoZXMgYW5k
IGNvbnRyaWJ1dGluZyBmb3Igb3ZlciBhIHllYXIuIEkgd291bGQKPiA+IGxpa2UgdG8gaGVscCBt
YWludGFpbiB0aGUgc3Vic3lzdGVtIGFzIHdlbGwuCj4gPiAgIAo+IAo+IEknbSBoYXBweSB0byBz
ZWUgdGhhdCB5b3UncmUgd2lsbGluZyB0byB0YWtlIG1vcmUgcmVzcG9uc2liaWxpdGllcywgaXQg
d291bGQKPiBiZSBuaWNlIHRvIGhhdmUgeW91IG9uIGJvYXJkLiBJJ2xsIHdhaXQgYSBiaXQgYmVm
b3JlIGFwcGx5aW5nIHRoaXMgcGF0Y2ggdG8KPiBnaXZlIHRpbWUgdG8gdGhlIE1URCBtYWludGFp
bmVycyB0byByZXZpZXcgaXQuCgpUaGFua3MgZm9yIHN0ZXBwaW5nIHVwISBUdWRvciwgZmVlbCBm
cmVlIHRvIGFkZCBteToKCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
