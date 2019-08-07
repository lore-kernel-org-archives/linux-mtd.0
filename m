Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042CFC32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E0A2231F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 16:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nNHY6ceR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8YEU80c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7E0A2231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFTr6R7KeRZe71qnP2bC9WztiuyFdO5RawvfFRxcvjA=; b=nNHY6ceRwVxkoC
	ezzUoMVWhYmWv2Ipm4/10ry4VSe01zGnEZqsa9M6upLmSund9PStfIfbySF8i9a6feqjD06fS5H2J
	WJoYMfxfvqfaHGTogjPs63hOBVW45UZDZZHMpgH+qYEgbkX1VWRwSc+601VcduutSI3oSXgq0XJy6
	80DjYr2NDZMksmkxoyiuN6O1zBn+cgN3ubLYiQ0Lj08XW3L5IrgwjV/u6rqw0pDOLyyzBQPuUrUuK
	ypboyannUv6QBLGbW0y2bFjyVV7FK07u4F/u4DyGM/4ZrO+bj09SFLaCvLlqtLdTAwY6OG/0JQfRU
	J8/dzeHB7zsA4cfS7wCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvPB3-0002tm-Qb; Wed, 07 Aug 2019 16:52:41 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvPB0-0002t1-Pl
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 16:52:40 +0000
Received: by mail-lj1-x243.google.com with SMTP id h10so14665936ljg.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2019 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QC7wHS3+ISEBThD3yh/vJDX8Xujexo9wNquWHTymYZ8=;
 b=m8YEU80cq71xT9BcalJf1PyfEURzMb1kFiDIFCswOAOHKEaRGxjSFqDPt4n5666hfk
 f+Ni9/WBQT0kG0sRQ4cgqmN6ucrO9oBEsBLmEIpLkUQkckU9Lv/akywQX0SGf97wLEJt
 bSNQpfqXyQZwpF6CpZGVgYDAZxnsrsm7YGrXl62zm0pJR/dUCuItRhPVv4Lz0kNP5AUy
 QiMyajbXCdCTvfON5yjMfyWemL9SE4aoCy7q4ryaYsARQjBvhHOO1CvMwBJ4ah4Ionl9
 1JS6o42jgU6BDal2hUzhFV6lwTihHJsHhkbrxvmDhgK24dCuHYx9ecl7m8j24c5c+Q7s
 RHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QC7wHS3+ISEBThD3yh/vJDX8Xujexo9wNquWHTymYZ8=;
 b=a3K1gDZCns+UR+0ZboRhlyhkdCs44LbjCd8iKM/9ni4/TNDHHP9u3Kp1XNVmDmB7xA
 uKzbJHkzSdWJ9Xf9mamgIhZ1knFkwj4K3KGcEc4tDVdkyVbN3SjhRGf5kW2hc/Dcgngc
 sIU2RGeSGvPWTB+HxxNaiuFiKIoDK9tKvJQ2mAfVmlSLMsyyqwJjBWBK6GTI3x84vqSQ
 gAeiGnTyCN6xVlYQQtkr/QlP/bHChyhjMojeInGbxXn1HH0MCVLp7vk+37NHKwGAUsv4
 zI3EkGSUbssEInB9B3K8fEtZbj3UoA+WdSbqmTbFHJ/4uW8Pd4uAjlxic/5nKa2ve/14
 C/jA==
X-Gm-Message-State: APjAAAXMiKjj1UbUULsO+DHlOkal2lpoiQUwLKtx9o9JdFYohZ0z7nA3
 HI70n96s+UgDfK18qZinDPsRkQ+ypizur0YSkfE=
