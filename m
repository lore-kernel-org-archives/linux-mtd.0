Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF07EDE983
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eaerfn5PZQ+3E+LA8J1vVAlQgO8LRb76lXHm08HQSw=; b=vYCtQ13747xbvJ
	0RUELttuPl62HVEY9tQeT+pNc7+OPg+JvVBL9e5bSBnhhuFYweJpR+xjXG2360lKhINjW4RTM9adA
	38B2k61Ug4Gm7XxOq/bvujlbdY4215TjNZOL6KK+8JjAGQBLWyoPM0wSY3uMZnfNWIhEI31OzfD7N
	I0vcsNSj7RnbtA/WdyLOPaJN614K/W+HFmkac3YU87516rcrRIsMbdtIFtQXOy0/uVUeQBOCRZeCr
	0mewGevfGSXH0+0U7XVJRllFla+jLdFPEyRhCYZFUWzGNIBE7d33fIyPBVAPFSg/eg6lTlX3hE6gH
	Uq2NzH/jMJkrZYdzf3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggPO-007ZfF-1M;
	Thu, 14 Sep 2023 07:05:02 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggPM-007ZeQ-1j
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 07:05:01 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1ba5cda3530so313806fac.3
        for <linux-mtd@lists.infradead.org>; Thu, 14 Sep 2023 00:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694675098; x=1695279898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzTdfD0LggvX1uBlCTC2vRtoepMYQzC2yBdB+oN7NDw=;
        b=bGamrY+MGve61D2CgFkBWhYLSCshrfC0LdgkbHEnvr+UdDvAPOBdc2MxsE2ffINPhN
         bAGmZ/A8QQCBiN7BMvoVKAhk2y7m09gUgfx4JTuW9m06h+3cTR7N+G9Fu4WXVIpk+lYu
         VkifgAUbCqIWzeuRUv42YbFU39DwO1rQBqZles6Y5eccTWCy7ZZD9mgRZckpavFVRo3m
         NabXeJeqdRuLUhQuDKuGRVA1FHoRewNUV7+UqRlW6r8/3XI9NdTUX2C1Vze0M4KsVDcJ
         pnN4dxn/AKkAqtKM2uXItE1WiEeVGRWqgzZD6nX33c+o4TRdOhJVzEV/CcpK7UmXZLtY
         XsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694675098; x=1695279898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzTdfD0LggvX1uBlCTC2vRtoepMYQzC2yBdB+oN7NDw=;
        b=HZLgdM/mVASRsVhR7dNCD9/HkzcDKTgboN3feO+8QB7YtGkwErq6iKkLrFM598GbGV
         b4GlBs1SOSbJ3LlVao/samu8Ym9Ri+O6uQGvqDV9N5z+z0X/aYuAY0oy91wHxIBHZx/J
         GyHrrJVEdzmnNUg7dfDx9Ty0vUnCM8PCQ8qRdgyxRBVK8eLJjRNZN/Pm5rP4yGXG7gRt
         0ZfPoIkC0e+KWiR7ZUOIum8MioHsESgzwzSrw16GfhGXOj41ePSgQwPZvnLmo8U2RsHo
         dt/rFvGSiGk+yALItOM1W1V9qhOYDqjp5/T+hZYOTltceW7i84/kp20SBXNEILvqHxjv
         rcAw==
X-Gm-Message-State: AOJu0YzJlQJUWIDpzo5dDy/nzxxyP8OQVG1sHATTJnNyRIzU0EeQNXYa
	azCDg2j7VXV/NOCRFcRwWemWruxDz/JiZ1slYoTpdP32vok=
