Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E11C3601E
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQtDoFPWYS2ZKQe/CTkZXnTQbHX6eZh19wwjYzLYw8c=; b=v4BaCwRYY8sgY/
	QoWwpvbmYdoTK30QEVYqgNUWjNoGzLNCyjyX1RqgORdAvQmCRYiz9+FcsLThTS1W+fyEfoPEOOeCg
	7FeJeZpebnRFGTJTQ3NcvuwfWGZRNqVzRTjNaLs/DqkURxQaV1h52rvQDZcJ5r+DQd89E6vzjHDkz
	DK+WMT4qzwhMd6u/nOR/C6GFxcvXwJY+Miit3o9HlY8o8k6xUH9fhelNMSy7VE/fJaMwfE/X8lUlC
	u2GA9/DYQ2Fxg8xmYk7xtUnZ6x1nnIn7aKlXQMYN8AIYwBI5gPEFCrnaIzBXYH/hw/QFKivmrDLUx
	W5nzM9W7UcYdYp1vgPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NCl-00000009KSA-0C8y;
	Thu, 03 Apr 2025 16:14:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NCi-00000009KRX-1XfX
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 16:14:09 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1263893b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743696847; x=1744301647; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
        b=WBP85wV7GIFeSbjQHHQv2Qc7CXoXg6xrjNcOKRQpS2PoEXxhOxEMXDcrKhmuLjNKbP
         /guibC4VsLuD0c7aPKD3mKs3PZdjZfiyd2qFuCHtufQz+RCA/upi2uoNZ7v6pr78qa9j
         uWzi0rU1wqv1zEVvYwPZu/Iut4RfSmTu4a8lQB/4UbUDBoKIiUkaErQP8j1T10RbTCQI
         opvG65Jb7V22LLcwUIvDmB+Ztjw2lvR9JuyIAFQZCDP4MKIEitv2jjrDkcUpK9myad17
         awmKiABImgGABaqTwff+FNW+mnwhkkOjhDkBwsBsO7diBYb6V4koMc2okV4i0T5isOBf
         oTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696847; x=1744301647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
        b=jMbyoobo2Og+U0Xywz7mcHVI66wU9wpfq1+NY05JO08GqN+G77rFAV6iY+tGPun48S
         qKLf1zh5bsK+/Rik27NPIJ3oMcyNg+YzpndK6Uikf3g+r6Eomg0Sh9QWoFs+cd59g3+u
         Z/VerIBZ+YPTSlW5KLb021qnDqSFoJuIMcO6AT9CJu/FuZ+UbH3bVYi0Ga+kGma6PNh1
         u+zGmgxq+Tqo9w7OBR4KxJkBaWfZftLm3rs9twN/CPFb5kGMMc73A/VPJeXGvvvwBJJk
         vYhBd0dXbx8m0DV9loknyaFamxV+g66aBi3vOBcnLJmg+BeXr074ruwiqas06fqbBTPm
         ATkw==
X-Forwarded-Encrypted: i=1; AJvYcCXDp5jK1O2kiQ7LOYJSlJ29WRBHMGGvlGgMSELgtPwEG7czcxNvgyCOoaRCOxEuCdWKRvh/qeWc6kA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBKuRhmK/PdyHitktNjmzYLaOckgVEfb4zrweJytP+Y4WnXKl6
	vQNF2YJqQQp2WygQF8E/aYs1M38JwWfbDlLR9ZkaI+nED6lkyCso
X-Gm-Gg: ASbGncsphMKlkJieXGd48UXazlSK8U4krCj1hPCJGgF+PNIzSIqPLVAkRZOUzH01QLR
	6ifBg4trYt+PWhRgc1bEMsNIq+Uguiagcuy4GT9jbW/942ONIU5XqT6/32SDfN+RLgOq7M2hljr
	9WkJG9yvXZq9GteeZYfRedU6C+mLGKjc42RtnJRxvbs7AWJH+ZfgCReVCyNTOFWsEiQtI74Ikvq
	Pidfl+k2gbtfCeWBg/7Hi42jmVhRVh161lyWP4zjwkP2vJcOXaC1McdWf3j4Y1NhVRL5GhYpD/A
	DYs0Fr8gZmK66Ovu3giduwQkV/0aK9WSkPZaCddFNCtj
