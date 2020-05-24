Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1406CC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:28:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D68D720812
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DizN0BhU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ib6C/+YE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68D720812
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9eoG3T1Yp++mfqluUQAoIeoRe5ZipjMQVA12QjPNQU=; b=DizN0BhUi+jrce
	sa6fwgG/g3y3ORNo7txaYywrRomcBSS7ywxL0mtgLDemD7wKZvbsJ7cmu3b9M60vLjjjilW7V7K9N
	07AZ/SUwGirkiCtFTVfeZJZMQvUpw9XLp6FnaXca8oVE3FfRtBZzhwhuSqcOBfCyjLrt68I+sfNKJ
	8VuCDjpvKRbfiXvpTYTip99mpIzmI8efab+a1TJ9HTZRL2944eH//oJIrAdEpk3snENFjFFn+Vjz8
	AT+hViv6jSkSIvc3Sg9WKnxolRQAhLd8kg++CbJ2zmZ5K1djTHAVJCYP8Pn3c9TIUKTWFilFpLaoY
	/RntFPVshZXBeBa/iGoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcyA2-0007mg-Pd; Sun, 24 May 2020 21:27:58 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcyA0-0007mN-Hl
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 21:27:57 +0000
Received: by mail-qk1-x744.google.com with SMTP id c185so1907447qke.7
 for <linux-mtd@lists.infradead.org>; Sun, 24 May 2020 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K+OEY7lK1Db+EgbE+rbT0EtjxC66i0NhuCxPpBJbiRs=;
 b=ib6C/+YEc/fcU7rZocmLNanXn6/Gw2Wcj8LfOPbr1ZYU5PUjE8b/5dgftC+Updpd5/
 KCsjPELoDLZC5AyF3V5fKAT16kb7nWuQHvrhAF+cUp3JebdybTfQWV+1kDyqm+Np425r
 uyfwcUb/kjPwUgfg6gm1Sgw7GHbnu5UdAgdrq41dWvexhj82Z6sjNV2+fsAWNbrlc/EF
 hRNjezr36EqkggxNJNfi0lYqA79ujUgGrziHZ2oWAYcKp4FvJHEYiGO+oPTuSrDsVkc1
 NKMCWlAsBsuZnnqTU60v4Gh6garoByN9ITrBmqKseanFdwKEwqsCUuDiCXozNFC6es5x
 FEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K+OEY7lK1Db+EgbE+rbT0EtjxC66i0NhuCxPpBJbiRs=;
 b=tlAWwKIHyGraiL1+LDxiLzAxXXqg5ibcskK/lKqVAswNQJDJWxtcvG/TuijfMxoeoD
 HPnRoA9Nz+CotPvcgvVA2X85e1vsMMMpg54xORr3Fykp/woTurp4E608fYPPkBZowPVy
 P12i4U6/avr6pbQMlT7sYE8S/XXAm6AYEqHCR329XM/cu7T8g5190l1S6c+tH3+Nk4vP
 6ivJQSHD2TiPp8pQEpU0PPQcEn+ECBgefTLEIU2H2E69JilztWDx2GcfKwVxDDkM0Bdt
 g7j8Z91zqdp14hRft8t56pEPOGYFb6hmgZpSj2rOnHxQYSoJnLkFyw9NdUvlz4O0Km2X
 Qa1A==
X-Gm-Message-State: AOAM532SyY20lcpJ/iFvP6oLvsdSrnJSS9wq70TFLigGIdQS1uH1Yq/V
 LFjEAmDUIiAA+c29XbfcVTo3PruLEkHb8y6g31Y=
X-Google-Smtp-Source: ABdhPJyFvWYLRqodwEfmUn70oAW9SG6P709a98yc3yKjquKNcWHG3n/QI1llG6aSt0Z5018fJ9wAt8lIYNSHD3buiNE=
X-Received: by 2002:a05:620a:15f4:: with SMTP id
 p20mr10202561qkm.283.1590355674568; 
 Sun, 24 May 2020 14:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-7-miquel.raynal@bootlin.com>
 <1221365235.202803.1589056980096.JavaMail.zimbra@nod.at>
 <20200510002949.6ef593ba@xps13>
