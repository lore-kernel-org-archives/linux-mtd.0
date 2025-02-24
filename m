Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B6C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vc4Fy/YIJdTFkJCp0hVi58vWDG4Oqk/0Wpo/vL9LHC4=; b=WUHul7x0TdrvG1
	J+1saeN26X1t3/3IVmde6lMb3gw/uSsknUkhQxL8vhDKdE9vkAE/5XkIrHIhxEx9hTKDAE3UaMltw
	KaHnW8/9kzPs+pL4qDcMoBiz+dvey+t9dyAopiDVwp3RtFJmS0XDbJLm8lGD6kV9HRpl8adb8vaQ+
	t9CfsuGiiHVSzt7wGew2KYb1n0an5y8eaHKH7eUdcZoFnKBQ3Qtbckl7NwZ9VI8vEw+FAGhRmnIss
	1ifE2y74M42AbGghd3YEIMWZTG12lO4QLaWe6voNNvWf1hHLNyx5EOiVRd5P0ZAl/uLbF9BN+J3qC
	JSJf9pjdOLXlfeiGqpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgcg-0000000FK4o-1Zst;
	Mon, 24 Feb 2025 22:08:22 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgcd-0000000FK4H-2vmD
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 22:08:20 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30613802a6bso51506631fa.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740434898; x=1741039698; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
        b=hXilcbsOFdMdQY3po1cXGKF2NMjaDH9UpOPweciKHxB04qSmUnHkNIfyu5PC4GNHps
         j1jzpFJ8mzDTZcE6UlrXhGHALur1syF4jm1ttAnMZdDyy9jADHiLz7j5s9cO9lV7RiMm
         Kt/fzqyY9QpEN73VcS4+/JtqvbVyNNuzvdxwewj1nNm/EMhnopVswlKbJ9dRQwMj0ov3
         gC7bJ4z9xWyr2bqgmfs2+WD/vC20sRa1oSBocHDD/I7NtYBGohoZeyMjAletfp8eEAvw
         1jCo/GKxcglK98D9k5Qd+VOgBf9D3aRSbt4w9vtZZ2CHTS5YTRmvDsoJVj5tsNeyvh5H
         YL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740434898; x=1741039698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oaFYm3uznORB4542Rq36b3rymmLdKUYeu8YPMsf53M=;
        b=STVb8hc7KhZG0YYAHBNMn59FqtheJBCWG37vNEnOi1VvOA88w3pOMdN8Ldv1qnVc34
         Ax7s9WWfCs8ctxWUaIodgFRgG3JiQ98Qcs25XIChZtjM3F/WHB+PaWpSGDUkw6c1aT7V
         kCfXvUGA9dOhvfoEc22/PPSj77EtgS2rcC/+vRY/ToSiubIuqXvcdMqIaEK13jrovwKK
         LpWhu6cq/kpcwuHoIM5ey4dSzJaZwL3XXTRhU5LzYJx7H3bcHmw5YQf0uk8weH0NDFv9
         wRcu7ejSEF950S0BHQ+U7TJuHTRcdLg/kcl3suug/rrDkJiITCUtqJv76Yeci7l8Dfvg
         3bqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOaZ6HCNIfIrTEMdbCxWvSVLy3Ws1VODeVW/wg+cDZrx0I9GbNW5ETtv8Ye+M3u5epBhxWoyPbCIU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkgKTPB10qXxOE0BEXU95TJVXF68HKMsYEC+o6dwuJAyjhRyP3
	6w/mMnMKz/Bi6SW1zvcbUfrHtZxPNHUhqKNy050Pk+ehu+l1IbU/0n6We3ugBNhxOgBN+IsbDIu
	ieWFMNNg+jQYXGXMfLR5cvGOZWU4=
