Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BA0FD5312
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Feb 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhK/3fCBlQgTGaNHQucv0kYakBvzlWrjKkZF132ahsI=; b=ZDHosvQsLMEz3x
	H2RLCzRNYzQrptNrSOmrDeBD+v2CHnI3zThXa8wDkcS/PiVvupV77jRXJazUQ6s7cAsT1bjMtgjGf
	K22RVYXYgdJMfl5k3vdGTalpuqL9h+PlRQhMB685sPCYo4/FxUV7ZjEGmsBBLdcD67miWPuwBEmTg
	JRL3TBxqathFx9Cx6btlDVIeBEB5RrkXOfUJyo99qCNTDq62k63jDIyoR3dm9cuSA+z/VFC7Prl/0
	bVqLYpEFNdsxOjFHFjRVvvRi451tEEu/meY5O6400CKr+KWSLdW6/yMG7qPA/A1+x+Trgvt0ON7O2
	TA2I6NTAMuoVWQvT2kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvthe-000000082nI-0Zc4;
	Fri, 27 Feb 2026 09:00:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvthc-000000082n9-3ER2
	for linux-mtd@lists.infradead.org;
	Fri, 27 Feb 2026 09:00:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36BF86012B
	for <linux-mtd@lists.infradead.org>; Fri, 27 Feb 2026 09:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0CCC2BC9E
	for <linux-mtd@lists.infradead.org>; Fri, 27 Feb 2026 09:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772182803;
	bh=dX4ehm8SXCXaUEOm0szjaHAyFfNx6GjrNtvxviAFHew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mhNtxGdZ1jJh3DYFjihspAqZJ/G9wEOeML7BDYqkF4JuCZgify/7ThCz5ndS/srIL
	 OzCxW7vo6/6xTxcTFJkxWA2Oo/awyxCEed8ECVqqvZS8LWsNQZtp0IjwdEgYNvlV8G
	 aeNHnubQ6Ik5v2dM5ER5FrT8NRG917sG0pz2xuPEQgoPmBCaYcgTJSTrN47sfD55FF
	 UisWSkZDmMRrrQH9UxuPbaiMoKmM9KoGCGY6v8LTiVQ1fR/gS4Ky/QO5YGTOt1+Gsb
	 HJdsB2IRTGVXgruAejoMVF5LgtmYtEopAexhZDumAlKlo8d0SC6q/GJ/Aeg9rMoV+e
	 o8Tm3stZiLW0g==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7984d31b895so17198427b3.1
        for <linux-mtd@lists.infradead.org>; Fri, 27 Feb 2026 01:00:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5BmoTzYi7ZC+K8RL0kgJcIq+J+QdrgD+rLoO5/hDyw7ydDvK+aMNAQZqe41fIq1JDThN8T9zkNoA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUalYroS2IATHH4JfkmyZU7fRGPVQZvepibvLP1TsSMqwXzY7X
	BAB/EOh8PSqPRAw/jDcjaxB5RGo/NiW6jv07HROSBVBPcZ6gkldAA6i2U869/Hq07b3g4O8KGf8
	YcmSpqjtC9d/1GivEfiN8qq3ItX0zfLY=
X-Received: by 2002:a05:690c:6611:b0:796:3515:3aa8 with SMTP id
 00721157ae682-798855f9bc4mr22529587b3.43.1772182802373; Fri, 27 Feb 2026
 01:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20260227014337.3938091-1-nichen@iscas.ac.cn>
In-Reply-To: <20260227014337.3938091-1-nichen@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Feb 2026 09:59:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLnUhMPLsikRR+UMu366f8OD0Ed0od0LmvdvkGjGC3FHjQ@mail.gmail.com>
X-Gm-Features: AaiRm50_HID7bgEsC7SDLlbqQppGeJv64gqQN8S3Qq05vWIx2NuXv240Wys_SPE
Message-ID: <CAD++jLnUhMPLsikRR+UMu366f8OD0Ed0od0LmvdvkGjGC3FHjQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: physmap_of_gemini: Fix disabled pinctrl state check
To: Chen Ni <nichen@iscas.ac.cn>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMjo0NOKAr0FNIENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cgo+IFRoZSBjb25kaXRpb24gZm9yIGNoZWNraW5nIHRoZSBkaXNhYmxlZCBw
aW5jdHJsIHN0YXRlIGluY29ycmVjdGx5IGNoZWNrcwo+IGdmLT5lbmFibGVkX3N0YXRlIGluc3Rl
YWQgb2YgZ2YtPmRpc2FibGVkX3N0YXRlLiBUaGlzIGNhdXNlcyBtaXNsZWFkaW5nCj4gZXJyb3Ig
bWVzc2FnZXMgYW5kIGNvdWxkIGxlYWQgdG8gaW5jb3JyZWN0IGJlaGF2aW9yIHdoZW4gb25seSBv
bmUgb2YgdGhlCj4gcGluY3RybCBzdGF0ZXMgaXMgZGVmaW5lZC4KPgo+IEZpeCB0aGUgY29uZGl0
aW9uIHRvIHByb3Blcmx5IGNoZWNrIGdmLT5kaXNhYmxlZF9zdGF0ZS4KPgo+IEZpeGVzOiA5ZDNi
NTA4NmY2ZDQgKCJtdGQ6IHBoeXNtYXBfb2ZfZ2VtaW5pOiBIYW5kbGUgcGluIGNvbnRyb2wiKQo+
IFNpZ25lZC1vZmYtYnk6IENoZW4gTmkgPG5pY2hlbkBpc2Nhcy5hYy5jbj4KCk9vb3BzISBUaGFu
a3MgZm9yIGZpbmRpbmcgdGhpcyBDaGVuIQpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXN3QGtlcm5lbC5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
