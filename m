Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9ACED260
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7bUYjdKRYCDpc/GR17e0dNHuqsnJTZSi3W/a9ed3Bk=; b=4/XMxdxObn9F2J
	wnRpA+F+NxhI7nhUn5bPUBe9eTt+mbPu6kBV/OoUuusxHJZaFzvAPSsNXlkbRDJVtHCMQHL8IEx0e
	t5Cbi/zmVYbDJjcT01jP3u0rojO9s4IMKB+vVcvRMPxMCyAVbk1R1Z8Gg792P2yu2iVca3O/5zHiN
	WlkF22tJ7pR3wyne51NVdnoWCD7Pz5cTbLH4nSfgXBaBunzrctACRLBq4n9FxLmGvZpCNX6E5zNAe
	YWD44TP/SYKAMSs3lP5GT70Vo4zy+LCY7zJuvy6aYbhLkBX4BCDBEvPR7qqDEDS9OaQuhxnvpZ00X
	USDYGm6XQ+AhzJ7rLxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIW0-00000000CTt-0g9A;
	Tue, 18 Nov 2025 10:00:48 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLIVx-00000000CTG-29b2
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 10:00:46 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8824a756771so51954546d6.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Nov 2025 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20230601.gappssmtp.com; s=20230601; t=1763460044; x=1764064844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0f8FamQLkCeAb8PRC+2rZX09ntf8SpiNRtDC48j9YAI=;
        b=OsP4va8zZjNxPyI4R3bwFCvpn8Sja4jVXjcm98etGno9pNJQHYsM+QnEIqIBTjSuYH
         +8alD3FndWjiv5dgNbFiuTh8dj4lp78tH+LcMh2NW5ORix2emT2vxdY9c+J4TwvfQnI7
         pFcvbAVkhU4dMNIh8aLhjZ8tbf4q8/OVxcgvIT3ebDmvEOhI4aJvLlJ/BC7Xydqps7Z+
         fmj4lQtgjLm+J27+aFHlJe1okHoY25IjUClBkAhYNgAFmATbtHCsdAkfHc2w7Og4VfM1
         Ejh8c+CjnK1PWQu/7QMNpd2wLRf9bHIVY8H1O0x0fALe+G6s/31ZPs2E4eDlajXVnTkl
         K7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460044; x=1764064844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0f8FamQLkCeAb8PRC+2rZX09ntf8SpiNRtDC48j9YAI=;
        b=qEnoumHA1z+NKovkTHlOQHKcBCiCxZWUfIvp+zeRwtU4ptC56TYTT3l1c5fgMZAeFW
         7nsF3R/U3UBoFInj2H3SgFDTpL+sj2oesWgL9oeDY3EQO6mPLeSWLh3q9ZrlrCMhF0JE
         zpN2x37EDRWGL1/rTKhYTpynlfGp4alwdbP7ZQ9EW829a5J7poYjuioAfdLN/juGifgf
         dm563Ni0tT3vgElEcQSSTMrR+7Ax2bqzABqyXflxdpwzJeFbPgyy1oOmY2YRg/c2pfwh
         EyP6r6//Ishk4ySPgjvmAzH4nIxRcYIiN/U368Z3Yl8FguDi1A2LOdd+KFdBC7vb5Y6S
         cmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1N2gzEAbECukyGaelCAn3L15fXYDv/kWZX+ILF2PElCQOLhmqGeb4Q3aRGLfyVCwWc+Ek4aajIOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGGOzYD9LUDPB/OWCz69Ci3A7xpt3uUmZufeTd0uJ8530s/CL/
	j9hs5HrGcC4FT1UFHCr9A7JY73GFzzBdS4TtuRSxplEwO034mZbdcuLabyb5AO4ZwBK/v+yVUSa
	dJvW5VDsnGYciIOzxuR8wZMcSoMftLFQYQiMBHzgBjQ==
X-Gm-Gg: ASbGnct3bEb3ofJQNG162kWMQtfqWETawuFiOQ2Ln6NRNV2BZ4LPAgKNYbwnVkq6wWv
	0p8iisI5ZH5tWJVBGu2LwJg+ElDIkhlL8NjLnfD1kaHqQvAYD2XpbX3U7fX60s0OpkzjdIYnD+T
	zKnkLN6lI1HhXXclsPx42dDHOuWwjmNp3JsKlgUTOWsx+DMY4fcWuGGlGXKQBtTfDJ7IU7Kdl35
	9StmUjvKhOxeRaIb3yKIcsXAEBrGKQ1cLM5zDnWc2Ylyd/OEb/sJ4D6LMQKONpSx20Eo8Ok
X-Google-Smtp-Source: AGHT+IHS0/q/tZg5OSsyCamM0DDUbk6GhawXcxJnOdQs0+oyhRdHB4du1PCpbm6xH6NwLhhr8Vz2inNYwWb7hZfBaU8=
X-Received: by 2002:a05:6214:f21:b0:882:4580:a86f with SMTP id
 6a1803df08f44-884521cf4dfmr34101696d6.6.1763460043894; Tue, 18 Nov 2025
 02:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
 <20251116135235.1479860-1-yashi@spacecubics.com> <3b4445aa-9672-40cb-900a-2853766cff6c@linaro.org>
In-Reply-To: <3b4445aa-9672-40cb-900a-2853766cff6c@linaro.org>
From: Yasushi SHOJI <yashi@spacecubics.com>
Date: Tue, 18 Nov 2025 19:00:32 +0900
X-Gm-Features: AWmQ_bmVhBjOfLO9Z0vpS_n0qevwq_172A9q_7QCz0GO4kdqfHoLR_Ph7FXXWsA
Message-ID: <CAGLTpnLeEUorkKf8CV2r_zevUCNz_3wi17z7yrv-0JaSiK3Sww@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Yasushi SHOJI <yasushi.shoji@gmail.com>, tkuw584924@gmail.com, 
	Takahiro.Kuwano@infineon.com, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, marek.vasut+renesas@mailbox.org, 
	miquel.raynal@bootlin.com, mwalle@kernel.org, pratyush@kernel.org, 
	richard@nod.at, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_020045_789261_4446EA54 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBOb3YgMTcsIDIwMjUgYXQgNTo0OOKAr1BNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4gSWYgeW91IGFscmVhZHkgdGVzdGVkIGl0IG9uIDYu
MTIsIHdoYXQgc3RvcHBlZCB5b3Ugb24gc2VuZGluZyB0aGUgcGF0Y2hlcwo+IGZvciByZXZpZXc/
CgpJZiB0aGF0IGRvZXNuJ3QgYm90aGVyIHlvdSBndXlzLCBJIGNhbiBkbyB0aGF0LgoKVGhhbmtz
LAotLSAKICAgICAgICAgICB5YXNoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
