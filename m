Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1157CC6B2D
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 11:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yY3WAOdMKhHvA2QkPHQtEBGzEa4TQ1rh/Lpm6Vlon0o=; b=EXSvlFek2lTPTf
	1z+0Dz+JIhRNbBTDdZV+3os0jP3kIA+Iyk1+L6eaUqk5mqKy7KJZ2tn4FItuqKN07bhGeDjPwfpNb
	2xnLiCdPrajCivWl1BTFYHBehsZjntfIxgTW/yeMwTgGeL1GcORecD9weDl3gA4kAN5qYKnk2We1L
	h/5Q5k+d4t3O0LjSNNpfThumP3FHDaXVnHMshfywm3al4KGlReUGiq8EyY2w+gCno7BSigTOrbMi5
	qQ4gmwXxBiJ5y1ET32hkNpkIA0YrGERNQRiOXa0vUSkozUkzFSehUI+C7rxfXrGq3F1aAfCvjH2i5
	Bc4966Ugf+z+JHoodtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAb-0000000FK9r-2JTt;
	Wed, 14 Oct 2026 11:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxAX-0000000FK38-0hgW
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=; b=lEgbydS6ZAruO+I2wYrx8hk9CC
	sRmABfsuSvXGIXu630zkoUwKAF0n2LqdhXTEfj6k0+w3F1xpUHeVD8XD64n1n7MYOc4Cjj1zDp0Ki
	JLhSpPNu2MV/swlnQEFETdt5UzAMusTRCBrYYDvODjM+JOZ6JlZkOw9hH2A7ts+IwgVI/fI0NTVFV
	q9340yA01Gj4aCyPh4xy60qnuEpIOhQGAWZmHGonqUaP0Y90FIKkqT4Kcg1jhJBT342OZ9VD/yeWF
	X3sjAMcwS54jwEY6ez9a1+0ZcVGaYB6brC9t2OsAu2XI4zWsTqF2gN6OS+RTzcy7dTPvG95kpO1S4
	oiqSIqdg==;
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxAU-0000000GghF-05Qx
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:12 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-35179d0747fso306964eec.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 04:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=FTYv2ZZ8Un5ZdFs622FGZiyKkcpPk1qHhUVuI/FTxGddT1E5mdIWx+PV9b6HRkaS1H
         nPf8f5t58tmewhLw9PwhPNBnDwCzxxtkNJFrW/0fBpXRlr/n5N8U5kkeNjWaljxLAYLN
         voi/9Ams9wnvxLUpF661Fu1P4dUnTra1cUbNUL5aExrcvfag0CTEc7WFQRGJrrVjUKoR
         hnTbraGc0X1HrbUuxmOkZZ75CRFTMwiR4vQk3IzOh1RnzvPA24Zv4N+qQoQi1nRVmlea
         R6t9V6vQWiMWa1+kcCi04wDix6MrVt3vONJUiNWy7c5UOqGjybcUYQBemtlu08yH1CBp
         uv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=L0J0bZXkDA7KJP3D0yXCsTfuJaD52My5VhyrekNXi8w=;
        b=Qnw5xdKtgbCQq86Xim76N+oifn0uXa3XQe+gVzs1siXUI889quUR/552GHaMGUJR+E
         8w3glD9UyXUpiST/OZYXPuRROAMbn4qvtrgF0ITnhK5R3+8Z65Adfqo22E91mTB6yDfA
         FWvP2QdCWUZRswGUvTqqn0tyBzEwvUrVtKME864Gj0B3EtKg/CfZOmwOynwQW4859tlk
         4EX1d5eY8r9+ewA6Xa1lVwAb9/9V+0GQty5MYN813KDMV+I07rRvPAGOVra1NoLI7air
         Y6rTf9ZuA/+FZHvSYcxKjP19rv8GgTsCrgsZDwclwSJ1NSDM04ZORYaXZE7pyp1Iv5Ve
         p3Uw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=fh/MvdNDgfK7HGTIcKDoIf7arWs+aj5dHq0MihGY5aDdM2brCFL+aGcG/d/c6Z2uZx
         NSIpG31SjmCUZYs77DezrYPFe9k/cLkzD6BMiC4d0V4CfJMAv+skSXg6zdYgkRiWVH+c
         ZtIdWsVio9/oaRc/FgoHuwfQaTRV7XUN6z81kfi694Zd7wTF+AExLW2Aicq+2+IOvPpo
         7xr0eJIxZ41wXbzYXuRKY32hduqTSaeYA9DPykPR5NZoQ+lgrKs9EwOBKSEvFL7n3a1e
         l0pnZ2UkC7Jy6eR+9K6aEG9pPjKoHxTzpqCmUw3QGbCipGZMaAdEe14UkzBphZKPg1eG
         +ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=UXnjIqvY8yTX2iSbXWCTBA3fVKCFoDD5K/2i87PRC2mVpsIcF/EW0uZH3oLiK8rl4P
         kV3+DJxsCT/4flNlwUGpBG6zi4iM5WHiw0O2xWWQa3dYuX+WJc+MOREsak3DEOnvqcaf
         BYpNMySyLgDEhvAPSsxp/KcT+vRtnk+0AuiS7CAHQAEnVuSiygNx316lvao2TbdoMYot
         izBcvptccobOWrlaTuf0cVcV3KzYSJ2swRYexLJkCXaGq7Ek81BYgrYrI43Nyxw3McOr
         WvM6RVtkbfsgm7u6TM7PodTIfzq694P3y6xGdjy2zH6dLyZTFMpYLpLzjF+vL9skQ+P0
         3Dfw==
