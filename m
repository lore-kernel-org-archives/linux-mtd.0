Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673BEC0219B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 03:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjxm0eXJdZNH6xGHApaBipoVfsPpSNCJbt2UWau93g0=; b=SKJtpOw3LvnOLN
	NgLV56OiEmjpESuHXTXCxn53oxnlY8/XBUYtxctNo4QYjKLE3cqVAo6UNXe/UXnhhKUdTDn4JIlI3
	VuD/07EZAxJdhiAGcXbX6pW2sT5ygUYrvs9p0vBFo22ylQpDm2VxoH1nZz9oZqjbMmboAgKa02DKr
	gL1r6tqDtt+LMtd3L7upIuRqn7V4ichNx4iD2FQnuHSzowlLsJcQ3GFz3jBfW5YwsM0lrTpkceZY2
	EkgF569CEqR3WN6qv3NjjObehUcRGx3asKYMQhQ51XqNOMSI8JuPq6jHiXYG9lP/7vXKLBQVJ6tp6
	uc9bOPWS7AVAlkD/YwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thKVw-0000000G4nP-1tgc;
	Mon, 10 Feb 2025 03:31:16 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thKVt-0000000G4lr-3Lp1
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 03:31:14 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fa345713a8so4309648a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 19:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739158273; x=1739763073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76A9PBO+S4wv2+n/JHC8Qbod4Dj92aF5P7rG4zB3pWI=;
        b=AaK8zb9hzH1MqWbo4J7BEMqu1Ew+QR2zUioKlmsaiSpmoLZfmUvSqQiAvEi8N1M/nL
         3Xl0+ZW+IsG+85erAVuOJgED16L276wqFh+hs9vBtCDivpPs2/Jk41ye8SHXH0G37AYd
         dqcbiF+8isd2W/YMJOsMhl8Pi1S4konNrLFljxlbT2dziyrmD2NFhxbZVwp8Qhj5eNin
         wAcfCLytPKtQ4hTeILoLuUKqV1Ejg5640iVJV/oOefSPAySjKQacA4Pk0gg38jKNN4E4
         4nXsX2Eew22a0lQeo1fWEi6OZ2pJ3yvevDvPL/nn9B11zohUcm/8uOc/x32GzBoRt7p6
         8ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739158273; x=1739763073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76A9PBO+S4wv2+n/JHC8Qbod4Dj92aF5P7rG4zB3pWI=;
        b=ETiPeC3F8z+J7j1Li0cJ5fUcA+ha+1IpApAdFAMUczqMv3xnl2/qkIsSa9hWlhhVou
         ljE5I9MiO6zt8pbdVRdzy0FbLWxj7Vcc2ucvMNxrwYfpx0llgtQmo8fVRPZS30O0ikEE
         X2gBMGN+MrjqoDS+nTAWeVULj+6nT2LhEmF0ZgLCMxWlh4MUTZJQ1Qkb8kzmr17B7/UX
         0MX4PdW7H2/ApzLJ19YUCkXCZNyfc4Y6ZcmLJbdm2t9qpo1L3CK+Jz/IjstoWKLpVqvD
         vlo7QdpTFzKJcZd4ZRc9Q6TR+V1WLh8KvjijkGmJ+qSlv7RkVOFa0+9j/E20NJTtK4XA
         91XA==
X-Forwarded-Encrypted: i=1; AJvYcCVYGGX2sal5ze+WA6gT9gBOpObXaH7zAjGUsANB9vSKWbzi6NUs7My/KPG+f7gJ6cbkhkyylVjIxDI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDCnP/XZAsMMVacwd/QfkTS745jUMsoy1fZgXYSOzmHeteBnt
	NDkTVL4eDydQZXKG/L3EAYfhdpGIvs1A4VxdHnXi4W6AlmvoXX+0aFOClODjBeYwuPBUxgd3IQY
	audxfo/IYE4huItqseuayzj4PbOg=
X-Gm-Gg: ASbGncsk2qo98lwn5sMr8uWXnmh7SSu8DZhZxCPcTQL/33IwusQlnKKzfpdfzK1ORbd
	hTnPscVdhDsbVxNzuHfAO6kXg4HI1m6/ecw2WISBalyogfzBBTp6ODqcSsQ9W+4lRBpIsu7cJ
X-Google-Smtp-Source: AGHT+IGspnQFdMK07n9rreinJUGIQVxLJ190e4UhtTGJFBM9IuQKpq5qf7Y1KZrF2sPLKlDV9/Mx6+VaNYmth6g5N+s=
X-Received: by 2002:a17:90a:d443:b0:2f6:f32e:90ac with SMTP id
 98e67ed59e1d1-2fa24066820mr19017490a91.11.1739158272917; Sun, 09 Feb 2025
 19:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-2-linchengming884@gmail.com> <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
