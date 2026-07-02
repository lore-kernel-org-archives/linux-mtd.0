Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68CDC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 02:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0uflqg+TgAc4vw3PxeZhDb/WHDMCbfGOw1qrTEHEwo=; b=CnlDaJamH7NZI8
	T1txex/TcZF63+ziLhbSiyzDVp9xuK2AUEmL+ax/N6QlAkyio3xKJXQPfbQ0TYCMH9l+AZqv59eAK
	N0n5LuGGRZJ2o3eErNoYXiwrOQUz99aV0XOHVAx0OCiwFGXtKYcQ+L0Ynte/GUq7ABZD4kO7qqKDf
	Op6SzY/tDa8bajA7moSaUGvYsHfmu1tg5wJQxAt+QxXMK4bUb5UNa7oZwcF8XK7Hpf8E4IhGliF/w
	ywJoCNeR4IZHtImwert0vb0bclyBZ7Ri0GpeKi4VuP6T6TgiQilcBr79JjcWobVPUXoIMkdV+4s/C
	ef71g97iXJ22A7Q85Wwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6yc-00000003PXV-3nJg;
	Thu, 02 Jul 2026 02:16:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6ya-00000003PWo-0ifr
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 02:16:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-847a69ba83dso688994b3a.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jul 2026 19:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782958587; cv=none;
        d=google.com; s=arc-20260327;
        b=Vx1GixTKGKYmLoPsoV1DaHjGkr2rL4moOmoWQZU7L0jBeF8mmWfWedDeP0x2w+YW8l
         bTiuuz/d1oVPn1V1lmnExl4WUxxpdlbCiG4hGVdQ2nhD4LgTVLp5aFJeQPh/92dF921g
         dFCJm6DOZUmYwecQFhsAXc6L97hU7HsS0YxzL91P8cc9K6E+djwmTZo7POMHyaRZDh26
         EKgluRIZfMwOu3IL7Gb4nFVNM1jWU7/XiVynlL4CQh0iSpXHqtkqV7kbV6ckEkdu67uD
         ZaZPxIFEP/Xq2Kmxzux3n5S6gKrFvoidz6PhrHfcx9X201d8vLznaD7NUpaWnHZ2RK83
         mVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5+E6fxZHhZpMPQrMUi7X3xQvYDVzwgVut3YjfHG2vYg=;
        fh=3c5EWJVtN5bumnaoE2LM+dgfLiZvO1yXbhqceJzO62o=;
        b=KS+I8woFfF/4lSu9FtRgKIHajvHN0F35ZtIs6TztIsbScxw/TXzacFGAhH9cuIbjjH
         jzRUjfq75yHFa/NHJLLZMkpROQKsySBu3kGtitnhL4J/a4Dx2VXe33YOr9tGRrkjhMjg
         hL9HUjX8yPRqPIPv9makZki+vjqHtLhKn2C8wN4NbsVxDLdfuOlDN/HWdqsicCseKlgq
         H3Ym5QH7ovTYstnV8ZJNIAWIoS1+RZ5Z9K/Z0kLVfDoM1EEZjAuJszhTqPuzymLl3rVr
         98eqKSQmiqvoRug+LSsMCeM//NzhhK7/CLSJ/rS4R0L7pAbJc4k9BbYlC5PllLEwcmLE
         OJlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782958587; x=1783563387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+E6fxZHhZpMPQrMUi7X3xQvYDVzwgVut3YjfHG2vYg=;
        b=lO12hsoPbx3kTIMtM4klmRiQfKefDzqEbs51u2hpY1FMOXa/bYtdt+fqR56WpUufED
         VQbrhKxaBccS8kADeFEB5gtD5lqh6cygFhFFTZrgI4gPRVYjRIoUsZtFnE4sTYyw4aNa
         01L4a7cxwQ7KOaaximIvPcyeq0DBUXW1EO8RU4dHs2r/LrCKGB6pTkMEYng27JrkmM/I
         DxDMoWxbDPeIiI+R0NfF7sf+i3hOMFpNJ2Mz6yUVLWc61TZmS6nJKNzrWf1vg6zEDBEN
         7L+rRd/GLZ4Xd8kNTudSBd3jqXOqRxB/upoiwYxqoc3qbTEaf6LdpVJyjYdy8GEANvkr
         dQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782958587; x=1783563387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+E6fxZHhZpMPQrMUi7X3xQvYDVzwgVut3YjfHG2vYg=;
        b=Mmq0J0TPOrO+FYv7lhqyqkvFEwTkETuFHnSW7mBIjpScT9GOyv2QZ6nGXkrSWyZguK
         qXnf1xuDFODuw9wTUWZowLmGWi+M/L/iz590BPe+SHquyFUasy+aZXxIOKitAMfsC7H+
         wgaHrZEK0RMochANhRn+Pk5WX/q0rDYhlPJSJVwu95gERQnD5iA1EWyeEUnPkYpRVM//
         y+bPLAZYl+KRKQ6mzcsrxoHaVkORiLiAKsC/5do4v8YHfeMi608wJgxvqFsyZpSo7p8o
         /2vTs6XJJM2hOSTmW70HtDMyAF6pNwis2gukyIDGbamqljt2T1DS9MdSTI5FGoOy/416
         SWZg==
