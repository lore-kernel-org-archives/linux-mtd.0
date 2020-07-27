Return-Path: <SRS0=kfRK=BG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317C4C433F4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 07:57:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F018920672
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2020 07:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9DIWZF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F018920672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9OhpkKDagXOXgtl+tYqzyB6mIEZMV1LMtd4foLKjmLY=; b=K9DIWZF7+yhJ4SUhBXnw+/Fgd
	KwCL7Iy6Tsezpb1l8a11YWLHp52QAyaj6VFl05tmekxzRMpS8/unqKMLaPKtVq53iOAUSa02fmrdc
	r3REeNxFkxynMV6DNbfvm2cWZAQJtTPUE9TKF7Mom6pirFp5O7yOkrcN+W19R/GDyuiM5Ke/QwZsS
	aOaoRV2X2ImVPOfm5E3EikI9DavR7YHLBBkOG5/AtkuC9FNt4xUKU+hz7xkvqnGRrHPSZLidJVxE+
	zuEjT7DaQY7YBcZuI6OnMQXuYlI27vdUlrjq0170is6A7ERE1gNkbKsT08A09Wo7sinDkEv80Ta4Z
	Fa0l68Lfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzxzd-0006bX-Tm; Mon, 27 Jul 2020 07:56:17 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzxza-0006aQ-VY
 for linux-mtd@lists.infradead.org; Mon, 27 Jul 2020 07:56:16 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MNc5b-1kAluB0Ozr-00P7zb for <linux-mtd@lists.infradead.org>; Mon, 27 Jul
 2020 09:56:12 +0200
Received: by mail-qk1-f174.google.com with SMTP id 11so14489999qkn.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jul 2020 00:56:11 -0700 (PDT)
X-Gm-Message-State: AOAM533i+wNrYc2q4okI75WR2s9bsc6ank9VMhIHOkXH+gYeAcRDt/uZ
 e+hucgWshagWA5mSnogww48hUZS4Jm95tL6yMmg=
X-Google-Smtp-Source: ABdhPJwN73bC8kIruJcdjJC2GFRSQxWwqPQCem38agJRvfEW+LrAzk5A0Z4s9LvPRY/dFw6d3xdJR2PEcDvNhP9aTUY=
X-Received: by 2002:a37:385:: with SMTP id 127mr20493263qkd.3.1595836570861;
 Mon, 27 Jul 2020 00:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200724145401.2566-1-krzk@kernel.org>
 <20200724145401.2566-3-krzk@kernel.org>
 <PWBZDQ.D1XCW6N2YMRA@crapouillou.net>
 <CAJKOXPc2w0QHQDEwqoeg9Nm361MszM4LRaCoJD2En-fPgPp+4Q@mail.gmail.com>
 <IBDZDQ.K28R5FAI0BXI2@crapouillou.net> <20200724155436.GA7460@kozik-lap>
 <K5Y0EQ.WYAK00ADM46F3@crapouillou.net>
 <CAK8P3a0HDu15u5dREd6gk_e9D6mrZ9JqT0DJs9AeC9C2602nAw@mail.gmail.com>
 <20200726160616.GA2662@kozik-lap> <RO33EQ.546WD84D5N7K2@crapouillou.net>
 <20200726161545.GA6058@kozik-lap> <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
In-Reply-To: <B243EQ.VEXGA7ZL5JAE2@crapouillou.net>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 09:55:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
Message-ID: <CAK8P3a1r6AMz2wKBEosAqn7qkuJY4LGFYK7o85sO++d+TSVOgQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: ingenic: Limit MTD_NAND_JZ4780 to
 architecture only
To: Paul Cercueil <paul@crapouillou.net>
X-Provags-ID: V03:K1:RAWmZh9pJo/r9HRF2bwXwWVtSlBQ9gZIv0Vc/olDUGeGJC2SXXm
 F5ZFCOiTrRw1a90HJlgTAe6ZPzA7PHxXIa0tI3nqOCEYAw0V6+3IW2h5vPfbQvtTdt0Dw74
 HKRCnnBIRr+f95dPD8aGeyMwySF9aSYl6qs727R30ZVgWW+U/cZrNSu6vxpHRpmFHEGjCsK
 na2RPKEFOooQDTnxEL7Pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dwl+KXNQQ9I=:F7Gz3J/JOfTMs2GTHrDpmz
 nxFORMsWMO92HmqH9Gr4lfwnUgGKG8a+0CBJLaW0Xp2VecvztLvnInaXL6/A1L8Jo76qAXnKP
 9W91qNhZ9Kryk+afr68VnlTAAVFItp6IcLrqw/CTH7GvAyB2SQ1XgaVs87bJYHc1c7P9govv2
 FnjhCsV03tM1ntb9dQaVRU9Lfw7sCWiStNf2tBdQWx0WvtXvEbp43ugQ2pms9s3cZ5KQp8sDW
 KVUxot08mQZ4+pQbzAQVi3Ss76JyY8CnHut1GtKFgYo+J55mDhRp3IEEj45/0jLb45mhnYhmU
 3s0NKBX5guC+1mRCEV09JGXtFC3QEJRL5E7S+k9j5bZqUgg96N6Gw6j0p4WFNZMumbOxMFKOq
 GBmWhjtNafUAQN+d1iEo4SeI9iIProFj5bsfOeztQ4sdBwBrdvsMZG9Hpv7E5uWc63M67xmtS
 1CvMJUQz+E21rkFqrT2pN6Dxo6PgcTyKwirgO8MVop2IEhuuLF3oPRKJ1lLYT/wWTVEFN01PK
 h51aXYSuheBjGevUfMrrG5zE4NxaE1CakPFT4kZl6IZYgVxJyiCqrpHIaX6KOe/NnyoVpyBxo
 5Nx2O+F6mgl0w5aVcBAVK/u9xnFEa0/IAFBQi5Pj8uxaVkcGiWqtlIlMn4n5vJg7u+j0SqvBp
 mEloLHOp/gQ7U4UtBR5fQGpAG4Ni7GgekcFqRsQMJSqRLHRhMRWiHlQVAOqHA4qL6zAfY1lDG
 B0iX1cZ3GsMHHy8QPOg/z5Me4GvKWOPHNFfMb/6O5z/YHeuzqqTef+erZS25dzJxUWqvnwjpc
 bUdfwCa2Z1XNf+SEncNrS50M85lScsdIbUJaWBaTgqKN3TftZOkF3rQdKtEAzo9UN8T3VT8jT
 skTvjsQmM/pDNSsJUP125bpVH536MRZMjDWbCP0Z7A+wxqYzkE1GoDKQC4Kk3NiP/vte0KGDn
 eqeTYs8BwfyDBmXt0/xZyiI36WxR2XtE7ATK8p9ciRoad3AgbwTQR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_035615_224133_AA3907D7 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKdWwgMjYsIDIwMjAgYXQgNjoyMCBQTSBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBv
