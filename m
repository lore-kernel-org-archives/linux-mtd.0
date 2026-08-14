Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD27C5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jgJPoKxmV3AnllWve9nNUzplMCjLfKcMLNqSjNcoXBc=; b=kt9zzNO3i0PmHu
	eJd00UqVDxVUMLuZjWSICdLHabOOFiiOTqb5HSDzCgIZbreTL1CYCe47KTilvQ6kyaNlAHCgm8re2
	LqcerUGsYX3BYW3EmFUqGXevAR54kCd/rqHOmT7hy20HzIWALaBgy5lTkpmroecyPUyDcsJ0Gdkx9
	Y9PWaidO4/d35sAVbRSJkuZ4raScGmBJnUdc48UyWBXPui51FX/yKVe30NTT0e7ZEQ/kH7PXmHNWJ
	8OidMBNmVjvOUCwjdcaNsHEOTMJNLESgSDkCSg9blUZzqf5YgF47Oui28bPOMksjJ/HhQY5yOU281
	B3caryAKktEJ8+PMrUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun1k-00000002Fk0-44BX;
	Fri, 14 Aug 2026 08:12:32 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wun1i-00000002FjZ-2nHv
	for linux-mtd@lists.infradead.org;
	Fri, 14 Aug 2026 08:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786695148;
	bh=A1sqORdZ9erEvAaMVf2iDTbB+8sg0glYgcA1SRT4wfc=;
	h=From:Date:Subject:To:Cc:From;
	b=VIjI96hOW/vsGkjMylSpJwcKHqAxwpk+PU5VkypW70Wgn8TsraazDYO05Z6iNI2Ez
	 KoGHzLX+0omS4/eaRalhGaFJOC5hiH2gynaciMf91EqGva8RI8TOTWTXZ/Q+z3HMDg
	 lRLnbfilWirIrgkMjKFEMWi7IoYvB38A6Td/ttnAVUxW2UvY71QyHdPaebWzWWl+88
	 wYdHfxPmEZGV98AeDg9OPv6+5G73v8pyAK4DnkXUv/Cw0axqpRePkqzoUW/zkdWvT2
	 zi/nVxq29X2C/i48GCVuJJLo5FHzLUq6XHOUTHT36HLviLyY6IeeyBkCHc77yLHvpG
	 L4eQ7rYZJPsIA==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 2ED046B8
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 17:12:28 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=ijGOz3Lw;
	dkim-atps=neutral
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 4E56F36C
	for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 17:12:27 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cceabd70f5so17939585ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786695146; x=1787299946; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T/aDf3HXh3DvsiSXqp1uIkHdGH2Zwyk40hOwXdkZteY=;
        b=ijGOz3Lwx3nEPJy63lGcN/thMVWjWeBsLkJMrfmTKDjflEdgXY7LCPSXc9zNmid2xM
         e4HDZpcp1y1p0HLktA3Pthwxab9kYgHRg5+bFgQEIQK0tCfgPpdjkkXdyV4qHK+OIj13
         pIHh3XrT8CRXXTSER1RUEGkETHvqAcfUM3AIytPlBcxLAz4GGzcNQfMjkyZWsjw+FX7P
         Wn9qmuQfR0lviPZrT2svIJVs3i1m86pQp2JKk5VogzvD0Q7ydvi85ny5s3oq1/L2PJ26
         ymwcFj/sQG2SiFayFvB9d2SUUo9vNRuomKe5VAf5udFqUUuej7eOGiRCT+TqTTYOFt0E
         0ZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695146; x=1787299946;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T/aDf3HXh3DvsiSXqp1uIkHdGH2Zwyk40hOwXdkZteY=;
        b=QAH6BManE3EAxLQD73IMC+MJHtNnvieL+WoNvyxqKdYF/sJv4K1D0eWXA2QpfppR4D
         Fuq66RJ8HhvsUOy0FrBuaETjIUrI+pUyhz5zez/EkSwaLUQgkKsZSQh4Awjpr9pG2PAN
         ixP/utR+cpMCsbGTB5VnvxzGJ25u50Y4qVLcqdGKuv560otOK/1PNci7NyfODesNjuvk
         0wuRK+vfw6RC+rEqMxTRH4rZhTpc/H/Koe7ohrbKuytaGTtaAS2dEX9G2gv1K+6SKom/
         r2mGS+mUCKIrMijcBt4tPMjLXoNVnGuNHUf0gCyyyGa7UNCAIM2bslU8eAortV/L+6xU
         xzkg==
