Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D56C5DF71
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89a7pNR3sK7AU5hyO8i8d1zNLR4HiG46IrYAOG/iiEs=; b=YCwI/Ywzf6Tag+
	BtVC4r9pHKXTldwIC0Y7hH8mIyvUJstqAg7qebD7eHOWMDfeZGJ0qQdJ2ASP5qosABwmo9K60FwLj
	sM4nxvl5RvQ1LaSyGgpef4QrkK1jgr1A9KgvSG2JtYqZGmYrM1qz3IHUlVZUjF9rWhbN9DdEZJkga
	JWVDbUT3gZGyPBG3XV2owb1YpeoXzai3ysoxVDLIsg+ZLqg0gl4F7zsuEObKbmtmlRStSS653M9Bt
	evPG3sfy0YH/n4+9ZKcZ68yhiBYK9w/sBXiRdFG9H7nZQmrqknYhlRjUWgi+TxJRk0NUXsd50qSyE
	0eA6+NRPntJojzUHBrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIRp-0000000CNXD-3My8;
	Tue, 02 Jun 2026 06:17:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIRn-0000000CNWM-1Ouh
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 06:17:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0c3315c5dso22005865ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2026 23:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780381074; cv=none;
        d=google.com; s=arc-20240605;
        b=P9HLkah+Nz7V+MCoHYrMMF5Ypuwid10077lCfwG/WNKUliB+q/3JuCqalQarmV5IHA
         GKmzqk2GVDJKLy6RSSVYERBOyBakSTj+KQai651ruqM4a88vVkeL2M+qPrxvIo4hiXW7
         BjBJtiQhMHULhO7DYvgHxcAJyhkd6u+YRqo9WD7gid5cAGSSjc0H0ubnfapvE3aomnE6
         1VQtrlsXwQP5HWxsbq/nE1JBn2j2FR4XcaaAVV8+XODNqXqUJR42Mb1BhCwDE2of//rk
         KnKcVjKxWD7M2OiIxxICPBvRChzLQX1+2uBX4aeVLpPsLjv1FGfHByKQ/5Ze5xZo+Vdt
         RwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=il7A9jbvtcgQ5cLyZAm5nuZuUtZoHrFIuDEc9j880uE=;
        fh=s7zeh9XcIoDrnyLUcWD7sX3LBqVhbSMRGPiPwx2Vp2Q=;
        b=iEZuO+eANjgT4hQfPJh47IoJLFMu1Y7iH8Q8o5+CIXOdyJB2n4mI56V8V7tXMx7XsV
         trz1PyVy6OL686MXhgpGzllLVVA6BxF0cPtuOdXERvIwFti2j8UaogwkDjRpQeI+Drrb
         TKimE0TXq6AkIVYoLO2/anlERrHjuGKDlncnuWfpJKiEyhlfQyIojJIZ0Rs7+YrBiYDl
         ZGqqw01UcvuBVZSalTfXyo9GOyvbFEqPyClAPsYPByf1iT5lP74KtHQxeSH5gMPMepMt
         9MIDffF6JRv1neW5uYfgvpeITHkiywfOFl9oCS1nOpVyLLKYj4yTOGefQNi9j71taZkg
         /YNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780381074; x=1780985874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il7A9jbvtcgQ5cLyZAm5nuZuUtZoHrFIuDEc9j880uE=;
        b=kMH2EQZR2ZiTykjkc546ebm79eBUvf35UPgFTx/lAoGwoOGSWj/pX1BWoDub724sk0
         wbZPG/87blUnRBgppSQJ9pCjvFiIu4TaL7IlNnEqiTTOeZF3f4xWEwcyXqLZGLKdKbn5
         rD0gKmG1MKowTT1FFDUGG1yn5kbqvmPWRrGkuuFIsNzgtNAWGcMIhBjeXvuHmnYv1PUd
         +yBgxvJgarjx7cccJbyy5OGckw+FdAry9BZYfTHeBrgA+LqVpLpX1uNYTj5/DqPDRGnc
         YDBrMX1yn6S7HABRvCJqtexLGA0jEHpSOBwVbIsoQ1CJiN/5Ols+XZIYG5FdUDW+iikz
         qiww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780381074; x=1780985874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=il7A9jbvtcgQ5cLyZAm5nuZuUtZoHrFIuDEc9j880uE=;
        b=bmfp10immH9hXHqopz4tLk8Tl0ImTfK9mutzxilrvho3cajy+RtWKmEOg8HfxWgJhD
         7jlKykXjHfr1EGc0kTRTKXDo8ciSNJH6rGbUKUbfjVmASUJG5/nlkEYVQTSx98oczV9E
         nAjKfJYzzknvgzOzVveLW6kdY3xtfnlEhKQmiqcUzLDUaqTEBWBzS/kVVMIZwg3uCFqg
         QjUf7H61MinI0A0rM8+/HflaZt5EWU2Sx+kmzDDqiFCtHN/XMVIqSo9DZfl6eCoFdWzX
         fHNBUHLvtNQjGTTBQCsL8bIX7ttu6/e7IsOoQxJ3YKF4b6oj8VY5yXBHpxumgj1mfmPf
         rsig==