In-Reply-To: <20200510002949.6ef593ba@xps13>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 May 2020 23:27:43 +0200
Message-ID: <CAFLxGvy58k35yMpxRTidq68dr3R1d+aFF0mmxsz6T=q2fajx0A@mail.gmail.com>
Subject: Re: [PATCH 06/17] mtd: rawnand: nandsim: Remove debugfs entries at
 unload time
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_142756_587716_5135A200 
X-CRM114-Status: GOOD (  18.06  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, dedekind@infradead.org,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBNYXkgMTAsIDIwMjAgYXQgMTI6MzAgQU0gTWlxdWVsIFJheW5hbAo8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIaSBSaWNoYXJkLAo+Cj4gUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24gU2F0LCA5IE1heSAyMDIwIDIyOjQzOjAw
Cj4gKzAyMDAgKENFU1QpOgo+Cj4gPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4g
PiA+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4g
PiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8
dmlnbmVzaHJAdGkuY29tPiwgIlR1ZG9yIEFtYmFydXMiIDxUdWRvci5BbWJhcnVzQG1pY3JvY2hp
cC5jb20+LAo+ID4gPiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+
Cj4gPiA+IENDOiAiQm9yaXMgQnJlemlsbG9uIiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5j
b20+LCBkZWRla2luZEBpbmZyYWRlYWQub3JnLCAiTWlxdWVsIFJheW5hbCIKPiA+ID4gPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiA+IEdlc2VuZGV0OiBTYW1zdGFnLCA5LiBNYWkgMjAy
MCAyMToxNDoxOQo+ID4gPiBCZXRyZWZmOiBbUEFUQ0ggMDYvMTddIG10ZDogcmF3bmFuZDogbmFu
ZHNpbTogUmVtb3ZlIGRlYnVnZnMgZW50cmllcyBhdCB1bmxvYWQgdGltZQo+ID4KPiA+ID4gQ3Jl
YXRlIGEgbnNfZGVidWdmc19yZW1vdmUoKSBoZWxwZXIgZm9yIHRoYXQgYW5kIGNhbGwgaXQgaW4K
PiA+ID4gbnNfY2xlYW51cF9tb2R1bGUoKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gLS0tCj4gPiA+IGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYyB8IDYgKysrKysrCj4gPiA+IDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRzaW0uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+ID4g
PiBpbmRleCBjOGU5YzcwYTY2NDEuLjc4NjJjNjVlMzJhZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRzaW0uYwo+ID4gPiBAQCAtNTIwLDYgKzUyMCwxMSBAQCBzdGF0aWMgaW50IG5zX2Rl
YnVnZnNfY3JlYXRlKHN0cnVjdCBuYW5kc2ltICpucykKPiA+ID4gICAgIHJldHVybiAwOwo+ID4g
PiB9Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgdm9pZCBuc19kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3QgbmFu
ZHNpbSAqbnMpCj4gPiA+ICt7Cj4gPiA+ICsgICBkZWJ1Z2ZzX3JlbW92ZShucy0+ZGVudCk7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gLyoKPiA+ID4gICogQWxsb2NhdGUgYXJyYXkgb2YgcGFnZSBw
b2ludGVycywgY3JlYXRlIHNsYWIgYWxsb2NhdGlvbiBmb3IgYW4gYXJyYXkKPiA+ID4gICogYW5k
IGluaXRpYWxpemUgdGhlIGFycmF5IGJ5IE5VTEwgcG9pbnRlcnMuCj4gPiA+IEBAIC0yMzk4LDYg
KzI0MDMsNyBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgbnNfY2xlYW51cF9tb2R1bGUodm9pZCkKPiA+
ID4gICAgIHN0cnVjdCBuYW5kc2ltICpucyA9IG5hbmRfZ2V0X2NvbnRyb2xsZXJfZGF0YShjaGlw
KTsKPiA+ID4gICAgIGludCBpOwo+ID4gPgo+ID4gPiArICAgbnNfZGVidWdmc19yZW1vdmUobnMp
Owo+ID4gPiAgICAgbnNfZnJlZShucyk7ICAgIC8qIEZyZWUgbmFuZHNpbSBwcml2YXRlIHJlc291
cmNlcyAqLwo+ID4KPiA+IFdoeSBpcyB0aGlzIHNwZWNpYWwgYW5kIGNhbm5vdCBkb25lIGluIG5z
X2ZyZWUoKT8KPiA+Cj4KPiBuc19kZWJ1Z2ZzX2NyZWF0ZSgpIGlzIGNhbGxlZCBpbiBuc19pbml0
X21vZHVsZSgpLCBzbyBmb3IgbWUgaXQgaXMKPiBuYXR1cmFsIHRvIGNhbGwgbnNfZGVidWdmc19y
ZW1vdmUgaW4gbnNfY2xlYW51cF9tb2R1bGUoKS4gTW9yZSB0aGFuCj4gY2FsbGluZyBpdCBmcm9t
IG5zX2ZyZWUoKSB3aGljaCBpcyB0aGUgc3ltbWV0cnkgb2YgbnNfaW5pdCgpLiBObz8KCk9rYXku
IE1ha2VzIHNlbnNlLgoKLS0gClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
