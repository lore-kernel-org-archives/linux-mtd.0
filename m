Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A92DC282C2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 01:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDF552083B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 01:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CljbwqBJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="jkYK+RHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDF552083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eht13P2Ea3dhCWHC43DHNTLWKduEVj6bh6jF0gNTxhw=; b=CljbwqBJziWLF1
	gnnocdZZTqpIVxuP6e6WW+RkrpmBeOt5TAXGkW29n4NHgY8KrkMJtqsefRHjFf3eRGBglkUnpeZWx
	3/xchTDoITUO050TE1Rf+KtNPfHx0SX7nQX/bVeADpbsHJ5KbxHznIzZJiSF7uQI/+MW/YjNey7Yi
	rSDHP2rlXSP2a2ibKKUmXcGwaT6JhNwvakkeRt3Z+NX9q+WIBxKIuVBsCpsTwwqy+NrCbRTtqB0lR
	50qBVmv/+ysKT8x11uGQC9yYbwvvwcrUls/c3FHsZysNw4WZy5uxpKTt96M1ZWil9Q1Eq2Yu0v5mN
	H0uZVcu2YLXTgSMvw96Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gt0D0-0001ph-B5; Mon, 11 Feb 2019 01:16:30 +0000
Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gt0Cu-0001pE-Oj
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 01:16:27 +0000
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x1B1FirR029602
 for <linux-mtd@lists.infradead.org>; Mon, 11 Feb 2019 10:15:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x1B1FirR029602
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549847745;
 bh=liz0a8bmiw0FcM/TWTCUBPm8kJRY4MTjd3tYETr+dQ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jkYK+RHpAwsxV3e8camizcZd99ZpqOsKQ3iKeFmanLkNdLMSuz1MtKHeBRAYOQ0vw
 BtvHjkUq3zsbsPFPBQL+ccP9Yjtg0+RVtnjIoId+O7PVUIC2EqWDVY0pCgeuYTWnFg
 Av0I718bzJOhWpEMAO2Lma4uR5lFbGWU3dVokxd5zY/elNmKbR1tKXT7zjiB2kQw/N
 58rpNYbE3bkfOj+rus+N1nWtji+dru9DyLA6VGL6HxNRGGLwMabKnIhxTlrSt3Up9p
 fJtqSDt/y1twwyvNp1bnkCki/Fxzcg1VxQ75pTJ4BC2jklA/d9AaKqWNmO1jJHwoqX
 kgSDnrIePl2VA==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id z11so2883260uaa.10
 for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2019 17:15:44 -0800 (PST)
X-Gm-Message-State: AHQUAubvbV6dxC+9OpUwB6tSKScBdVXgYXoVc0aE4hT3GhP4wFWROuJ3
 EzW0wPnuCj7X6zNRALXeF+tHhJ5WDjgHW2E/9qg=
X-Google-Smtp-Source: AHgI3IYpFWX9qhhmBNeNSLY7sQ+QD247/WyYD607wgddcoSWfCvZgNf8CTZvizxwT0YsPr/nPUyLrv3+kg9ey47OxRM=
X-Received: by 2002:a9f:3f41:: with SMTP id i1mr12021102uaj.42.1549847743634; 
 Sun, 10 Feb 2019 17:15:43 -0800 (PST)
MIME-Version: 1.0
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-6-git-send-email-yamada.masahiro@socionext.com>
 <20190208225733.2c8779b9@xps13>
In-Reply-To: <20190208225733.2c8779b9@xps13>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 11 Feb 2019 10:15:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0hJJ=PWJhWo5cjtboN6qW5JFtOV+WzrLyFy=zRXjwFw@mail.gmail.com>
Message-ID: <CAK7LNAT0hJJ=PWJhWo5cjtboN6qW5JFtOV+WzrLyFy=zRXjwFw@mail.gmail.com>
Subject: Re: [PATCH 05/11] mtd: rawnand: denali: rename irq_status to irq_stat
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_171625_073198_ADCAAD26 
X-CRM114-Status: GOOD (  16.10  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gU2F0LCBGZWIgOSwgMjAxOSBhdCA2OjU3IEFNIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgTWFzYWhpcm8sCj4KPiBN
YXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3cm90ZSBvbiBG
cmksICA4IEZlYgo+IDIwMTkgMTc6MDg6NDkgKzA5MDA6Cj4KPiA+IEkgd2lsbCBhZGQgdGhlIHRo
aXJkIGFyZ3VtZW50IHRvIGRlbmFsaV93YWl0X2Zvcl9pcnEoKSBpbiB0aGUKPiA+IGZvbGxvd2lu
ZyBjb21taXQuIFRoZW4sIHNvbWUgbGluZXMgd2lsbCBleGNlZWQgODAgY29sdW1ucy4KPiA+Cj4g
PiBSZW5hbWUgJ2lycV9zdGF0dXMnIHRvICdpcnFfc3RhdCcuIFNhdmluZyB0d28gY2hhcmFjdGVy
cyB3aWxsIGF2b2lkCj4gPiBsaW5lLXdyYXBwaW5nIGluIHNvbWUgcGxhY2VzLCBhbmQga2VlcCB0
aGUgY29kZSBjbGVhbi4KPgo+IEkgaGFkIGEgbG9vayBhdCB0aGUgY2hhbmdlcyBhbmQgSSBkb24n
dCB0aGluayB0aGlzIGlzIHdvcnRoIHRoZQo+IHRyb3VibGUuIEkgZG9uJ3QgZmluZCBpcnFfc3Rh
dCBtZWFuaW5nZnVsIGVub3VnaCBjb21wYXJlZCB0bwo+IGlycV9zdGF0dXMuIElmIHlvdSB3YW50
LCB5b3UgbWF5IGJyZWFrIGxpbmVzIGJldHdlZW4gYXJndW1lbnRzIG9mIGEKPiBmdW5jdGlvbiBp
bnN0ZWFkLgoKT0ssIEkgd2lsbCBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB2Mi4KCgo+ID4KPiA+IEkg
cmVwbGFjZWQgdWludDMyX3Qgd2l0aCB1MzIgaW4gdGhlIHRvdWNoZWQgbGluZXMuIFRoaXMgd2ls
bCByZWR1Y2UKPiA+IHRoZSByZXBvcnRzIGZyb20gJ3NjcmlwdHMvY2hlY2twYXRjaC5wbCAtLXN0
cmljdCcuCj4KPiBXaGlsZSB5b3UgYXJlIGF0IGl0LCBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0
byBjb252ZXJ0IHRoZSB3aG9sZQo+IGRyaXZlciBpbiBvbmUgZ28gdG8gdXNpbmcgdTgsIHUxNiBh
bmQgdTMyPwoKSSBkaWQgdGhpcyBpbiAxMS8xMS4KaHR0cDovL3BhdGNod29yay5vemxhYnMub3Jn
L3BhdGNoLzEwMzg1MDcvCgpJIHdpbGwgbW92ZSBhbGwgdWludDMyX3QgLT4gdTMyIGNvbnZlcnNp
b25zIHRvIHRoZSBsYXN0IHBhdGNoCmlmIHRoaXMgaXMgd29ydGh3aGlsZS4KCgpUaGFua3MuCgo+
IFRoYW5rcywKPiBNaXF1w6hsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
