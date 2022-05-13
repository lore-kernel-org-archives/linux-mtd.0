Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BDEC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTNQzwm/nf4hOHBIIffj4MTSzgscyil9upGApBpIKJI=; b=CD1lR71LB85sjI
	ppQvI8brnVMefG4762aRdX00pLAFap874wYTXO6F+dRru4Ft5pptqntJ+S3qi8XzyU9D2tv90ujT+
	vLIqIM3ManoWmjqX6pBr3XFCwIyvLHEWjRwGDD4izVC386undei6RemJ9KSr4uT6o5zVEtg+bVRgg
	GV/qMd1cpZTRTuQwMFbfkvEsObToHyem7lHSNwf9O9JC0SgyJAHslhreJy2UYzjdQTDWqd+h2o+e3
	1htT+YgZCp9nr9YfUbzCa8LpSZJBypGoCK0CXlpaEitYkbwi79xHtJGNj/sJBJRQtziF5oS25YYKQ
	TfI04RFT/VgmP1gKSXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npK4u-00E3d2-PG; Fri, 13 May 2022 01:26:48 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npK4h-00E3YP-6B
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 01:26:36 +0000
Received: by mail-pg1-x530.google.com with SMTP id g184so6145777pgc.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 May 2022 18:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZnLrSf2c9DggEospDLc02BQqTl9gI8KE+kXDDD4s/Eg=;
 b=Us8PaMJqhvuKMKRgQMZlzBWX5Uq30IdwEHwiNUzGk8doiRSsak1+8MsONUdwtLAHMl
 tc3cR3puWBFHiKNKm2gQe3hXAUKuSKgU1tcseI0lEfK02/iue2oSlVxnkqvXoMdgmXis
 dfIv4JYwDExHz9+4+GgWu1JTOtinA1OS9SJEnJfqEXOzk1/SECP5fkG/07tC8Ja0UC+i
 5ZDzkyUWBinV0Ct/stQB9MbbATFqdLKyb8l8Y0WAWVM85xzesla4ExcCjiUZaWF5mz0m
 iNHZD1k5bRyOtk8/DF9DRbr76+Vg+aLpweb1XGjOsrCWgkkPCujQ1sHoCVygFUpTeq1G
 8kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZnLrSf2c9DggEospDLc02BQqTl9gI8KE+kXDDD4s/Eg=;
 b=KTZbruiEKrl6fy3MxbdUDmVlLZe+SL/JAnxe0WC4rlC3D1eLQd1b435Z0M9NdIqW17
 YqYAbeMKDcu5EvacBdA7kkoSgTmvM8oztNVaT9DuX90ATYVDJ6/jGtHEogXBB3MQIPRu
 m1Dpsaz/kx9DxyTEWn0et+4pN/Hk+Qcg5ABswoYm1O6yv++Kh/hTBq9nXu5p4HfKeUHW
 9ZmADxlBhZxDNqxS3SlU1IvbJcL1aJ26wsNTzkZ1sOdRCURhI7lbL+C/QLBZ41kBSmEP
 Dt0PaH8Sm6g194+6YtyxGNQwZ2M/b1Cp9EMDhCSgvS1zdTrXczeBQcmiMa6HIBVe4ekB
 LyAQ==
X-Gm-Message-State: AOAM532HT+op9Vf85/XDmZ5WeR7F33K7017F/MxOvV+4G0jndqycM3fY
 HMk8H0ZT2aNXtaZPd8sVt8bgeZItmgg=
X-Google-Smtp-Source: ABdhPJwzPwjoSpx1GevajEHt6l0B7vAwKVcxEpFrZEciaO+hzHrgnT1tyHQFI9cZZr64aewuMOncuw==
X-Received: by 2002:a63:8442:0:b0:3c6:42b4:3d48 with SMTP id
 k63-20020a638442000000b003c642b43d48mr1875264pgd.45.1652405191812; 
 Thu, 12 May 2022 18:26:31 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a17090a940f00b001cd8e9ea22asm2366997pjo.52.2022.05.12.18.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 18:26:31 -0700 (PDT)
Message-ID: <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
Date: Fri, 13 May 2022 10:26:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <99cf396f9210279e28dc1656a652efb4@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_182635_272448_9AFE43ED 
X-CRM114-Status: GOOD (  14.29  )
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

T24gNS8xMy8yMDIyIDc6MTQgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMi0wNS0x
MCAwMDoxMCwgc2NocmllYiB0a3V3NTg0OTI0QGdtYWlsLmNvbToKPj4gRnJvbTogVGFrYWhpcm8g
S3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pgo+PiBJbiA0QkFJVCBwYXJz
ZSwga2VlcCBub3ItPnBhcmFtcy0+YWRkcl93aWR0aCBiZWNhdXNlIGl0IG1heSBiZSB1c2VkIGFz
Cj4+IGN1cnJlbnQgYWRkcmVzcyBtb2RlIGluIFNNUFQgcGFyc2UgbGF0ZXIgb24uCj4gCj4gTWgg
SSdtIG5vdCBzdXJlIHRoaXMgaXMgbmVlZGVkIGF0IGFsbC4KPiAKPiBTRkRQIHNwZWMgc2F5cwo+
IMKgIFZhcmlhYmxlIGFkZHJlc3MgbGVuZ3RoICh0aGUgY3VycmVudCBzZXR0aW5nIG9mIHRoZSBh
ZGRyZXNzCj4gwqAgbGVuZ3RoIG1vZGUgZGVmaW5lcyB0aGUgYWRkcmVzcyBsZW5ndGgpCj4gCj4g
YW5kCj4gwqAgV2hlbiB0aGUgbGVuZ3RoIGlzIGRlZmluZWQgYXMgdmFyaWFibGUsIHRoZSBzb2Z0
d2FyZSBvciBoYXJkd2FyZQo+IMKgIGNvbnRyb2xsaW5nIHRoZSBtZW1vcnkgaXMgYXdhcmUgb2Yg
dGhlIGFkZHJlc3MgbGVuZ3RoIG1vZGUgbGFzdAo+IMKgIHNldCBpbiB0aGUgbWVtb3J5IGRldmlj
ZSBhbmQgdGhpcyBzYW1lIGxlbmd0aCBvZiBhZGRyZXNzLgo+IAo+IFdlIGRvbid0IHNldCBhbnkg
YWRkcmVzcyBtb2RlIHVudGlsIGFsbCB0aGUgU0ZEUCBwYXJzaW5nIGlzCj4gb3Zlci4gVGhlcmVm
b3JlIHdlIHNob3VsZCBhbHdheXMgYmUgaW4gMyBieXRlIG1vZGUsIG5vPwo+IApBY3R1YWxseSB0
aGVyZSBhcmUgc29tZSBkZXZpY2VzIHRoYXQgaGF2ZSB2YXJpYWJsZSBhZGRyZXNzIGxlbmd0aCBi
dXQKNCBieXRlIG1vZGUgYnkgZGVmYXVsdCAoSSB3aWxsIHdvcmsgb24gdGhvc2UgZGV2aWNlcyBh
ZnRlciB0aGlzIHNlcmllcwppcyBzZXR0bGVkKS4gVG8gc3VwcG9ydCBzdWNoIGNhc2UsIEkgcHJl
ZmVyIHRvIHVzZSBwYXJhbXMtPmFkZHJfbmJ5dGVzCmFzIGN1cnJlbnQgYWRkcmVzcyBtb2RlIHNv
IHRoYXQgSSBjYW4gZml4IGl0IGluIHBvc3RfYmZwdF9maXh1cCgpIGhvb2suCgpUaGFua3MsClRh
a2FoaXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
