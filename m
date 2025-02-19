Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AB8C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 11:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSbGfOkwTLyufDIHg12cnkB/+VNxRXkJrSdYAqGAQPI=; b=AIiOYoftEAOBRb
	uX8uEYoWcKWA5BT7wkJAne8NG72F93N28neJFW0luDKYOPtj7UCJLsU+X6L1PB9feXVhhsw6E8ieE
	lyOs4K+v0VADBgR6YQlr4whMIMAH2cgstmhiYEkg/wPC1pBo7tnEN+3UvoWunI2A1a+GIN66ozCeZ
	CsCK17M/Umun5I0emJe/GIEtq/zNrmzY3Ipg1C8NvvOTLtq1wBP6JzfgXrD4yTTe9X5VBTQcgYJhs
	jt8EuMM41uO7mba+jiuXm5+n3gAjlPc3htJiLTku6sWc9d6XNdDGeW5k1o8TIOIdEkBjmAK6FivmS
	dsl6mQBB9vpizNHwsEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkijd-0000000CYMi-1uJL;
	Wed, 19 Feb 2025 11:59:25 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkija-0000000CYKs-1kTq
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 11:59:24 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22185cddbffso1092955ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 03:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shkspr.mobi; s=google; t=1739966361; x=1740571161; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhjIlFQZmJgDNMy72o/YIBnf+53/O0sOR13h4ZV5JHQ=;
        b=V6KHK8RgONU/JwRz05HikcYPxcTr6wI2qOWcuxalFYc7/XWTg1mh8uIPLwkrQ9Q+Ar
         OYW92Hv9xheddnPbx9JrF2T4P2w8/4fZOrNnw7IpbStnxiZu0/UX4hwqiTPeOYt+1ORO
         cqUyaCARkbyx2x5S5/ixjOPp7ZE1ERIS9bcFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739966361; x=1740571161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhjIlFQZmJgDNMy72o/YIBnf+53/O0sOR13h4ZV5JHQ=;
        b=dYG7gyhZLDhHPtSCcZiavN9VRzoGnlu5YKuICWKeKTCNYiotGzFSOZNqfMmoOosmw3
         F6eEte3CapIzKskkvXe1TNWalDYvB10+MzAXhk3bxi2AeDhwNsKGfmY3/NFwk7sOqGw3
         FZ01PBThwZGksi+o5aXCVgmqjuPla8tpLtt1d3R86/da/O41oXakYKzL+NSzlc+DQJ2J
         0DnA0MbUqdxXZ7lL4baTk7ZgiEPuj0NpTmJmaRzUNY81Ps3eRZqjqEGOv38+5EyUF+K7
         93dkkiCdUADGcQHsUcETqI6GUarQe33NpDdx4KubJMlhdgvGrqc1/QueL4fQUIQdz9Oq
         FQqg==
X-Forwarded-Encrypted: i=1; AJvYcCU/1qhwDCJZWt3wfgNm4p59QLSliOp6d3jikKtwmSWc0asvhLRtdAvgYDyBBtaSb13Fb3avo2hkhzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAQ6vsYc1sYKYx0CfWL4ousMmBziuIZLQRduiP7YeZYP5/32/J
	3xY3Tz8JqJSWdkM4cQCzDSh/RJhvdeGIZLS4uAAgGaP/NYECfSPkZi6f/03HVBZ7JbPkoVbvERl
	AIMfczb4X5IiaGus79H0ejffmXb/XnODm7wfF+AZ4WRoooISEbKM=
X-Gm-Gg: ASbGncumNu6fGCJzF+/Esafa4HsrdUAqvNZ5KIi8fmCVGKbhKYRmZaqcSSju5LvqLpI
	zz/mZXTmHGOlunpOd6Os8cp8iPsbtw6I6aWSn7ZMdljluUaJkKloQyM3FwFji5HpmKcnODLA=
X-Google-Smtp-Source: AGHT+IEIDu7cQIabhELINhbbJ/JqmVLW5wmtW8XAT57/BRdqzv+jjODmqF66BtG0qpi54DE2iwfZ9nia7HowDeQ3geQ=
X-Received: by 2002:a05:6a00:1886:b0:732:6a48:22f6 with SMTP id
 d2e1a72fcca58-7329cf56ec1mr5772209b3a.9.1739966361436; Wed, 19 Feb 2025
 03:59:21 -0800 (PST)
MIME-Version: 1.0
References: <CAPFVDHokn+kfyk9AxTHuBJjRKMNJjZy8w=e-qzvXaA8Vfcq6Dg@mail.gmail.com>
 <87o6yzs6c8.fsf@bootlin.com>
