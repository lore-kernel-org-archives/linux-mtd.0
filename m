Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HlT7KL7WsMq9ZamMz+krVy76Fqv5sSrQUwEzWHsmD4=; b=lf1dFEd++WrXFO
	UnqRgws5MKrWQFsOuTlzAngfEtFznMKGaMzxXHBm7JM6LrHSThSn0yQKEgW7axm2mYU6VjEWr8S4t
	yuVaPCtRAFHmAp5PKaCl56+iOZ2NbzrXcEj2lA1bOR0Id1tFPTCEVinPjw/vnUBv3b6VXRCJQMGAc
	+zKx6SU6ANqrkcSZgLJ55pYI6XOIz2JHit0yv5iulFj4DlsOVf22E21LUEN8ACGhb2xRNrz91IDA9
	rXwo89YaYdUt5Q231xpBO9bHEsLp5hovynsidBjWGphI1d5xxvwURgPDiQ5w+DY89AM1SOCKq+rkt
	Pu6B8lpndv8s7iK2wCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndod3-007JJw-Bb; Mon, 11 Apr 2022 07:38:29 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoby-007Ifx-En
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 07:37:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AA23200009;
 Mon, 11 Apr 2022 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649662637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f23x7rYso3qTtUKAOasLEySA7B77wZVwGhNXdFZuxHo=;
 b=hGiVuSiLd/yF1F9sGVaGV3TxN+/os56t3b2ohQUvEcKulmovYXMLRn49geBtJ65Xp7U1Np
 k0UzNgF63evz6fKL5gc8ec0EKUQQ0gOPS5+eT1647Tu9I91FdPvM6TAuuldGXSZr4Cj82m
 A1Fl5lDruqsNNkzW/pzDdmCdDtB06VeCXMivDozWq0kbm2YLKIYDYOCWFX8Jf7v6M5/f++
 cPO+0JAlJ50lG7ZrHtb7suOrw9uZRx4136LorPHWNxSAJxAPTqM5LcBcZ/Dj8BZLFIFTxx
 F9QiIR4VoG6WtJVi3tFpViLJz1SU25BUGNhR5qsl2w6D2r2nX+WUp8XqEguAbg==
Date: Mon, 11 Apr 2022 09:37:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] mtd: rawnand: denali_pci: page fault when probing fails
Message-ID: <20220411093715.4cecc280@xps13>
In-Reply-To: <CAMhUBjn40pO7A=icudFKOoiMrckcH_o7mdi-uCmgCFHi6Ueuzw@mail.gmail.com>
References: <CAMhUBjn40pO7A=icudFKOoiMrckcH_o7mdi-uCmgCFHi6Ueuzw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_003722_691146_86B0AEAF 
X-CRM114-Status: GOOD (  11.53  )
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

SGkgWmhleXUsCgp6aGV5dW1hOTdAZ21haWwuY29tIHdyb3RlIG9uIFN1biwgMTAgQXByIDIwMjIg
MjI6MTc6MzUgKzA4MDA6Cgo+IEhlbGxvLAo+IAo+IEkgZm91bmQgYSBidWcgaW4gdGhlIGRlbmFs
aV9wY2kgbW9kdWxlLgo+IFdoZW4gdGhlIGRyaXZlciBmYWlscyB0byBwcm9iZSwgd2Ugd2lsbCBn
ZXQgdGhlIGZvbGxvd2luZyBzcGxhdDoKPiAKPiBbICAgIDQuNDcyNzAzXSBkZW5hbGktbmFuZC1w
Y2kgMDAwMDowMDowNS4wOiB0aW1lb3V0IHdoaWxlIHdhaXRpbmcgZm9yCj4gaXJxIDB4MTAwMAo+
IFsgICAgNC40NzQwNzFdIGRlbmFsaS1uYW5kLXBjaTogcHJvYmUgb2YgMDAwMDowMDowNS4wIGZh
aWxlZCB3aXRoIGVycm9yIC01Cj4gWyAgICA0LjQ3MzUzOF0gbmFuZDogTm8gTkFORCBkZXZpY2Ug
Zm91bmQKPiBbICAgIDQuNDc0MDY4XSBCVUc6IHVuYWJsZSB0byBoYW5kbGUgcGFnZSBmYXVsdCBm
b3IgYWRkcmVzczoKPiBmZmZmYzkwMDA1MDAwNDEwCj4gWyAgICA0LjQ3NTE2OV0gI1BGOiBzdXBl
cnZpc29yIHdyaXRlIGFjY2VzcyBpbiBrZXJuZWwgbW9kZQo+IFsgICAgNC40NzU1NzldICNQRjog
ZXJyb3JfY29kZSgweDAwMDIpIC0gbm90LXByZXNlbnQgcGFnZQo+IFsgICAgNC40NzgzNjJdIFJJ
UDogMDAxMDppb3dyaXRlMzIrMHg5LzB4NTAKPiBbICAgIDQuNDg2MDY4XSBDYWxsIFRyYWNlOgo+
IFsgICAgNC40ODYyNjldICA8SVJRPgo+IFsgICAgNC40ODY0NDNdICBkZW5hbGlfaXNyKzB4MTVi
LzB4MzAwIFtkZW5hbGldCj4gWyAgICA0LjQ4Njc4OF0gID8gZGVuYWxpX2RpcmVjdF93cml0ZSsw
eDUwLzB4NTAgW2RlbmFsaV0KPiBbICAgIDQuNDg3MTg5XSAgX19oYW5kbGVfaXJxX2V2ZW50X3Bl
cmNwdSsweDE2MS8weDNiMAo+IFsgICAgNC40ODc1NzFdICBoYW5kbGVfaXJxX2V2ZW50KzB4N2Qv
MHgxYjAKPiBbICAgIDQuNDg3ODg0XSAgaGFuZGxlX2Zhc3Rlb2lfaXJxKzB4MmIwLzB4NzcwCj4g
WyAgICA0LjQ4ODIxOV0gIF9fY29tbW9uX2ludGVycnVwdCsweGM4LzB4MWIwCj4gWyAgICA0LjQ4
ODU0OV0gIGNvbW1vbl9pbnRlcnJ1cHQrMHg5YS8weGMwCj4gCj4gSXQgc2VlbXMgdGhhdCB0aGUg
ZHJpdmVyIHVubWFwIHRoZSBtZW1vcnkgcmVnaW9uIGJlZm9yZSBkaXNhYmxpbmcgdGhlIGlycS4K
ClRoYW5rcyBmb3IgdGhlIHJlcG9ydCEgVGhlIG1hcHBpbmcgaXMgZG9uZSB3aXRoIGRldm1fIGhl
bHBlcnMgYW5kIHNvIGlzCnRoZSBJUlEgcmVnaXN0cmF0aW9uLCBzbyBpdCdzIHNsaWdodGx5IG1v
cmUgY29tcGxpY2F0ZWQgdGhhdCBqdXN0Cm1vdmluZyBhIGZ1bmN0aW9uIGNhbGwgaW4gdGhlIHJl
bW92ZSBwYXRoLCBhcHBhcmVudGx5LiBXb3VsZCB5b3UgbWluZAppbnZlc3RpZ2F0aW5nIGFuZCBw
cm9wb3NpbmcgYSBwYXRjaD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
