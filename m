Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5AC3DA7A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpEYfZvq+5EvV0ARbvZnV2AXiOCK7uBx4VgAI6DYQKE=; b=xuFAJ829EO9HVo
	AGzkE7Ot9k9F7ABs9rlfVAbNyoosNgBdEvhjaVzqriuxCdaNE67c3FUj9gaD/CnbkMnNxhGDy8SLv
	KYG+jzQ6Ekp99t6VitcxH0tmlhWLLRSDL/Tu1qcs3WOGZZBuUZzS/FjfKF+IFql/wXz6T8YD7OfLU
	wivuZmK724MPE3rrH6XoohzlD+rgqFWyC7hy9fbh/5UurBlp92yxBSS0dbKjGQtaxy5lc87MFfCn/
	APXYnb/9h7Not8R7Sov+8Vmvib4FdxmrC4P8yc1WMbzMkB6r03whxmpkXnDnWzbetVBgJlxwCLHRj
	s12IkkkNHuN3zOrxWXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH25w-0000000G1Us-24Oa;
	Wed, 14 Oct 2026 16:44:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH25t-0000000G1TQ-3s7C
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:44:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so38176955e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 09:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996282; cv=none;
        d=google.com; s=arc-20260327;
        b=VoTQLNViN/eYgUYXCybjH02Lsm9rH3S/4mHjAImYPhzaT53UOxJ2CKA7t/wSnVOgFk
         p/1dJ6wFNNUMCbieT7zvFb1knNp3GWHZzSu+7BG3r8vrsWv4IcU4sbqJnHA//zIlLi6s
         2DArb7KNlrT6wWdFiLW3u0olIHRam2AjEoczXBanhEfotR4TEK4/Aq8mtsytpLnLZlWy
         cwyV4mjIO4m95h/MmC2kbVFVozS/BEeUD6IayRVtPiivwQeQNu2onqI02TQKrjNJsLko
         MHB2ITzEnI5fccGM+Vk5rQHjdq/npzoaOaX31cRBA2Xs2keHutNRCGQS6NBiVnjGgpwL
         7ruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        fh=ez8Y5vc+AHM1DCt6crmOS71Akxqo9ur4glXv8SPChto=;
        b=Ym0D06yvQJhBJwbbNQ6ICMwBiMcOwXku3oX8vQkSAAF9EzuDTMNJFTPlPA+Ii8R1i9
         h4NrGwJLyOHTp1IQTTuVPNYvjNFundVLI9l3bjDZb08CerN4zwxbaKUTRce13iwblibj
         IussFxPFSInrpIueWCXVcTDuu40SoMNowsAPTR2qIBpeHv6aO0BqkMMMpz5uXBezNq+H
         LX4C3qNn60bfobhnlDePF72g/kedrOup81lZHUdP56fRJXumhKzHPdmhMO1GheWWijmt
         MOPjFetltUSRgUSrYAy5NVIJG1n1p8RwqiqlzAn11PaKOv+CBN8f16yEfNsTzI4t4Gso
         SfCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996282; x=1792601082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=X1FrqO5GyClX/F2L5x0CxxhTwaCZSX8n65LpnZmmugPszH8By50fyAnzOQzlx97USC
         Zw5B8FIdq+ZpLwBrEPP3gSGwEn3KHbrTYzNO1IVJYWhrF/PDLOMoTxa0ze4Y9w56Twzy
         4vCGYCZvjB//3YEEMWH9Y2S5b/kdKv0p5gYINWmVhY5WKQs9piN55gLaa8zmHXGO424j
         r92/5q4Ltj/kLT3YvMXV+9evmlCnqXrdVROhXi48Tf3hCLDEZJYurrH6Zu6J0CT6ZJYp
         p+n8hIvgcABhdkoMqr9lyN08A80cHarGHZIN1PV+GyFX/KdgFZ3fO9vXmSOHYJce/9rK
         MGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996282; x=1792601082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsPwLhsDZInozncTdS3m6Cc033xIb80Yu7bEmy4I9fE=;
        b=GFidhKG9GgXTSKvYErz3i2kLlJ4FtOG1ikvoVMHEyvqEJy34lq/Id67Fq2vtySRiZD
         E3c2iylfHd22wK2tRPR0GVSaF3Bw7ra/kAmBmRr094Pwx1E++2yJQ11xtoN45luw23Z7
         MTVDz8LdaKgY5aqH1bh7eV+EywSqJ0t9jyRDHRzODbDjZ4VWN8kYDGvmCat/1o+kpUc7
         DyW/HI4JlRaBj/xWR9o4rjH9YF+bpe+r2ETo3QZ4gsH2x35BukspxKXKPGxDKiM9zVZq
         hGcLbb5Y7HGzGJoiiE1IJUnzJ2trwwIsbKQSrwOqOaqiADOEu1RogsPwKlYGMCJVRbJ2
         3gzA==
X-Forwarded-Encrypted: i=1; AKwUvBykUs4R4iAE7Z5dSD0uGzkFLzfQyZ2H9K8jjzTMU6WAD49W73UdTzCB6I50juMiZoe8JG/7ipjx1r8=@lists.infradead.org
X-Gm-Message-State: AFq9FYL1YdfRQpOyjsMzjFl8Cu65VyJgSdHhzHyeh0L5Stkv6GIfP3ui
	g6LAGZLJc6AlCOzn4kfYlTuttTFnll2V2wJ6kFH2Yg5uGIEKnDl5SVyhEoK5Tw4VYa7jRJSAlUE
	qXR0sSkTMkY6FKB2lyDOJQdWftIhvqqjtdMjYbSFU
