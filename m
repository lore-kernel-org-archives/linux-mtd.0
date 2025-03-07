Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEEC28B24
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsgZtP9QLJnGuJHnK2VLZTHgniIY0wEW7HsyXsNTS6Q=; b=XurES3uHppgW1U
	uFVdnLgZ1b47cgTI50tJDjzVrb0uuYYITgBhdONxUdJQE/Wp9GE//XS9YS88yKRhpqE4dq1GD3njW
	yxTkWquI9+J7DI3p5FGV2ejuzNIcRrIqyaP7hNlnRae5a8SF5ohq44hKYOfymdi7GI+O/SAFiiWR3
	yJmbF9L5Uu6IhLpX4qXnf5dkWDulo19PupvsSQpKFAOhOs0NLdFAFZucSuNJTBMhQoCzQxf3H/Ntq
	CHXMRBBJoLEVW5RPKISG299qGhpnDNbC3pxuKIVjN/fFVp6Ds2Up+Wo7cNfSijp8zuFoYZKXo0PmG
	zUqLTBdPrd1DAnVXEJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcSj-0000000FECJ-3ul1;
	Fri, 07 Mar 2025 18:30:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcSh-0000000FEB8-2QT9
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 18:30:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22409077c06so14332395ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 07 Mar 2025 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741372218; x=1741977018; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
        b=WlZdfbzZRK4CZhix/umwGoXYZZOTyRDLrxcghoA8bUeYCWnCPMcfwJnHzWqytG0Cin
         tdeSyyrNQzTGbSBWaqHuPPrXJul40QAd2DbSG47iKPRPgTh5/xKmraZitpfd6ZLXEZwy
         z6MPXWPGs2ppVbMpYO93h2x3AY6OqcWK0WeAroJftWm4Glh2T3v8fzyzvTNft000bCzn
         5ns0HmtjbvXrWIrZsxwZW791oGN4j2dsQccMmLkLy01IP3XZ793s/ZCuQwpNzcfE8zGk
         E+yOIjUwfmL8leJJ9adnI1jjNrPM4ZWnQkQO2DvW4/8IhK1jqzeSUXryY1JUKK5v0hnL
         Qu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741372218; x=1741977018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADljs+6QUrhT8gv23eyNcU2smhHAIyZh+jPjPfAngag=;
        b=B6LRnhqTPp1+AAxPgZH9UrvVuMKDmEbIojbO4Pi9OJ/J7U98QTilpnnxRML4VWpeIa
         yFDjUU2lOGY2RWdxql6L4nyQGO5LvlE7565K8RwS3cvQKG8YlKpEZj0MTCtGLrPi8sBp
         Yf1vLM/jY6kLkXJabFkBNBiDRDjsfKxILMkrG+NlRrLqRp5gBnivRpqfSqUjARVgf1Z5
         CUn26fb8mVC9hBQj0v9DqSle8RHGLzTlMJW0lVtXuw19FdYbIH9j+r6wa4xZj2qjyFHV
         UJUXCyUtXxAowV7J+FxC25uJPTpUQNKWXB/nJVpRCMydBEZgzW67ffwtSnJUYDy35Y9I
         +nHg==
X-Forwarded-Encrypted: i=1; AJvYcCXw1+ZHGaflkADFK7oTxjlWjJ7mkNTCYNyBhAWl2LOIr7q1vtkc6ke/0mHnoKNDSM18zz+7vNuFMbY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYH/4nXRQO+8vvr5Tgf6rFjuxtkXM8ZEasaYRiveI9jKqs/ORg
	8JUapE6DnalFkuZKxxrea3KdORklwvK/IxnPH83wh8xHf2ePLgyc
X-Gm-Gg: ASbGncsPh+IYflcP1UkS/SziLlmKnLolgh/2h9oYQQ6FcwwHHTvziZ2A0FzWyUv36Jg
	KpuJPvT7qm2QSW/PdMukW7Wh/26pCVSKUM0lOZJ4kPRkk3MfVh1EBxZ7s9qg9MF1U+HNcfYyTs7
	gSfmpndG8/Yf+4HW6tNO7YepfJag7vuBwZeIPHf2hINyCTWbmHTPGdnS7cBoi2ZiLYa5sDiGetm
	nVeu+4SRsRKE9z4fshfthpkaZQZe09U3+DOB1n6UGUPuQl0cA8UvP+t7x6Y/kIHidGTubl3jznG
	gTjO1AQuMN909X0AUuPJzreeibqoBgFufZkU6UHIFGBQ/jGYbWnqqOoS5v7h4yjR4sA1Ejej