In-Reply-To: <87o6yzs6c8.fsf@bootlin.com>
From: Terence Eden <terence.eden@shkspr.mobi>
Date: Wed, 19 Feb 2025 11:59:10 +0000
X-Gm-Features: AWEUYZkug6csWP395XWtuoa1wgcZpXRIcIAStp6hrxOrgrqmtvoIFzgVEbubXvQ
Message-ID: <CAPFVDHob_mna4DRc91cNVAF85px91NV7gjJr-kbY63EYCnJ=EA@mail.gmail.com>
Subject: mtd: rawnand: r852: [PATCH] Fixed a spelling error in the comments
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: maximlevitsky@gmail.com, richard@nod.at, vigneshr@ti.com, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_035922_709369_2A70D0F3 
X-CRM114-Status: GOOD (  11.62  )
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

Q29udGludWluZyB0aGUgd29yayBvZiBDb21taXQgIzhhYjFiNTEgLwpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tdGQvMjAyNDA5MjMwNjU2NDkuMTE5NjYtMS1zaGVubGljaHVhbkB2aXZv
LmNvbS8KClRoaXMgZml4ZXMgYSBzcGVsbGluZyBlcnJvciBpbiB0aGUgY29tbWVudHMgYW5kIHJl
bW92ZXMgYW4gZXJyYW50IG5ld2xpbmUuCgpTaWduZWQtb2ZmLWJ5OiBUZXJlbmNlIEVkZW4gPHRl
cmVuY2UuZWRlbkBzaGtzcHIubW9iaT4KLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yODUyLmMg
fCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3I4NTIuYwppbmRleCBiMDdjMmY4YjQwMzUuLjEzNjU4OWY5YTBlOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3I4NTIuYwpAQCAtMjQyLDEzICsyNDIsMTIgQEAgc3RhdGljIHZvaWQgcjg1Ml93cml0ZV9idWYo
c3RydWN0IG5hbmRfY2hpcAoqY2hpcCwgY29uc3QgdWludDhfdCAqYnVmLCBpbnQgbGVuKQogICAg
ICAgICAgICAgICAgcmV0dXJuOwogICAgICAgIH0KCi0gICAgICAgLyogd3JpdGUgRFdPUkQgY2hp
bmtzIC0gZmFzdGVyICovCisgICAgICAgLyogd3JpdGUgRFdPUkQgY2h1bmtzIC0gZmFzdGVyICov
CiAgICAgICAgd2hpbGUgKGxlbiA+PSA0KSB7CiAgICAgICAgICAgICAgICByZWcgPSBidWZbMF0g
fCBidWZbMV0gPDwgOCB8IGJ1ZlsyXSA8PCAxNiB8IGJ1ZlszXSA8PCAyNDsKICAgICAgICAgICAg
ICAgIHI4NTJfd3JpdGVfcmVnX2R3b3JkKGRldiwgUjg1Ml9EQVRBTElORSwgcmVnKTsKICAgICAg
ICAgICAgICAgIGJ1ZiArPSA0OwogICAgICAgICAgICAgICAgbGVuIC09IDQ7Ci0KICAgICAgICB9
CgogICAgICAgIC8qIHdyaXRlIHJlc3QgKi8KLS0gCjIuMzQuMQoKT24gVHVlLCAxOCBGZWIgMjAy
NSBhdCAxMzo1OCwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGU6Cj4KPiBIZWxsbywKPgo+IE9uIDE4LzAyLzIwMjUgYXQgMTM6MjE6NDIgR01ULCBUZXJlbmNl
IEVkZW4gPHRlcmVuY2UuZWRlbkBzaGtzcHIubW9iaT4gd3JvdGU6Cj4KPiA+IENvbnRpbnVpbmcg
dGhlIHdvcmsgb2YgQ29tbWl0ICM4YWIxYjUxIC8KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW10ZC8yMDI0MDkyMzA2NTY0OS4xMTk2Ni0xLXNoZW5saWNodWFuQHZpdm8uY29tLwo+
Cj4gV2hpbGUgdGhlIGRpZmYgaXMgb2J2aW91c2x5IGZpbmUsIEknZCBwcmVmZXIgaWYgeW91IGNv
dWxkIHdyaXRlIGEgcHJvcGVyCj4gY29tbWl0IGxvZy4KPgo+IEFsc28gdGhlIHRpdGxlIHNob3Vs
ZCBiZSBwcmVmaXhlZCAibXRkOiByYXduYW5kOiByODUyOiAiCj4KPiBUaGFua3MsCj4gTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