dWlsbG91Lm5ldD4gd3JvdGU6Cj4gTGUgZGltLiAyNiBqdWlsLiAyMDIwIMOgIDE4OjE1LCBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IGEgw6ljcml0IDoKPiA+IE9uIFN1biwg
SnVsIDI2LCAyMDIwIGF0IDA2OjEyOjI3UE0gKzAyMDAsIFBhdWwgQ2VyY3VlaWwgd3JvdGU6Cj4g
Pj4gIExlIGRpbS4gMjYganVpbC4gMjAyMCDDoCAxODowNiwgS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPiBhIMOpY3JpdAogPgo+ID4gT0ssIHRoYXQncyB0cnVlLiBBbnl3YXks
IEkgZG9uJ3QgaGF2ZSBzdHJvbmcgb3BpbmlvbiBvbiBhbnkgb2YgdGhpcy4gSQo+ID4ganVzdCBm
b2xsb3dlZCBBcm5kJ3MgaGludC4KPiA+Cj4gPiBGb3IgdGhlIG1lbW9yeSBkcml2ZXIgKGFuZCBN
VEQgTkFORCBhcyB3ZWxsKSB3aGljaCBvbmUgeW91IHByZWZlcjoKPiA+IDEuIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA3MjQwNzQwMzguNTU5Ny02LWtyemtAa2VybmVsLm9yZy8K
PiA+IDIuIGRlcGVuZHMgb24gTUFDSF9JTkdFTklDIHx8IE1JUFNfR0VORVJJQyB8fCBDT01QSUxF
X1RFU1QKPiA+Cj4gPiA/Cj4KPiBJJ2Qgc2F5IGEgc2xpZ2h0bHkgbW9kaWZpZWQgIzEuIFRoZSBk
cml2ZXIgc2hvdWxkbid0IGJlICJkZWZhdWx0IHkiIGluCj4gdGhlIGZpcnN0IHBsYWNlLCBzbyB0
aGUgcGF0Y2ggY291bGQgYmUgdG8gZGlzYWJsZSBpdCBieSBkZWZhdWx0LgoKSWYgaXQgZGVmYXVs
dHMgdG8gJ24nIGV2ZW4gZm9yIE1BQ0hfSU5HRU5JQywgeW91IG1heSBoYXZlIHRvIGVuYWJsZQpp
dCBpbiB0aGUgZm91ciBkZWZjb25maWcgZmlsZXMgZm9yIHRoZXNlIG1hY2hpbmVzIHRvIGF2b2lk
IHN1cnByaXNlcy4KCj4gQW5kIHdoZW4gdGhlIEluZ2VuaWMgY29kZSBpcyBtZXJnZWQgaW50byB0
aGUgTUlQUyBnZW5lcmljIGZyYW1ld29yaywgSSdsbAo+IHNlbmQgYSBzZXQgb2YgcGF0Y2hlcyB0
byBjaGFuZ2UgYWxsIGRyaXZlciBkZXBlbmRlbmNpZXMgb24gTUlQUyB0bwo+IE1JUFNfR0VORVJJ
Qy4KClRoZSB3YXkgd2UgZG8gaXQgb24gQXJtLCB0aGUgbWFjaGluZSBLY29uZmlnIGlkZW50aWZp
ZXJzIHN0YXkgYXJvdW5kCmV2ZW4gZm9yIG11bHRpcGxhdGZvcm0gdGFyZ2V0cyAod2hpY2ggbm93
IG1ha2UgdXAgYmFzaWNhbGx5IGFjdGl2ZWx5Cm1haW50YWluZWQgbWFjaGluZXMpLgoKSSBkb24n
dCB0aGluayBpdCBtYWtlcyBhbnkgc2Vuc2UgZm9yIGEgZHJpdmVyIHRvIGRlcGVuZCBvbiBNSVBT
X0dFTkVSSUM6CmVpdGhlciBpdCBpcyBhIGdlbmVyaWMgZHJpdmVyIHRoYXQgc2hvdWxkIGFsd2F5
cyBiZSB2aXNpYmxlIG9yIGl0IGlzIHNwZWNpZmljCnRvIGEgc2V0IG9mIFNvQ3MgYW5kIHNob3Vs
ZCBkZXBlbmQgb24gc29tZSBjb3JyZXNwb25kaW5nIHZlbmRvcgpzcGVjaWZpYyBpZGVudGlmaWVy
cy4KCiAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