X-Gm-Gg: ASbGncv/PLwCrAhGJ8I79G9hHRVH8ggrV6egDsz5Lf9BMfDW0+eDMpDBEGH/RtJDCU0
	kCcTtR5X1txseGKBQVGFOei/vB04HwNk9eV2yVYUsPk0U2Q1GrnltPomNsWT0flzJVToU73LYwz
	+jN/c1scs=
X-Google-Smtp-Source: AGHT+IHVkIuUFpCDrTU0uvA7Fgx58+MbAWd4iAmh/s9u5Z4OX/tBnfLt5fF/OB0IUp1t1TAS/xkQrlAynJ4vLhos6iA=
X-Received: by 2002:a2e:8713:0:b0:300:1ea5:1655 with SMTP id
 38308e7fff4ca-30a80c2525dmr3121091fa.15.1740434897401; Mon, 24 Feb 2025
 14:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com> <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
In-Reply-To: <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 24 Feb 2025 23:08:05 +0100
X-Gm-Features: AWEUYZk0kdMcSa1NJ7f-FEs-56xLQUiW9T9ljXTGABrJPIypOLr5b30gUzs5pw0
Message-ID: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Subject: Re: [PATCH 03/17] x86: Replace open-coded parity calculation with parity8()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, 
	Ingo Molnar <mingo@redhat.com>, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com, 
	mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, parthiban.veerasooran@microchip.com, 
	arend.vanspriel@broadcom.com, johannes@sipsolutions.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
	akpm@linux-foundation.org, mingo@kernel.org, alistair@popple.id.au, 
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mtd@lists.infradead.org, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
	Yu-Chun Lin <eleanor15x@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_140819_739276_96712878 
X-CRM114-Status: GOOD (  12.10  )
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