X-Forwarded-Encrypted: i=1; AFNElJ/AxL/qedkFVRl6Inwe+1mST/O6SWZHLebcUj7/mK8STfGBpPft0T7RqsT/sOXwCcfE631X+OxDg4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/zsorAUcmK4F9X7ckuGWq4F+D7yievW/KLf/LBUmUl9h6sVw8
	34rFd41KDXsSV4J+WAeaM/+g5Ny/bnPeEUiFgudixbfOUvfBqPrQ1xuitd6ZfrEKLHs8MtejfDg
	Lh/YT4h+Wqd6Tobr40vBt/8I8c/uHmVo=
X-Gm-Gg: AfdE7clNTlUJnFZqOYJ44Mkaq2db2oRLHAYu5j7CrrcmFwjk5tGqpGOjmAW0oWkOupt
	oEKs63Z5pP28GKKVUMNjhYNfOnmELU8rPS6Jm4WAU0XLs02QxQn6pWREJGirHI04zDd/ugEE6pb
	h29uuz4fkp/1c2MEGIB9p1Kg1Kv5NPolkUIqg5ni5zNd0yqsmcziNuG7gULDye6kxVDDgnSa5vk
	wVM5DQRpqLTsRdv0LZvhuFGUu6vqF0Y3suoOLpD8cCF6MV1RThGG5OhXRwM3OHO93sTNfgo
X-Received: by 2002:a05:6a20:c784:b0:3bf:6936:4f5f with SMTP id
 adf61e73a8af0-3bfed23ad12mr4987214637.17.1782958587062; Wed, 01 Jul 2026
 19:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260701023619.2730136-1-linchengming884@gmail.com> <stable-reply-mtd-macronix-66-20260701193800@kernel.org>
In-Reply-To: <stable-reply-mtd-macronix-66-20260701193800@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 2 Jul 2026 10:13:23 +0800
X-Gm-Features: AVVi8CfGZpX1FhXQPqVi_FnLTDouMKKJJyWOxj2Gb50T8p0rk49KOiDYNFDb8jM
Message-ID: <CAAyq3SY48RRSO1nN-uRH7HVnXbnvQ1_K823Lc_hRsCyVuf9L3g@mail.gmail.com>
Subject: Re: [PATCH 6.6.y] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org, 
	mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	linux-mtd@lists.infradead.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_191628_233124_A988FD4F 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgU2FzaGEsCgpTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+IOaWvCAyMDI25bm0N+ac
iDLml6XpgLHlm5sg5LiK5Y2IODozOOWvq+mBk++8mgo+Cj4gSSBjYW4ndCB0YWtlIHRoaXMgc2Vy
aWVzIGZvciA2LjYueTogcGF0Y2ggMiBhZGRzIGZsYXNoX2luZm8gZW50cmllcwo+IHdpdGggYSBO
VUxMIC5uYW1lLCBhbmQgNi42J3Mgc3BpX25vcl9tYXRjaF9uYW1lKCkgaGFzIG5vIE5VTEwgZ3Vh
cmQKPiAob25seSBhZGRlZCB1cHN0cmVhbSBpbiBhYzViZmE5NjhiNjApLCBzbyB0aGUgbGVnYWN5
IHByb2JlLWJ5LW5hbWUKPiBwYXRoIGNhbiBvb3BzIGF0IGJvb3QuCgpUaGFuayB5b3UgZm9yIHBv
aW50aW5nIHRoaXMgb3V0IGFuZCBjYXRjaGluZyB0aGUgcG90ZW50aWFsIGlzc3VlLgoKSSBoYXZl
IHZlcmlmaWVkIHRoaXMsIGFuZCB5b3UgYXJlIGFic29sdXRlbHkgcmlnaHQuIFRoZSBpc3N1ZSBz
dGVtcyBmcm9tCnRoZSBzdHJjbXAobmFtZSwgbWFudWZhY3R1cmVyc1tpXS0+cGFydHNbal0ubmFt
ZSkgZXZhbHVhdGlvbiB3aXRoaW4gdGhlCmxlZ2FjeSBwcm9iZSBwYXRoLiBTaW5jZSA2LjYueSBs
YWNrcyB0aGUgbnVsbCBndWFyZCwgcGFzc2luZyBhIE5VTEwgLm5hbWUKd2lsbCByZXN1bHQgaW4g
YSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UgaW4gc3RyY21wKCkgYW5kIGNhdXNlIGEga2VybmVs
Cm9vcHMgZHVyaW5nIGJvb3QuCgpJIHdpbGwgYWRkIHRoZSAubmFtZSB0byB0aGUgbmV3IGZsYXNo
IGVudHJpZXMgYW5kIHN1Ym1pdCBhIHYyIHNlcmllcy4KCj4KPiBQbGVhc2Ugc2VuZCBhIHYyIHRo
YXQgZWl0aGVyIG5hbWVzIHRoZSBuZXcgZW50cmllcyBvciBiYWNrcG9ydHMKPiBhYzViZmE5Njhi
NjAgZmlyc3QuCj4KPiBUaGUgNi4xMi55IHNlcmllcyBpcyBxdWV1ZWQsIHRoYW5rcy4KPgo+IC0t
Cj4gVGhhbmtzLAo+IFNhc2hhCgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