X-Google-Smtp-Source: AGHT+IHgn9VYVN+pY6VrcRSpGmZ1OnVGCCY/wp+YVj8MkJGAiDKX4lh0yxX6MBBGMkwIe7/wx2wiPQ==
X-Received: by 2002:a05:6a00:139a:b0:736:520a:58f9 with SMTP id d2e1a72fcca58-736aaadf082mr5830777b3a.17.1741372218220;
        Fri, 07 Mar 2025 10:30:18 -0800 (PST)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f7268sm3588473b3a.116.2025.03.07.10.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 10:30:17 -0800 (PST)
Date: Sat, 8 Mar 2025 02:30:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z8s7L+ZCI/yM5qm4@visitorckw-System-Product-Name>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <3dfc81eb-caa1-42fe-8fd6-61101de0ef13@kernel.org>
 <Z8sW4c5LxV-ITdCi@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8sW4c5LxV-ITdCi@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_103019_615083_789F2225 
X-CRM114-Status: GOOD (  25.92  )
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

SGkgWXVyeSwKCk9uIEZyaSwgTWFyIDA3LCAyMDI1IGF0IDEwOjU1OjEzQU0gLTA1MDAsIFl1cnkg
Tm9yb3Ygd3JvdGU6Cj4gT24gRnJpLCBNYXIgMDcsIDIwMjUgYXQgMDc6NTc6NDhBTSArMDEwMCwg
SmlyaSBTbGFieSB3cm90ZToKPiA+IE9uIDA2LiAwMy4gMjUsIDE3OjI1LCBLdWFuLVdlaSBDaGl1
IHdyb3RlOgo+ID4gPiBTZXZlcmFsIHBhcnRzIG9mIHRoZSBrZXJuZWwgY29udGFpbiByZWR1bmRh
bnQgaW1wbGVtZW50YXRpb25zIG9mIHBhcml0eQo+ID4gPiBjYWxjdWxhdGlvbnMgZm9yIDE2LzMy
LzY0LWJpdCB2YWx1ZXMuIEludHJvZHVjZXMgZ2VuZXJpYwo+ID4gPiBwYXJpdHkxNi8zMi82NCgp
IGhlbHBlcnMgaW4gYml0b3BzLmgsIHByb3ZpZGluZyBhIHN0YW5kYXJkaXplZAo+ID4gPiBhbmQg
b3B0aW1pemVkIGltcGxlbWVudGF0aW9uLgo+ID4gPiAKPiA+ID4gU3Vic2VxdWVudCBwYXRjaGVz
IHJlZmFjdG9yIHZhcmlvdXMga2VybmVsIGNvbXBvbmVudHMgdG8gcmVwbGFjZQo+ID4gPiBvcGVu
LWNvZGVkIHBhcml0eSBjYWxjdWxhdGlvbnMgd2l0aCB0aGUgbmV3IGhlbHBlcnMsIHJlZHVjaW5n
IGNvZGUKPiA+ID4gZHVwbGljYXRpb24gYW5kIGltcHJvdmluZyBtYWludGFpbmFiaWxpdHkuCj4g
PiA+IAo+ID4gPiBDby1kZXZlbG9wZWQtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yMTV4QGdtYWls
LmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IxNXhAZ21haWwu
Y29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLdWFuLVdlaSBDaGl1IDx2aXNpdG9yY2t3QGdtYWls
LmNvbT4KPiA+ID4gLS0tCj4gPiA+IEluIHYzLCBJIHVzZSBwYXJpdHlYWCgpIGluc3RlYWQgb2Yg
dGhlIHBhcml0eSgpIG1hY3JvIHNpbmNlIHRoZQo+ID4gPiBwYXJpdHkoKSBtYWNybyBtYXkgZ2Vu
ZXJhdGUgc3Vib3B0aW1hbCBjb2RlIGFuZCByZXF1aXJlcyBzcGVjaWFsIGhhY2tzCj4gPiA+IHRv
IG1ha2UgR0NDIGhhcHB5LiBJZiBhbnlvbmUgc3RpbGwgcHJlZmVycyBhIHNpbmdsZSBwYXJpdHko
KSBtYWNybywKPiA+ID4gcGxlYXNlIGxldCBtZSBrbm93Lgo+ID4gCj4gPiBXaGF0IGlzIHN1Ym9w
dGltYWwgYW5kIHdoZXJlIGV4YWN0bHkgaXQgbWF0dGVycz8gSGF2ZSB5b3UgYWN0dWFsbHkgbWVh
c3VyZWQKPiA+IGl0Pwo+IAo+IEkgYXNrZWQgZXhhY3RseSB0aGlzIHF1ZXN0aW9uIGF0IGxlYXN0
IDMgdGltZXMsIGFuZCBoYXZlIG5ldmVyCj4gcmVjZWl2ZWQgcGVyZiB0ZXN0cyBvciBhc20gbGlz
dGluZ3MgLSBub3RoaW5nLiBJJ3ZlIG5ldmVyIHJlY2VpdmVkCj4gYW55IGNvbW1lbnRzIGZyb20g
ZHJpdmVyIG1haW50YWluZXJzIGFib3V0IGhvdyBwZXJmb3JtYW5jZSBvZiB0aGUKPiBwYXJpdHko
KSBpcyBpbXBvcnRhbnQgZm9yIHRoZW0sIGFzIHdlbGwuCj4gClRvIGJlIGNsZWFyLCBJIHVzZSBw
YXJpdHlYWCgpIHdhcyBtYWlubHkgYmVjYXVzZSB5b3UgZGlzbGlrZSB0aGUgPj4KMTYgPj4gMTYg
aGFjaywgYW5kIEkgZGlzbGlrZSB0aGUgI2lmIGdjYyAjZWxzZSBoYWNr4oCUbm90IGR1ZSB0bwpw
ZXJmb3JtYW5jZSBvciBnZW5lcmF0ZWQgY29kZSBjb25zaWRlcmF0aW9ucy4KCj4gV2l0aCB0aGUg
YWJzZW5jZSBvZiBfYW55XyBmZWVkYmFjaywgSSdtIG5vdCBnb2luZyB0byB0YWtlIHRoaXMgc2Vy
aWVzLAo+IG9mIGNvdXJzZSwgZm9yIHRoZSByZWFzb246IG92ZXJlbmdpbmVlcmluZy4KPiAKSSdt
IHF1aXRlIHN1cnByaXNlZCB0aGF0IHRocmVlIHNlcGFyYXRlIG9uZS1saW5lIGZ1bmN0aW9ucyBh
cmUKY29uc2lkZXJlZCBvdmVyZW5naW5lZXJpbmcgY29tcGFyZWQgdG8gYSBtdWx0aS1saW5lIGFw
cHJvYWNoIHRoYXQKcmVxdWlyZXMgc3BlY2lhbCBoYW5kbGluZyB0byBzYXRpc2Z5IGdjYy4KCj4g
V2l0aCB0aGF0IHNhaWQsIHRoZSBzaW1wbGVzdCB3YXkgd291bGQgYmUgcmVwbGFjaW5nIHBhcml0
eTgodTgpIHdpdGgKPiBwYXJpdHkodTY0KSAnb25lIHNpemUgZml0cyBhbGwnIHRoaW5nLiBJIGV2
ZW4gbWFkZSBhIG9uZSBleHRyYSBzdGVwLAo+IHN1Z2dlc3RpbmcgYSBtYWNybyB0aGF0IHdvdWxk
IGdlbmVyYXRlIGEgYmV0dGVyIGNvZGUgZm9yIHNtYWxsZXIgdHlwZXMKPiB3aXRoIGFsbW9zdCBu
byBleHRyYSBtYWludGVuYW5jZSBidXJkZW4uIFRoaXMgaXMgYW5vdGhlciBhY2NlcHRhYmxlCj4g
b3B0aW9uIHRvIG1lLgo+IApJJ20gZmluZSB3aXRoIHVuaWZ5aW5nIGV2ZXJ5dGhpbmcgdG8gYSBz
aW5nbGUgcGFyaXR5KHU2NCkgZnVuY3Rpb24uCkJlZm9yZSBJIHN1Ym1pdCB0aGUgbmV4dCB2ZXJz
aW9uLCBwbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55b25lIGhhcwpvYmplY3Rpb25zIHRvIHRoaXMg
YXBwcm9hY2guCgpSZWdhcmRzLApLdWFuLVdlaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
