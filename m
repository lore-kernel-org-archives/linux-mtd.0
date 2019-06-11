Return-Path: <SRS0=yQQQ=UK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77C7C4321A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 08:36:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC61212F5
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jun 2019 08:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbVUWA0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC61212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7if869F14VsbnE2VT5d2KdfXpbSKrWZJKEVX/eTUaA=; b=lbVUWA0i9IzfS8
	7Sir9NgawDo6KNHRSwIzeaX2L3wabbsr+YXxZ5a+9qBwmoAy/Zl6nduoDzEyhrij9zAdlSqIq+cjn
	3fbqDE4yF4uLsOhG27DwacuC8h2/MsoljKV8+xKlhVP8tBiGpJ3dEioZ29SeryudRpYfAa/hP7sJk
	ATO65EVNKasSCpr3tGzcFjjEcHpNWkludLJw0MaBi8ql4+PAhmYZLOtft5klEk8QC3FTOmGk/l51+
	FW+hjwrVJAbiwn19xUQwVCDiNIFOYOtlAjIIWzSUEXFcjMpOFvMKCcsaoH7/u/ERr6z5Lj2oGa5rx
	uzpltGupYT6P7LegCvXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hacGQ-0006oc-Hl; Tue, 11 Jun 2019 08:36:18 +0000
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hacGL-0006o6-Oy
 for linux-mtd@lists.infradead.org; Tue, 11 Jun 2019 08:36:15 +0000
Received: by mail-lf1-f66.google.com with SMTP id j29so8617668lfk.10
 for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2019 01:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GUp8qliVx03zllgkYDK8ocvKtbFURF4tyvvuVMWSXJU=;
 b=Lq4a0545AW9xFuYHEpOm7pgYfayHx+wZWH/WwnP/2lYm+tzL5dL8GxUNgjBgzMUOIL
 +llS/j5UZwqQlHxcOTFfmAqVrdiSVsY/eDDz43rPPIvgDA1Tm48/nEo3Qfun2Y4XTFob
 FIVaEsL5lTZa8ju/4swUjnp4WppcBQN0RCypUGecy2zxOUpTI3zhuORtgX4hB7zqEsmE
 bXkrPTKkoZ9+0FANO2Zh5o+ybcX9F3HZRhZsBiMn06IXzjsTrmTw0XF6CQA/tNBH08br
 YqAGg5Otmj8Kf+/xJq48XgLfr4Fj9I4pmcJmBC5CWzy5W3gTycJGGd5pt0mskxnBqFya
 7Geg==
X-Gm-Message-State: APjAAAVqlEMQHdFFE5d00YSsBLuioDCq5iT5ugEokia+YFdWq6OM7vx5
 wWwQ5nyoYp0WQR1Wk5svQrHN3XIb0GgZ43a++elZBI5x
X-Google-Smtp-Source: APXvYqwd/QOgBJwyleqHVMRIDIpSd3upHGdxLIZdMQ2+GlhKJ5bW8QObXfMjmP33hbygmeS7kdgIlsZS8CVKSZyz6fA=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr37353204lfn.75.1560242171986; 
 Tue, 11 Jun 2019 01:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <c57fe97b-ad4a-874e-663f-7f3a737824c9@microchip.com>
 <20190610062351.24405-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190610062351.24405-1-tudor.ambarus@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jun 2019 10:35:59 +0200
