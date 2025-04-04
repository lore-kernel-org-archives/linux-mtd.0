Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED8C3601E
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZmY7b4187GFqKPtW2FpE0JO2CdBn7vfHCGfmXRL69g=; b=CjV/mAQjoLNQ8B
	t45SXaQCsRl88t0hEyF4WJZ4BJpckpfB5WrtxrbrGl/H2MCjlij85OL3+n54LnJhZ+r13VBERWugO
	hm6ZTCA8mWdIPIVwXegpUGLfRQJaC5FgHc4x37DNrQCkspSyshJzXMhGquH+elTaF681OGixfQSp6
	+23r9sXs7W2C7Li4j6Ln5Ixvg7TzWYKN6qLS7I+657VqX5eV2OordPDykOotLal3Jf83GZFbL8bCg
	M8Qn7xBRroDRWozC0+NhC4/e4XEpcvKuHgM5B9RH/prV0Ec6DxsvQkyI22eTEgWzHqR9rhIxVtxbq
	HlH+oRAGb8aUSLnpjHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cii-0000000BBp4-1ggJ;
	Fri, 04 Apr 2025 08:48:12 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cif-0000000BBoQ-3XJU
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 08:48:11 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af19b9f4c8cso1255121a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2025 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756489; x=1744361289; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKYFZl2hMBVvq/tGTvaEyWP0BJSuPsnZGbFqpvTq3m8=;
        b=V0jQykFz4uYewaq3XFinqHk6zWQIsVCKHPx5mcvaC4jAhyCcg5vHfOW+PCagTqbUvR
         r/FjE/t8uIztKAkXU3UV7oNVH3G/vsIzQK+ys+raOHqEE2IKr4WkR8Ge25+3MeJpsxoK
         XgTKt1jTuccGFRTIeRDszcY7RQwOOHzuPkARMhflR3kD+iyEe6fuO3i1VoF7sxAuCq9W
         t6ZeUoQVh9/hSv6JhAQ8uiJgZDLhNlp1r2T8myZx6GxSrCe5r2S8Cy97EsZ9p1v7YYuW
         dcixTy0n3QS6zNfkaa2Ul1Wv06dMsODDiSBVakGHjIUsGDkifV4MyUwW1bzfHkJWTigw
         jsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756489; x=1744361289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKYFZl2hMBVvq/tGTvaEyWP0BJSuPsnZGbFqpvTq3m8=;
        b=gzEYhIK2NhSoxip0KayuVIO7lvrbo8OxMbRLkjRCEer5e6rGsaw+aIgFLm1cMvEKjM
         4jD9tH6z+04+GRpfLMkPVg8dbYaCwL2ghTKZIWjVXpUuVge+LEI3edglLmrgk2FakJgC
         jO8Jy14zKsRkqlnP5aXL2pWeakNp/4f8GEMu1cPNm5Njkgp7hrm/lydSlkrmA4zSkOPq
         dolYOlUP+7/bLDv7oYyq7DpurEBKnBGzvLOuWazmlPCD5jHpaFqsLAkfKWF+DlMFJQyE
         7KrmCE3Qw9uQBq++BPywIwziTGKgX7EY3VZyrY/f+aGE0lZOn0EoB90RGKaNkJ11rlEk
         NUTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8RMVZODLU6iOYaSZL4AxFiyj22qK9jqf8qvWlwaO1tbdNnhVXRYP5gH86U84tBCN75NMCxSJRo1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVje9CWEt+Flj0xChU1reK3/X2XOATwA2q6rMrXKUCg0i8Pz/i
	hi6aubN9EkUMo7mnbiraE88yOOwj4iECaEFsJ7qT50MjH3P2/Fle
