Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C7CC3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJdummNmXlBJe02ixs3nHcD2XswZn8y4SQ+xh2ZESck=; b=0abxC+3z+omJSO
	cRb2ZfJbFEezWEcPC4mRWI9pcww23QVKBkWMLhSqmDmHFtzRQ6PyKBt+Vco/rJ8hny5U+A2pgaxqJ
	HtDhoh5DS2JZkpnJBxCzlUjKavn7BX6oUFn+9v2Rx5TQFXLJzOlEq+iW9rKj5FYKyhfN5JtsZA1ek
	xMDkVLSGz4Kv+KclTBVVtyWJD9LJGQZRiKrWvLZPVw1JHwsiEfpv04+NTCzBmETDQKvxvlORWClTI
	56ZlyftbHSTWl89jHlAYreFPTTeZk/hZ6G3hgvPQe+7U+XLAF8PO4EFs1HzUsYg62YCk2G0KQNuKi
	UANaAaj3y0BTcYvMAG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Nq9-00000009PEB-3vM5;
	Thu, 03 Apr 2025 16:54:53 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Nq7-00000009PDa-24v0
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 16:54:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-736b98acaadso1212249b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743699291; x=1744304091; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FDa5eNS7BwA8fLuFV+VPTYw9CpDmGbyK6UKEScOkVlM=;
        b=j5hQySVldCoMHYiRQI45W6CIJkOdui+opdbLrgguiem7OKegndmzjCOPyF3sWQdObM
         sJKiJ2Tm9151Bo4a4LZzEF0fzR+HIGF06wNv3VmDMQzUxH+YPITuLms8LVv3iHWc3qaD
         eA/NGVHn/PcYmA9uw9xVsLazSDMlxDkK4HUUa+XeeBuGxBaQVeAuyiVrUiEQB1tTpHF8
         /e6zmS9Ca0PtHatGiECMF5xgeCkLYUKxFXZOU7Wir+4XsPdz+UHk0isJCmA59CQ9VmQS
         p0Oj6mCt9EcjVMGi20Dlp4jej9Fp0uW4ZOaHWoZBejgHtlsibQMRZygMjA0OuYa0H+Co
         xEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699291; x=1744304091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDa5eNS7BwA8fLuFV+VPTYw9CpDmGbyK6UKEScOkVlM=;
        b=t3E6UuxYYaZJYDnb00lRUO5bJZG86XTZITUi9kkkhObK54qg8iw1d2gmi4Svv3LP6z
         t8C5udYUlLWctSdfG4CWCFr/PUtjfnAdBEaV/yVKRl6+d1QqfIMnVIO/GMrSciXR3/zz
         kdNGrgUVeoPFqYxKDPcUgwb1qWKg/FN4bBL9DL2wWhxz+PDAOUwtAGvbvcF7CLg4i7dg
         SDm5WwBtMm9pw5ofiI0TurcZBmZwiO/Sy1v/246mr6evH4cyHQHmcdUvqSHwdV/W8hwb
         +rIKs80hEzDLbOA8Du+jhyyA4OEug3WTiLwh5+KtHtMqNcoX6Xpotfjf+YVKXymeSIVE
         dUpg==
X-Forwarded-Encrypted: i=1; AJvYcCW1AIrnUKdXOMSAhQ0gCp0YfO16MdY+13fdmOOZLhHPK/6atOfJJtFb3llharxn7PGUZSLSyjBDsLw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOhv7NqpAm9p4JKXALElMVwPW11vn7W7SP2b5Y+Z2ltQ1wi8TQ
	zwCk3/gkQQstfCwPcHu+JRBCFb2Q7Qk0DZaoJXlFM2SrY1IDITRH
