Return-Path: <SRS0=JUqn=BF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB2EC433E5
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:16:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B3C206D8
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jul 2020 16:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ta7ZRX2c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B3C206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LXwOH2I50S9psRGPlYqXdC9wprJa9Vs/jwP3KxQniFM=; b=Ta7ZRX2csa25vYx1QmwpZxaz4
	6Irhby2bGgImqOud0C7zcrpgufgqxPS8jtQgDb+nGznnFrcn9XvfR8LfW6gVI4Ay0CT0HJn3nqwJ4
	/ezk8BlXuHVZbzmsTHzacIrfqRM8W5ArnvaCUtxGe5bbFvVdVb6lY/lhLEBwK5B+MR+AYwnCrgFIs
	CUDwCuapXgnVwA8p0A8CeRR8/oeuQkmmxzJeFzyJmtQBmPElNM6lkVeh624ARP88YaRAzlxCalYsX
	rTpOrB+rW+o9bhlW5bzv95MDOpYwEO9lukKSE+8DMdwoN8FXYzMa2xHzHi/90qtUpK/6/D23Q/hLF
	V78MVK3EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzjJY-00062w-NX; Sun, 26 Jul 2020 16:15:52 +0000
Received: from mail-ej1-f68.google.com ([209.85.218.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzjJW-00062G-Aj
 for linux-mtd@lists.infradead.org; Sun, 26 Jul 2020 16:15:51 +0000
Received: by mail-ej1-f68.google.com with SMTP id d6so817738ejr.5
 for <linux-mtd@lists.infradead.org>; Sun, 26 Jul 2020 09:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LHCX779xDCziv9cINGPr791+zRjJyZ0k/sQQBFyJUkU=;
 b=Xzifj1LvOIHgEaHNhIE8q88a6fmuT2XA/uFEMZh+Kt3yRmlk3Cun9yxIwA+HqI5oFH
 2Cc+HsjvRrN6n36VtYRxfWdsLvB3m+S97blE2SqxvEWIJ5xGvNQb0Ju3edgnCDR+xmSR
 aV0bmWVPqs5pMP8Q0RfGKqPtzjv38VpdYyMwvzPK58udglEMZfL/TxWSwdiL7Fo8wjtt
 cuSRM9/4360JGTsQbW+gnCqtwpo7fg4Ygw/18Myx/qrecRrVOuDCfUSOmuvKgFhi04EV
 3ks7J5EqWAqtgQPIMap5dCO61/jne6mVvCAl8RitkRqrLg5yVBRi/6mMQr2rNSYgQuIM
 OB7w==
X-Gm-Message-State: AOAM533zeBnM70Ljj3sbhHvUxM6BT8VQyzBED/g4sP11T73bElJ5uodF
 xcIFNpn8mfpZPqf8HV4Cjpg=
X-Google-Smtp-Source: ABdhPJxnTcSNTUSMfMTn0La6YPwuFCw4PQ75kCsUb7roUhlRYj3yttARKH7FOWYbz6r5ML3+mFGUoQ==
X-Received: by 2002:a17:906:970a:: with SMTP id
 k10mr2114160ejx.189.1595780148915; 
 Sun, 26 Jul 2020 09:15:48 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id i5sm5055198ejg.121.2020.07.26.09.15.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Jul 2020 09:15:47 -0700 (PDT)
Date: Sun, 26 Jul 2020 18:15:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
Message-ID: <20200726161545.GA6058@kozik-lap>
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net>
 <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap>
 <RO33EQ.546WD84D5N7K2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <RO33EQ.546WD84D5N7K2@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_121550_420190_554409B1 
X-CRM114-Status: GOOD (  21.35  )
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
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMjYsIDIwMjAgYXQgMDY6MTI6MjdQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiAKPiAKPiBMZSBkaW0uIDI2IGp1aWwuIDIwMjAgw6AgMTg6MDYsIEtyenlzenRvZiBL
b3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gYSDDqWNyaXQKPiA6Cj4gPiBPbiBTYXQsIEp1bCAy
NSwgMjAyMCBhdCAwODozMDo1NlBNICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gPiAg
T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMjoxNyBQTSBQYXVsIENlcmN1ZWlsCj4gPiA+IDxwYXVs
QGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4gPiA+ICA+IExlIHZlbi4gMjQganVpbC4gMjAyMCDD
oCAxNzo1NCwgS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPiA8a3J6a0BrZXJuZWwub3JnPiBhCj4g
PiA+ICA+IMOpY3JpdCA6Cj4gPiA+ICA+ID4gT24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDU6NTA6
MDZQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4gID4gPj4gIExlIHZlbi4gMjQg
anVpbC4gMjAyMCDDoCAxNzozMywgS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPiAgPiA+PiA8a3J6
a0BrZXJuZWwub3JnPiBhIMOpY3JpdDoKPiA+ID4gID4gPj4gID4gT24gRnJpLCAyNCBKdWwgMjAy
MCBhdCAxNzoxOSwgUGF1bCBDZXJjdWVpbAo+ID4gPiA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4g
PiA+ICA+ID4+ICA+IHdyb3RlOgo+ID4gPiAgPiA+Pgo+ID4gPiAgPiA+PiAgT24gTUlQUywgdGhl
IFNvQyBzZWxlY3Rpb24gaXMgYSBLY29uZmlnICJjaG9pY2UiLCBzbyB5b3UgY2FuCj4gPiA+IG9u
bHkKPiA+ID4gID4gPj4gc3VwcG9ydAo+ID4gPiAgPiA+PiAgb25lIFNvQyBmYW1pbHksIHVuZm9y
dHVuYXRlbHkuCj4gPiA+ICA+ID4KPiA+ID4gID4gPiBMZXQncyBzYXkgc29tZW9uZSBzZWxlY3Rl
ZCB0aGVuIHNvbWUgb3RoZXIgYXJjaGl0ZWN0dXJlCj4gPiA+ICA+ID4gKE1JUFNfQUxDSEVNWSku
Cj4gPiA+ICA+ID4gVGhleSBjb3VsZCBzZWxlY3QgdGhpcyBNVEQgZHJpdmVyLgo+ID4gPiAgPiA+
Cj4gPiA+ICA+ID4gRG9lcyBpdCBtZWFuIHRoZXkgd291bGQgYmUgYWJsZSB0byBydW4gaXQgb24g
SW5nZW5pYyBoYXJkd2FyZT8KPiA+ID4gID4KPiA+ID4gID4gSW4gKnRoZW9yeSogeWVzLCBhcyBs
b25nIGFzIHRoZSBLY29uZmlnIG9wdGlvbnMgdGhhdCBNQUNIX0lOR0VOSUMKPiA+ID4gID4gc2Vs
ZWN0cyBhcmUgZW5hYmxlZCwgdGhlIGtlcm5lbCBzaG91bGQgYm9vdCBhbmQgd29yayBvbiBJbmdl
bmljCj4gPiA+IFNvQ3MuCj4gPiA+IAo+ID4gPiAgUmlnaHQgbm93LCB0aGlzIHdvbid0IHdvcmsg
eWV0LCBiZWNhdXNlIHRoZXJlIGFyZSBwbGF0Zm9ybSBzcGVjaWZpYwo+ID4gPiAgZnVuY3Rpb25z
IHRoYXQgYXJlIGltcGxlbWVudGVkIGJ5IGVhY2ggb2YgdGhlIHBsYXRmb3JtcyBpbgo+ID4gPiBh
cmNoL21pcHMsCj4gPiA+ICBlLmcuIGFyY2gvbWlwcy9nZW5lcmljL2luaXQuYyBhbmQgYXJjaC9t
aXBzL2p6NDc0MC9zZXR1cC5jLgo+ID4gCj4gPiBJIHdvdWxkIHNheSBldmVuIG1vcmUgLSBubyBE
VFMgd291bGQgYmUgcHJvdmlkZWQgZm9yIHN1Y2ggY29uZmlndXJhdGlvbi4KPiA+IEFsbCBJbmdl
bmljIERUU2VzIGFyZSBpbmNsdWRlZCBvbmx5IHdpdGggTUFDSF9JTkdFTklDLiAgWW91IGNhbm5v
dCBidWlsZAo+ID4gYSBrZXJuZWwgd29ya2luZyBvbiBJbmdlbmljIHdpdGhvdXQgTUFDSF9JTkdF
TklDLiBFdmVuIGluIHRoZW9yeS4KPiAKPiBCdXQgdGhlIGRldmljZXRyZWUgZG9lc24ndCBoYXZl
IHRvIGJlIGJ1aWx0LWluLgo+CgpPSywgdGhhdCdzIHRydWUuIEFueXdheSwgSSBkb24ndCBoYXZl
IHN0cm9uZyBvcGluaW9uIG9uIGFueSBvZiB0aGlzLiBJCmp1c3QgZm9sbG93ZWQgQXJuZCdzIGhp
bnQuCgpGb3IgdGhlIG1lbW9yeSBkcml2ZXIgKGFuZCBNVEQgTkFORCBhcyB3ZWxsKSB3aGljaCBv
bmUgeW91IHByZWZlcjoKMS4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDcyNDA3
NDAzOC41NTk3LTYta3J6a0BrZXJuZWwub3JnLwoyLiBkZXBlbmRzIG9uIE1BQ0hfSU5HRU5JQyB8
fCBNSVBTX0dFTkVSSUMgfHwgQ09NUElMRV9URVNUCgo/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRv
ZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
