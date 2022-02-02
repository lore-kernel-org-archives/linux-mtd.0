Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80273C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pkaa761VNERB3ZO4kcaBM2ZBF9qIWkuQI0GIonf/u60=; b=fSFpfGYgmXijXF
	ZQH/oycyVkf8MWw6wXt3Q3w7s6Zt7CHrrCDfmN3J/5fVYMkleFi+lCVf1wzy3eitWfe7aYpoXlALM
	pw5CKY5cH8wo0xGzIpXOPxmxeDrGMYZJVaI+Jp5xx6RZBSNooM3fL0CS6eWwF+rofqQ8Qyxw2wJfa
	pR9/zFAp3SzWwFsbIfSpqj+qTbCPu9shw7psNCwRnOGDA44617IMpSfG7R2bMohxiS97oNY2wKTOy
	K6yio7y8OsC3TFyqORJUYMa74ng7qDJ+dglKxN8w5rVSEsqYm9YFd84rt1xtPzlelwAVWHv1CBVj4
	RCk1c5A8EDiORwhfji2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFNpP-00Gyxz-0s; Wed, 02 Feb 2022 22:10:15 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFNpK-00GywF-I9; Wed, 02 Feb 2022 22:10:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id g145so977976qke.3;
 Wed, 02 Feb 2022 14:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=Rr5xR3phcMmOtciTLGMao2x+J3LzUpf33KP5PgsG6mw=;
 b=fcP42zsjJKBRLsCCLNxeBAvGoAUH+RgY1jYrpOhhT8bMHr7+15EWYSucDQfP1oORdR
 v8va2D+TIvGEUfFpYyk+KAAnpvrPj2Do2UURxQqDM2NZ0yrVKHV/Tmvmi8VnHPqEl5Sj
 FzsjYO1CSUmsISBtPa5x3zIEsUBOu9RZDDuPyg2QqPpe+3i2ouYdl1b7XJc+7Yz287oe
 n4Ll3sdxxGbRuNPqe8Va40e5cgmVlDZI5fIN6fBWjGY94knmRKOKljCldyrgDLu4eqFI
 61yZGnSZcmCnvpc5Ppek75k/hWgHufZ8NwnxWp4bgKiaLrzdRDurexHwqhp4Nqyni8AG
 h/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=Rr5xR3phcMmOtciTLGMao2x+J3LzUpf33KP5PgsG6mw=;
 b=DHyrYY6R0MRmbv6zxl5LafCo+YORF8sGqDF8xqLZmlQsJDh4YGSMHfua2ID6qgsGS1
 ASxEoDJ4INIxapqruIjD0v9PkH5azOfFDoBdzwKwgBHU/bLNkVuwb4ek8HYFGLe+doxP
 rFGl9CC6SCW71bZxlsC5uTs1/XuQGS8hI7ve1GTYMV+bALicnDWu3ZdwqhXt4WmX4QIO
 mZ4HGbyqS/SNUsfywT0yrfJitf8LiLLfWT5Ox/5f8lVdfHEf0pAzrd5Jb+WgXocgEwmz
 sCcHEwcYZZPBuxz9cuSY1fe5OqeLGr3hluMy0CuQL0gEnJqxU6jtzZ4MeHL26pTHjr7y
 Z7XA==
X-Gm-Message-State: AOAM532HvEbStsy84wgZxiQVBbKnS3M6FZozi07GyXrxEWClfGjHpcz/
 75F3Y4XzEf5WVDJtpfJWhg==
X-Google-Smtp-Source: ABdhPJwRpKyRhMilcGtomGensbv6thBpUXpxVK7cAkdNeBk0lqsREJF6QVbIyABhwvxgVYCy4DCMsQ==
X-Received: by 2002:a37:4648:: with SMTP id t69mr21000172qka.702.1643839808031; 
 Wed, 02 Feb 2022 14:10:08 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id o13sm7298868qtv.36.2022.02.02.14.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 14:10:07 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:c4e6:e49c:6958:ac58])
 by serve.minyard.net (Postfix) with ESMTPSA id 68539181297;
 Wed,  2 Feb 2022 22:10:06 +0000 (UTC)
Date: Wed, 2 Feb 2022 16:10:05 -0600
From: Corey Minyard <minyard@acm.org>
To: "Verdun, Jean-Marie" <verdun@hpe.com>
Cc: "Hawkins, Nick" <nick.hawkins@hpe.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Wang Kefeng <wangkefeng.wang@huawei.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Hao Fang <fanghao11@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, 
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Openipmi-developer] [PATCH] HPE BMC GXP SUPPORT
Message-ID: <20220202221005.GD2091156@minyard.net>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <20220202175635.GC2091156@minyard.net>
 <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E9905F2-1576-4826-ADC2-85796DE0F4DB@hpe.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_141010_634500_4104F651 
