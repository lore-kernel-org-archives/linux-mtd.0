Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B9C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAw+2ZpLoQmf3M4tulXTzct6BLtMpYeWwIpRbOo4x74=; b=WPbVqJ11Gs2OBE
	6ENrzrZ1bFVTTDt7IY45ubwSvWyIVlvoW3VRNEmbOYHrO6S3WymSgIkAqmrYKqVsy0eLlYpP4KLqa
	KjljvX62bP70y8liG5NBMXSNd03FKytATpqVS780duK88UjGPUHN9bvQkDj+P51MaVrmUBzbSXVF7
	9YAnaEQVgWpgQgpukQSRvhE4eKDfdO7c8G0HFiHC06vG8XoEmW/BxDQYV2ba4eVIki8MeV6hiRkc8
	3MsYH63zafKjo3ALLNesrCz8irDyvOUv8joZB/4g4k5+6uh6pk3rTsOPIgplUicXvYI9QfxqrVAjO
	VCKOif3KVew8x2W//GUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sl5-00AJA4-IB; Wed, 29 Jun 2022 08:09:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sl2-00AJ7i-GT
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 08:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656490147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
	b=fgsDzeyRjFEk2KeWSqmbecKyn25Vy9Yr9ksDNykkz9dbfibRQ1L2qZtCKWDjwTLV/Uk6rf
	5eskSYYjJuqE8dTfdzbVu/c8lHf9ZfI/MxhZTUQ/0PRnz/2WCOCjXmOWpkNEs2HTUBOUZc
	hcCoase9/NGzpmY7V6jwkU2icPl1iRM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-T0QRgAM7MdmESVsdSE93Yg-1; Wed, 29 Jun 2022 04:09:05 -0400
X-MC-Unique: T0QRgAM7MdmESVsdSE93Yg-1
Received: by mail-wm1-f70.google.com with SMTP id az40-20020a05600c602800b003a048edf007so3892201wmb.5
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 01:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7hQQnP6ElkRz6EikrOqVkat5RAwQAYxqOhDbZ9zjeug=;
        b=SHhiVsU+YQLttXY8kQ8LRunEpY4aO26JNaKDUVgRlFUVb5cx/nG1GPKWAWu+bNzULe
         qGZAU2eAo+LN3GFqYw0bbrvFal7DQap6mJDLQUunD0NEb1nn/KwxfnvHyJsax3o6AIVR
         9EC25uNBX3pH9RRB6mqyENB1XZ/tA8j0XG99CZphFuytMeEj2OKFchFRcfKjxJLn9/J/
         J72lQmLAPn7gZ5rlpXm/A0nAw5PWQStgmSMGjCYNH9/E/GbPjQ8sQ6/Cm9Oi40QyWUq+
         x5xdvLWw8H5b7ZVDM5/SBX0HWywnKsGAB65ebbdoWvIwGEsIavSLVM1VNhK0/LfEK5Zu
         FXUg==
X-Gm-Message-State: AJIora+9SJ8ndSYg+Ncc6geM6iD/4CpXi0lNj03KoxHVVq34Gtg+qa96
	rkmYKWJApmxKyPXXJc+Es1UKcDxh4gQxv2huRCwwF69c6z43TTVT31lvke2aW+P+A8cyp7J6F/y
	LrLytI5mHZdEIuHsqESaYGnCIZA==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201644wmm.70.1656490144653;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1usFW/96xeCeX9gWa5EcwEsowhB540yEb4Gaanj9433iMcJH3n1uDXhdEWzSLPQicn1TmuJ9w==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9d5 with SMTP id a6-20020a05600c224600b003a04d14e9d5mr2201616wmm.70.1656490144372;
        Wed, 29 Jun 2022 01:09:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c358200b003942a244f47sm2507134wmq.32.2022.06.29.01.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 01:09:03 -0700 (PDT)
Message-ID: <a5a3e2ca-030a-4838-296e-50dbb6d87330@redhat.com>
Date: Wed, 29 Jun 2022 10:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "acpi4asus-user@lists.sourceforge.net"
 <acpi4asus-user@lists.sourceforge.net>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
 <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <5517f329-b6ba-efbd-ccab-3d5caa658b80@csgroup.eu>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_010908_655402_76AE1DB7 
X-CRM114-Status: UNSURE (   9.23  )
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

T24gNi8yOS8yMiAwOTo1NSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAyOS8w
Ni8yMDIyIMOgIDA5OjIzLCBVd2UgS2xlaW5lLUvDtm5pZyBhIMOpY3JpdMKgOgo+PiBIZWxsbywK
Pj4KPj4gW0kgZHJvcHBlZCBuZWFybHkgYWxsIGluZGl2aWR1YWxzIGZyb20gdGhlIENjOiBsaXN0
IGJlY2F1c2UgdmFyaW91cwo+PiBib3VuY2VzIHJlcG9ydGVkIHRvIGJlIHVuaGFwcHkgYWJvdXQg
dGhlIGxvbmcgKGxvZ2ljYWwpIGxpbmUuXQo+IAo+IEdvb2QgaWRlYSwgZXZlbiBwYXRjaHdvcmsg
bWFkZSBhIG1lc3Mgb2YgaXQsIHNlZSAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjIwNjI4MTQwMzEzLjc0OTg0LTctdS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlLwo+IAoKRllJLCBmb3IgcGF0Y2hlcyBsaWtlIHRoZXNlIHdo
YXQgSSB1c3VhbGx5IHVzZSBpczoKCi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtLW5vZ2l0
LWZhbGxiYWNrIC0tbm8tbSAtLW5vLXIKCi0tIApCZXN0IHJlZ2FyZHMsCgpKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMKTGludXggRW5naW5lZXJpbmcKUmVkIEhhdAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
