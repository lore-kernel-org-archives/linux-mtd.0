Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60D5C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B622420656
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 07:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDvq6DJ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="b0RNTH8u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B622420656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Il+F1NIQIgSzEn9dXq07fxQ0BEiwDk/qwhqwSSXnYZ0=; b=YDvq6DJ+fFjlwE
	8mIq8ds8IZVVcsU28T80o5RCpYRKwsKPFgzQ4EXvgmX04XNPwVLGdrllTy5gboomgOTWb2DF+IdGP
	JlQllP1CYyxOx5x83MIwzpyg3NfPj4V/YCzRln4IufW9NmBUShe0+A9DhGr5GklxPU0mfxjOfabby
	duMSN/1na1IGcLNx/CZK+LDdoewRCeS2jObfGvPMMOoxfCQ6RI0ksVZaZsxotuYMh5/jKOJIgC8TH
	VVru54w4F8fpBDcDpp3vNmv+UyLRSE5hGEpSblYwdTcsQzZ9SVJzK7Vhs2GRatIdopDdwdEfBEFYH
	cI1zpeZcAMdH9XnucxkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgOVI-0000Dv-GW; Thu, 27 Jun 2019 07:07:32 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgOVE-0000DK-5f
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 07:07:30 +0000
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x5R778Ju003577
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 16:07:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5R778Ju003577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1561619229;
 bh=gj7s9w7UjXz0QHPHPCGEcB7DjBVPqUTYuZyU7sdAJGw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b0RNTH8uJ4ym7zeLnMIlOiCX7+JAAJ+v7rZoy4sTmkaxALKZTWXzWy8lMYMLfNnLt
 wo2FoB4GX8af7fhxA2P4V5+a0xDo5CojetqqsqHKj0e8a9T/4cP/oO/0Ojzd1ZqSv9
 9jTQPvBO8ojgs9a0xdLk/uFgBhiv7gywn0mMDfV6U3T88SnSC/QIgkYk8sXAsriyQv
 yTWfBDPviQAFp8Nzr2+DDvMmAm5OoTi21BJXnRyutWD1/2x+L7PhzWTvyu0jVWynkv
 s+qviyUZd6CkxtHBaTLtyYvgHPz8zjTRgLChpFilY0eIgAGMCekDiR1qX4CkLlOIuy
 fBvb5m30En/Lw==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id 8so448002uaz.11
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 00:07:08 -0700 (PDT)
X-Gm-Message-State: APjAAAX+SDLsJHQ/RoQA8VIsialndWUun7nzvKpehChbqBvMkNkqb748
 bZc+vsYWLgFnbX3RCzIsHCwITi5xbqia9TPPaSc=
X-Google-Smtp-Source: APXvYqx824GHdql4BE5NM/JzpgGc4JoQsrkCC8hqQAOm3UzXYSdRRi1zarQ28eOqavgTIxG4QWRhxiFU9drmOTEF+WY=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr880005ual.109.1561619227668; 
 Thu, 27 Jun 2019 00:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190618030926.30616-1-yamada.masahiro@socionext.com>
 <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
In-Reply-To: <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 27 Jun 2019 16:06:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARA62uqi8rkDeJ=zjA6vnruTAH2VGOBd4=sQMhF+FHMLA@mail.gmail.com>
Message-ID: <CAK7LNARA62uqi8rkDeJ=zjA6vnruTAH2VGOBd4=sQMhF+FHMLA@mail.gmail.com>
Subject: Re: [PATCH v2] jffs2: remove C++ style comments from uapi header
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_000728_451072_EEF5AD69 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMzoyMCBQTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+
IFZvbjogIk1hc2FoaXJvIFlhbWFkYSIgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+
ID4gQW46ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiA+IEND
OiAiQm9yaXMgQnJlemlsbG9uIiA8YmJyZXppbGxvbkBrZXJuZWwub3JnPiwgIk1pcXVlbCBSYXlu
YWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwgIkJyaWFuIE5vcnJpcyIKPiA+IDxjb21w
dXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+LCAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hy
QHRpLmNvbT4sICJNYXJlayBWYXN1dCIgPG1hcmVrLnZhc3V0QGdtYWlsLmNvbT4sCj4gPiAiTWFz
YWhpcm8gWWFtYWRhIiA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+LCAicmljaGFyZCIg
PHJpY2hhcmRAbm9kLmF0PiwgIkRhdmlkIFdvb2Rob3VzZSIgPGR3bXcyQGluZnJhZGVhZC5vcmc+
LAo+ID4gImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBH
ZXNlbmRldDogRGllbnN0YWcsIDE4LiBKdW5pIDIwMTkgMDU6MDk6MjYKPiA+IEJldHJlZmY6IFtQ
QVRDSCB2Ml0gamZmczI6IHJlbW92ZSBDKysgc3R5bGUgY29tbWVudHMgZnJvbSB1YXBpIGhlYWRl
cgo+Cj4gPiBMaW51eCBrZXJuZWwgdG9sZXJhdGVzIEMrKyBzdHlsZSBjb21tZW50cyB0aGVzZSBk
YXlzLiBBY3R1YWxseSwgdGhlCj4gPiBTUERYIExpY2Vuc2UgdGFncyBmb3IgLmMgZmlsZXMgc3Rh
cnQgd2l0aCAvLy4KPiA+Cj4gPiBPbiB0aGUgb3RoZXIgaGFuZCwgdWFwaSBoZWFkZXJzIGFyZSB3
cml0dGVuIGluIG1vcmUgc3RyaWN0IEMsIHdoZXJlCj4gPiB0aGUgQysrIGNvbW1lbnQgc3R5bGUg
aXMgZm9yYmlkZGVuLgo+ID4KPiA+IEkgc2ltcGx5IGRyb3BwZWQgdGhlc2UgbGluZXMgaW5zdGVh
ZCBvZiBmaXhpbmcgdGhlIGNvbW1lbnQgc3R5bGUuCj4gPgo+ID4gVGhpcyBjb2RlIGhhcyBiZWVu
IGFsd2F5cyBjb21tZW50ZWQgb3V0IHNpbmNlIGl0IHdhcyBhZGRlZCBhcm91bmQKPiA+IExpbnV4
IDIuNC45IChpLmUuIGNvbW1lbnRlZCBvdXQgZm9yIG1vcmUgdGhhbiAxNyB5ZWFycykuCj4gPgo+
ID4gJ01heWJlIGxhdGVyLi4uJyB3aWxsIG5ldmVyIGhhcHBlbi4KPgo+IDotKQo+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29t
Pgo+Cj4gQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4KPiBU
aGFua3MsCj4gLy9yaWNoYXJkCgoKV2lsbCB0aGlzIGJlIHBpY2tlZCB1cCBmb3IgdjUuMy1yYzEg
PwoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