T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMTA6NTbigK9QTSBILiBQZXRlciBBbnZpbiA8aHBhQHp5
dG9yLmNvbT4gd3JvdGU6Cj4KPiBPbiAyLzI0LzI1IDA3OjI0LCBVcm9zIEJpemphayB3cm90ZToK
PiA+Cj4gPgo+ID4gT24gMjMuIDAyLiAyNSAxNzo0MiwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPiA+
PiBSZWZhY3RvciBwYXJpdHkgY2FsY3VsYXRpb25zIHRvIHVzZSB0aGUgc3RhbmRhcmQgcGFyaXR5
OCgpIGhlbHBlci4gVGhpcwo+ID4+IGNoYW5nZSBlbGltaW5hdGVzIHJlZHVuZGFudCBpbXBsZW1l
bnRhdGlvbnMgYW5kIGltcHJvdmVzIGNvZGUKPiA+PiBlZmZpY2llbmN5Lgo+ID4KPiA+IFRoZSBw
YXRjaCBpbXByb3ZlcyBwYXJpdHkgYXNzZW1ibHkgY29kZSBpbiBib290ZmxhZy5vIGZyb206Cj4g
Pgo+ID4gICAgNTg6ICAgIDg5IGRlICAgICAgICAgICAgICAgICAgICBtb3YgICAgJWVieCwlZXNp
Cj4gPiAgICA1YTogICAgYjkgMDggMDAgMDAgMDAgICAgICAgICAgIG1vdiAgICAkMHg4LCVlY3gK
PiA+ICAgIDVmOiAgICAzMSBkMiAgICAgICAgICAgICAgICAgICAgeG9yICAgICVlZHgsJWVkeAo+
ID4gICAgNjE6ICAgIDg5IGYwICAgICAgICAgICAgICAgICAgICBtb3YgICAgJWVzaSwlZWF4Cj4g
PiAgICA2MzogICAgODkgZDcgICAgICAgICAgICAgICAgICAgIG1vdiAgICAlZWR4LCVlZGkKPiA+
ICAgIDY1OiAgICA0MCBkMCBlZSAgICAgICAgICAgICAgICAgc2hyICAgICVzaWwKPiA+ICAgIDY4
OiAgICA4MyBlMCAwMSAgICAgICAgICAgICAgICAgYW5kICAgICQweDEsJWVheAo+ID4gICAgNmI6
ICAgIDMxIGMyICAgICAgICAgICAgICAgICAgICB4b3IgICAgJWVheCwlZWR4Cj4gPiAgICA2ZDog
ICAgODMgZTkgMDEgICAgICAgICAgICAgICAgIHN1YiAgICAkMHgxLCVlY3gKPiA+ICAgIDcwOiAg
ICA3NSBlZiAgICAgICAgICAgICAgICAgICAgam5lICAgIDYxIDxzYmZfaW5pdCsweDUxPgo+ID4g
ICAgNzI6ICAgIDM5IGM3ICAgICAgICAgICAgICAgICAgICBjbXAgICAgJWVheCwlZWRpCj4gPiAg
ICA3NDogICAgNzQgN2YgICAgICAgICAgICAgICAgICAgIGplICAgICBmNSA8c2JmX2luaXQrMHhl
NT4KPiA+ICAgIDc2Ogo+ID4KPiA+IHRvOgo+ID4KPiA+ICAgIDU0OiAgICA4OSBkOCAgICAgICAg
ICAgICAgICAgICAgbW92ICAgICVlYngsJWVheAo+ID4gICAgNTY6ICAgIGJhIDk2IDY5IDAwIDAw
ICAgICAgICAgICBtb3YgICAgJDB4Njk5NiwlZWR4Cj4gPiAgICA1YjogICAgYzAgZTggMDQgICAg
ICAgICAgICAgICAgIHNociAgICAkMHg0LCVhbAo+ID4gICAgNWU6ICAgIDMxIGQ4ICAgICAgICAg
ICAgICAgICAgICB4b3IgICAgJWVieCwlZWF4Cj4gPiAgICA2MDogICAgODMgZTAgMGYgICAgICAg
ICAgICAgICAgIGFuZCAgICAkMHhmLCVlYXgKPiA+ICAgIDYzOiAgICAwZiBhMyBjMiAgICAgICAg
ICAgICAgICAgYnQgICAgICVlYXgsJWVkeAo+ID4gICAgNjY6ICAgIDczIDY0ICAgICAgICAgICAg
ICAgICAgICBqYWUgICAgY2MgPHNiZl9pbml0KzB4YmM+Cj4gPiAgICA2ODoKPiA+Cj4gPiB3aGlj
aCBpcyBmYXN0ZXIgYW5kIHNtYWxsZXIgKC0xMCBieXRlcykgY29kZS4KPiA+Cj4KPiBPZiBjb3Vy
c2UsIG9uIHg4NiwgcGFyaXR5OCgpIGFuZCBwYXJpdHkxNigpIGNhbiBiZSBpbXBsZW1lbnRlZCB2
ZXJ5IHNpbXBseToKPgo+IChBbHNvLCB0aGUgcGFyaXR5IGZ1bmN0aW9ucyByZWFsbHkgb3VnaHQg
dG8gcmV0dXJuIGJvb2wsIGFuZCBiZSBmbGFnZ2VkCj4gX19hdHRyaWJ1dGVfY29uc3RfXy4pCj4K
PiBzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX2NvbnN0X18gYm9vbCBfYXJjaF9wYXJpdHk4KHU4
IHZhbCkKPiB7Cj4gICAgICAgICBib29sIHBhcml0eTsKPiAgICAgICAgIGFzbSgiYW5kICUwLCUw
IiA6ICI9QGNjbnAiIChwYXJpdHkpIDogInEiICh2YWwpKTsKCmFzbSgidGVzdCAlMCwlMCIgOiAi
PUBjY25wIiAocGFyaXR5KSA6ICJxIiAodmFsKSk7CgpiZWNhdXNlIHdlIGFyZSBpbnRlcmVzdGVk
IG9ubHkgaW4gZmxhZ3MuCgpVcm9zLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