X-Google-Smtp-Source: AGHT+IGVU2+2TkhGwc9XcrbXTU+jprAkGrGQEy4B9m6YI+h73paRxRK7YqS+QjyFE8ZrGike3yIkRw==
X-Received: by 2002:a05:6a20:c886:b0:1ee:47e7:7e00 with SMTP id adf61e73a8af0-200f55ecf4dmr5333762637.13.1743696847264;
        Thu, 03 Apr 2025 09:14:07 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd41dsm1416486a12.50.2025.04.03.09.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:14:06 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:14:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
Message-ID: <Z-6zzP2O-Q7zvTLt@thinkpad>
References: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_091408_408951_BF97B789 
X-CRM114-Status: GOOD (  29.55  )
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

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMTA6Mzk6MDNQTSArMDgwMCwgS3Vhbi1XZWkgQ2hpdSB3
cm90ZToKPiBPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAxMjo0MzoyNVBNIC0wNzAwLCBILiBQZXRl
ciBBbnZpbiB3cm90ZToKPiA+IE9uIDMvMjMvMjUgMDg6MTYsIEt1YW4tV2VpIENoaXUgd3JvdGU6
Cj4gPiA+IAo+ID4gPiBJbnRlcmZhY2UgMzogTXVsdGlwbGUgRnVuY3Rpb25zCj4gPiA+IERlc2Ny
aXB0aW9uOiBib29sIHBhcml0eV9vZGQ4LzE2LzMyLzY0KCkKPiA+ID4gUHJvczogTm8gbmVlZCBm
b3IgZXhwbGljaXQgY2FzdGluZzsgZWFzeSB0byBpbnRlZ3JhdGUKPiA+ID4gICAgICAgIGFyY2hp
dGVjdHVyZS1zcGVjaWZpYyBvcHRpbWl6YXRpb25zOyBleGNlcHQgZm9yIHBhcml0eTgoKSwgYWxs
Cj4gPiA+ICAgICAgICBmdW5jdGlvbnMgYXJlIG9uZS1saW5lcnMgd2l0aCBubyBzaWduaWZpY2Fu
dCBjb2RlIGR1cGxpY2F0aW9uCj4gPiA+IENvbnM6IE1vcmUgZnVuY3Rpb25zIG1heSBpbmNyZWFz
ZSBtYWludGVuYW5jZSBidXJkZW4KPiA+ID4gT3BpbmlvbnM6IE9ubHkgSSBzdXBwb3J0IHRoaXMg
YXBwcm9hY2gKPiA+ID4gCj4gPiAKPiA+IE9LLCBzbyBJIHJlc3BvbmRlZCB0byB0aGlzIGJ1dCBJ
IGNhbid0IGZpbmQgbXkgcmVwbHkgb3IgYW55IG9mIHRoZQo+ID4gZm9sbG93dXBzLCBzbyBsZXQg
bWUgZ28gYWdhaW46Cj4gPiAKPiA+IEkgcHJlZmVyIHRoaXMgb3B0aW9uLCBiZWNhdXNlOgo+ID4g
Cj4gPiBhLiBWaXJ0dWFsbHkgYWxsIHVzZXMgb2YgcGFyaXR5IGlzIGRvbmUgaW4gY29udGV4dHMg
d2hlcmUgdGhlIHNpemVzIG9mIHRoZQo+ID4gaXRlbXMgZm9yIHdoaWNoIHBhcml0eSBpcyB0byBi
ZSB0YWtlbiBhcmUgd2VsbC1kZWZpbmVkLCBidXQgaXQgaXMgKnJlYWxseSoKPiA+IGVhc3kgZm9y
IGludGVnZXIgcHJvbW90aW9uIHRvIGNhdXNlIGEgdmFsdWUgdG8gYmUgZXh0ZW5kZWQgdG8gMzIg
Yml0cwo+ID4gdW5uZWNlc3NhcmlseSAoc2lnbiBvciB6ZXJvIGV4dGVuZCwgYWx0aG91Z2ggZm9y
IHBhcml0eSBpdCBkb2Vzbid0IG1ha2UgYW55Cj4gPiBkaWZmZXJlbmNlIC0tIGlmIHRoZSBjb21w
aWxlciByZWFsaXplcyBpdC4pCj4gPiAKPiA+IGIuIEl0IG1ha2VzIGl0IGVhc2llciB0byBhZGQg
YXJjaC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMsIG5vdGFibHkgdXNpbmcKPiA+IF9fYnVpbHRp
bl9wYXJpdHkgb24gYXJjaGl0ZWN0dXJlcyB3aGVyZSB0aGF0IGlzIGtub3duIHRvIGdlbmVyYXRl
IGdvb2QgY29kZS4KPiA+IAo+ID4gYy4gRm9yIGFyY2hpdGVjdHVyZXMgd2hlcmUgb25seSAqc29t
ZSogcGFyaXR5IGltcGxlbWVudGF0aW9ucyBhcmUKPiA+IGZhc3QvcHJhY3RpY2FsLCB0aGUgZ2Vu
ZXJpYyBmYWxsYmFja3Mgd2lsbCBlaXRoZXIgbmF0dXJhbGx5IHN5bnRoZXNpemUgdGhlbQo+ID4g
ZnJvbSBjb21wb25lbnRzIHZpYSBzaGlmdC14b3IsIG9yIHRoZXkgY2FuIGJlIGRlZmluZWQgdG8g
dXNlIGEgbGFyZ2VyCj4gPiB2ZXJzaW9uOyB0aGUgZnVuY3Rpb24gcHJvdG90eXBlIGFjdHMgbGlr
ZSBhIGNhc3QuCj4gPiAKPiA+IGQuIElmIHRoZXJlIGlzIGEgcmVhc29uIGluIHRoZSBmdXR1cmUg
dG8gYWRkIGEgZ2VuZXJpYyB2ZXJzaW9uLCBpdCBpcyByZWFsbHkKPiA+IGVhc3kgdG8gZG8gdXNp
bmcgdGhlIHNpemUtc3BlY2lmaWMgZnVuY3Rpb25zIGFzIGNvbXBvbmVudHM7IHRoaXMgaXMKPiA+
IHNvbWV0aGluZyB3ZSBkbyBsaXRlcmFsbHkgYWxsIG92ZXIgdGhlIHBsYWNlLCB1c2luZyBhIHBh
dHRlcm4gc28gY29tbW9uIHRoYXQKPiA+IGl0LCBpdHNlbGYsIHByb2JhYmx5IHNob3VsZCBiZSBt
YWNyb2l6ZWQ6Cj4gPiAKPiA+ICNkZWZpbmUgcGFyaXR5KHgpIAkJCQlcCj4gPiAoewkJCQkJCVwK
PiA+IAl0eXBlb2YoeCkgX194ID0gKHgpOwkJCVwKPiA+IAlib29sIF9feTsJCQkJXAo+ID4gCXN3
aXRjaCAoc2l6ZW9mKF9feCkpIHsJCQlcCj4gPiAJCWNhc2UgMToJCQkJXAo+ID4gCQkJX195ID0g
cGFyaXR5OChfX3gpOwlcCj4gPiAJCQlicmVhazsJCQlcCj4gPiAJCWNhc2UgMjoJCQkJXAo+ID4g
CQkJX195ID0gcGFyaXR5MTYoX194KTsJXAo+ID4gCQkJYnJlYWs7CQkJXAo+ID4gCQljYXNlIDQ6
CQkJCVwKPiA+IAkJCV9feSA9IHBhcml0eTMyKF9feCk7CVwKPiA+IAkJCWJyZWFrOwkJCVwKPiA+
IAkJY2FzZSA4OgkJCQlcCj4gPiAJCQlfX3kgPSBwYXJpdHk2NChfX3gpOwlcCj4gPiAJCQlicmVh
azsJCQlcCj4gPiAJCWRlZmF1bHQ6CQkJXAo+ID4gCQkJQlVJTERfQlVHKCk7CQlcCj4gPiAJCQli
cmVhazsJCQlcCj4gPiAJfQkJCQkJXAo+ID4gCV9feTsJCQkJCVwKPiA+IH0pCj4gPgo+IFRoYW5r
IHlvdSBmb3IgeW91ciBkZXRhaWxlZCByZXNwb25zZSBhbmQgZm9yIGV4cGxhaW5pbmcgdGhlIHJh
dGlvbmFsZQo+IGJlaGluZCB5b3VyIHByZWZlcmVuY2UuIFRoZSBwb2ludHMgeW91IG91dGxpbmVk
IGluIChhKeKAkyhkKSBhbGwgc2VlbQo+IHF1aXRlIHJlYXNvbmFibGUgdG8gbWUuCj4gCj4gWXVy
eSwKPiBkbyB5b3UgaGF2ZSBhbnkgZmVlZGJhY2sgb24gdGhpcz8KPiBUaGFuayB5b3UuCgpNeSBm
ZWVkYmFjayB0byB5b3U6CgpJIGFza2VkIHlvdSB0byBzaGFyZSBhbnkgbnVtYmVycyBhYm91dCBl
YWNoIGFwcHJvYWNoLiBBc20gbGlzdGluZ3MsCnBlcmZvcm1hbmNlIHRlc3RzLCBibG9hdC1vLW1l
dGVyLiBCdXQgeW91IGRpZCBub3RoaW5nIG9yIHZlcnkgbGl0dGxlCmluIHRoYXQgZGVwYXJ0bWVu
dC4gWW91IG1vdmUgdGhpcyBzZXJpZXMsIGFuZCBpdCBtZWFucyB5b3Ugc2hvdWxkIGJlCnZlcnkg
d2VsbCBhd2FyZSBvZiBhbHRlcm5hdGl2ZSBzb2x1dGlvbnMsIHRoZWlyIHByb3MgYW5kIGNvbnMu
CgpJbnN0ZWFkLCB5b3Ugc3RhcnRlZCBhIHBvbGwgdG8gcGljayB0aGUgYmVzdCBzb2x1dGlvbi4g
VGhpcyBpcyBub3QKd2hhdCBJIGV4cGVjdGVkLCBhbmQgdGhpcyBpcyBub3QgaG93IHRoZSBiZXN0
IHNvbHV0aW9uIGNhbiBiZSBmb3VuZC4KClRvIEguIFBldGVyIGFuZCBldmVyeW9uZToKClRoYW5r
IHlvdSBmb3Igc2hhcmluZyB5b3VyIG9waW5pb24gb24gdGhpcyBmaXhlZCBwYXJpdHkoKS4gWW91
cgphcmd1bWVudHMgbWF5IG9yIG1heSBub3QgYmUgaW1wb3J0YW50LCBkZXBlbmRpbmcgb24gd2hh
dCBleGlzdGluZwp1c2VycyBhY3R1YWxseSBuZWVkLiBVbmZvcnR1bmF0ZWx5LCBLdWFuLVdlaSBk
aWRuJ3QgY29sbGVjdApwZXJmb3JtYW5jZSBudW1iZXJzIGFuZCBvcGluaW9ucyBmcm9tIHRob3Nl
IHByb3Bvc2VkIHVzZXJzLgoKSSBhbHJlYWR5IHRvbGQgdGhhdCwgYW5kIEkgd2lsbCBzYXkgYWdh
aW46IHdpdGggdGhlIGxhY2sgb2YgYW55CmV2aWRlbmNlIHRoYXQgcGVyZm9ybWFuY2UgYW5kL29y
IGNvZGUgZ2VuZXJhdGlvbiBpcyBpbXBvcnRhbnQgaGVyZSwKdGhlIGJlc3Qgc29sdXRpb24gaXMg
b25lIHRoYXQgbWluaW1pemVzIG1haW50YWluZXJzJyAobXkhKSBidXJkZW4uCgpJbiBvdGhlciB3
b3JkcywgYm9vbCBwYXJpdHkodW5zaWduZWQgbG9uZyBsb25nKS4gSSdtIE9LIHRvIG1haW50YWlu
CmEgbWFjcm8sIGFzIHdlbGwuIEkgdW5kZXJzdGFuZCB0aGF0IG1vcmUgY29tcGxpY2F0ZWQgc29s
dXRpb25zIG1heSBiZQptb3JlIGVmZmVjdGl2ZS4gSSB3aWxsIHRha2UgdGhlbSBvbmx5IGlmIHRo
ZXkgd2lsbCBiZSB3ZWxsIGFkdm9jYXRlZC4KCkkgaG9wZSB0aGlzIHdpbGwgaGVscCB1cyB0byBz
dG9wIG1vdmluZyB0aGlzIGRpc2N1c3Npb24gYmFjayBhbmQgZm9ydGgKYW5kIHNhdmUgb3VyIHRp
bWUsIGd1eXMuCgpUaGFua3MsCll1cnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