X-Gm-Gg: ASbGnctGyf1AB80Tr9e5kVOnT1aok+YEWeAuozbHZ4gK1IpUbrPD1FNHVFarploh70n
	4HtNEGpqc1aizG0G/cvqRRmIKWQ+GUwNi3pI3moue0d4Pj8ZlBEV5rPlSUoiRe6krAJw2Mwic55
	QEYjaX9vrIoJQ+oXmZ2G2avKxUxgXzrqFszyMip15scP2U7X9+itcoK61w6Mr5oGhJHQ4hyhzoz
	Zi8PDb5bSeujwPOCemBK+uP+wwD/mngaUWOSXrcuwPMzsmTMW7b4GgeH+rlrcb+e4NXsQ3YycGM
	0byE7xYeAGI62AXoaNHbBIq8zQQPLhs1o1wvf0Jy3L0QdDp53kGFdTlwVNIZSZ+5JcOKCQnO
X-Google-Smtp-Source: AGHT+IHQy54LZ/NyiSvEoks7UryUue+uQARWbnhEUMyhIJqZeMH+xfpWnZ/jGnglOqtjlSonVKNhIw==
X-Received: by 2002:a05:6a21:999d:b0:1f5:8748:76cc with SMTP id adf61e73a8af0-20108188cdemr3659983637.31.1743756488698;
        Fri, 04 Apr 2025 01:48:08 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc32c999sm2377463a12.19.2025.04.04.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:48:07 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:47:58 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z++cvrLOz2VAaUkO@visitorckw-System-Product-Name>
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
X-CRM114-CacheID: sfid-20250404_014809_883989_BFF90F50 
X-CRM114-Status: GOOD (  34.58  )
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
cm5hdGl2ZSBzb2x1dGlvbnMsIHRoZWlyIHByb3MgYW5kIGNvbnMuCj4gCkl0IHNlZW1zIHRoZSBj
b25jZXJuIGlzIHRoYXQgSSBkaWRuJ3QgcHJvdmlkZSBhc3NlbWJseSByZXN1bHRzIGFuZApwZXJm
b3JtYW5jZSBudW1iZXJzLiBXaGlsZSBJIGJlbGlldmUgdGhhdCBsaXN0aW5nIHRoZXNlIG51bWJl
cnMgYWxvbmUKY2Fubm90IHByb3ZlIHdoaWNoIHVzZXJzIHJlYWxseSBjYXJlIGFib3V0IHBhcml0
eSBlZmZpY2llbmN5LCBJIGhhdmUKaW5jbHVkZWQgdGhlIGFzc2VtYmx5IHJlc3VsdHMgYW5kIG15
IGluaXRpYWwgb2JzZXJ2YXRpb25zIGJlbG93LiBTb21lCmRpZmZlcmVuY2VzLCBsaWtlIG1vdiB2
cyBtb3Z6aCwgYXJlIGxpa2VseSBkaWZmaWN1bHQgdG8gbWVhc3VyZS4KCkNvbXBpbGF0aW9uIG9u
IHg4Ni02NCB1c2luZyBHQ0MgMTQuMiB3aXRoIE8yIE9wdGltaXphdGlvbjoKCkxpbmsgdG8gR29k
Ym9sdDogaHR0cHM6Ly9nb2Rib2x0Lm9yZy96L0VzcVBNejhjcQoKRm9yIHU4IElucHV0OgotICMy
IGFuZCAjMyBnZW5lcmF0ZSBleGFjdGx5IHRoZSBzYW1lIGFzc2VtYmx5IGNvZGUsIHdoaWxlICMx
IHJlcGxhY2VzCiAgb25lIGBtb3ZgIGluc3RydWN0aW9uIHdpdGggYG1vdnpoYCwgd2hpY2ggbWF5
IHNsaWdodGx5IHNsb3cgZG93biB0aGUKICBwZXJmb3JtYW5jZSBkdWUgdG8gemVybyBleHRlbnNp
b24uCi0gRWZmaWNpZW5jeTogIzIgPSAjMyA+ICMxCgpGb3IgdTE2IElucHV0OgotIEFzIHdpdGgg
dTggaW5wdXQsICMxIHBlcmZvcm1zIGFuIHVubmVjZXNzYXJ5IHplcm8gZXh0ZW5zaW9uLCB3aGls
ZSAjMwogIHJlcGxhY2VzIG9uZSBvZiB0aGUgYHNocmAgaW5zdHJ1Y3Rpb25zIGluICMyIHdpdGgg
YSBgbW92YCwgbWFraW5nIGl0CiAgc2xpZ2h0bHkgZmFzdGVyLgotIEVmZmljaWVuY3k6ICMzID4g
IzIgPiAjMQoKRm9yIHUzMiBJbnB1dDoKLSAjMSBoYXMgYW4gYWRkaXRpb25hbCBgbW92YCBpbnN0
cnVjdGlvbiBjb21wYXJlZCB0byAjMiwgYW5kICMyIGhhcyBhbgogIGV4dHJhIGBzaHJgIGluc3Ry
dWN0aW9uIGNvbXBhcmVkIHRvICMzLgotIEVmZmljaWVuY3k6ICMzID4gIzIgPiAjMQoKRm9yIHU2
NCBJbnB1dDoKLSAjMSBhbmQgIzIgZ2VuZXJhdGUgdGhlIHNhbWUgY29kZSwgYnV0ICMzIGhhcyBv
bmUgbGVzcyBgc2hyYAogIGluc3RydWN0aW9uIGNvbXBhcmVkIHRvIHRoZSBvdGhlcnMuCi0gRWZm
aWNpZW5jeTogIzMgPiAjMSA9ICMyCgotLS0KCkFkZGluZyAtbTMyIEZsYWcgdG8gVmlldyBBc3Nl
bWJseSBmb3IgMzItYml0IE1hY2hpbmU6CgpMaW5rIHRvIEdvZGJvbHQ6IGh0dHBzOi8vZ29kYm9s
dC5vcmcvei9HclBhODZFcTUKCkZvciB1OCBJbnB1dDoKLSAjMiBhbmQgIzMgZ2VuZXJhdGUgaWRl
bnRpY2FsIGFzc2VtYmx5IGNvZGUsIHdoZXJlYXMgIzEgaGFzIGFkZGl0aW9uYWwKICBgbW92YCwg
YHNocmAsIGFuZCBgcHVzaC9wb3BgIGluc3RydWN0aW9ucy4KLSBFZmZpY2llbmN5OiAjMiA9ICMz
ID4gIzEKCkZvciB1MTYgSW5wdXQ6Ci0gIzEgdXNlcyBhIGxvdCBvZiBgeG1tYCByZWdpc3RlciBv
cGVyYXRpb25zLCBtYWtpbmcgaXQgc2xvd2VyIHRoYW4gIzIKICBhbmQgIzMuIEFkZGl0aW9uYWxs
eSwgIzIgaGFzIGFuIGV4dHJhIGBzaHJgIGluc3RydWN0aW9uIGNvbXBhcmVkIHRvICMzLgotIEVm
ZmljaWVuY3k6ICMzID4gIzIgPiAjMQoKRm9yIHUzMiBJbnB1dDoKLSAjMSBhZ2FpbiB1c2VzIGEg
bG90IG9mIGB4bW1gIHJlZ2lzdGVyIG9wZXJhdGlvbnMsIHNvIGl0IGlzIHNsb3dlcgogIHRoYW4g
IzIgYW5kICMzLCBhbmQgIzIgaGFzIGFuIGFkZGl0aW9uYWwgYHNocmAgaW5zdHJ1Y3Rpb24gY29t
cGFyZWQgdG8gIzMuCi0gRWZmaWNpZW5jeTogIzMgPiAjMiA+ICMxCgpGb3IgdTY0IElucHV0Ogot
IEJvdGggIzEgYW5kICMyIHVzZSBgeG1tYCByZWdpc3RlciBvcGVyYXRpb25zLCBidXQgIzEgaGFz
IGEgZmV3IGV4dHJhCiAgYG1vdmRxYWAgaW5zdHJ1Y3Rpb25zLiAjMyBpcyBtb3JlIGNvbmNpc2Us
IHVzaW5nIGEgZmV3IGBzaHJgLCBgeG9yYCwKICBhbmQgYG1vdmAgaW5zdHJ1Y3Rpb25zIHRvIGNv
bXBsZXRlIHRoZSBvcGVyYXRpb24uCi0gRWZmaWNpZW5jeTogIzMgPiAjMiA+ICMxCgpSZWdhcmRz
LApLdWFuLVdlaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