X-Google-Smtp-Source: AGHT+IEzUZhYY4nwIJ6Dlm9qukCO/53xQ9HZuRBayIOhSRBl2gZChNyMJPFJoM0Y2E3e3o3puld+m0KaJ40spNNiqwQ=
X-Received: by 2002:a05:6870:2397:b0:1c5:56f:ac08 with SMTP id
 e23-20020a056870239700b001c5056fac08mr5612105oap.12.1694675098534; Thu, 14
 Sep 2023 00:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230913115001.23183-1-brgl@bgdev.pl> <20230913115001.23183-3-brgl@bgdev.pl>
 <CAHp75Ve8aK4Pfid1JYWH86mKy-Zb-G2QDPrJYmRzPCYOsn1TqQ@mail.gmail.com>
 <CACRpkdYtYDJa6fo6RnizHNzUsyazBQxEaNMznaij8rBF4ie+ew@mail.gmail.com>
 <20230913222338.07d1625b@xps-13> <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd2a06rnGCEiJW0reN00amso0RyvgLT516nZiYLYZ-xcQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Sep 2023 10:04:22 +0300
Message-ID: <CAHp75Vdn9a8a-E=RuByNL8B93cNHuusVrqE-RnH4f3+WgxJ22Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: ingenic: use gpiod_set_active_high()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Scally <djrscally@gmail.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_000500_576504_6214EB35 
X-CRM114-Status: GOOD (  16.93  )
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

T24gVGh1LCBTZXAgMTQsIDIwMjMgYXQgMTA6MDLigK9BTSBBbmR5IFNoZXZjaGVua28KPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQg
MTE6MjPigK9QTSBNaXF1ZWwgUmF5bmFsCj4gPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdy
b3RlOgo+ID4gbGludXMud2FsbGVpakBsaW5hcm8ub3JnIHdyb3RlIG9uIFdlZCwgMTMgU2VwIDIw
MjMgMjI6MTI6NDAgKzAyMDA6Cj4gPiA+IE9uIFdlZCwgU2VwIDEzLCAyMDIzIGF0IDEwOjA14oCv
UE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiB3cm90
ZToKPiA+ID4gPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAyOjUw4oCvUE0gQmFydG9zeiBHb2xh
c3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiAuLi4KPgo+ID4gPiA+IFdoeSBub3Qg
bW92aW5nIHRoaXMgcXVpcmsgdG8gZ3Bpb2xpYi1vZi5jPwo+ID4gPgo+ID4gPiBUaGF0J3MgYSBi
ZXR0ZXIgaWRlYSBoZXJlIEkgdGhpbmssIGl0J3MgY2xlYXJseSBhIHF1aXJrIGZvciBhCj4gPiA+
IGJ1Z2d5IGRldmljZSB0cmVlLgo+ID4KPiA+IEFncmVlZCwgaXQncyBqdXN0IGZvciBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5IHB1cnBvc2VzIGluIGEgc2luZ2xlCj4gPiBkcml2ZXIuIEkgYmVsaWV2
ZSBpdCBzaG91bGQgc3RheSBoZXJlLgo+Cj4gSSBiZWxpZXZlIExpbnVzIHdhcyBmb3IgbW92aW5n
Lgo+Cj4gZ3Bpb2xpYi1vZi5jIGNvbnRhaW5zIGEgbG90IG9mIHF1aXJrcywgaW5jbHVkaW5nIHRo
aXMgb25lLiBDYWxsaW5nCgpUbyBiZSBjbGVhcjoKImluY2x1ZGluZyBvbmUgZm9yIHRoZSBzYW1l
IGlzc3VlIgoKPiB0aGVzZSBuZXcgKG9yIG9sZCkgQVBJcyBmb3Igb3ZlcnJpZGluZyBwb2xhcml0
eSBpbiBtYW55IGNhc2VzCj4gc2hvdWxkbid0IGJlIG5lZWRlZCBpZiB0aGVyZSB3ZXJlIG5vIGlz
c3VlcyB3aXRoIERUIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCgpUbyBiZSBjbGVhcjoKVGhlIGxl
c3Mgd2UgY2FsbCB0aGVzZSBBUElzIGZyb20gZHJpdmVycyB0aGUgYmV0dGVyLiBJZGVhbGx5IHRo
ZXNlCkFQSXMgc2hvdWxkbid0IGhhdmUgZXhpc3RlZC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywK
QW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