X-Gm-Message-State: AOJu0YzMzJ+XkR+8N35nMkw9I21ox/Y4Hi59FkA/mFyvzFhWTr5YdlNL
	g4v1SJTExfP8vyVdHvee9luaAnoMov9hxcwzvfpkFMyVul3QfUe13y50Sz0o39FWgm4G55QXzQ0
	bFUaEOa+/WwZ0q+Lb5EMTbGNlRMPjNc3U94VeRmrUr5GOQwshcNJjHrQI0fhAKeIGIdgr
X-Gm-Gg: AR+sD10FbCs0ZJP862TSTqnuYFgr28MVw3C9bMZWMMNLjGFAAtzymBVBcD+vZOT6QOb
	vGzE9dqE2qhWyYFtHqVIKK6VOyyEDI17tz6YtYHXO4ZrooTq6nUqNBl+euHsQfPd4ArJd27yWYx
	Zge2w/38E8cTm5WXBPm7ETr7+iS4rYjMbOAQnrDk0LlaV81+7PHQ3h51NbVb7+WKe11/bL8Wpmg
	64dTjVkZbA33AUTh4e4otGJBNxtbcUNGAzGKBvHx6glPzO4iA0mS0n03nSJlMuDiGNVwHupU+0S
	BqRBCBuOmVO2NFYi156Cx9f5dspf61LvGV5me49+gBIlWOJibUAjXWikqM8ehJScSqUd8/R5Fog
	RwURJKNhtl1foxRtDCLp9bQUBWGxzLEBNhY1Sl5VTd/ZYO6+B
X-Received: by 2002:a17:902:c410:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d3b0c9f12cmr46366035ad.17.1786695146269;
        Fri, 14 Aug 2026 01:12:26 -0700 (PDT)
X-Received: by 2002:a17:902:c410:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2d3b0c9f12cmr46365515ad.17.1786695145753;
        Fri, 14 Aug 2026 01:12:25 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d3aeb887aasm6205455ad.61.2026.08.14.01.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:12:25 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Fri, 14 Aug 2026 08:12:11 +0000
Subject: [PATCH v3] mtd: spinand: winbond: add support for W25N04LW
MIME-Version: 1.0
Message-Id: <20260814-w25n04lw-v3-1-c6a7423ac7d0@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIANrNfmoC/2WOOw+CMBSF/wrpqiWlIIITg5MmJg4OxjiUcpEqb
 bXlISH8d3mMLjf5ku+cc3tkwQiwaOf0yEAjrNBqBH/tIF4w9QAsspERJTQkkUdxSzeKBGWLfYi
 9IMwiPyA5GvW3gVx856rbfWFbp0/g1ZSfjELYSptu3mq8yUNM2etFn46Hbn9ehTlNihrLjJVM4
 rQ07qdmJddSuuNBU2lD59j/Nw3FHs4AIN6GhOY8SFglmXnhCnih9FIwDMMPgOjAQPEAAAA=
X-Change-ID: 20260812-w25n04lw-3e9146d8340f
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=A1sqORdZ9erEvAaMVf2iDTbB+8sg0glYgcA1SRT4wfc=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqfs3o4/qP8LK071nWoP0yW60eAAIQH9VXFMKj2
 1FzpRg/H62JAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCan7N6AAKCRDyimB/1oxx
 ByC7D/4zBOCf+4qC4KFHAHL1naBxcoeSq6fTk3KbFQikwBob23ZWcwi2D+zmOJowgiZf5iNkXmU
 Ed1rtoTOvTQ3VIPCnPM1UsycCXJ5GZEPs21errwzuS5bwh+YwBVUp5xBnSYx2g0azwKrlepH9gf
 LpWC9pimUQZqJNuuC3fx+EWNlE0fbaRRyriqRSgA6Nj8lYgDU0BLR6eRppZuZrmOi5oypvtLrNF
 kHn1kCAAOUKm9bAPS5cQILgSy7pwCzWVMdq8l4TyZB55y+3b8jzaEMRpMNGUoOy+mq8sZo93u9E
 yN0Mj5taOa6aBZkjBl5F9akPSFCruvqS5rY0k3SCEvtSZJki/wT5kckyQAhBFCf/8xLTNxbPjUC
 sD26Ylmho/bEIZDBl4qoCskvd43BHvD0TqJLPe0QSODjInuYAndKSgYW8RvmtJ8OdK4lpjGa+r+
 RwNcmrhB4RWb79eezcOcU3AY9ZiQj83i1xgxvdGtkjtByDesAGT3LcrGiqcZICp0Tq5LvwpM48i
 tQY2q4PTpFOhI2qrTn7OyRJrzRaGo0UjqaKRuodBQ1nljP0RPWmWh6egkM/U2NlltVg+aUTS7/b
 Tcn5ltpBaq0wBu/TwvsxYkM3bTwds//ZwMzr2i/QQgppsR7ZsWTT02aXKmvMs/ya9rg0X9IzztP
 w1jY4ojK9/1ecgg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_011230_936630_1E69045A 
