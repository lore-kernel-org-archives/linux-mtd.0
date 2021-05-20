Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DA9C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:33:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93EB761363
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 11:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93EB761363
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVYPTf5iZAHbU6kx0HyJQGWdjiYiSdMhTdEfqEVjD44=; b=ZxfJDA97k9hVMn7ty2mLScj1jh
	XUn17NvmrDI/Cb6BpIHQ7FxUh9wo4rfRvIXmMBviUMZOS0J9GgtrWSnBh4SRFfVZUoF9j3KekUTJN
	JXpallP7n5yFs7x0lsUsM8UzvjTDDBN+IPETe5NzQUasZ4ZHoStT5NOWEgTn79aYGHXQxWTBZ+E+K
	UBk+OYhqlh/ekRZuHeQfdj61QhLWAilfzMhcJYNfqQfgqfApqJ0NAjFEH3BZL5H1KUaA4RNdHXagE
	TAoiAXP4mhEB4uwnNSdh+W8IWef3h+u/qK6Q4vqIy9ileZ5Qlfzmu7L+IbDnbvwB+JyG+upb8sTjd
	WOwQb4rg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljguQ-000Ufz-JE; Thu, 20 May 2021 11:32:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljguK-000UXW-OR
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 11:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=nuzL6Ruulv2L91neWfH6gbNOIBfzDSuGknCxOlzDAzc=; b=Tl8MbU/aVuYqG9PKzTcMV++d5i
 5J+OHtqjD78HWIGJK7oQAST/KYZ5YaPmbZdz/Rs61Wn97Tt7qwcy9gpZwvQGF4RgdJThRfXtKet/o
 JE7EzD0WTCwTSPr0dgK0z1W5RLsQhFKqHLw4/TjlX1NDpxOAL70IOk0GYFfmKytIAUUd8AuXIFOg0
 ySi7I/AmQhXADVQ+gcLm4Ve5nuNONyTT7APpu/2fEgQQihPvcUtqo36G7u/DN7lOaq8TDFCT++MEg
 2jDQce0A2deDiY2CWZHbsnpf6ac1NM3QvoejWabNKE1oeqMJBXtONDoJd1FtZpXk29t9KFHI4E5mv
 cH/lwfmw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljguH-00GFdJ-UQ
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 11:32:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B1C6CFF80D;
 Thu, 20 May 2021 11:31:56 +0000 (UTC)
Date: Thu, 20 May 2021 13:31:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>
Cc: Helmut Grohne <helmut.grohne@intenta.de>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, Rob Herring
 <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>, Amit Kumar
 Mahapatra <akumarma@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>, Siva
 Durga Prasad Paladugu <sivadur@xilinx.com>
Subject: Re: [PATCH v20 10/19] dt-binding: memory: pl353-smc: Convert to yaml
Message-ID: <20210520133155.02700d2c@xps13>
In-Reply-To: <fd29436201e8e5932a8a027472f1064a@walle.cc>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-11-miquel.raynal@bootlin.com>
 <fd29436201e8e5932a8a027472f1064a@walle.cc>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_043202_145766_CE75EABD 
X-CRM114-Status: GOOD (  11.40  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+IHdyb3RlIG9uIFRo
dSwgMjAgTWF5IDIwMjEgMTM6MDk6MDUKKzAyMDA6Cgo+IEFtIDIwMjEtMDUtMTkgMjA6MjYsIHNj
aHJpZWIgTWlxdWVsIFJheW5hbDoKPiBbLi5dCj4gCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwK
PiA+ICsgICAgc21jYzogbWVtb3J5LWNvbnRyb2xsZXJAZTAwMGUwMDAgewo+ID4gKyAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLHBsMzUzLXNtYy1yMnAxIiwgImFybSxwcmltZWNlbGwiOwo+ID4gKyAg
ICAgIHJlZyA9IDwweGUwMDBlMDAwIDB4MDAwMTAwMD4sCj4gPiArICAgICAgICAgICAgPDB4ZTEw
MDAwMDAgMHg1MDAwMDAwPjsKPiA+ICsgICAgICBjbG9jay1uYW1lcyA9ICJtZW1jbGsiLCAiYXBi
X3BjbGsiOwo+ID4gKyAgICAgIGNsb2NrcyA9IDwmY2xrYyAxMT4sIDwmY2xrYyA0ND47Cj4gPiAr
ICAgICAgcmFuZ2VzID0gPDB4MCAweDAgMHhlMTAwMDAwMCAweDEwMDAwMDAgLyogTmFuZCBDUyBy
ZWdpb24gKi8KPiA+ICsgICAgICAgICAgICAgICAgMHgxIDB4MCAweGUyMDAwMDAwIDB4MjAwMDAw
MCAvKiBTUkFNL05PUiBDUzAgcmVnaW9uICovCj4gPiArICAgICAgICAgICAgICAgIDB4MiAweDAg
MHhlNDAwMDAwMCAweDIwMDAwMDA+OyAvKiBTUkFNL05PUiBDUzEgcmVnaW9uID4gKi8KPiA+ICsg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsK
PiA+ICsKPiA+ICsgICAgICBuYW5kMDogbmFuZC1jb250cm9sbGVyQDAsMCB7ICAKPiAKPiB3aGF0
IGFib3V0IG5mYyAob3IgbmZjMCkgaGVyZT8gSWYgSSB1c2UgdGhpcyByZWZlcmVuY2Ugb24gbXkg
Ym9hcmQgaXQKPiBsb29rcyBraW5kYSBvZGQ6CgpXaGlsZSB0aGUgbm9kZSBuYW1lIChuYW5kLWNv
bnRyb2xsZXJAKSBpcyBmaXhlZCwgdGhlIGxhYmVsIElJUkMgaXMKdG90YWxseSBhcmJpdHJhcnks
IHNvIGFueSBzdHJpbmcgaGVyZSBzaG91bGQgZG8gdGhlIHRyaWNrLiBJIGFncmVlIHRoYXQKbmFu
ZDAgaXMgcmF0aGVyIGNvbmZ1c2luZyBhbmQgSSBkb24ndCBsaWtlIGl0IG11Y2gsIGp1c3Qga2Vw
dCB0aGF0IGZvcgpsZWdhY3kgcmVhc29ucyAobWFueSBEVCBkZWNsYXJlIHRoZSBOQU5EIGNvbnRy
b2xsZXIgYW5kIGxhYmVsIGl0CiJuYW5kIikuIEknbSBmaW5lIGNoYW5naW5nIHRoYXQgdG8gbmZj
MCB0aG91Z2gsIEknbGwgdXBkYXRlIHRoZQpleGFtcGxlLgoKPiAKPiAmbmFuZCB7Cj4gICAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gCj4gICAgICAgICBuYW5kQDAgewo+ICAgICAgICAgICAgICAg
ICByZWcgPSA8MD47Cj4gICAgICAgICAgICAgICAgIG5hbmQtdXNlLXNvZnQtZWNjLWVuZ2luZTsK
PiAgICAgICAgICAgICAgICAgbmFuZC1lY2MtYWxnbyA9ICJiY2giOwo+ICAgICAgICAgfTsKPiB9
Owo+IAo+IC1taWNoYWVsCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