In-Reply-To: <1c1da131-a7b1-4c2e-9866-d7833a134033@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 11:27:04 +0800
X-Gm-Features: AWEUYZmU6xSOnv0TV2wLY5Bey99PtaRVUwJAxIxTo7wIml2ZMdufwTYDyepL_MI
Message-ID: <CAAyq3Sb4WZtjq6-jYqHYympSxLgf=Oifcf2BmV+pVLJGc8=oYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad
 Input Page Program
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_193113_836576_7D88A5F5 
X-CRM114-Status: GOOD (  16.95  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI15bm0MuaciDfml6Ug6YCx5LqUIOS4i+WNiDQ6Mzflr6vpgZPvvJoKPgo+IEhpLCBDaGVuZywK
Pgo+IE9uIDIvNy8yNSA4OjE4IEFNLCBDaGVuZyBNaW5nIExpbiB3cm90ZToKPiA+IEFsdGhvdWdo
IGNlcnRhaW4gTWFjcm9uaXggTk9SIGZsYXNoIHN1cHBvcnQgdGhlIFF1YWQgSW5wdXQgUGFnZSBQ
cm9ncmFtCj4gPiBmZWF0dXJlLCB0aGUgY29ycmVzcG9uZGluZyBpbmZvcm1hdGlvbiBpbiB0aGUg
NC1ieXRlIEFkZHJlc3MgSW5zdHJ1Y3Rpb24KPiA+IFRhYmxlIG9mIHRoZXNlIGZsYXNoIGlzIG5v
dCBwcm9wZXJseSBmaWxsZWQuIEFzIGEgcmVzdWx0LCB0aGlzIGZlYXR1cmUKPiA+IGNhbm5vdCBi
ZSBlbmFibGVkIGFzIGV4cGVjdGVkLgo+Cj4gWW91IG5lZWQgdG8gcHJvdmUgdGhhdCBhbGwgdGhl
IGZsYXNoZXMgdGhhdCB5b3UgdG91Y2ggbmVlZCB0aGlzIGZpeHVwLAo+IGkuZS4gZHVtcCB0aGVp
ciBTRkRQIGFuZCBzaG93IHdoZXJlJ3MgdGhlIHdyb25nIGJpdCBpbiB0aGUgU0ZEUCB0YWJsZS4K
Ck9rYXksIEkgd2lsbCBkdW1wIHRoZSBTRkRQIGZvciBlYWNoIG9mIHRoZW0gYW5kIHBvaW50IG91
dCB0aGUKc3BlY2lmaWMgZXJyb3JzIGluIHRoZSBTRkRQIHRhYmxlcy4KCj4KPiBJZGVudGlmeWlu
ZyB3cm9uZyBiaXQgaW4gdGhlIFNGRFAgdGFibGVzIHdvdWxkIGJlIGVhc3kgdG8gc3BvdCBpZiB3
ZSBoYWQKPiBhIFNGRFAgZGVjb2Rlci4gU29tZXRoaW5nIHRoYXQgd2UgYWxsIGFncmVlIHRoYXQn
ZCBiZSBhIGdvb2QgdGhpbmcgdG8KPiBoYXZlLCBidXQgbm9ib2R5IGNhbiBhbGxvY2F0ZSB0aW1l
IHRvIGRvIGl0LiBQcmF0eXVzaCBJIHJlbWVtYmVyIGhhcwo+IHN0YXJ0ZWQgYSBkcmFmdC4gQXJl
IHlvdSBpbnRlcmVzdGVkIGluIGludHJvZHVjaW5nIGEgU0ZEUCBkZWNvZGVyIGluCj4gbXRkLXV0
aWxzPwo+Cj4gQWxzbywgaWYgeW91IHRvdWNoIGFsbCB0aGVzZSBmbGFzaGVzLCB3aWxsIHlvdSBw
bGVhc2UgdXBkYXRlIHRoZW0gYW5kCj4gZ2V0IHJpZCBvZiB0aGUgc3RyYXkgZmxhc2ggaW5mbyBm
aWVsZHM/IEknbSB0aGlua2luZyBvZiBuYW1lLCBzaXplLCBhbmQKPiBub19zZmRwX2ZsYWdzLgoK
Tm8gcHJvYmxlbS4gV291bGQgcmVtb3ZpbmcgdGhlc2Ugc3RyYXkgZmxhc2ggaW5mbyBmaWVsZHMg
ZnJvbSB0aGUKTWFjcm9uaXggZmxhc2ggd2FycmFudCBhIHNlcGFyYXRlIHBhdGNoIHNlcmllcywg
b3Igc2hvdWxkIGl0IGJlIGluY2x1ZGVkCndpdGggdGhlIGN1cnJlbnQgY2hhbmdlcz8KCj4KPiBD
aGVlcnMsCj4gdGEKClRoYW5rcywKQ2hlbmcgTWluZyBMaW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
