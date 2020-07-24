Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13DA0C433E5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:55:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57B92064C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ghS1xqXa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57B92064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FnJFT5XNN9UnjU+g2e/OuXAAiQJ8ws23ZaabAYKvZ1c=; b=ghS1xqXaI470zIib7b0D2VJLk
	LMSePjzqtipQKPaI78r/zxBZfZ6H+QJs0vRomw/euphC+COICq/TNHAO2hLRy0KUP7HBpBfrmjua7
	PPhccAUpchBrgGRkGscuDCDEepYRVjo+fzlaoQ3OK0hToVIYfKlcgiAKbq8/dc8lkpT6NOcu/clNF
	XLwgkxygzBiDsT346ND6Qvx8jPvef86kwP294i47OebwjQGMMchVWvHFRkkPn0RY1RIIvTT1nTHA2
	tNeCiE+P0iuB1ZiE09oiDy4EHWAqzMCsccsWfzmIxniF1wryQaYEOdugGUuNmtR2Ii0eRgqqUCvl9
	t//Fm/AjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz020-0006y3-9W; Fri, 24 Jul 2020 15:54:44 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz01x-0006xU-QQ
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 15:54:42 +0000
Received: by mail-wr1-f67.google.com with SMTP id f2so8748880wrp.7
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2020 08:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Kf1dseeXdq4ZJ2MoLlLEkkKYqnpO+uVX6RfAe0LBuXo=;
 b=nx6nCPbEl2jmzR8gb1TvTuvMJT3pvZHKviss6807PdEHukBo3zquveLG49/5Xfx+Hk
 pUKTfWmmlXxyoWukkBQiczrGVx68SP+lsJA7t0M9rZTQps4XQ+LHiXDxuiHksFjCnadE
 LZEAQzeBgZKnYeVNABtyPFJmat9atxaqCM5TBkF+HmNYPh4yqAPvBYcf89QGw4Yaa6xf
 r4DLl6qNjOdGAs8S05mGb1r1ea2nHAlbyPZcFjwetnQTtspujYMeYWfh1XkLnjITAkzu
 r8uul3C4f4V8p4THfK1oV23ssigoivh+IfRN4C4CZ3WzQhF5fzB274i1hwgW+hPWhf2l
 WeMQ==
X-Gm-Message-State: AOAM533oTeXcH8whXgvn9GD18HhRLtsCKixr2uMxwvsIiD2YvID2YnY9
 1u8skl1xdzIULNp2t3oJw6o=
X-Google-Smtp-Source: ABdhPJzsiL9xPZnqIRsa4EplqduajKhlOCqgC5oKJrL3jFja6/El7JiIO6RbHryhbxCCV6naonW0PQ==
X-Received: by 2002:adf:de91:: with SMTP id w17mr9136332wrl.108.1595606080536; 
 Fri, 24 Jul 2020 08:54:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id 78sm7983174wma.31.2020.07.24.08.54.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 08:54:39 -0700 (PDT)
