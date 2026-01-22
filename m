Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EFFD3EE7F
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 15:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4x20JtAZ1esUl4Gz0qjBK/vSG9ypXAvRM1x9G4Pmks=; b=iR2wdzbvNFoc7p
	bSZcD0x5CR/hS8U/32xEdrmBoROHZC6NhLVe9TDsyihKhBo4sGeTAcKhtNqDMjsq3QkEfLOEL//j6
	a1RUAzNM97bKjyPSXqRU1mQ/JoO7EEWfJ/27js/hM3yT08v2WVLFyI6jvyk+ChtPIpYFHrDg4yGGi
	TNgNDLT+oSo8D5SCAzIEN3/BMfyj4jbhQ8uFKluoRitRGsrguxcOR5yshsY1Zlbr805TTJebSBLMv
	si6eITkCYqtvmAgwvUO/3sXhCCNuiE3zdhouq7gKkdMWOmlL6Yygiz97hr89yktgf12mQ3LeSH2rj
	MjthHEAJsNOpZEoC1Xug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwpg-00000007M2k-2o9k;
	Thu, 22 Jan 2026 15:42:52 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwpb-00000007M1e-3Bm4
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 15:42:50 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so288261241.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2026 07:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096565; x=1769701365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIeF+csqY/eavlwFkg1N9WEd1r9no9Qc6UP7rigar3Y=;
        b=p7acGLUuH5TFmpkgT8GuVrTb+9VVzJLiMdSJaYJACW02lY4/nffwF3ckUK7rYhQsPy
         JQq9perK9j75SKyIIyZ++xODeD/iIFjWw6+wyF0G+Sls+icNRs4YWwMUMgNJT+hOSZAR
         j7v8QcXx1Q6SHJmoczf1A8y6AysXvF+ETNx7QZGKeNKcu83WUJP0zdlC7+5nV9BvRnET
         RPHQEH9nHyw9KMvxYzu0/0lhJc+WnkbtihJI1JkYadS3aROi4vHi3FjUMqz2cKV1udDX
         v1Tmyxb/ZQXxpsuhymHrxQMl7P1B7osi6VYcGwivvlwgJ82kLM8/s16lCYL65H+84ntJ
         /bRw==
X-Forwarded-Encrypted: i=1; AJvYcCX5ILKJrD5ZwN1y2MWr8H8lAfv/oLfsNyxeT1UDpOXY5dlnVQ5CoR13O14lLnSsV9GG/8H9qyerKcE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGMgtsYOfqvyzq2ZI5pHt5mE0ShHAH9MjJqxxd5fVRWE5AuGDb
	+rL7gSYsdLIdrCWmNQJktqxB28Gk8tm1r3LfQwvvvm8HyUjQsBq3Mmeg/0lfb07d
X-Gm-Gg: AZuq6aKwvLzVzodS4NeIHonozSMKkwUJGcLyBCi3D9crwdSOtN/aL9XTuP0z6GiiGUd
	rhKwDY9HHkZZM0NIq9aB6CJbj5Sh+bAyudytnaZFRbSpP3Aav7lEcka+6C7oftlj0HjMuuiACGE
	AkXTNUmYO+TppQ6aSqWgrxCEuQ+g0gnhdtq8NDGuNWDfx37SPshFFiW4xpps41gyVZYzijtOfxV
	WAdVsGW/heJa6IuPXvLVflUuCKnxds5rn6Bo3Y1LShbn92HPL84pOaj9fHgK02tGybErbU1mlPZ
	wijnJ6reOFEP8of78mVDlSDI2FVktl0HO3c7I/tsEcppfFZsajf6Xt00WKTAl5v5syuNli63PXk
	oCPwynC8dVRfldQz+zQ7uW7wDp6avNyIkEmNEBTJFeZMetY7U05MCNRoVqS6RxOok3apLyrELZY
	a2thkcCHKgcQuhkMlGP+ZxUe5Qnj7SZ8Y/zJHTHSJeJ2Fr2SLb
X-Received: by 2002:a05:6102:dd0:b0:5df:ac57:b0ea with SMTP id ada2fe7eead31-5f54baf16e9mr21297137.10.1769096564689;
        Thu, 22 Jan 2026 07:42:44 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm6266578137.10.2026.01.22.07.42.44
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 07:42:44 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so288258241.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2026 07:42:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8bGp+BU/aUtA8vFirf47ko5AiJ6J6QsdQAt9vlTwUrcbZgAoI/j8UPnJpTSltzNX5XLP+U3Yilvo=@lists.infradead.org
X-Received: by 2002:a05:6102:3711:b0:5db:ebb4:fdcf with SMTP id
 ada2fe7eead31-5f54bb3f1d7mr19060137.17.1769096564255; Thu, 22 Jan 2026
 07:42:44 -0800 (PST)
MIME-Version: 1.0
References: <c5e1377b7a9b5cd6f08296ada5520e19951fe002.1768487070.git.geert+renesas@glider.be>
 <87fr7xpwqf.fsf@bootlin.com>
In-Reply-To: <87fr7xpwqf.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 16:42:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXo-QxcJeSiCJv=7D22T_VbT5OEQxU7D_nmCkj7siCGBA@mail.gmail.com>
X-Gm-Features: AZwV_QgwKXf3xC-7ZmUKrWRWeY_jEo_4iDWUiNJsp07Y_KfWxez2iXVe1iR0nNk
Message-ID: <CAMuHMdXo-QxcJeSiCJv=7D22T_VbT5OEQxU7D_nmCkj7siCGBA@mail.gmail.com>
Subject: Re: [PATCH v7] mtd: rawnand: sunxi: Convert to common
 field_{get,prep}() helpers
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_074247_804389_0F08C3DC 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgTWlxdcOobCwKCk9uIFRodSwgMjIgSmFuIDIwMjYgYXQgMTU6MDcsIE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+IE9uIDE1LzAxLzIwMjYgYXQgMTU6
MjY6MjIgKzAxLCBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiB3
cm90ZToKPiA+IERyb3AgdGhlIGRyaXZlci1zcGVjaWZpYyBmaWVsZF9nZXQoKSBhbmQgZmllbGRf
cHJlcCgpIG1hY3JvcywgaW4gZmF2b3IKPiA+IG9mIHRoZSBnbG9iYWxseSBhdmFpbGFibGUgdmFy
aWFudHMgZnJvbSA8bGludXgvYml0ZmllbGQuaD4uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiA+IEFja2VkLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Cj4gSSB0aGluayBiNCBk
aWRuJ3QgY2F0Y2ggdXAgdGhhdCBJIGFwcGxpZWQgdGhpcyBwYXRjaCAoaW4gdGhlIHdyb25nCj4g
YnJhbmNoLCB0aGVuIG1vdmVkIGl0IG1hbnVhbGx5KSwgc28gaW4gY2FzZSBJIGluZGVlZCBkaWQg
bm90IHNlbmQgYQo+IGZvcm1hbCAiYXBwbGllZCB0byB0aGUgTVREIHRyZWUiIHlldCwgaGVyZSBp
dCBpcyA6LSkKCk5vIHdvcnJpZXMsIEleV215IHNjcmlwdGluZyBoYWQgbm90aWNlZCA7LSkKCkdy
e29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVy
dCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdl
ZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5p
Y2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2Ug
dGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
