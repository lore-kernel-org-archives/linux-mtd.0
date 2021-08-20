Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7609C4338F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 05:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8203661029
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 05:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8203661029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBxWu4iM0pZ4aX51KBaey5hkU9Q994GejraV1w+06bY=; b=Biky3Bx5Jasy+V
	CHdWq8RVgBSV/V0ebvzmXxuwbR81ENPamUvvtmP7Ixn+6uo/+UyHL/C23Gtgjwk8l9Zpp7deEXKjH
	Ot2eknQNwkQ5H/cBNWCDyDHpHxZx6HHXQ/Q3oyPHR0IrrNPZ4IffvgEcXLaNZtu3u+lCjDd1URSAh
	qR1k+hDhFGMiKuXxNqxBdQeoYL4+8DlCd6yU/inkxZpOB7qOAw3PVI+Y8nSXO/ASNDPPbZ7T9tUxd
	GJ7vV91ZBH2hFXjCGBosdUNUJnn08lkoMu7n2zS6W51qInGJbKKtgTOAJg3H/A1u0MFeeINzmhNB7
	GE5y4JQj8g7QQIUSbQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGwko-00A6kj-D2; Fri, 20 Aug 2021 05:07:42 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGwkj-00A6im-IM
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 05:07:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id n18so8019235pgm.12
 for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2021 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=I11c1cKgPr/Sp26Jfws1CaBTqYhcyWk53u2DaXhbwr4=;
 b=UpF+nH2OkwIlPICwJCGnmyjIr4B9zvEagcPYbt+FJYBnDajj0m1nO6tNVE8qbt0+Fb
 dvuJgN/eTqaJJteqhCVn/rpcLUbjjgUdxm7UyfiENQfoJm1xoF4RsPXSRRmHR5JJ+BPY
 PyeM7sN+r+QeMIx3F/9qJdfTHD7pTlzTgVcV3EQwfDc98f2L+ENvpCEJkt6OSiVH99HJ
 DBrXa6YTNx2fJk97BqJPlKXpgux1dBNrNVjVGSJvKx8onkggk5QqicWc5AuujjenjwE8
 18Ew9Inp2nlX4py5sLi42iaANQsw78fFTvRX/HOAZ1Q/cYx042ZZ2sxqM8pjRICPn4KS
 FXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=I11c1cKgPr/Sp26Jfws1CaBTqYhcyWk53u2DaXhbwr4=;
 b=m4Twt265MrhEQzvEkralnTcT5vTM+17c1DoNiA5nEgRqsBR2TTk4I0D0pyHuORrSbD
 88kliGdo4O6PuMe9kYPIdJAXQmAvxWsd9DC9RjfPHL+X65mf/whLWUvrG0dj73WPiApl
 JGs/aqCNFAnZYJlC6hzlxGloOUAlSOKDDavAow+cKV1tgV7Nql77jbko21i42d55b88B
 eALJCoRjqfMORZ/SPHt3fVwo6p5bN6cwSx+78ZP0AmisiNr7Yu5IcDia/Zzw7gDBM4VS
 jAE5AN79C0siG3X4A6xWBn5f2OzWMLuQ2+LzQOKZDiCCeJraeU8POAydUI14PUsD/hnB
 tPGg==
X-Gm-Message-State: AOAM532FgsRj+ekYH3B5TiMVZS97lr4BSoQmDx8XHbGhCblwpM+GsBJ/
 y1ARlHcjJjCOqeuGIujXElL2sQ==
X-Google-Smtp-Source: ABdhPJy16/E+lvO8MOOTzYuxWhro60JOgxJRFDA2oDgCU53rDXdaeG2jdAFewa07ZsImLDOdZ74p+w==
X-Received: by 2002:a05:6a00:791:b0:3e1:3316:2e8 with SMTP id
 g17-20020a056a00079100b003e1331602e8mr18151438pfu.10.1629436055638; 
 Thu, 19 Aug 2021 22:07:35 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id m5sm6747464pgn.70.2021.08.19.22.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 22:07:35 -0700 (PDT)
Date: Fri, 20 Aug 2021 10:37:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210820050732.oy2qdtwha5zioasq@vireshk-i7>
References: <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
 <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
 <87073fc2-d7b3-98f4-0067-29430ea2adef@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87073fc2-d7b3-98f4-0067-29430ea2adef@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_220737_717464_A0D56C74 
X-CRM114-Status: GOOD (  29.22  )
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