Date: Fri, 24 Jul 2020 17:54:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
Message-ID: <20200724155436.GA7460@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_115441_888547_4F55ECD0 
X-CRM114-Status: GOOD (  19.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDU6NTA6MDZQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSB2ZW4uIDI0IGp1aWwuIDIwMjAgw6AgMTc6MzMsIEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gYSDDqWNyaXQKPiA6Cj4gPiBPbiBGcmksIDI0IEp1
bCAyMDIwIGF0IDE3OjE5LCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiA+
IHdyb3RlOgo+ID4gPiAKPiA+ID4gIEhpIEtyenlzenRvZiwKPiA+ID4gCj4gPiA+IAo+ID4gPiAg
TGUgdmVuLiAyNCBqdWlsLiAyMDIwIMOgIDE2OjU0LCBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA+
IDxrcnprQGtlcm5lbC5vcmc+IGEKPiA+ID4gIMOpY3JpdCA6Cj4gPiA+ICA+IEVuYWJsaW5nIHRo
ZSBNVERfTkFORF9KWjQ3ODAgZHJpdmVyIG1ha2VzIHNlbnNlIG9ubHkgZm9yIHNwZWNpZmljCj4g
PiA+ICA+IGhhcmR3YXJlIC0gdGhlIEluZ2VuaWMgU29DIGFyY2hpdGVjdHVyZS4gIFNldCBpdCdz
IGRlcGVuZGVuY3kgdG8KPiA+ID4gID4gTUFDSF9JTkdFTklDIHNvIGl0IHdpbGwgbm90IGFwcGVh
ciBvbiB1bnJlbGF0ZWQgYXJjaGl0ZWN0dXJlcwo+ID4gPiAoZWFzaWVyCj4gPiA+ICA+IGpvYiBm
b3IgZG93bnN0cmVhbS9kaXN0cm8ga2VybmVsIGVuZ2luZWVycykuCj4gPiA+IAo+ID4gPiAgRGlz
YWdyZWVkLiBJdCB3YXMgZG9uZSB0aGlzIHdheSBzbyB0aGF0IGRpc3RybyBrZXJuZWxzIGNhbiBz
dXBwb3J0Cj4gPiA+ICBtdWx0aXBsZSBTb0NzLgo+ID4gCj4gPiBUaGV5IHdpbGwgc3RpbGwgYmUg
YWJsZSB0byBzdXBwb3J0IG11bHRpcGxlIFNvQ3MuIE5vdGhpbmcgY2hhbmdlZAo+ID4gaGVyZS4g
VGhlIHNhbWUgd2UgZG8gZm9yIGFsbCBBUk0gZHJpdmVycyAoU29DcyBhcmUgbXVsdGlwbGF0Zm9y
bSkuLi4KPiA+IFVubGVzcyB5b3Ugd2FudCB0byBzYXkgdGhhdCBpdCBpcyBwb3NzaWJsZSB0byBz
dXBwb3J0IEluZ2VuaWMgU29DCj4gPiB3aXRob3V0IE1BQ0hfSU5HRU5JQz8KPiAKPiBPbiBNSVBT
LCB0aGUgU29DIHNlbGVjdGlvbiBpcyBhIEtjb25maWcgImNob2ljZSIsIHNvIHlvdSBjYW4gb25s
eSBzdXBwb3J0Cj4gb25lIFNvQyBmYW1pbHksIHVuZm9ydHVuYXRlbHkuCgpMZXQncyBzYXkgc29t
ZW9uZSBzZWxlY3RlZCB0aGVuIHNvbWUgb3RoZXIgYXJjaGl0ZWN0dXJlIChNSVBTX0FMQ0hFTVkp
LgpUaGV5IGNvdWxkIHNlbGVjdCB0aGlzIE1URCBkcml2ZXIuCgpEb2VzIGl0IG1lYW4gdGhleSB3
b3VsZCBiZSBhYmxlIHRvIHJ1biBpdCBvbiBJbmdlbmljIGhhcmR3YXJlPwoKPiBJJ20gdGhlIG9u
ZSB0byBibGFtZSBmb3IgdXNpbmcgImRlcGVuZHMgb24KPiBNSVBTIHx8IENPTVBJTEVfVEVTVCIg
b24gaW5nZW5pYyBkcml2ZXJzLCBtYXliZSBpdCBzaG91bGQgZGVwZW5kIG9uCj4gTUFDSF9JTkdF
TklDIGluZGVlZCwgYnV0IHRoZW4gaXQgc2hvdWxkIGJlIG1hZGUgcG9zc2libGUgdG8gc3VwcG9y
dCBtb3JlCj4gdGhhbiBvbmUgU29DIGZhbWlseS4KPiAKPiBUaGF0J3Mgc29tZXRoaW5nIHRoYXQg
c2hvdWxkIGJlIHBvaW50ZWQgb3V0IHRvIHRoZSBNSVBTIG1haWxpbmcgbGlzdCwgSQo+IGJlbGll
dmUuCgpTb21laG93IEpaNDc4MCBlbnRyaWVzIGluIE1haW50YWluZXJzIGRvIG5vdCBtZW50aW9u
IE1JUFMgbGlzdC4uLgoKPiAKPiBCdHc6IERvZXMgdGhhdCBtZWFuIHlvdSBhcmUgdGhlIG5ldyBt
YWludGFpbmVyIGZvciBkcml2ZXJzL21lbW9yeS8/CgpZZXMsIHRoYXQncyB0aGUgY29taW5nIGNo
YW5nZS4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA3MjQxNDAzNDUuR0IxMzQ3
MkBrb3ppay1sYXAvVC8jbTkxY2EyMDkyMGE3ZWM1ZjIyOGE1OTVmMTgxNmMxNWI2Yzg1YjZhMDkK
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