X-Forwarded-Encrypted: i=1; AKwUvBzDMrHolhkp2gPTNfSzGV8U/JmuBhhKR9A2z4JtKRqrQOm7oKmim2ZZ5+9eV5KVu3Kpz92wsAP8+7g=@lists.infradead.org
X-Gm-Message-State: AFq9FYKGWS+f+fx5iQ7YppB0OoP7OWv5pN4ETaTW9bbFHqSntZ6DGWmN
	tOyApGt1PNdCzme8/TWSeMr0d0OEUcMbYSXXsR8EJFe//7vQTUL0Ij6V0aguAuPSHkfbv2J2K1N
	M6N5EKIdwlwMN85sjPAmoUA90CKifxk5dnpCMSy8=
X-Gm-Gg: AYBFou3J/hZaIYLZvJkdynoKmkojKb7MnFjtbyMprr0tKy/OadYaqf/TQqgmLNePjr7
	4wf/FzDoW9Vio/mQlibcHvsp6eM6DIiYxHgkKY8phHJa6a8XyKGiX68z52bJ85oe4reVj0hRKQm
	zfoGHRUjqPU4ovoSTgSDzzyiEh5uDAZO542/KTjvKTizCdKfSPE3IzuGHl7RHBElx570W5R4vUg
	IQeOqifeMy9XtczKfo5sSuMCJLInTEpL3qjucvOOSbzkLOWMWMC/zcR8cR9NJwjeMSTw9rzJZJD
	BFeYTqhOdNeYkt/jRfoWj99LF7WTvHtlVKJLsMwSq1r8Y6v0GbCJUwYWvPFuCmaymrF9ZmGLYI+
	hbD2sUGxjhrPluEGDaSQ4ZCCMTjv3DlJ0xUQO3mFASe83qM6EU0FnLfB7TBAKH08eGtPSE3Wtn2
	2gRVFDUI9GjEp1tXqyXaHhwphojvpYS4DZYjhusJDpxB/WT474uyY=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
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
X-CRM114-CacheID: sfid-20261014_122910_217123_99E98D3D 
X-CRM114-Status: GOOD (  13.06  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgMTI6NDDigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gKy8qCj4gKyAqIE9wdGlvbmFsOiBub3Qgc3VwcG9ydGVkIGJ5
IGdjYwo+ICsgKgo+ICsgKiBjbGFuZzogaHR0cHM6Ly9jbGFuZy5sbHZtLm9yZy9kb2NzL0F0dHJp
YnV0ZVJlZmVyZW5jZS5odG1sI3JlcXVpcmUtZXhwbGljaXQtaW5pdGlhbGl6YXRpb24KPiArICov
Cj4gKyNpZiBfX2hhc19hdHRyaWJ1dGUoX19yZXF1aXJlX2V4cGxpY2l0X2luaXRpYWxpemF0aW9u
X18pCj4gKyMgZGVmaW5lIF9fcmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlvbiBfX2F0dHJp
YnV0ZV9fKChfX3JlcXVpcmVfZXhwbGljaXRfaW5pdGlhbGl6YXRpb25fXykpCj4gKyNlbHNlCj4g
KyMgZGVmaW5lIF9fcmVxdWlyZV9leHBsaWNpdF9pbml0aWFsaXphdGlvbgo+ICsjZW5kaWYKClRo
ZSBMUEMgc2xpZGVzIG1lbnRpb24gQ2xhbmcgMTQrLCBidXQgZnJvbSBhIHF1aWNrIHRlc3QgaW4g
Q29tcGlsZXIKRXhwbG9yZXIgYW5kIGEgYGdpdCBsb2cgLS1ncmVwYCBvbiB0aGUgTExWTSByZXBv
c2l0b3J5IHRvIGNvbmZpcm0sIGl0CnNlZW1zIHRoZSBhdHRyaWJ1dGUgd2FzIGludHJvZHVjZWQg
aW4gQ2xhbmcgMjArLCBubz8KCklmIHRoYXQgaXMgY29ycmVjdCwgdGhlbiBpdCBpcyBub3QgYXZh
aWxhYmxlIGluIGFsbCBMTFZNIHZlcnNpb25zIHdlCnN1cHBvcnQgKExMVk0gMTcrKSwgc28gd2Ug
c2hvdWxkIGFkZDoKCiAgICAgKiBPcHRpb25hbDogb25seSBzdXBwb3J0ZWQgc2luY2UgY2xhbmcg
Pj0gMjAuMAoKV2l0aCB0aGF0OgoKQWNrZWQtYnk6IE1pZ3VlbCBPamVkYSA8b2plZGFAa2VybmVs
Lm9yZz4KClRoYW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
