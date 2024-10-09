Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4BCF044D
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cc6K24yDFiSMqUkPg7b1sjKAl8/KsHminaBIUj2hXLE=; b=DFwGVjjvqp+lc1
	SfBRzVCVoDmrmltSmEtrdhXp5dY1+JRqGEAT5pYR4W9xJjhLrc/higYWMcMVc6gA66LjX74fhtFcg
	s+t6QlXv9qhUMbuKm9UtEElCEAoWIh+BtmDVlusuTloTotPl2065DzKQ47lrE0FCmPZjAKIhTcCW5
	vUGl05LFuNQLt/sZnm8LrwcupMhmAkSa5EUibLiR78sbLd2qRe1JyJF/Ikwc1jJE0auZzHUuFo0gd
	4eOk7tukBWXULIIMft7ZddrB3EALAMZeOEG9JRjrtaHxFfNATsRWo0YzbWswscz2lROd19vMQcXwi
	7n9lewebyms2wu3uv3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syU6m-00000008uq1-0ILQ;
	Wed, 09 Oct 2024 10:39:56 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTvb-00000008sqp-1TOT
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 10:28:25 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e2903a48ef7so381688276.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2024 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728469702; x=1729074502; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fIjIpUdHAzWUFceihGJMz4qHHzjyT7pvRboVHLIXt8=;
        b=vSo7lu24ebsHDHKEQD8EbH1k42WmZ1fOuzCDdweTUO+m9GsWtXo5Ib+cyzrRR5mjXj
         VynIs4xuMgqCbfx18fPBkVaytdoqqNv2CT7tS8fTXKtRTiViPK09NEPTToiyRG1ZDp6y
         2Ez+nu2p8js0CmlaHqP+NPjgXDd6KGwqcK/bOqIJtaUhBMBIJscwwNMuZ117jxMbHbpn
         AaA4BNewQMuzOsBMzrwdxTjVX99q0iz17rbtVnuheE7jOnNh0izpadOwyVLCqNCrVqjh
         4ZxkVu+N/7P1bzME/T9a5BUzdHhw2jUmEGxapnc6fpItOVVdsOnGaiTM1UMl8xx8DPqH
         fxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728469702; x=1729074502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fIjIpUdHAzWUFceihGJMz4qHHzjyT7pvRboVHLIXt8=;
        b=EZ8DS53Zj1CsbINDwW8TjXeBiKX+dtrGIc1r9ySW5qGI533gKounVqPhh3G86YaTfg
         9xSefZVCP16b/7dlrB4D6mS+A8SzAsmOK8Zkmo3Swgn7zI6k4u2i5XYNQiKKBgLvVzSg
         bkKiNX4Rlz9pmdR4/qecfX6+al7F/WZiE5qufQO6tQjtly1znNbCLGPP74POpLOKhvNk
         7oZdTS9z+RUr2QeSmFsiJo3X1+3uhpIeUDXqssu96TWxg4V7j9IKGVhFTee2+UQy7J9Q
         X0Ht5vtcPYlfAz8nGp1/0UICzAoePJiqWtXJaoJ3bQ3Uv+rQMGqiH9pe12kpiCmWBkdc
         lRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX45TEQgQ+GESVosAZRt/bIapMNcGFqi4DGb3+xlb+nPORRNKvB0cgVM2bpYYR01hcZD/hU6/WrEyM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqu16r1I905xK66SDtY14tguL9sij6XM72D+40xwsLvmRPI9vb
	Vj5TyKgN46PuQnIQUZfX6hGJ/KuYDiJt/ZPcAgj9svC9VEIJTj7DXvRuTbVl1UAQumI1FoVeuIe
	YmjbdqPsNEfD6ofyq/I0DLxNQzehH548oJihn+Q==
X-Google-Smtp-Source: AGHT+IHNaU3Z3+DDKTWwqyhccdWy6KGvX0jRFFJtFda2WTvGLlJcpHA53hhWZp12VBznxD4kUpVSZMoh/Lgesk7avnk=
X-Received: by 2002:a25:eb02:0:b0:e25:96a4:1706 with SMTP id
 3f1490d57ef6-e28fe43f3d1mr1744852276.19.1728469701975; Wed, 09 Oct 2024
 03:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com> <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com> <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Oct 2024 12:27:45 +0200
Message-ID: <CAPDyKFqh_BS=6eN4tQzZ20sWCHL3kdnrY=1Mgd7B9gfBamm8bw@mail.gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, patches@opensource.cirrus.com, 
	iommu@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org, 
	asahi@lists.linux.dev, Andy Shevchenko <andy.shevchenko@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_032823_465546_D539E81C 
X-CRM114-Status: GOOD (  46.20  )
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