X-Gm-Gg: AYBFou3Ao+oMFOGFHCa0Dh9hTzEEinDnoh1fmZ1BrAaMhZ+RITGNyW0z8S3YIKBFzJj
	2vKrcyLBdr+RRR01dNkRYMXfNSWyeIylWNQ48bbXhZwbNWkeU2VLF4qptPS+eeTrkG0+shpB2ku
	5RVOYV7a9Im44DyWlcDk4ZE545UFpccS305BtmBuU9rAKG6Y7JZw37A9WV1T59FxzirBIVQCiIf
	IhXauMOlGFYy3GQSTIsLO0Tu/QIYoGZAjGObHGKM0xEJZfctRvQI9FjdinvYOjQmD4QkzYV3oaQ
	9bM9kkBp63IgNuMWfaaLIJfb/M9Z/3bvoYSVJ99mRzJaI+bfKnRf/FvzPBNIVxYChr5MTGJm6YE
	zjCa94pbNzIwamN/urPNjDJoc7CsajA6M7zxsDPEfN+sp9Vz/4/P3vn5lHnqzhvZP0V+otRIeLT
	CxdDs05U9CfZGOxcnDovTp9V+pZisMWNKaXKymi6LAN/NUI/HdZ0+N
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a18e3ef23cmr329192565e9.0.1791996281614; Wed, 14 Oct 2026
 09:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
 <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com> <202610140937.B68C8C9AAC@keescook>
In-Reply-To: <202610140937.B68C8C9AAC@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:44:29 -0700
X-Gm-Features: AclHuK9LUe2FvddsKjj0vYiArabpm2vrSaqioSsrjl7koqqOn_VyYRh6l-6milM
Message-ID: <CAKwvOdm6nO6skW4-AZtmzpGoNyO126L_AN3Mz2fu23+3QXcshg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Kees Cook <kees@kernel.org>, Ian Rogers <irogers@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_094445_986910_F309155F 
X-CRM114-Status: GOOD (  19.32  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgOTozN+KAr0FNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDAxOjI4OjU1UE0gKzAyMDAs
IE1pZ3VlbCBPamVkYSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDEyOjQw4oCv
QU0gSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gKy8q
Cj4gPiA+ICsgKiBPcHRpb25hbDogbm90IHN1cHBvcnRlZCBieSBnY2MKPiA+ID4gKyAqCj4gPiA+
ICsgKiBjbGFuZzogaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0F0dHJpYnV0ZVJlZmVyZW5j
ZS5odG1sI3JlcXVpcmUtZXhwbGljaXQtaW5pdGlhbGl6YXRpb24KPiA+ID4gKyAqLwo+ID4gPiAr
I2lmIF9faGFzX2F0dHJpYnV0ZShfX3JlcXVpcmVfZXhwbGljaXRfaW5pdGlhbGl6YXRpb25fXykK
PiA+ID4gKyMgZGVmaW5lIF9fcmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlvbiBfX2F0dHJp
YnV0ZV9fKChfX3JlcXVpcmVfZXhwbGljaXRfaW5pdGlhbGl6YXRpb25fXykpCj4gPiA+ICsjZWxz
ZQo+ID4gPiArIyBkZWZpbmUgX19yZXF1aXJlX2V4cGxpY2l0X2luaXRpYWxpemF0aW9uCj4gPiA+
ICsjZW5kaWYKPiA+Cj4gPiBUaGUgTFBDIHNsaWRlcyBtZW50aW9uIENsYW5nIDE0KywgYnV0IGZy
b20gYSBxdWljayB0ZXN0IGluIENvbXBpbGVyCj4gPiBFeHBsb3JlciBhbmQgYSBgZ2l0IGxvZyAt
LWdyZXBgIG9uIHRoZSBMTFZNIHJlcG9zaXRvcnkgdG8gY29uZmlybSwgaXQKPiA+IHNlZW1zIHRo
ZSBhdHRyaWJ1dGUgd2FzIGludHJvZHVjZWQgaW4gQ2xhbmcgMjArLCBubz8KPiA+Cj4gPiBJZiB0
aGF0IGlzIGNvcnJlY3QsIHRoZW4gaXQgaXMgbm90IGF2YWlsYWJsZSBpbiBhbGwgTExWTSB2ZXJz
aW9ucyB3ZQo+ID4gc3VwcG9ydCAoTExWTSAxNyspLCBzbyB3ZSBzaG91bGQgYWRkOgo+ID4KPiA+
ICAgICAgKiBPcHRpb25hbDogb25seSBzdXBwb3J0ZWQgc2luY2UgY2xhbmcgPj0gMjAuMAo+ID4K
PiA+IFdpdGggdGhhdDoKPiA+Cj4gPiBBY2tlZC1ieTogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJu
ZWwub3JnPgo+Cj4gWXVwLCBJIGNhbiBjb25maXJtLCBJIG9ubHkgc2VlIGl0IHdpdGggMjArIHRv
by4KCkZpeCB1cCB0aGUgY29tbWVudCBhbmQgaGF2ZSBhIGNvaW4sIHdpdGNoZXIuClJldmlld2Vk
LWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KCj4KPiAtLQo+
IEtlZXMgQ29vawoKCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