X-CRM114-Status: GOOD (  22.03  )
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

QWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1TjA0TFcgNEdiaXQgU1BJLU5BTkQ6Cj4gMS44ViA0
Ry1iaXQKPiBSYXcgc2VyaWFsIFNMQyBOQU5EIGZsYXNoIG1lbW9yeQo+IER1YWwvUXVhZCBTUEkg
d2l0aCAxMDRNSHoKPiBidWZmZXIgcmVhZCwgY29udGludW91cyByZWFkICYgc2VxdWVudGlhbCBy
ZWFkCgpIaWdobGlnaHRzIGNvcGllZCBmcm9tIGRhdGFzaGVldDoK4oCTIFBhZ2Ugc2l6ZTogNCwz
NTIgQnl0ZXMgKDQwOTYgKyAyNTYgQnl0ZXMpCuKAkyBCbG9jayBzaXplOiA2NCBwYWdlcyAoMjU2
SyArIDE2SyBCeXRlcykKLSBCdWlsdC1pbiA4LUJpdCBFQ0MgZm9yIG1lbW9yeSBhcnJheQrigJMg
RUNDIHN0YXR1cyBiaXRzIGluZGljYXRlIEVDQyByZXN1bHRzCuKAkyBCYWQgQmxvY2sgTWFuYWdl
bWVudCBhbmQgTFVUIGFjY2VzcwrigJMgU29mdHdhcmUgYW5kIEhhcmR3YXJlIFdyaXRlLVByb3Rl
Y3QK4oCTIFBvd2VyIFN1cHBseSBMb2NrLURvd24gYW5kIE9UUCBwcm90ZWN0aW9uCuKAkyBVbmlx
dWUgSUQgYW5kIFBhcmFtZXRlciBwYWdlCuKAkyBUZW4gNEtCIE9UUCBwYWdlcyBwZXIgZGllCuKA
kyBSZWFkIExldmVsIFNldHRpbmcgZm9yIFJlYWQgUmV0cnkKClRoZSA0MDk2KzI1NiBieXRlIHBh
Z2UgbGF5b3V0IGlzIGFzIGZvbGxvdzoKLSA0MDk2IGJ5dGVzIEVDQyBwcm90ZWN0ZWQgIm1haW4g
bWVtb3J5IGFycmF5Iiwgc3ViZGl2aWRlZCBpbiA4CiAgNTEyIGJ5dGVzIHNlY3RvcnMKLSAxMjgg
Ynl0ZXMgc3BhcmUgYXJyYXksIHN1YmRpdmlkZWQgaW4gOCAxNiBieXRlcyBzZWN0b3JzIGFzIGZv
bGxvdzoKICAtIDIgYnl0ZXMgYmFkIGJsb2NrIG1hcmtlciAobm8gRUNDIHByb3RlY3Rpb24pCiAg
LSAyIGJ5dGVzICJ1c2VyIGRhdGEgSUkiIChubyBFQ0MgcHJvdGVjdGlvbikKICAtIDEyIGJ5dGVz
ICJ1c2VyIGRhdGEgSSIgKEVDQyBwcm90ZWN0ZWQpCi0gMTI4IGJ5dGVzIHBhcml0eSBhcnJheSwg
c3ViZGl2aWRlZCBpbiA4IDE2IGJ5dGVzIHNlY3RvcnM6CiAgLSAxMyBieXRlcyBFQ0MgZm9yIG1h
aW4gZGF0YSBhbmQgdXNlciBkYXRhCiAgLSAzIHVudXNlZCBieXRlcwoKVGhpcyBjb21taXQgZG9l
cyBub3Qgc3VwcG9ydCBtb3N0IGFkdmFuY2VkIGZlYXR1cmVzIHN1Y2ggYXMgY29udGludW91cwpy
ZWFkLCBMVVQgbWFuYWdlbWVudCBhbmQgT1RQIHBhZ2VzLCBhbmQgb25seSBwcm92aWRlcyBiYXNp
YyB1c2FnZS4KCk9PQiBsYXlvdXQgd2FzIGtlcHQgY29tcGF0aWJsZSB3aXRoIHByZXZpb3VzIG1v
ZGVscyAoZXhwb3NpbmcgYm90aCB1c2VyCmRhdGEgSSBhbmQgSUkpLCBkZXBlbmRlbnQgb24gbXRk
LT5vb2JzaXplLgoKQ28tZGV2ZWxvcGVkLWJ5OiBEYWlzdWtlIE1pem9idWNoaSA8bWl6b0BhdG1h
cmstdGVjaG5vLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFpc3VrZSBNaXpvYnVjaGkgPG1pem9AYXRt
YXJrLXRlY2huby5jb20+ClNpZ25lZC1vZmYtYnk6IERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5p
cXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8uY29tPgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBGaXhl
ZCBDby1hdXRob3JlZC1ieSAvIGNvbW1lbnQgc3R5bGUKLSBNZXJnZWQgb29ibGF5b3V0IGhlbHBl
ciB3aXRoIHcyNW4wMmt2X29vYmxheW91dCwgdXNpbmcgbXRkLT5vb2JzaXplCih3aXRoIGFuIGV4
dHJhIGNvbW1lbnQgZGVzY3JpYmluZyBVc2VyIERhdGEgSS9JSSwgYnV0IGtlZXBpbmcgY3VycmVu
dApiZWhhdmlvdXIpCi0gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYw
ODEyLXcyNW4wNGx3LXYyLTEtZGVlZTk3NjAyZmM0QGF0bWFyay10ZWNobm8uY29tCgpDaGFuZ2Vz
IGluIHYyOgotIExpbmsgdG8gdjE6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay9hbnNZVW9OS0p5
RFErNmYyQGh1LW1kYWxhbS1ibHIucXVhbGNvbW0uY29tCi0gZml4ZWQgb29iIGxheW91dAotIGZp
eGVkIE5BTkRfTUVNT1JHIG9vYiBzaXplCgpUZXN0d2lzZToKLSBkZWJ1Z2ZzIG9vYmxheW91dF9l
Y2Mvb29ibGF5b3V0X2ZyZWUgaXMgZmluZSB3aXRoIG5ldyB2ZXJzaW9uCi0gSSBzdGlsbCBuZWVk
IHRvIGNoZWNrIGFib3V0IHRoZSBoaWdoIG51bWJlciBvZiBlY2MgZXJyb3JzIG5leHQgd2VlaywK
YnV0IEkgZG9uJ3QgdGhpbmsgaXQncyBsaWtlbHkgdG8gYmUgcmVsYXRlZCB0byB0aGlzIHBhdGNo
IHNvIHNlbmRpbmcKYWhlYWQuLi4gRmVlbCBmcmVlIHRvIHdhaXQgYSBiaXQgKHRoZXJlJ3Mgbm8g
aHVycnkgb24gbXkgZW5kIGZvciB0aGlzIHRvCmdldCBpbnRvIDcuMzsgaXQncyBmaW5lIHRvIHNr
aXAgYSBjeWNsZSBhcyB5b3Ugc2VlIGZpdCkKLSBJIGNoZWNrZWQgdGhlIFNQSU5BTkRfSU5GT19P
UF9WQVJJQU5UUyBhbmQgdGhlcmUgaXMgbm8gcHJvYmxlbSB3aXRoCmN1cnJlbnQgdmFsdWVzIGZv
ciB0aGlzIG1vZGVsLgoKVGhhbmtzIQoKLURvbWluaXF1ZQotLS0KIGRyaXZlcnMvbXRkL25hbmQv
c3BpL3dpbmJvbmQuYyB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3NwaS93aW5ib25kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMK
aW5kZXggOWI3OGMxZTZjYmM5Li4xNzFmNGMyNjQyMjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvc3BpL3dpbmJvbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMK
QEAgLTMxNCwxMCArMzE0LDExIEBAIHN0YXRpYyBpbnQgdzI1bjAxa3Zfb29ibGF5b3V0X2VjYyhz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCiBzdGF0aWMgaW50IHcyNW4wMmt2X29v
YmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCQkJCSAgc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCiB7Ci0JaWYgKHNlY3Rpb24gPiAzKQorCS8qIDQg
c2VjdGlvbnMgZm9yIDEyOCBieXRlcywgOCBmb3IgMjU2ICovCisJaWYgKHNlY3Rpb24gPj0gbXRk
LT5vb2JzaXplIC8gMzIpCiAJCXJldHVybiAtRVJBTkdFOwogCi0JcmVnaW9uLT5vZmZzZXQgPSA2
NCArICgxNiAqIHNlY3Rpb24pOworCXJlZ2lvbi0+b2Zmc2V0ID0gKG10ZC0+b29ic2l6ZSAvIDIp
ICsgKDE2ICogc2VjdGlvbik7CiAJcmVnaW9uLT5sZW5ndGggPSAxMzsKIAogCXJldHVybiAwOwpA
QCAtMzI2LDkgKzMyNywxNiBAQCBzdGF0aWMgaW50IHcyNW4wMmt2X29vYmxheW91dF9lY2Moc3Ry
dWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogc3RhdGljIGludCB3MjVuMDJrdl9vb2Js
YXlvdXRfZnJlZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCiAJCQkJICAgc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCiB7Ci0JaWYgKHNlY3Rpb24gPiAzKQorCWlmIChz
ZWN0aW9uID49IG10ZC0+b29ic2l6ZSAvIDMyKQogCQlyZXR1cm4gLUVSQU5HRTsKIAorCS8qCisJ
ICogRm9yIGF0IGxlYXN0IFcyNU4wNEtXIGFuZCBXMjVOMDRMVywgdGhpcyByZWdpb24gaXMgYWN0
dWFsbHkKKwkgKiBzcGxpdCBpbiB0d286CisJICogRUNDLXByb3RlY3RlZCAiVXNlciBEYXRhIEki
IGF0ICsgNCBvZmZzZXQsIGxlbmd0aCAxMgorCSAqIHVucHJvdGVjdGVkICJVc2VyIERhdGEgSUki
IGF0ICsgMiBvZmZzZXQsIGxlbmd0aCAyCisJICogVGhpcyByZXR1cm5zIHRoZSBmdWxsIHJlZ2lv
biBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuCisJICovCiAJcmVnaW9uLT5vZmZzZXQgPSAo
MTYgKiBzZWN0aW9uKSArIDI7CiAJcmVnaW9uLT5sZW5ndGggPSAxNDsKIApAQCAtNzY4LDYgKzc3
NiwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfaW5mbyB3aW5ib25kX3NwaW5hbmRf
dGFibGVbXSA9IHsKIAkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCiAJCSAgICAg
MCwKIAkJICAgICBTUElOQU5EX0VDQ0lORk8oJncyNW4wMmt2X29vYmxheW91dCwgdzI1bjAya3Zf
ZWNjX2dldF9zdGF0dXMpKSwKKwlTUElOQU5EX0lORk8oIlcyNU4wNExXIiwgLyogMS44ViAqLwor
CQkgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHhi
MiwgMHgyMyksCisJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAs
IDEsIDEsIDEpLAorCQkgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCisJCSAgICAgU1BJTkFORF9J
TkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAorCQkJCQkgICAgICAmd3JpdGVf
Y2FjaGVfdmFyaWFudHMsCisJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAorCQkg
ICAgIDAsCisJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZ3MjVuMDJrdl9vb2JsYXlvdXQsIHcyNW4w
Mmt2X2VjY19nZXRfc3RhdHVzKSksCiAJU1BJTkFORF9JTkZPKCJXMzVOMDRKVyIsIC8qIDEuOFYg
Ki8KIAkJICAgICBTUElOQU5EX0lEKFNQSU5BTkRfUkVBRElEX01FVEhPRF9PUENPREVfRFVNTVks
IDB4ZGYsIDB4MjMpLAogCQkgICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDEyOCwgNjQsIDUxMiwg
MTAsIDEsIDQsIDEpLAoKLS0tCmJhc2UtY29tbWl0OiBkYjJkZGI4NzE0MzUxOWUyMGE5NWFhMzZj
NjBiMzYxMDdiNzM2YTU4CmNoYW5nZS1pZDogMjAyNjA4MTItdzI1bjA0bHctM2U5MTQ2ZDgzNDBm
CgpCZXN0IHJlZ2FyZHMsCi0tICAKRG9taW5pcXVlIE1hcnRpbmV0IDxkb21pbmlxdWUubWFydGlu
ZXRAYXRtYXJrLXRlY2huby5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