T24gVHVlLCA4IE9jdCAyMDI0IGF0IDIwOjI1LCBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgOCwgMjAyNCBhdCAxMjozNeKAr0FNIFVs
ZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUs
IDggT2N0IDIwMjQgYXQgMDA6MjUsIExhdXJlbnQgUGluY2hhcnQKPiA+IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBVbGYsCj4gPiA+Cj4g
PiA+IE9uIFR1ZSwgT2N0IDA4LCAyMDI0IGF0IDEyOjA4OjI0QU0gKzAyMDAsIFVsZiBIYW5zc29u
IHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgNyBPY3QgMjAyNCBhdCAyMDo0OSwgTGF1cmVudCBQaW5j
aGFydCB3cm90ZToKPiA+ID4gPiA+IE9uIEZyaSwgT2N0IDA0LCAyMDI0IGF0IDA0OjM4OjM2UE0g
KzAyMDAsIFVsZiBIYW5zc29uIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBGcmksIDQgT2N0IDIwMjQg
YXQgMTE6NDEsIFNha2FyaSBBaWx1cyB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IEhlbGxvIGV2ZXJ5b25lLAo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhpcyBzZXQgd2ls
bCBzd2l0Y2ggdGhlIHVzZXJzIG9mIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdG8KPiA+
ID4gPiA+ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2hpbGUgdGhlIGZvcm1l
ciB3aWxsIHNvb24gYmUgcmUtcHVycG9zZWQKPiA+ID4gPiA+ID4gPiB0byBpbmNsdWRlIGEgY2Fs
bCB0byBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuIFRoZSB0d28gYXJlIGFsbW9zdAo+ID4g
PiA+ID4gPiA+IGFsd2F5cyB1c2VkIHRvZ2V0aGVyLCBhcGFydCBmcm9tIGJ1Z3Mgd2hpY2ggYXJl
IGxpa2VseSBjb21tb24uIEdvaW5nCj4gPiA+ID4gPiA+ID4gZm9yd2FyZCwgbW9zdCBuZXcgdXNl
cnMgc2hvdWxkIGJlIHVzaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuCj4gPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gPiBPbmNlIHRoaXMgY29udmVyc2lvbiBpcyBkb25lIGFuZCBwbV9y
dW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHJlLXB1cnBvc2VkLAo+ID4gPiA+ID4gPiA+IEknbGwg
cG9zdCBhbm90aGVyIHNldCB0byBtZXJnZSB0aGUgY2FsbHMgdG8gX19wbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZCgpCj4gPiA+ID4gPiA+ID4gYW5kIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3ko
KS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhhdCBzb3VuZHMgbGlrZSBpdCBjb3VsZCBjYXVz
ZSBhIGxvdCBvZiBjaHVybnMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdoeSBub3QgYWRkIGEg
bmV3IGhlbHBlciBmdW5jdGlvbiB0aGF0IGRvZXMgdGhlCj4gPiA+ID4gPiA+IHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCkgYW5kIHRoZSBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkKPiA+
ID4gPiA+ID4gdGhpbmdzPyBUaGVuIHdlIGNhbiBzdGFydCBtb3ZpbmcgdXNlcnMgb3ZlciB0byB0
aGlzIG5ldyBpbnRlcmZhY2UsCj4gPiA+ID4gPiA+IHJhdGhlciB0aGFuIGhhdmluZyB0aGlzIGlu
dGVybWVkaWF0ZSBzdGVwPwo+ID4gPiA+ID4KPiA+ID4gPiA+IEkgdGhpbmsgdGhlIEFQSSB3b3Vs
ZCBiZSBuaWNlciBpZiB3ZSB1c2VkIHRoZSBzaG9ydGVzdCBhbmQgc2ltcGxlc3QKPiA+ID4gPiA+
IGZ1bmN0aW9uIG5hbWVzIGZvciB0aGUgbW9zdCBjb21tb24gdXNlIGNhc2VzLiBGb2xsb3dpbmcK
PiA+ID4gPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgd2l0aCBwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5KCkgaXMgdGhhdAo+ID4gPiA+ID4gbW9zdCBjb21tb24gdXNlIGNhc2UuIFRo
YXQncyB3aHkgSSBsaWtlIFNha2FyaSdzIGFwcHJvYWNoIG9mIHJlcHVycG9zaW5nCj4gPiA+ID4g
PiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLCBhbmQgaW50cm9kdWNpbmcKPiA+ID4gPiA+
IF9fcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBmb3IgdGhlIG9kZCBjYXNlcyB3aGVyZQo+
ID4gPiA+ID4gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpIHNob3VsZG4ndCBiZSBjYWxsZWQu
Cj4gPiA+ID4KPiA+ID4gPiBPa2F5LCBzbyB0aGUgcmVhc29uIGZvciB0aGlzIGFwcHJvYWNoIGlz
IGJlY2F1c2Ugd2UgY291bGRuJ3QgZmluZCBhCj4gPiA+ID4gc2hvcnQgYW5kIGRlc2NyaXB0aXZl
IG5hbWUgdGhhdCBjb3VsZCBiZSB1c2VkIGluIGZhdm9yIG9mCj4gPiA+ID4gcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKS4gTGV0IG1lIHRocm93IHNvbWUgaWRlYXMgYXQgaXQgYW5kIG1heWJl
Cj4gPiA+ID4geW91IGxpa2UgaXQgLSBvciBub3QuIDotKQo+ID4gPgo+ID4gPiBJIGxpa2UgdGhl
IGlkZWEgYXQgbGVhc3QgOi0pCj4gPiA+Cj4gPiA+ID4gSSBkb24ndCBrbm93IHdoYXQgb3B0aW9u
cyB5b3UgZ3V5cyBkaXNjdXNzZWQsIGJ1dCB0byBtZSB0aGUgZW50aXJlCj4gPiA+ID4gImF1dG9z
dXNwZW5kIi1zdWZmaXggaXNuJ3QgcmVhbGx5IHRoYXQgbmVjZXNzYXJ5IGluIG15IG9waW5pb24u
IFRoZXJlCj4gPiA+ID4gYXJlIG1vcmUgd2F5cyB0aGFuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRf
YXV0b3N1c3BlbmQoKSB0aGF0IHRyaWdnZXJzCj4gPiA+ID4gdXMgdG8gdXNlIHRoZSBSUE1fQVVU
TyBmbGFnIGZvciBycG1fc3VzcGVuZCgpLiBGb3IgZXhhbXBsZSwganVzdAo+ID4gPiA+IGNhbGxp
bmcgcG1fcnVudGltZV9wdXQoKSBoYXMgdGhlIHNpbWlsYXIgZWZmZWN0Lgo+ID4gPgo+ID4gPiBU
byBiZSBob25lc3QsIEknbSBsb3N0IHRoZXJlLiBwbV9ydW50aW1lX3B1dCgpIGNhbGxzCj4gPiA+
IF9fcG1fcnVudGltZV9pZGxlKFJQTV9HRVRfUFVUIHwgUlBNX0FTWU5DKSwgd2hpbGUKPiA+ID4g
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSBjYWxscyBfX3BtX3J1bnRpbWVfc3VzcGVuZChS
UE1fR0VUX1BVVCB8Cj4gPiA+IFJQTV9BU1lOQyB8IFJQTV9BVVRPKS4KPiA+Cj4gPiBfX3BtX3J1
bnRpbWVfaWRsZSgpIGVuZHMgdXAgY2FsbGluZyBycG1faWRsZSgpLCB3aGljaCBtYXkgY2FsbAo+
ID4gcnBtX3N1c3BlbmQoKSAtIGlmIGl0IHN1Y2NlZWRzIHRvIGlkbGUgdGhlIGRldmljZS4gSW4g
dGhhdCBjYXNlLCBpdAo+ID4gdGFncyBvbiB0aGUgUlBNX0FVVE8gZmxhZyBpbiB0aGUgY2FsbCB0
byBycG1fc3VzcGVuZCgpLiBRdWl0ZSBzaW1pbGFyCj4gPiB0byB3aGF0IGlzIGhhcHBlbmluZyB3
aGVuIGNhbGxpbmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKS4KPgo+IFJpZ2h0Lgo+Cj4g
Rm9yIGFsbW9zdCBldmVyeWJvZHksIGV4Y2VwdCBmb3IgYSBzbWFsbCBidW5jaCBvZiBkcml2ZXJz
IHRoYXQKPiBhY3R1YWxseSBoYXZlIGEgLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrLCBwbV9ydW50
aW1lX3B1dCgpIGlzCj4gbGl0ZXJhbGx5IGVxdWl2YWxlbnQgdG8gcG1fcnVudGltZV9wdXRfYXV0
b3N1c3BlbmQoKS4KPgo+IFNvIHJlYWxseSB0aGUgcXVlc3Rpb24gaXMgd2h5IGFueW9uZSB3aG8g
ZG9lc24ndCBwcm92aWRlIGEKPiAucnVudGltZV9pZGxlKCkgY2FsbGJhY2sgYm90aGVycyB3aXRo
IHVzaW5nIHRoaXMgc3BlY2lhbAo+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgdGhpbmcs
IHdoaWNoIHJlYWxseSBtZWFucyAiZG8gYQo+IHJ1bnRpbWVfcHV0KCksIGJ1dCBza2lwIG15IC5y
dW50aW1lX2lkbGUoKSBjYWxsYmFjayIuCgpNeSBndWVzcyBpcyB0aGF0IGl0J3MgaW4gbW9zdCBj
YXNlcyBhIGxlZ2FjeSBwYXR0ZXJuIHRoYXQgaXMgYmVpbmcKZm9sbG93ZWQuIEFsc28gbm90ZSB0
aGF0IHJwbV9pZGxlKCkgZGlkbid0ICJhbHdheXMiIHRhZyBvbiB0aGUKUlBNX0FVVE8gZmxhZywg
ZXZlbiBpZiBpdCdzIHF1aXRlIGEgd2hpbGUgYWdvICgyMDEzKSBzaW5jZSB3ZSBhZGRlZAppdC4K
ClVubGVzcyB0aGVyZSBpcyBzb21lIGFjdHVhbCBvcHRpbWl6YXRpb24gaW52b2x2ZWQsIGFzIGl0
IGFsc28gYWxsb3dzCnVzIHRvIHNraXAgY2FsbGluZyBycG1faWRsZSgpIGFuZCBnbyBkaXJlY3Rs
eSBmb3IgcnBtX3N1c3BlbmQoKS4KCj4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IE1vcmVvdmVyLCBp
dCdzIHNpbWlsYXIgZm9yIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSwgaXQncyBjYWxsZWQK
PiA+ID4gPiBkdXJpbmcgcnBtX3Jlc3VtZSgpIHRvbywgZm9yIGV4YW1wbGUuIFNvIHdoeSBib3Ro
ZXIgYWJvdXQgaGF2aW5nCj4gPiA+ID4gIm1hcmtfbGFzdF9idXN5IiBpbiB0aGUgbmV3IG5hbWUg
dG9vLgo+ID4gPiA+Cj4gPiA+ID4gVGhhdCBzYWlkLCBteSBzdWdnZXN0aW9uIGlzIHNpbXBseSAi
cG1fcnVudGltZV9wdXRfc3VzcGVuZCIuCj4gPiA+Cj4gPiA+IENhbiB3ZSBkbyBldmVuIGJldHRl
ciwgYW5kIG1ha2UgcG1fcnVudGltZV9wdXQoKSB0byBoYW5kbGUgYXV0b3N1c3BlbmQKPiA+ID4g
YXV0b21hdGljYWxseSB3aGVuIGF1dG9zdXNwZW5kIGlzIGVuYWJsZWQgPwo+ID4KPiA+IEFzIHN0
YXRlZCBhYm92ZSwgdGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNlLgo+Cj4gV2hhdCByZWFsbHkgaXMg
bmVlZGVkIGFwcGVhcnMgdG8gYmUgYSBjb21iaW5hdGlvbiBvZgo+IHBtX3J1bnRpbWVfbWFya19s
YXN0X2J1c3koKSB3aXRoIHBtX3J1bnRpbWVfcHV0KCkuCgpUaGlzIG1ha2VzIHNlbnNlIHRvIG1l
IHRvbywgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGxpbWl0IGl0IHRvIHRoaXMuCgpNYWtp
bmcgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQgKG9yIGlmIHRoZSBuYW1lCiJwbV9ydW50aW1l
X3B1dF9zdXNwZW5kIiBpcyBiZXR0ZXI/KSB0byBkbyB0aGUgc2ltaWxhciB0aGluZywgaXMKcHJv
YmFibHkgYSBnb29kIGlkZWEgdG9vLiBBdCBsZWFzdCBpbiBteSBvcGluaW9uLgoKPgo+IEdyYW50
ZWQsIHBtX3J1bnRpbWVfcHV0KCkgY291bGQgZG8gdGhlIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1
c3koKQo+IHRoaW5nIGF1dG9tYXRpY2FsbHkgaWYgYXV0b3N1c3BlbmQgaXMgZW5hYmxlZCBhbmQg
dGhlIG9ubHkgY29uc2VxdWVuY2UKPiBvZiBpdCBtaWdodCBiZSBkZWxheWluZyBhIHN1c3BlbmQg
b2YgdGhlIGRldmljZSB1bnRpbCBpdHMgYXV0b3N1c3BlbmQKPiB0aW1lciBleHBpcmVzLCB3aGlj
aCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbSBpbiB0aGUgdmFzdCBtYWpvcml0eSBvZgo+IGNhc2Vz
LgoKUmlnaHQuCgpJIGd1ZXNzIHdlIHNob3VsZCBleHBlY3QgdGhlICpzeW5jKiB2YXJpYW50cyB0
byBiZSB1c2VkLCBpZiB0aGUgdGltZXIKcmVhbGx5IG5lZWRzIHRvIGJlIG92ZXJyaWRkZW4uCgpL
aW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
