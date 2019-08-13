Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38978C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A54C20679
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 10:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iqm20VnG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECIOfaMx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A54C20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vz6eJpRt/vCJIQjRhZCsovTOXrghR+RLsa3Z8uLWD7o=; b=Iqm20VnGw883Vq
	Ml6Osks13DcbWjWkJHlHV+96uNDPEdiC/7+xRazt6URil4k/lPbPR7l04N5IwHlWgrehQ4mynS4pU
	OrezvwfcfXdrXrhlFwsEKi+4cnYDb6806XufFO2i0nuzjXRZr7mZeak3r+x4hKt78hnEko9EJr2DS
	rvLpyKm7tBynw3NQWB/AXwIpzU2E1SXpY5MxJbBihD5eqNQe59gz5nTwkcieXrs3hTda3rRx/eUxG
	4gTwOollitVcixiwWx+S4YH/k550GylAjP7KB1A5VwB5XQaU1iTngeScY0VX+mqROfdjk4SxrsZwy
	DPdw80fsQ6FwiDycofRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxU4W-0000RY-1A; Tue, 13 Aug 2019 10:30:32 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxU4T-0000R5-8r
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 10:30:30 +0000
Received: by mail-wm1-x342.google.com with SMTP id o4so876567wmh.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 03:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=ECIOfaMx8Etdcuaur37ndWisVmkutpI1rFJEIHjhiDwicrUiGrpbpAh/VAWiR4/mk6
 Jys94C59P6dLWKu5BQICoe2FRE77l28OSivWG+JTNpgd8WKtGSQfWBBZVZAd/6GBPYIR
 N7QAM4bNCEBuL4EZ341aigqm61rNC6SklbSxux6Dl/RDvx5m6NoOoWU5WkAo1sULWlGP
 rmInauOV0CaASOC/reQNrVHz2DmC5lwG4koVfD/zwf/6tujmdf9hlG0GpGX3wZHW5mgA
 uLPW4z83TGAcn7qk9nhCXCd2q3i2VQmGjIrY9gblReoQWkp3QwSKnXXrrq/4ZMdLTfKj
 FjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FpaQRzjjHieM2ZwGQ/GdoyebOrmSoenQLDvTG9Qi6yI=;
 b=eT8DFwuRbF8jJqJpRytijRyo9qwgaDzn1lITWQDMWas5sJJnBkwwAqt/XQYDSzh1Uv
 OQzIx111zzuGEJ/aXYmhyhgah0/gnx0Eb7+GVDcaOCPVa/o8z3XZKhE5Dy2q5NcQPf6Y
 FMmWiqB1cmNBv2KX0K/9bZPHD0QX+m9ZVAkksf4hqX39Kq60LIpHbq+RZKTu66BPXVoN
 0bHAM6+jKA0dGfo9sPeIWWD+3DRsCKTxGrJJtPgU9m9dtiNmKj5fgmt4ci4Dw4SH3HRJ
 shX9+R/6kHWyXJHDnwweJsGm2STB1rst+H+nIxt6I/Q02LV/znpO3IwwnW6w982DvUxc
 7JOw==
X-Gm-Message-State: APjAAAXOOoasjwDffdvzI3Pds2I8gPrdErZL864wu3wI3Arq188ioNKX
 ZyFG1+caZQx3b+PA+6ZMaW7D4w==
X-Google-Smtp-Source: APXvYqyN4qrmzO2fFtNWQoBH44tqgLmmkrAsTcojaeG2fQxm4ZfxnFrHwjr1JBuy4GY1YNPhUuoqgg==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr2384506wme.3.1565692225238;
 Tue, 13 Aug 2019 03:30:25 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id a11sm10103044wrx.59.2019.08.13.03.30.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 03:30:24 -0700 (PDT)
Date: Tue, 13 Aug 2019 11:30:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 10/11] mfd: Drop obsolete JZ4740 driver
Message-ID: <20190813103022.GB26727@dell>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190725220215.460-11-paul@crapouillou.net>
 <20190812081640.GA26727@dell>
 <4b48e597-951e-45fd-dfb2-4a1292a8b067@amsat.org>
 <1565690508.1856.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1565690508.1856.0@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_033029_321872_4E5F04CB 
X-CRM114-Status: GOOD (  16.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, James Hogan <jhogan@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Artur Rojek <contact@artur-rojek.eu>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 linux-mips@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMyBBdWcgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKCj4gSGkgUGhpbGlwcGUs
Cj4gCj4gCj4gTGUgbWFyLiAxMyBhb8O7dCAyMDE5IMOgIDEwOjQ0LCBQaGlsaXBwZSA9P2lzby04
ODU5LTE/cT9NYXRoaWV1LURhdWQ9RTk/PQo+IDxmNGJ1Z0BhbXNhdC5vcmc+IGEgw6ljcml0IDoK
PiA+IEhpIExlZSwKPiA+IAo+ID4gT24gOC8xMi8xOSAxMDoxNiBBTSwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiAgT24gVGh1LCAyNSBKdWwgMjAxOSwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiA+ID4g
Cj4gPiA+ID4gIEl0IGhhcyBiZWVuIHJlcGxhY2VkIHdpdGggdGhlIGluZ2VuaWMtaWlvIGRyaXZl
ciBmb3IgdGhlIEFEQy4KPiA+ID4gPiAKPiA+ID4gPiAgU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJj
dWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiA+ID4gIFRlc3RlZC1ieTogQXJ0dXIgUm9q
ZWsgPGNvbnRhY3RAYXJ0dXItcm9qZWsuZXU+Cj4gPiA+ID4gIC0tLQo+ID4gPiA+ICAgZHJpdmVy
cy9tZmQvS2NvbmZpZyAgICAgIHwgICA5IC0tCj4gPiA+ID4gICBkcml2ZXJzL21mZC9NYWtlZmls
ZSAgICAgfCAgIDEgLQo+ID4gPiA+ICAgZHJpdmVycy9tZmQvano0NzQwLWFkYy5jIHwgMzI0Cj4g
PiA+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4gICAz
IGZpbGVzIGNoYW5nZWQsIDMzNCBkZWxldGlvbnMoLSkKPiA+ID4gPiAgIGRlbGV0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21mZC9qejQ3NDAtYWRjLmMKPiA+ID4gCj4gPiA+ICBBcHBsaWVkLCB0aGFu
a3MuCj4gPiAKPiA+IEl0IHNlZW1zIHRoZSByZXBsYWNlbWVudCBpcyBkb25lIGluICJNSVBTOiBx
aV9sYjYwOiBNaWdyYXRlIHRvCj4gPiBkZXZpY2V0cmVlIiB3aGljaCBpcyBub3QgeWV0IG1lcmdl
ZC4KPiAKPiBJdCdzIG1lcmdlZCBpbiB0aGUgTUlQUyB0cmVlLCB0aG91Z2gsIHNvIGl0J2xsIGJs
ZW5kIHRvZ2V0aGVyIGp1c3QKPiBmaW5lIGluIGxpbnV4LW5leHQuCgpXb25kZXJmdWwuICBUaGFu
a3MgUGF1bC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