Message-ID: <CAMuHMdW3=fzFvt+ZmC2B6qf0zEwfvV--HVEoxa06Tk=a=Q1cWA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: use 16-bit WRR command when QE is set on
 spansion flashes
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_013613_814205_B3907C8C 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVHVkb3IsCgpPbiBNb24sIEp1biAxMCwgMjAxOSBhdCA4OjI0IEFNIDxUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+IEZyb206IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbWljcm9jaGlwLmNvbT4KPgo+IFNQSSBtZW1vcnkgZGV2aWNlcyBmcm9tIGRpZmZlcmVudCBt
YW51ZmFjdHVyZXJzIGhhdmUgd2lkZWx5Cj4gZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zIGZvciBT
dGF0dXMsIENvbnRyb2wgYW5kIENvbmZpZ3VyYXRpb24KPiByZWdpc3RlcnMuIEpFREVDIDIxNkMg
ZGVmaW5lcyBhIG5ldyBtYXAgZm9yIHRoZXNlIGNvbW1vbiByZWdpc3Rlcgo+IGJpdHMgYW5kIHRo
ZWlyIGZ1bmN0aW9ucywgYW5kIGRlc2NyaWJlcyBob3cgdGhlIGluZGl2aWR1YWwgYml0cyBtYXkK
PiBiZSBhY2Nlc3NlZCBmb3IgYSBzcGVjaWZpYyBkZXZpY2UuIEZvciB0aGUgSkVERUMgMjE2QiBj
b21wbGlhbnQKPiBmbGFzaGVzLCB3ZSBjYW4gcGFydGlhbGx5IGRlZHVjZSBTdGF0dXMgYW5kIENv
bmZpZ3VyYXRpb24gcmVnaXN0ZXJzCj4gZnVuY3Rpb25zIGJ5IGluc3BlY3RpbmcgdGhlIDE2dGgg
RFdPUkQgb2YgQkZQVC4gT2xkZXIgZmxhc2hlcyB0aGF0Cj4gZG9uJ3QgZGVjbGFyZSB0aGUgU0ZE
UCB0YWJsZXMgKFNQQU5TSU9OIEZMNTEyU0FJRkcxIDMxMVFRMDYzIEEgwqkxMQo+IFNQQU5TSU9O
KSBsZXQgdGhlIHNvZnR3YXJlIGRlY2lkZSBob3cgdG8gaW50ZXJhY3Qgd2l0aCB0aGVzZSByZWdp
c3RlcnMuCj4KPiBUaGUgY29tbWl0IGRjYjRiMjJlZWFmNCAoInNwaS1ub3I6IHMyNWZsNTEycyBz
dXBwb3J0cyByZWdpb24gbG9ja2luZyIpCj4gdW5jb3ZlcmVkIGEgcHJvYmUgZXJyb3IgZm9yIHMy
NWZsNTEycywgd2hlbiB0aGUgUVVBRCBiaXQgQ1JbMV0gd2FzIHNldAo+IGluIHRoZSBib290bG9h
ZGVyLiBXaGVuIHRoaXMgYml0IGlzIHNldCwgb25seSB0aGUgV3JpdGUgUmVnaXN0ZXIKPiBXUlIg
Y29tbWFuZCBmb3JtYXQgd2l0aCAxNiBkYXRhIGJpdHMgbWF5IGJlIHVzZWQsIFdSUiB3aXRoIDgg
Yml0cwo+IGlzIG5vdCByZWNvZ25pemVkIGFuZCBoZW5jZSB0aGUgZXJyb3Igd2hlbiB0cnlpbmcg
dG8gY2xlYXIgdGhlIGJsb2NrCj4gcHJvdGVjdGlvbiBiaXRzLgo+Cj4gRml4IHRoZSBhYm92ZSBi
eSB1c2luZyAxNi1iaXRzIFdSUiBjb21tYW5kIHdoZW4gUXVhZCBiaXQgaXMgc2V0Lgo+Cj4gQmFj
a3dhcmQgY29tcGF0aWJpbGl0eSBzaG91bGQgYmUgZmluZS4gVGhlIG5ld2x5IGludHJvZHVjZWQK
PiBzcGlfbm9yX3NwYW5zaW9uX2NsZWFyX3NyX2JwKCkgaXMgdGlnaHRseSBjb3VwbGVkIHdpdGgg
dGhlCj4gc3BhbnNpb25fcXVhZF9lbmFibGUoKSBmdW5jdGlvbi4gQm90aCBhc3N1bWUgdGhhdCB0
aGUgV3JpdGUgUmVnaXN0ZXIKPiB3aXRoIDE2IGJpdHMsIHRvZ2V0aGVyIHdpdGggdGhlIFJlYWQg
Q29uZmlndXJhdGlvbiBSZWdpc3RlciAoMzVoKQo+IGluc3RydWN0aW9ucyBhcmUgc3VwcG9ydGVk
Lgo+Cj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2No
aXAuY29tPgo+IC0tLQo+IEdlZXJ0LCBKb25hcywKPgo+IFRoaXMgcGF0Y2ggaXMgY29tcGlsZS10
ZXN0ZWQgb25seS4gSSBkb24ndCBoYXZlIHRoZSBmbGFzaCwgSSBuZWVkIHlvdXIKPiBoZWxwIGZv
ciB0ZXN0aW5nIHRoaXMuCgpUaGFua3MsIHRoaXMgcmV2aXZlcyBhY2Nlc3MgdG8gdGhlIHMyNWZs
NTEycyBvbiBLb2Vsc2NoLgoKRml4ZXM6IGRjYjRiMjJlZWFmNDRmOTEgKCJzcGktbm9yOiBzMjVm
bDUxMnMgc3VwcG9ydHMgcmVnaW9uIGxvY2tpbmciKQpUZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+SGkgVHVkb3IsCgpUd28gcXVlc3Rpb25zIGJl
bG93Li4uCgo+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jCj4gKysrIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKCj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zcGFuc2lv
bl9jbGVhcl9zcl9icChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICt7CgpbLi4uXQoKPiArICAgICAg
ICAqIFdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgUVVBRCBiaXQgQ1JbMV0gaXMgMSwg
b25seQo+ICsgICAgICAgICogdGhlIFdSUiBjb21tYW5kIGZvcm1hdCB3aXRoIDE2IGRhdGEgYml0
cyBtYXkgYmUgdXNlZC4KCnMvV1JSL1dSU1IvPwoKPiArICAgICAgICAqLwo+ICsgICAgICAgaWYg
KHJldCAmIENSX1FVQURfRU5fU1BBTikgewo+ICsgICAgICAgICAgICAgICBzcl9jclsxXSA9IHJl
dDsKPiArCj4gKyAgICAgICAgICAgICAgIHJldCA9IHJlYWRfc3Iobm9yKTsKPiArICAgICAgICAg
ICAgICAgaWYgKHJldCA8IDApIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKG5v
ci0+ZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImVycm9yIHdoaWxlIHJl
YWRpbmcgc3RhdHVzIHJlZ2lzdGVyXG4iKTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgIHNyX2NyWzBdID0g
cmV0ICYgfm1hc2s7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXQgPSB3cml0ZV9zcl9jcihub3Is
IHNyX2NyKTsKPiArICAgICAgICAgICAgICAgaWYgKHJldCkKPiArICAgICAgICAgICAgICAgICAg
ICAgICBkZXZfZXJyKG5vci0+ZGV2LCAiMTYtYml0IHdyaXRlIHJlZ2lzdGVyIGZhaWxlZFxuIik7
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
LyogSWYgcXVhZCBiaXQgaXMgbm90IHNldCwgdXNlIDgtYml0IFdSUiBjb21tYW5kLiAqLwoKTGlr
ZXdpc2UuCgo+ICsgICAgICAgcmV0dXJuIHNwaV9ub3JfY2xlYXJfc3JfYnAobm9yKTsKPiArfQoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