X-Google-Smtp-Source: APXvYqwG5hhnFREvq1qUqsccIXXUbyH9vBFlyynNtOw8iCYEENBqiz3jJhb0dHfoyl20H12QDgSGOPp9aAtff+6rcx0=
X-Received: by 2002:a2e:b009:: with SMTP id y9mr5482513ljk.152.1565196757241; 
 Wed, 07 Aug 2019 09:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMxq0fNSWrUFMmmTs8Ri9gFOvS+KQJvZN3-_KuiqXi9bbmCB0Q@mail.gmail.com>
 <CAFLxGvz92UR2M7KJ_dMMW-F47_pLLxSTOrGwdQ5Cc0kuSiTA8Q@mail.gmail.com>
 <CAMxq0fO=0P8972FKvscmNxCBxq0m8_f2DST-Oa9HtNeUA-FKsA@mail.gmail.com>
 <1019514474.57102.1564822129140.JavaMail.zimbra@nod.at>
 <CAMxq0fPvj+gMnUysDDN8j2wXNQj3Th_HwVV2NWmm8pjSe7Q_vQ@mail.gmail.com>
In-Reply-To: <CAMxq0fPvj+gMnUysDDN8j2wXNQj3Th_HwVV2NWmm8pjSe7Q_vQ@mail.gmail.com>
From: Sergeant Peppercorn <speppercorn109@gmail.com>
Date: Wed, 7 Aug 2019 09:52:26 -0700
Message-ID: <CAMxq0fOJ0uqqzPRW_wBiAZS=KzpRy_waGHODErhjcLgRbX5ALQ@mail.gmail.com>
Subject: Re: UBIFS ECC errors
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_095238_858364_06C48DE9 
X-CRM114-Status: GOOD (  22.34  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWxzbywgd291bGQgdGhpcyBhcHBseSBmbyBteSA0LjkuODggSU1YIGtlcm5lbCBhcyB3ZWxsIGFz
IHRoZSBUSSAzLjEyLjEwIGtlcm5lbD8KCk9uIFdlZCwgQXVnIDcsIDIwMTkgYXQgOTo1MSBBTSBT
ZXJnZWFudCBQZXBwZXJjb3JuCjxzcGVwcGVyY29ybjEwOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4g
SGksIHNvIGFyZSB5b3Ugc2F5aW5nIHRoYXQgSSBzaG91bGQgdHJ5IHRvIG1lcmdlIGluIHRoZXNl
IHR3byBjb21taXRzCj4gZm9yIGEgcHJvcGVyIGZpeCBmb3IgdGhpcz8KPiA3MzBhNDNmYmMxMzUg
KCJtdGQ6IG5hbmQ6IGFkZCBuYW5kX2NoZWNrX2VyYXNlZCBoZWxwZXIgZnVuY3Rpb25zIikKPiBm
ZGYyZTgyMTA1MjkgKCJtdGQ6IG5hbmQ6IGdwbWk6IEZpeCBmYWlsdXJlIHdoZW4gYSBlcmFzZWQg
cGFnZSBoYXMgYQo+IGJpdGZsaXAgYXQgQkJNIikKPgo+IEkgYW0gYXNzdW1pbmcgdGhlc2UgYXJl
IGZyb20gdGhlIG1haW5saW5lIGtlcm5lbD8KPgo+IElmIG5vdCwgaG93IGRvIEkgZml4IHRoaXM/
IHRoaXMgb3RoZXIgcGF0Y2gsIGluc3RlYWQgb3Igd2l0aCB0aG9zZSB0d28gY29tbWl0cz8KPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbXRkLzIwMTQtSmFudWFy
eS8wNTEzNTcuaHRtbAo+Cj4gVGhlIHBhdGNoIGRvZXNuJ3Qgc2VlbSB0byBiZSBhYmxlIHRvIGFw
cGx5IGNsZWFubHkgdG8gbXkga2VybmVsIHNvIEkKPiBtdXN0IGRvIHNvbWUgZGVlcCBtZXJnaW5n
LiBJIGhhdmUgbm90IGxvb2tlZCBmb3IgdGhlIHR3byBjb21taXRzIHlldC4KPgo+IEFyZSB0aGVy
ZSBhbnkgb3RoZXIgYWx0ZXJuYXRpdmVzPwo+Cj4gVGhlbmtzIGluIGFkdmFuY2UgZm9yIGFueSBo
ZWxwLgo+Cj4gT24gU2F0LCBBdWcgMywgMjAxOSBhdCAxOjQ4IEFNIFJpY2hhcmQgV2VpbmJlcmdl
ciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+ID4KPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPiA+ID4gVm9uOiAiU2VyZ2VhbnQgUGVwcGVyY29ybiIgPHNwZXBwZXJjb3JuMTA5
QGdtYWlsLmNvbT4KPiA+ID4gQW46ICJSaWNoYXJkIFdlaW5iZXJnZXIiIDxyaWNoYXJkLndlaW5i
ZXJnZXJAZ21haWwuY29tPgo+ID4gPiBDQzogImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5p
bmZyYWRlYWQub3JnPgo+ID4gPiBHZXNlbmRldDogRnJlaXRhZywgMi4gQXVndXN0IDIwMTkgMTg6
MTQ6NTUKPiA+ID4gQmV0cmVmZjogUmU6IFVCSUZTIEVDQyBlcnJvcnMKPiA+Cj4gPiA+IEhpLCBt
YW55IHRoYW5rcyBmb3IgdGhlIHJlcGx5Lgo+ID4gPgo+ID4gPiBJIGhhdmUgc2VlbiBwb3N0cyBv
biBiaXRmbGlwcyBpbiBlbXB0eSBzcGFjZSBpc3N1ZXMgYmVmb3JlLCBidXQgZG9uJ3QKPiA+ID4g
cmVtZW1iZXIgc2VlaW5nIGFueSBmaXhlcy4gRG9lcyB0aGlzIG1lYW4gdGhlIGtlcm5lbCBVQkkg
ZHJpdmVycyBtdXN0Cj4gPiA+IGJlIHBhdGNoZWQ/IENhbiB5b3UgZWxhYm9yYXRlIG9uIHdoYXQg
Zml4ZXMgb3Igd2hlcmUgdG8gZmluZCBwYXRjaGVzLAo+ID4gPiBldGMsIG9yIHdoYXQgdG8gZG8g
YWJvdXQgdGhpcywgdGhlbj8gQWxsIEkgY2FyZSBhYm91dCBpcyBnZXR0aW5nIHRoaXMKPiA+ID4g
dG8gd29yaywgYW5kIGhvcGVmdWxseSB3aXRob3V0IG5lZWRpbmcgdG8gcmVmb3JtYXQgdGhlIHJv
b3QgZmlsZQo+ID4gPiBzeXN0ZW0gb24gNTAsMDAwIHVuaXRzIGluIHRoZSBmaWVsZC4KPiA+Cj4g
PiBZb3VyIGtlcm5lbCBpcyBwcmV0dHkgb2xkLCBzbyBJIGd1ZXNzIHlvdSBkb24ndCBoYXZlIHRo
aXMgY29tbWl0Ogo+ID4gNzMwYTQzZmJjMTM1ICgibXRkOiBuYW5kOiBhZGQgbmFuZF9jaGVja19l
cmFzZWQgaGVscGVyIGZ1bmN0aW9ucyIpCj4gPgo+ID4gQml0ZmxpcHMgaW4gZW1wdHkgcGFnZXMg
c2hvdWxkIGJlIGhhbmRsZWQgaW4gdGhlIE5BTkQgbGF5ZXIuCj4gPgo+ID4gUGxlYXNlIGRvbid0
IGJsaW5kbHkgYXBwbHkgdGhpcyBwYXRjaCwgaXQgbWF5IGhhdmUgZGVwZW5kZW5jaWVzIG9yIHdp
bGwKPiA+IHVuY292ZXIgb3RoZXIgYnVncy4gU3VjaCBhcyBmaXg6Cj4gPiBmZGYyZTgyMTA1Mjkg
KCJtdGQ6IG5hbmQ6IGdwbWk6IEZpeCBmYWlsdXJlIHdoZW4gYSBlcmFzZWQgcGFnZSBoYXMgYSBi
aXRmbGlwIGF0IEJCTSIpCj4gPgo+ID4gVGhhbmtzLAo+ID4gLy9yaWNoYXJkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
