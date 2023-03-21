Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24129C74A5B
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Mar 2023 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9vlGhhuqe8FEBQVoxpoWe/OEmr+qKCsSU1Q/pVnMKw=; b=aH9DqR0y9TUM9Q
	R2KeKxYnelII8FJXZk2Z9pB0bPl7ESKTL0TFdhGiEgANDXgZjhKd9CL3Ygghb4xdwBgYpFGqEzcmk
	9/gm5DBU7gI6OG98Hy/Nvnec30QvpKq5LhhuqKSoskv/LWm+9jDOTW8dkse5fAbRwzuJKxdQCgGnM
	s4RVIOb9TBF8ULceTPvyr3C/XbU7I48MMPk2qhMUUSAG14J0kGleI/BJ5WSHVoBRdkxU15xuzbbKK
	7NHmsCWYZoRD1MKu7y+hf6lpa/TcgzDCELFaJ4+X6u1l/ztc7mBYlatuh46dKxbqTM/qoNwh4LJ3k
	y8DQ95DOODpLfnHb96Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pedUo-00Cpl2-2g;
	Tue, 21 Mar 2023 15:01:54 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedUb-00Cpha-12;
	Tue, 21 Mar 2023 15:01:43 +0000
Received: by mail-oi1-f173.google.com with SMTP id bj20so1846228oib.3;
        Tue, 21 Mar 2023 08:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679410897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u64F8yDGgz21kRhxCXRNhTCJDfOEDsPDI4sBA/nJgKY=;
        b=pa61euUqiBNf6uhmcE+ZkNZ7yTeRbyqn5JRbs01e5vYBXuvKvJbvAwaRy5GLT1ULG9
         Okfi0RFvO8G1KYEX+TQETVLqDHaXO+QHYxWyHao07sC1/fE46MORcmLyiYQZWpYFUURV
         zgdLd+ZDx64/i+YQvG6Ek1oG9jsUPJAhiWMcOq5zMYdzc4NtlJ07uL0zhgI/R/tRWx5n
         +xc17AEt9VRc5ARIyuqIYhaR1JvcDCUxXXcM5sL4h7pyldkvQze33ArCvjL8UDEHhY//
         PL+dGB9UX4Vt/FFuFNGYTPIzZIeJxKSjyLiZAO2Mw60KIkPM2HMflHT5Ou9NYjxTruFh
         OiRw==
X-Gm-Message-State: AO0yUKXDpHV0PgQtDis0yECZyYIasRtcvBlgwVYdTJ1Wu/M5xloCQYMY
	Ki3hrnyxH5jif1z6Mav0RdrJKxwe8H5irg==
X-Google-Smtp-Source: AK7set+bbIK5WoaPvAj3wBkxB0MeoEKIOGOV98hGfUzg1dmtwVz+VNPjl5iPLVJT4DgvvNfQMFPfWQ==
X-Received: by 2002:a05:6808:49:b0:384:3e65:d0df with SMTP id v9-20020a056808004900b003843e65d0dfmr1113806oic.3.1679410897351;
        Tue, 21 Mar 2023 08:01:37 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id f66-20020a37d245000000b00745f3200f54sm9385426qkj.112.2023.03.21.08.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 08:01:37 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id e71so17519653ybc.0;
        Tue, 21 Mar 2023 08:01:36 -0700 (PDT)
X-Received: by 2002:a25:9e8d:0:b0:a09:314f:a3ef with SMTP id
 p13-20020a259e8d000000b00a09314fa3efmr1669792ybq.12.1679410896517; Tue, 21
 Mar 2023 08:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
 <4afd79ba-215d-8b33-4999-4afaa88ae051@linaro.org> <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