X-Gm-Gg: ASbGnctDNg4OEV55Kn4Murw2VkixcK3Dn0eCC4KVYv3kTouh9Nt+53TXUVsu0Y/qP9O
	2NKAJxOyel6VtZzMOsPW0F2SDtt/pftDp6PTjxLiEBDhRiqVmF1eoABk6Q8iYZnDluLBSkPSSkU
	urS7ONTedJMoWmQGLep6C/YHIhm9sq81ozwcEzBKVgddNapmJRveMazvvCRe6CwnGrUKQq0UvdV
	5jh5cYzX3n+sN/+sE014lrlpnDT/KUV8seno0uAWyavsQDuheOiWJBLkEzhWTxdFLOGVQwQ9ykn
	AxRfAQjuabqhRyE03GLVvM3l5LWAV2f52QPdVVREZP0PQi0e+yQnaCZUTn3eOX5MMuyA5A0r
X-Google-Smtp-Source: AGHT+IFzbU3WoJeacDQdqibpo5DgjipppPJR8PTe9f3lGsTZ/tQbuHLEeyPY/scxBj5Gc9UqWtPEbg==
X-Received: by 2002:a05:6a21:9011:b0:1f3:418c:6281 with SMTP id adf61e73a8af0-2010446ceb8mr238059637.4.1743699290513;
        Thu, 03 Apr 2025 09:54:50 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc31c00csm1453293a12.20.2025.04.03.09.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:54:49 -0700 (PDT)
Date: Fri, 4 Apr 2025 00:54:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z+69UOemf+H/EHvN@visitorckw-System-Product-Name>
References: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
 <Z-6zzP2O-Q7zvTLt@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-6zzP2O-Q7zvTLt@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_095451_540362_FA75F854 