T24gMTktMDgtMjEsIDIyOjM1LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTkuMDguMjAyMSAx
NjowNywgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiA+IEluIHRoZSBvdGhlciBzY2VuYXJpbyB3
aGVyZSBhIGNvbnN1bWVyIGRyaXZlciBwcmVmZXJzIHRvICpub3QqIGNhbGwKPiA+IHBtX3J1bnRp
bWVfcmVzdW1lX2FuZF9nZXQoKSBpbiBpdHMgLT5wcm9iZSgpLCBiZWNhdXNlIGl0IGRvZXNuJ3Qg
bmVlZAo+ID4gdG8gcG93ZXIgb24gdGhlIGRldmljZSB0byBjb21wbGV0ZSBwcm9iaW5nLCB0aGVu
IHdlIGRvbid0IHdhbnQgdG8gdm90ZQo+ID4gZm9yIGFuIE9QUCBhdCBhbGwgLSBhbmQgd2UgYWxz
byB3YW50IHRoZSBwZXJmb3JtYW5jZSBzdGF0ZSBmb3IgdGhlCj4gPiBkZXZpY2UgaW4gZ2VucGQg
dG8gYmUgc2V0IHRvIHplcm8uIENvcnJlY3Q/Cj4gCj4gWWVzCj4gCj4gPiBJcyB0aGlzIHRoZSBt
YWluIHByb2JsZW0geW91IGFyZSB0cnlpbmcgdG8gc29sdmUsIGJlY2F1c2UgSSB0aGluayB0aGlz
Cj4gPiBkb2Vzbid0IHdvcmsgb3V0IG9mIHRoZSBib3ggYXMgb2YgdG9kYXk/Cj4gCj4gVGhlIG1h
aW4gcHJvYmxlbSBpcyB0aGF0IHRoZSByZXN0b3JlZCBwZXJmb3JtYW5jZSBzdGF0ZSBpcyB6ZXJv
IGZvciB0aGUKPiBmaXJzdCBnZW5wZF9ydW50aW1lX3Jlc3VtZSgpLCB3aGlsZSBpdCdzIG5vdCB6
ZXJvIGZyb20gdGhlIGgvdyBwZXJzcGVjdGl2ZS4KClRoaXMgaXMgZXhhY3RseSB3aHkgSSBoYXZl
IGJlZW4gYWR2b2NhdGluZyB0aGF0IHRoZSBnZW5wZCBuZWVkcyB0bwpzeW5jIHVwIHdpdGggdGhl
IGhhcmR3YXJlIGJlZm9yZSBhbnkgY2FsbHMgYXJlIG1hZGUgdG8gaXQgZnJvbSB0aGUKY29uc3Vt
ZXIgZHJpdmVyLiBKdXN0IHdoYXQgY2xvY2sgZnJhbWV3b3JrIGRvZXMgdG8gZ2V0IHRoZSBjbG9j
ayByYXRlLgoKPiA+IFRoZXJlIGlzIGFub3RoZXIgY29uY2VybiB0aG91Z2gsIGJ1dCBwZXJoYXBz
IGl0J3Mgbm90IGEgcHJvYmxlbSBhZnRlcgo+ID4gYWxsLiBWaXJlc2ggdG9sZCB1cyB0aGF0IGRl
dl9wbV9vcHBfc2V0X3JhdGUoKSBtYXkgdHVybiBvbiByZXNvdXJjZXMKPiA+IGxpa2UgY2xvY2sv
cmVndWxhdG9ycy4gVGhhdCBjb3VsZCBjZXJ0YWlubHkgYmUgcHJvYmxlbWF0aWMsIGluCj4gPiBw
YXJ0aWN1bGFyIGlmIHRoZSBkZXZpY2UgYW5kIGl0cyBnZW5wZCBoYXZlIE9QUCB0YWJsZXMgYXNz
b2NpYXRlZCB3aXRoCj4gPiBpdCBhbmQgdGhlIGNvbnN1bWVyIGRyaXZlciB3YW50cyB0byBmb2xs
b3cgdGhlIGFib3ZlIHNlcXVlbmNlIGluCj4gPiBwcm9iZS4KPiAKPiBkZXZfcG1fb3BwX3NldF9y
YXRlKCkgd29uJ3QgZW5hYmxlIGNsb2NrcyBhbmQgcmVndWxhdG9ycywgYnV0IGl0IG1heQoKSXQg
ZG9lcyBlbmFibGUgcmVndWxhdG9ycyByaWdodCBub3csIGl0IG1heSBjaG9vc2UgdG8gZW5hYmxl
IGNsb2NrcwpsYXRlciBvbiwgbm8gZ3VhcmFudGVlcy4KCj4gY2hhbmdlIHRoZSBjbG9jayByYXRl
IGFuZCB2b2x0YWdlLiBUaGlzIGlzIGFsc28gcGxhdGZvcm0vZHJpdmVyIHNwZWNpZmljCj4gYmVj
YXVzZSBpdCdzIHVwIHRvIE9QUCB1c2VyIGhvdyB0byBjb25maWd1cmUgT1BQIHRhYmxlLiBPbiBU
ZWdyYSB3ZSBvbmx5Cj4gYXNzaWduIGNsb2NrIHRvIE9QUCB0YWJsZSwgcmVndWxhdG9ycyBhcmUg
dW51c2VkLgoKUmlnaHQsIG92ZXIgdGhhdCBwbGF0Zm9ybXMgY2FuIHNldCB0aGVpciBvd24gdmVy
c2lvbiBvZiBzZXQtb3BwCmNhbGxiYWNrLCB3aGVyZSBhbGwgdGhpcyBpcyBkb25lIGZyb20gYSBw
bGF0Zm9ybSBzcGVjaWZpYyBjYWxsYmFjay4KCj4gPiBWaXJlc2gsIGNhbiB5b3UgcGxlYXNlIGNo
aW1lIGluIGhlcmUgYW5kIGVsYWJvcmF0ZSBvbiBzb21lIG9mIHRoZQo+ID4gbWFnaWMgaGFwcGVu
aW5nIGJlaGluZCBkZXZfcG1fb3BwX3NldF9yYXRlKCkgQVBJIC0gaXMgdGhlcmUgYSBwcm9ibGVt
Cj4gPiBoZXJlIG9yIG5vdD8KCkl0IGNvbmZpZ3VyZXMgY2xvY2ssIHJlZ3VsYXRvcnMsIGdlbnBk
cywgYW55IHJlcXVpcmVkIE9QUHMsICsgaXQKZW5hYmxlcyByZWd1bGF0b3JzIHJpZ2h0IG5vdy4K
Ci0tIAp2aXJlc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