In-Reply-To: <CAMuHMdXE=jvjKTekRgWpYRPa7_T51qRdTXTgB3nQn5Dcjjg7bA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Mar 2023 16:01:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
Message-ID: <CAMuHMdVsbcuH+UYKb2be34LAk=gu8GMOQ+5+uxk_O585X4rWBg@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_080141_361705_1C4EB012 
X-CRM114-Status: GOOD (  28.34  )
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgNzo1N+KAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDY6MDTi
gK9QTSBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4g
VmlnbmVzaCB1c2VkIHRvIHJldmlldyBDRkkgY29kZSwgbWF5YmUgaGUgY2FuIGludGVydmVuZS4g
SSd2ZSBuZXZlcgo+ID4gd29ya2VkIHdpdGggQ0ZJLCBidXQgSSBjYW4gdHJ5IHRvIGhlbHAuIEkn
bGwgbmVlZCBtb3JlIGRlYnVnIGRhdGEgdGhvdWdoLgo+ID4KPiA+IE9uIDMvMjAvMjMgMTY6NDMs
IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gQWRkIGEgZGV2aWNlIG5vZGUgZm9yIHRo
ZSBTcGFuc2lvbiBTMjlHTDUxMk4gTk9SIEZMQVNIIG9uIHRoZSBNYXJ6ZW4KPiA+ID4gZGV2ZWxv
cG1lbnQgYm9hcmQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZl
biA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiA+IC0tLQo+ID4gPiBBbHRob3VnaCB0aGUg
UzI5R0w1MTJOIGlzIGEgQ0ZJIEZMQVNILCB1c2luZyAiY2ZpLWZsYXNoIiBpbnN0ZWFkIG9mCj4g
PiA+ICJtdGQtcm9tIiBkb2VzIG5vdCB3b3JrOgo+ID4gPiAgIDEuIFByb2JpbmcgZmFpbHMgd2l0
aCAicGh5c21hcC1mbGFzaCAwLmZsYXNoOiBtYXBfcHJvYmUgZmFpbGVkIiwKPiA+Cj4gPiBJIHdv
dWxkIGZpcnN0IHRyeSB0byB1bmRlcnN0YW5kIHdoeSB0aGUgcHJvYmUgZmFpbHMuCj4KPiBXaXRo
IGRlYnVnIGNvZGUgYWRkZWQsIEkgc2F3IHRoYXQgY2ZpX3Byb2JlX2NoaXAoKSBmYWlscyBiZWNh
dXNlCj4gY2ZpX3FyeV9tb2RlX29uKCkgcmV0dXJucyB6ZXJvLiAgUHJpbnRpbmcgYWN0dWFsIHZz
LiBleHBlY3RlZCB2YWx1ZXMKPiBpbiBtYXBfd29yZF9lcXVhbCgpIHNob3dlZCB0aGF0IG5vdGhp
bmcgd2FzIHJlYWQgKGFsbCAweGZmLCBJSVJDKS4KCkkgbWlzcmVtZW1iZXJlZDoKCiAgICBwaHlz
bWFwLWZsYXNoIDAuZmxhc2g6IHBoeXNtYXAgcGxhdGZvcm0gZmxhc2ggZGV2aWNlOiBbbWVtCjB4
MDAwMDAwMDAtMHgwM2ZmZmZmZl0KICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1MSB2cy4g
MHhlMAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweGUwCiAgICBjZmlfcXJ5
X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4ZTAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4
NTE1MSB2cy4gMHhlMAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweGUwCiAg
ICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAogICAgY2ZpX3FyeV9wcmVzZW50
OjIzODogMHg1MTUxIHZzLiAweDAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1MSB2cy4g
MHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAogICAgY2ZpX3FyeV9w
cmVzZW50OjIzODogMHg1MTUxIHZzLiAweDAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1
MSB2cy4gMHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAogICAgY2Zp
X3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweDAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6
IDB4NTE1MSB2cy4gMHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAog
ICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MSB2cy4gMHhlMAogICAgY2ZpX3FyeV9wcmVzZW50
OjIzODogMHg1MSB2cy4gMHhlMAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MSB2cy4gMHhl
MAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MSB2cy4gMHhlMAogICAgY2ZpX3FyeV9wcmVz
ZW50OjIzODogMHg1MSB2cy4gMHhlMAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MSB2cy4g
MHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxIHZzLiAweDAKICAgIGNmaV9xcnlfcHJl
c2VudDoyMzg6IDB4NTEgdnMuIDB4MAogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MSB2cy4g
MHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxIHZzLiAweDAKICAgIHBoeXNtYXAtZmxh
c2ggMC5mbGFzaDogbWFwX3Byb2JlIGZhaWxlZAoKSSBzdWRkZW5seSByZW1lbWJlcmVkIEkgaGF2
ZSBhIGRpZmZlcmVudCBib2FyZCAoQVBFNi1FVk0pLCB3aGVyZQp0aGUgQ0ZJLUZMQVNIIHN0b3Bw
ZWQgd29ya2luZyBhZnRlciBhZGRpbmcgc3VwcG9ydCBmb3Igc2Vjb25kYXJ5CkNQVXMuIEkgYWx3
YXlzIHRob3VnaHQgdGhhdCB3YXMgYSBoYXJkd2FyZSBxdWlyay4uLgoKVHVybnMgb3V0IHRoZSBD
RkktRkxBU0ggb24gTWFyemVuIChxdWFkIENvcnRleC1BOSkgaXMgZGV0ZWN0ZWQgd2hlbgpib290
aW5nIHdpdGggIm5vc21wIjoKCiAgICBwaHlzbWFwLWZsYXNoIDAuZmxhc2g6IHBoeXNtYXAgcGxh
dGZvcm0gZmxhc2ggZGV2aWNlOiBbbWVtCjB4MDAwMDAwMDAtMHgwM2ZmZmZmZl0KICAgIGNmaV9x
cnlfcHJlc2VudDoyMzg6IDB4NTE1MSB2cy4gMHg1MQogICAgY2ZpX3FyeV9wcmVzZW50OjIzODog
MHg1MTUxIHZzLiAweDUxCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4NTEK
ICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1MSB2cy4gMHgxYzAKICAgIGNmaV9xcnlfcHJl
c2VudDoyMzg6IDB4NTE1MSB2cy4gMHgxYzAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1
MSB2cy4gMHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAogICAgY2Zp
X3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweDAKICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6
IDB4NTE1MSB2cy4gMHgwCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUxNTEgdnMuIDB4MAog
ICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweDYwMDIKICAgIGNmaV9xcnlfcHJl
c2VudDoyMzg6IDB4NTE1MSB2cy4gMHg2MDAyCiAgICBjZmlfcXJ5X3ByZXNlbnQ6MjM4OiAweDUx
NTEgdnMuIDB4NjAwMgogICAgY2ZpX3FyeV9wcmVzZW50OjIzODogMHg1MTUxIHZzLiAweDYwMDIK
ICAgIGNmaV9xcnlfcHJlc2VudDoyMzg6IDB4NTE1MSB2cy4gMHg2MDAyCiAgICAwLmZsYXNoOiBG
b3VuZCAxIHgxNiBkZXZpY2VzIGF0IDB4MCBpbiAxNi1iaXQgYmFuay4gTWFudWZhY3R1cmVyCklE
IDB4MDAwMDAxIENoaXAgSUQgMHgwMDIzMDEKICAgIEFtZC9GdWppdHN1IEV4dGVuZGVkIFF1ZXJ5
IFRhYmxlIGF0IDB4MDA0MAogICAgICBBbWQvRnVqaXRzdSBFeHRlbmRlZCBRdWVyeSB2ZXJzaW9u
IDEuMy4KICAgIG51bWJlciBvZiBDRkkgY2hpcHM6IDEKICAgIDMgZml4ZWQtcGFydGl0aW9ucyBw
YXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgMC5mbGFzaAogICAgQ3JlYXRpbmcgMyBNVEQg
cGFydGl0aW9ucyBvbiAiMC5mbGFzaCI6CiAgICAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA0MDAw
MCA6ICJ1Ym9vdCIKICAgIDB4MDAwMDAwMDQwMDAwLTB4MDAwMDAwMDgwMDAwIDogInVib290LWVu
diIKICAgIDB4MDAwMDAwMDgwMDAwLTB4MDAwMDA0MDAwMDAwIDogImZsYXNoIgoKTXkgZmlyc3Qg
Z3Vlc3Mgd2FzIHRoYXQgdGhlIHByb2JpbmcgcHJvY2VzcyBpcyBtaWdyYXRlZCB0byBhIGRpZmZl
cmVudApDUFUgY29yZSBkdXJpbmcgcHJvYmluZywgYnV0IHByaW50aW5nIHNtcF9wcm9jZXNzb3Jf
aWQoKSBkaWRuJ3QKY29uZmlybSB0aGF0OyBpdCdzIGp1c3QgcnVubmluZyBvbiBhIGRpZmZlcmVu
dCBDUFUgY29yZSB0aGFuIENQVTAuCldyYXBwaW5nIHRoZSBib2R5IG9mIGNmaV9xcnlfbW9kZV9v
bigpIGluc2lkZSBhIGdldF9jcHUoKS9wdXRfY3B1KCkKcGFpciB0byBwcmV2ZW50IG1pZ3JhdGlv
biBhbHNvIGRpZG4ndCBmaXggaXQuCgpJcyBDRkktRkxBU0gga25vd24tYnJva2VuIG9uIFNNUD8K
VGhhbmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