X-CRM114-Status: GOOD (  35.73  )
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

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMTI6MTQ6MDRQTSAtMDQwMCwgWXVyeSBOb3JvdiB3cm90
ZToKPiBPbiBUaHUsIEFwciAwMywgMjAyNSBhdCAxMDozOTowM1BNICswODAwLCBLdWFuLVdlaSBD
aGl1IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTI6NDM6MjVQTSAtMDcwMCwg
SC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4gPiA+IE9uIDMvMjMvMjUgMDg6MTYsIEt1YW4tV2VpIENo
aXUgd3JvdGU6Cj4gPiA+ID4gCj4gPiA+ID4gSW50ZXJmYWNlIDM6IE11bHRpcGxlIEZ1bmN0aW9u
cwo+ID4gPiA+IERlc2NyaXB0aW9uOiBib29sIHBhcml0eV9vZGQ4LzE2LzMyLzY0KCkKPiA+ID4g
PiBQcm9zOiBObyBuZWVkIGZvciBleHBsaWNpdCBjYXN0aW5nOyBlYXN5IHRvIGludGVncmF0ZQo+
ID4gPiA+ICAgICAgICBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgb3B0aW1pemF0aW9uczsgZXhjZXB0
IGZvciBwYXJpdHk4KCksIGFsbAo+ID4gPiA+ICAgICAgICBmdW5jdGlvbnMgYXJlIG9uZS1saW5l
cnMgd2l0aCBubyBzaWduaWZpY2FudCBjb2RlIGR1cGxpY2F0aW9uCj4gPiA+ID4gQ29uczogTW9y
ZSBmdW5jdGlvbnMgbWF5IGluY3JlYXNlIG1haW50ZW5hbmNlIGJ1cmRlbgo+ID4gPiA+IE9waW5p
b25zOiBPbmx5IEkgc3VwcG9ydCB0aGlzIGFwcHJvYWNoCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBP
Sywgc28gSSByZXNwb25kZWQgdG8gdGhpcyBidXQgSSBjYW4ndCBmaW5kIG15IHJlcGx5IG9yIGFu
eSBvZiB0aGUKPiA+ID4gZm9sbG93dXBzLCBzbyBsZXQgbWUgZ28gYWdhaW46Cj4gPiA+IAo+ID4g
PiBJIHByZWZlciB0aGlzIG9wdGlvbiwgYmVjYXVzZToKPiA+ID4gCj4gPiA+IGEuIFZpcnR1YWxs
eSBhbGwgdXNlcyBvZiBwYXJpdHkgaXMgZG9uZSBpbiBjb250ZXh0cyB3aGVyZSB0aGUgc2l6ZXMg
b2YgdGhlCj4gPiA+IGl0ZW1zIGZvciB3aGljaCBwYXJpdHkgaXMgdG8gYmUgdGFrZW4gYXJlIHdl
bGwtZGVmaW5lZCwgYnV0IGl0IGlzICpyZWFsbHkqCj4gPiA+IGVhc3kgZm9yIGludGVnZXIgcHJv
bW90aW9uIHRvIGNhdXNlIGEgdmFsdWUgdG8gYmUgZXh0ZW5kZWQgdG8gMzIgYml0cwo+ID4gPiB1
bm5lY2Vzc2FyaWx5IChzaWduIG9yIHplcm8gZXh0ZW5kLCBhbHRob3VnaCBmb3IgcGFyaXR5IGl0
IGRvZXNuJ3QgbWFrZSBhbnkKPiA+ID4gZGlmZmVyZW5jZSAtLSBpZiB0aGUgY29tcGlsZXIgcmVh
bGl6ZXMgaXQuKQo+ID4gPiAKPiA+ID4gYi4gSXQgbWFrZXMgaXQgZWFzaWVyIHRvIGFkZCBhcmNo
LXNwZWNpZmljIGltcGxlbWVudGF0aW9ucywgbm90YWJseSB1c2luZwo+ID4gPiBfX2J1aWx0aW5f
cGFyaXR5IG9uIGFyY2hpdGVjdHVyZXMgd2hlcmUgdGhhdCBpcyBrbm93biB0byBnZW5lcmF0ZSBn
b29kIGNvZGUuCj4gPiA+IAo+ID4gPiBjLiBGb3IgYXJjaGl0ZWN0dXJlcyB3aGVyZSBvbmx5ICpz
b21lKiBwYXJpdHkgaW1wbGVtZW50YXRpb25zIGFyZQo+ID4gPiBmYXN0L3ByYWN0aWNhbCwgdGhl
IGdlbmVyaWMgZmFsbGJhY2tzIHdpbGwgZWl0aGVyIG5hdHVyYWxseSBzeW50aGVzaXplIHRoZW0K
PiA+ID4gZnJvbSBjb21wb25lbnRzIHZpYSBzaGlmdC14b3IsIG9yIHRoZXkgY2FuIGJlIGRlZmlu
ZWQgdG8gdXNlIGEgbGFyZ2VyCj4gPiA+IHZlcnNpb247IHRoZSBmdW5jdGlvbiBwcm90b3R5cGUg
YWN0cyBsaWtlIGEgY2FzdC4KPiA+ID4gCj4gPiA+IGQuIElmIHRoZXJlIGlzIGEgcmVhc29uIGlu
IHRoZSBmdXR1cmUgdG8gYWRkIGEgZ2VuZXJpYyB2ZXJzaW9uLCBpdCBpcyByZWFsbHkKPiA+ID4g
ZWFzeSB0byBkbyB1c2luZyB0aGUgc2l6ZS1zcGVjaWZpYyBmdW5jdGlvbnMgYXMgY29tcG9uZW50
czsgdGhpcyBpcwo+ID4gPiBzb21ldGhpbmcgd2UgZG8gbGl0ZXJhbGx5IGFsbCBvdmVyIHRoZSBw
bGFjZSwgdXNpbmcgYSBwYXR0ZXJuIHNvIGNvbW1vbiB0aGF0Cj4gPiA+IGl0LCBpdHNlbGYsIHBy
b2JhYmx5IHNob3VsZCBiZSBtYWNyb2l6ZWQ6Cj4gPiA+IAo+ID4gPiAjZGVmaW5lIHBhcml0eSh4
KSAJCQkJXAo+ID4gPiAoewkJCQkJCVwKPiA+ID4gCXR5cGVvZih4KSBfX3ggPSAoeCk7CQkJXAo+
ID4gPiAJYm9vbCBfX3k7CQkJCVwKPiA+ID4gCXN3aXRjaCAoc2l6ZW9mKF9feCkpIHsJCQlcCj4g
PiA+IAkJY2FzZSAxOgkJCQlcCj4gPiA+IAkJCV9feSA9IHBhcml0eTgoX194KTsJXAo+ID4gPiAJ
CQlicmVhazsJCQlcCj4gPiA+IAkJY2FzZSAyOgkJCQlcCj4gPiA+IAkJCV9feSA9IHBhcml0eTE2
KF9feCk7CVwKPiA+ID4gCQkJYnJlYWs7CQkJXAo+ID4gPiAJCWNhc2UgNDoJCQkJXAo+ID4gPiAJ
CQlfX3kgPSBwYXJpdHkzMihfX3gpOwlcCj4gPiA+IAkJCWJyZWFrOwkJCVwKPiA+ID4gCQljYXNl
IDg6CQkJCVwKPiA+ID4gCQkJX195ID0gcGFyaXR5NjQoX194KTsJXAo+ID4gPiAJCQlicmVhazsJ
CQlcCj4gPiA+IAkJZGVmYXVsdDoJCQlcCj4gPiA+IAkJCUJVSUxEX0JVRygpOwkJXAo+ID4gPiAJ
CQlicmVhazsJCQlcCj4gPiA+IAl9CQkJCQlcCj4gPiA+IAlfX3k7CQkJCQlcCj4gPiA+IH0pCj4g
PiA+Cj4gPiBUaGFuayB5b3UgZm9yIHlvdXIgZGV0YWlsZWQgcmVzcG9uc2UgYW5kIGZvciBleHBs
YWluaW5nIHRoZSByYXRpb25hbGUKPiA+IGJlaGluZCB5b3VyIHByZWZlcmVuY2UuIFRoZSBwb2lu
dHMgeW91IG91dGxpbmVkIGluIChhKeKAkyhkKSBhbGwgc2VlbQo+ID4gcXVpdGUgcmVhc29uYWJs
ZSB0byBtZS4KPiA+IAo+ID4gWXVyeSwKPiA+IGRvIHlvdSBoYXZlIGFueSBmZWVkYmFjayBvbiB0
aGlzPwo+ID4gVGhhbmsgeW91Lgo+IAo+IE15IGZlZWRiYWNrIHRvIHlvdToKPiAKPiBJIGFza2Vk
IHlvdSB0byBzaGFyZSBhbnkgbnVtYmVycyBhYm91dCBlYWNoIGFwcHJvYWNoLiBBc20gbGlzdGlu
Z3MsCj4gcGVyZm9ybWFuY2UgdGVzdHMsIGJsb2F0LW8tbWV0ZXIuIEJ1dCB5b3UgZGlkIG5vdGhp
bmcgb3IgdmVyeSBsaXR0bGUKPiBpbiB0aGF0IGRlcGFydG1lbnQuIFlvdSBtb3ZlIHRoaXMgc2Vy
aWVzLCBhbmQgaXQgbWVhbnMgeW91IHNob3VsZCBiZQo+IHZlcnkgd2VsbCBhd2FyZSBvZiBhbHRl
cm5hdGl2ZSBzb2x1dGlvbnMsIHRoZWlyIHByb3MgYW5kIGNvbnMuCj4KSSdtIHdpbGxpbmcgdG8g
cnVuIG1pY3JvLWJlbmNobWFya3MsIGJ1dCBldmVuIHdpdGggcGVyZm9ybWFuY2UgZGF0YSwgSQps
YWNrIHRoZSBkb21haW4ga25vd2xlZGdlIHRvIGRldGVybWluZSB3aGljaCB1c2VycyBjYXJlIGFi
b3V0IHBhcml0eQplZmZpY2llbmN5LiBObyBvbmUgaW4gQ2MgaGFzIGNsYXJpZmllZCB0aGlzIGVp
dGhlci4KCj4gSW5zdGVhZCwgeW91IHN0YXJ0ZWQgYSBwb2xsIHRvIHBpY2sgdGhlIGJlc3Qgc29s
dXRpb24uIFRoaXMgaXMgbm90Cj4gd2hhdCBJIGV4cGVjdGVkLCBhbmQgdGhpcyBpcyBub3QgaG93
IHRoZSBiZXN0IHNvbHV0aW9uIGNhbiBiZSBmb3VuZC4KPiAKPiBUbyBILiBQZXRlciBhbmQgZXZl
cnlvbmU6Cj4gCj4gVGhhbmsgeW91IGZvciBzaGFyaW5nIHlvdXIgb3BpbmlvbiBvbiB0aGlzIGZp
eGVkIHBhcml0eSgpLiBZb3VyCj4gYXJndW1lbnRzIG1heSBvciBtYXkgbm90IGJlIGltcG9ydGFu
dCwgZGVwZW5kaW5nIG9uIHdoYXQgZXhpc3RpbmcKPiB1c2VycyBhY3R1YWxseSBuZWVkLiBVbmZv
cnR1bmF0ZWx5LCBLdWFuLVdlaSBkaWRuJ3QgY29sbGVjdAo+IHBlcmZvcm1hbmNlIG51bWJlcnMg
YW5kIG9waW5pb25zIGZyb20gdGhvc2UgcHJvcG9zZWQgdXNlcnMuCj4gCj4gSSBhbHJlYWR5IHRv
bGQgdGhhdCwgYW5kIEkgd2lsbCBzYXkgYWdhaW46IHdpdGggdGhlIGxhY2sgb2YgYW55Cj4gZXZp
ZGVuY2UgdGhhdCBwZXJmb3JtYW5jZSBhbmQvb3IgY29kZSBnZW5lcmF0aW9uIGlzIGltcG9ydGFu
dCBoZXJlLAo+IHRoZSBiZXN0IHNvbHV0aW9uIGlzIG9uZSB0aGF0IG1pbmltaXplcyBtYWludGFp
bmVycycgKG15ISkgYnVyZGVuLgo+IAo+IEluIG90aGVyIHdvcmRzLCBib29sIHBhcml0eSh1bnNp
Z25lZCBsb25nIGxvbmcpLiBJJ20gT0sgdG8gbWFpbnRhaW4KPiBhIG1hY3JvLCBhcyB3ZWxsLiBJ
IHVuZGVyc3RhbmQgdGhhdCBtb3JlIGNvbXBsaWNhdGVkIHNvbHV0aW9ucyBtYXkgYmUKPiBtb3Jl
IGVmZmVjdGl2ZS4gSSB3aWxsIHRha2UgdGhlbSBvbmx5IGlmIHRoZXkgd2lsbCBiZSB3ZWxsIGFk
dm9jYXRlZC4KPiAKQmVmb3JlIFBldGVyIHN1Z2dlc3RlZCBhbiBhcmNoLXNwZWNpZmljIGltcGxl
bWVudGF0aW9uLCBJIHBsYW5uZWQgdG8gZ28Kd2l0aCBhcHByb2FjaCAjMSwgYXMgaXQgbWluaW1p
emVzIG1haW50ZW5hbmNlIG92ZXJoZWFkIGluIHRoZSBhYnNlbmNlCm9mIGNsZWFyIHVzZXIgcmVx
dWlyZW1lbnRzLgoKUGV0ZXIsCkhhdmUgeW91IGlkZW50aWZpZWQgYW55IHVzZXJzIHdobyBjYXJl
IGFib3V0IHBhcml0eSBlZmZpY2llbmN5PwpJZiBub3QsIGRvIHdlIHN0aWxsIG5lZWQgdG8gaW50
cm9kdWNlIGFuIGFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24/CgpSZWdhcmRzLApLdWFuLVdl
aQoKPiBJIGhvcGUgdGhpcyB3aWxsIGhlbHAgdXMgdG8gc3RvcCBtb3ZpbmcgdGhpcyBkaXNjdXNz
aW9uIGJhY2sgYW5kIGZvcnRoCj4gYW5kIHNhdmUgb3VyIHRpbWUsIGd1eXMuCj4gCj4gVGhhbmtz
LAo+IFl1cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