X-CRM114-Status: GOOD (  28.22  )
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
Reply-To: minyard@acm.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBGZWIgMDIsIDIwMjIgYXQgMDY6MTQ6NTdQTSArMDAwMCwgVmVyZHVuLCBKZWFuLU1h
cmllIHdyb3RlOgo+ID4gVGhpcyBpcyBmYXIgdG9vIGJpZyBmb3IgYSBzaW5nbGUgcGF0Y2guICBJ
dCBuZWVkcyB0byBiZSBicm9rZW4gaW50bwo+ID4gZnVuY3Rpb25hbCBjaHVua3MgdGhhdCBjYW4g
YmUgcmV2aWV3ZWQgaW5kaXZpZHVhbGx5LiAgRWFjaCBkcml2ZXIgYW5kCj4gPiBlYWNoIGRldmlj
ZSB0cmVlIGNoYW5nZSBhbG9uZyB3aXRoIGl0J3MgYWNjb21wYW55aW5nIGNvZGUgbmVlZCB0byBi
ZQo+ID4gZG9uZSBpbiBpbmRpdmlkdWFsIHBhdGNoZXMuICBUaGUgd2F5IGl0IGlzIGl0IGNhbid0
IGJlIHJldmlld2VkIGluIGFueQo+ID4gc2FuZSBtYW5uZXIuCj4gCj4gPiAtY29yZXkKPiAKPiBU
aGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIFdlIGFyZSBnZXR0aW5nIGEgbGl0dGxlIGJpdCBsb3N0
IGhlcmUsIGFzIG91ciBwbGFuIHdhcyB0byBzdWJtaXQgaW5pdGlhbAo+IAo+IC0gYmluZGluZ3MK
PiAtIGR0cyBmb3IgU29DIGFuZCAxIGJvYXJkCj4gLSBpbml0aWFsIHBsYXRmb3JtIGluaXQgY29k
ZQo+IAo+IFRoZW4gZHJpdmVycyBjb2RlIGF2b2lkaW5nIHRvIHNlbmQgbWFueSBkdHMgdXBkYXRl
cyB3aGljaCBtaWdodCBjb21wbGV4aWZ5IHRoZSByZXZpZXcuIFdlIHdhbnRlZCB0byBzZW5kIGFs
bCBkcml2ZXJzIGNvZGUgdG8gcmVsZXZhbnQgcmV2aWV3ZXJzIGJ5IHRvbW9ycm93Lgo+IAo+IFNv
LCB3aGF0IHlvdSBhcmUgYXNraW5nICggZG8gbm90IHdvcnJ5IEkgYW0gbm90IHRyeWluZyB0byBu
ZWdvdGlhdGUsIEkganVzdCB3YW50IHRvIGF2b2lkIEVuZ2xpc2ggbWlzdW5kZXJzdGFuZGluZ3Mg
YXMgSSBhbSBGcmVuY2gpIGlzIHRvIHNlbmQgcGVyIGRyaXZlcgo+IAo+IC0gYmluZGluZwo+IC0g
ZHRzIHVwZGF0ZQo+IC0gZHJpdmVyIGNvZGUKPiAKPiBGb3IgZWFjaCBkcml2ZXIgdGhyb3VnaCBk
aWZmZXJlbnQgc3VibWlzc2lvbiAod2l0aCBlYWNoIG9mIHRoZW0gY29udGFpbmluZyB0aGUgMyBh
c3NvY2lhdGVkIHBhcnRzKSA/CgpBcm5kIGdhdmUgYW4gZXhjZWxsZW50IGV4cGxhaW5hdGlvbiBm
b3IgdGhpcy4KClRvIGJlIGNsZWFyLCB5b3UgbmVlZCB0byBzcGxpdCBvdXQgY2hhbmdlcyB0byBp
bmRpdmlkdWFsIHN1YnN5c3RlbXMgYW5kCnN1Ym1pdCB0aG9zZSB0byB0aGUgbWFpbnRhaW5lcnMg
Zm9yIHRoYXQgc3Vic3lzdGVtIGFuZCBub3Qgc2VuZCB0aGVtIHRvCmV2ZXJ5b25lLiAgVGhhdCB3
YXkgeW91IHJlZHVjZSBzZW5kaW5nIGVtYWlscyB0byBwZW9wbGUgd2hvIGRvbid0IG5lZWQKdG8g
c2VlIHRoZW0uCgpPbmNlIHlvdSBoYXZlIGEgc2V0IG9mIHBhdGNoZXMgZm9yIGEgc3Vic3lzdGVt
LCB5b3UgY2FuIHN1Ym1pdCB0aGVtIGFzIG9uZQpzZXQuICBUaGF0IGlzIGdlbmVyYWxseSBwcmVm
ZXJyZWQuICBUaGUgImdpdCBzZW5kLWVtYWlsIiBvciAiZ2l0CmZvcm1hdC1wYXRjaCIgdG9vbHMg
YXJlIGdlbmVyYWxseSB3aGF0IHdlIHVzZSwgdGhleSBsZXQgeW91IGNvbXBvc2UgYQpoZWFkZXIg
bWVzc2FnZSB3aGVyZSB5b3UgY2FuIGdpdmUgYW4gb3ZlcmFsbCBleHBsYWluYXRpb24sIHRoZW4g
aXQgc2VuZHMKdGhlIGluZGl2aWR1YWwgY2hhbmdlcyBhcyBmb2xsb3d1cCBtZXNzYWdlcyB0byB0
aGUgaGVhZGVyIG1lc3NhZ2UuCgotY29yZXkKCj4gCj4gV2hhdCBzaGFsbCBiZSB0aGUgaW5pdGlh
bCBvbmUgaW4gb3VyIGNhc2UgYXMgd2UgYXJlIGludHJvZHVjaW5nIGEgcGxhdGZvcm0gPyBBbiBl
bXB0eSBkdHMgaW5mcmFzdHJ1Y3R1cmUgYW5kIHRoZW4gd2UgbWFrZSBpdCBncm93IG9uZSBzdGVw
IGF0IGEgdGltZSA/Cj4gCj4gdmVqbWFyaWUKPiAKPiDvu78KPiAgCj4gCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBPcGVuaXBtaS1kZXZlbG9w
ZXIgbWFpbGluZyBsaXN0Cj4gT3BlbmlwbWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL29wZW5pcG1p
LWRldmVsb3BlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