X-Forwarded-Encrypted: i=1; AFNElJ8znmMs80j9PSTY82tGXb87WNKH/lD8Jm4OfCH/vu8YJ1bFlL4deVUl4IbjVjOnH9X/KNtQZzD/MrU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya142ZRq9EbtXE1PiLqYfF9+YqV7Wps4i68IyCfhF3RwHLR4r+
	iyeJXKlDe9VwCWwkgpJa6DLJfbKSVBCSY148fJUoqYwiTZD9GaUGnPDzYodY9mATxuzaL9W1Up0
	KKdV6BOeP+/ch8muVKWgR3Dls7NZ8qh4=
X-Gm-Gg: Acq92OE6UVfaSgy8pKU25eiJiQ6eBaDrPb4TT7RpGDMvGba9oGM7QoP+GS7AY2H0iwf
	W0YP3hc06c5Nq1zB5Hy8YFbqcrnwxiZAII0jHRDd5PBhdaviH9Hmj2lB9XGzak63vAe515zoChz
	CuHeH4TElC/VIG2h6kKo9zvNXX+ACENy16q0u8Jur/7FgpgrO+45oBdEQTpvjg0h2UWIsShPkrI
	6VoaIJgv2O0RlPEYnxGpMF8k75Tz8YEakejc0HJy3zk6/ONPdAu+WqYpVbI0pib9TMcapxHoehJ
	IADoBS+RK9+e3zSTlQ==
X-Received: by 2002:a17:903:ac6:b0:2c0:eee2:fc40 with SMTP id
 d9443c01a7336-2c0eee2fca6mr73459905ad.3.1780381074079; Mon, 01 Jun 2026
 23:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051751.1648246-1-linchengming884@gmail.com>
 <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org> <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
 <87eciwhtf8.fsf@bootlin.com> <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
 <CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com> <DIXQA3JV2N5M.2UHTAAXQEWB86@kernel.org>
In-Reply-To: <DIXQA3JV2N5M.2UHTAAXQEWB86@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 2 Jun 2026 14:15:40 +0800
X-Gm-Features: AVHnY4KZTXnMTQq42i4P2n-1imS_5c5hc1fU7Q8POL-yiKL3M-VfmPJX-abU45w
Message-ID: <CAAyq3SZ-FuKeY7_-vKRY+Aqd975B2cfSyky4Qid=FwNWN5RSCw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
To: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_231755_379229_BBA14620 
X-CRM114-Status: GOOD (  45.64  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDbmnIgx5pel6YCx5LiAIOS4i+WNiDg6NTflr6vpgZPvvJoKPgo+IE9uIE1vbiBKdW4gMSwgMjAy
NiBhdCAyOjU2IEFNIENFU1QsIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4gSGkgTWljaGFlbCwK
PiA+Cj4gPiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4g5pa8IDIwMjblubQ15pyI
Mjjml6XpgLHlm5sg5LiL5Y2IMzo1MuWvq+mBk++8mgo+ID4+Cj4gPj4gSGksCj4gPj4KPiA+PiBP
biBUaHUgTWF5IDI4LCAyMDI2IGF0IDk6NDIgQU0gQ0VTVCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiA+PiA+IEhpIENoZW5nIE1pbmcsCj4gPj4gPgo+ID4+ID4+PiBJdCBsb29rcyBsaWtlIHlvdSdy
ZSBnZXR0aW5nIGJpdHRlbiBieSB0aGUgSUQgcmV1c2UuIFlvdSBjYW4ndCBqdXN0Cj4gPj4gPj4+
IHVuY29uZGl0aW9uYWxseSBhZGQgdGhlIHF1YWQgUFAgYmVjYXVzZSBhcyBmYXIgYXMgSSBjYW4g
c2VlIHRoZQo+ID4+ID4+PiBNWDI1TDEyODA1RCBbMV0gaXMganVzdCBhIHN0YW5kYXJkIHNpbmds
ZSBiaXQgaS9vIGZsYXNoIGFuZCBkb2Vzbid0Cj4gPj4gPj4+IHN1cHBvcnQgdGhlIDRQUC4KPiA+
PiA+Pgo+ID4+ID4+IFlvdSBhcmUgYWJzb2x1dGVseSByaWdodC4gVGhhbmtzIGZvciBjYXRjaGlu
ZyB0aGlzLgo+ID4+ID4+Cj4gPj4gPj4gVGhlIE1YMjVMMTI4MDVEIGlzIGluZGVlZCBhIG11Y2gg
b2xkZXIgcHJvZHVjdCAocmVsZWFzZWQgYXJvdW5kIDIwMDkpLgo+ID4+ID4+IFNpbmNlIHRoZSBp
bml0aWFsIEpFU0QyMTYgU0ZEUCBzdGFuZGFyZCB3YXNuJ3QgcHVibGlzaGVkIHVudGlsIDIwMTEs
Cj4gPj4gPj4gSSBkb3VibGUtY2hlY2tlZCB3aXRoIG91ciBpbnRlcm5hbCBQTSBhbmQgY29uZmly
bWVkIHRoYXQgdGhlIE1YMjVMMTI4MDVECj4gPj4gPj4gZG9lcyBub3Qgc3VwcG9ydCBTRkRQIGF0
IGFsbC4KPiA+PiA+Pgo+ID4+ID4+IFNpbmNlIHRoZSBuZXdlciBmbGFzaGVzIChNWDI1TDEyODMz
RiBhbmQgTVgyNUwxMjg0NUcpIGRvIHN1cHBvcnQgU0ZEUCwKPiA+PiA+PiB3ZSBjb3VsZCB1c2Ug
dGhpcyBhcyBhIGRpZmZlcmVudGlhdG9yIHRvIGRpc3Rpbmd1aXNoIHRoZW0gZnJvbSB0aGUgbGVn
YWN5Cj4gPj4gPj4gTVgyNUwxMjgwNUQuCj4gPj4gPj4KPiA+PiA+PiBXaGF0IGlmIHdlIHRyeSB0
byByZWFkIHRoZSBTRkRQIHNpZ25hdHVyZSAoUkRTRkRQKSBpbiB0aGUgZml4dXAgaG9vaz8KPiA+
PiA+PiBJZiBhIHZhbGlkIFNGRFAgc2lnbmF0dXJlIGlzIGRldGVjdGVkLCB3ZSBjYW4gc2FmZWx5
IGlkZW50aWZ5IGl0IGFzIHRoZQo+ID4+ID4+IG5ld2VyIGZsYXNoIGFuZCBhcHBseSB0aGUgU05P
Ul9IV0NBUFNfUFBfMV80XzQgY2FwYWJpbGl0eS4gSWYgdGhlcmUgaXMKPiA+PiA+PiBubyBTRkRQ
IHNpZ25hdHVyZSwgd2UgbGVhdmUgaXQgYXMgaXMgZm9yIHRoZSBsZWdhY3kgTVgyNUwxMjgwNUQu
Cj4gPj4gPj4KPiA+PiA+PiBEbyB5b3UgdGhpbmsgdGhpcyBhcHByb2FjaCBpcyBmZWFzaWJsZSBh
bmQgYWNjZXB0YWJsZT8gSWYgc28sIEkgd2lsbAo+ID4+ID4+IGltcGxlbWVudCB0aGlzIGxvZ2lj
IGFuZCBzdWJtaXQgYSB2MiBwYXRjaC4KPiA+PiA+Cj4gPj4gPiBUaGUgLT5wb3N0X3NmZHAoKSBm
aXh1cCBob29rIGlzIGRvY3VtZW50ZWQgYXMgIm5vdCBjYWxsZWQgZm9yIFNQSSBOT1JzCj4gPj4g
PiB0aGF0IGRvIG5vdCBzdXBwb3J0IFNGRFAiLiBBbHRlcm5hdGl2ZWx5LCBJIGJlbGlldmUgYW4g
ZWFybGllciBob29rLAo+ID4+ID4gbGlrZSAtPnBvc3RfYmZwdCgpIGNvdWxkIGFsc28gd29yayBz
aW5jZSBpdCBkb2VzIG5vdCBzZWVtIHRvIHJ1biBvbgo+ID4+ID4gbm9uIFNGRFAgY29tcGF0aWJs
ZSBmbGFzaGVzLgo+ID4+Cj4gPj4gTW9yZW92ZXI6Cj4gPj4KPiA+PiAgKiAgICBzcGlfbm9yX3Bv
c3Rfc2ZkcF9maXh1cHMoKSBpcyBjYWxsZWQgYWZ0ZXIgdGhlIFNGRFAgdGFibGVzIGFyZSBwYXJz
ZWQuCj4gPj4gICogICAgSXQgaXMgdXNlZCB0byB0d2VhayB2YXJpb3VzIGZsYXNoIHBhcmFtZXRl
cnMgd2hlbiBpbmZvcm1hdGlvbiBwcm92aWRlZAo+ID4+ICAqICAgIGJ5IHRoZSBTRkRQIHRhYmxl
cyBhcmUgd3JvbmcuCj4gPj4KPiA+PiBBbmQgaXQgbG9va3MgbGlrZSB0aGF0IGlzIHRoZSBjYXNl
IGZvciB0aGVzZSBmbGFzaGVzLiBBbHNvLCBwbGVhc2UKPiA+PiBwcm92aWRlIGEgY29tbWVudCBv
biB0aGUgZml4dXAgZGVzY3JpYmluZyB0aGF0IHRoZSBmbGFzaCBtaXNzZXMgdGhhdAo+ID4+IHBy
b3BlcnR5LiBCYXNpY2FsbHksIHdoYXQgeW91J3ZlIHdyaXR0ZW4gaW4gdGhlIGNvbW1pdCBtZXNz
YWdlLgo+ID4KPiA+IEkgYW0gY3VycmVudGx5IHdvcmtpbmcgb24gdGhlIGZsYXNoIHBhcnQgMHhj
MjIwMTggYW5kIEkgYW0gcGxhbm5pbmcgdG8KPiA+IGFkZCBpdHMgc2l6ZSBiYWNrIHRvIHRoZSBm
bGFzaCBpbmZvIHRhYmxlLiBIb3dldmVyLCBJIGVuY291bnRlcmVkIGFuCj4gPiBpc3N1ZSByZWdh
cmRpbmcgdGhlIGZpeHVwIGhvb2tzLgo+ID4KPiA+IFNpbmNlIHRoaXMgc3BlY2lmaWMgZmxhc2gg
ZG9lcyBub3Qgc3VwcG9ydCBkdWFsLCBxdWFkLCBvciBvY3RhbCByZWFkcywKPiA+IHRoZSBjb3Jl
IGxvZ2ljIGluIHNwaV9ub3JfaW5pdF9wYXJhbXNfZGVwcmVjYXRlZCgpIGRldGVybWluZXMgdGhh
dCBTRkRQCj4gPiBwYXJzaW5nIGlzIG5vdCBuZWVkZWQuIEJlY2F1c2UgdGhlIFNGRFAgcGFyc2lu
ZyBpcyBza2lwcGVkLCB0aGUgcG9zdF9iZnB0Cj4gPiBvciBwb3N0X3NmZHAgaG9va3MgYXJlIG5l
dmVyIHRyaWdnZXJlZCwgd2hpY2ggcHJldmVudHMgdXMgZnJvbSBhcHBseWluZwo+ID4gdGhlIG5l
Y2Vzc2FyeSBmaXh1cHMgYXMgd2UgZXhwZWN0ZWQuCj4gPgo+ID4gSSBpbml0aWFsbHkgY29uc2lk
ZXJlZCBhc2tpbmcgYWJvdXQgdGhlIHBvc3NpYmlsaXR5IG9mIHJlbW92aW5nIHRoaXMKPiA+IHNw
ZWNpZmljIGNoZWNrIGluIHNwaV9ub3JfaW5pdF9wYXJhbXNfZGVwcmVjYXRlZCgpLCB3aGljaCB3
b3VsZCBhbGxvdwo+ID4gYWxsIFNQSS1OT1IgZmxhc2hlcyB0byBnbyB0aHJvdWdoIFNGRFAgcGFy
c2luZyBieSBkZWZhdWx0ICh1bmxlc3MKPiA+IFNQSV9OT1JfU0tJUF9TRkRQIGlzIGV4cGxpY2l0
bHkgc2V0KS4KPgo+IE9vcHMsIEkndmUgZm9yZ290IHRvIGFkZCB5b3Ugb24gQ0MuIFNvcnJ5LiBJ
J3ZlIGp1c3Qgc2VuZCBhIHNlcmllcwo+IHRvIGdldCByaWQgb2YgdGhhdCBsZWdhY3kgaGFuZGxp
bmcuIFBsZWFzZSBnaXZlIGl0IGEgdHJ5IG9uIHlvdXIKPiBmbGFzaGVzLgoKTm8gd29ycmllcyBh
dCBhbGwhIFRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLgoKSSBoYXZlIHRlc3RlZCB5b3VyIHNlcmll
cyBvbiBvdXIgTWFjcm9uaXggZmxhc2hlcywgYW5kIGV2ZXJ5dGhpbmcgd29ya3MKcGVyZmVjdGx5
LgoKUXVpY2sgcXVlc3Rpb24gcmVnYXJkaW5nIG15IG93biBwYXRjaCBzZXJpZXM6CnNob3VsZCBJ
IHdhaXQgZm9yIHlvdXIgc2VyaWVzIHRvIGJlIGFwcGxpZWQgYmVmb3JlIHNlbmRpbmcgb3V0IG15
IHYyLApvciBpcyBpdCBva2F5IHRvIHNlbmQgaXQgbm93PwoKPgo+IFsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyNjA2MDExMjU0MzguMzQ4MTcyMi0xLW13YWxsZUBrZXJu
ZWwub3JnLwo+Cj4gLW1pY2hhZWwKPgo+ID4gSG93ZXZlciwgSSBhbSBhd2FyZSB0aGF0IGZvcmNp
bmcgU0ZEUCBwYXJzaW5nIGdsb2JhbGx5IG9uIGFsbCBsZWdhY3kKPiA+IDEtMS0xIGZsYXNoZXMg
bWlnaHQgYmUgcmlza3kuIEZsYXNoZXMgcHJlZGF0aW5nIHRoZSBKRVNEMjE2IHN0YW5kYXJkCj4g
PiBtaWdodCByZXR1cm4gZ2FyYmFnZSBkYXRhIHdoZW4gdGhlIFNGRFAgb3Bjb2RlICgweDVBKSBp
cyBpc3N1ZWQsCj4gPiBwb3RlbnRpYWxseSBjYXVzaW5nIHJlZ3Jlc3Npb25zIGlmIHRoZSBnYXJi
YWdlIGRhdGEgYWNjaWRlbnRhbGx5IG1hdGNoZXMKPiA+IHRoZSBTRkRQIHNpZ25hdHVyZS4KPiA+
Cj4gPiBJZiBkcm9wcGluZyB0aGlzIGdsb2JhbCBjaGVjayBpcyBpbmRlZWQgY29uc2lkZXJlZCB0
b28gcmlza3kgZm9yIG9sZGVyCj4gPiBoYXJkd2FyZSwgd291bGQgaXQgYmUgYWNjZXB0YWJsZSB0
byB1c2UgdGhlIGxhdGVfaW5pdCBob29rIHRvIGhhbmRsZQo+ID4gdGhpcyBmbGFzaCBpbmRpdmlk
dWFsbHk/IFRoZSBpZGVhIHdvdWxkIGJlIHRvIG1hbnVhbGx5IGNoZWNrIGFuZCBwYXJzZQo+ID4g
dGhlIFNGRFAgdGFibGUgZXhjbHVzaXZlbHkgZm9yIDB4YzIyMDE4IHdpdGhpbiBpdHMgb3duIGZp
eHVwLCBlbnN1cmluZwo+ID4gdGhhdCBubyBvdGhlciBsZWdhY3kgMS0xLTEgZmxhc2hlcyBhcmUg
YWZmZWN0ZWQgYnkgdGhpcyBjaGFuZ2UuCj4gPgo+ID4gQW55IHRob3VnaHRzIG9yIGd1aWRhbmNl
IG9uIHdoZXRoZXIgdGhpcyBsYXRlX2luaXQgYXBwcm9hY2ggaXMgdGhlIHJpZ2h0Cj4gPiB3YXkg
dG8gZ28gd291bGQgYmUgZ3JlYXRseSBhcHByZWNpYXRlZC4KClRoYW5rcywKQ2hlbmcgTWluZyBM
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
