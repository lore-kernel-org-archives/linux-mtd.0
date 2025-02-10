Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F453C02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hNh7sZ0UBuDH6e28FYeUZrKsAmTj0EQSfZ3/0HBhl0=; b=UvlBQ212WwTjwQ
	JAoNn7CBd4xgwuNxDm3KdhZjh/M8LH2rKvj9QLndWKN1/HXrqfMHdITuoz9MOnq9vEmZZ4CA1aw9g
	EOkVrUpDv33JreIuVKThgbtyQRz3y/3mEY0X8CBB38Zo5xnqL6Ll6Ev7SWCvcO8oW1HLdvPjsEgBY
	sFuHwd/k+D/00QANjAUTF1mLEkAhOz+Q3DgitmI5lTnWSEMwIplBQ5l+zmhFlZTJybNjID7jPIa0r
	oxct+/j+Zm+KTAPXyucGhG0StSwzKQhfaRLmFwH2iDYGTRdAlqhFF7Dx3ZI8cf8KdkmS9KUgXao03
	Y+evi4H2s637OEDijyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thN8g-0000000GLyg-0ZVt;
	Mon, 10 Feb 2025 06:19:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thN8c-0000000GLyC-0sKY
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 06:19:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f5a224544so26328735ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739168360; x=1739773160; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0qE5ztiMfOqU/NNNTmSKqQDaw+xnPVhX8L7HjFr4oA=;
        b=DzNL0MdvRgAWlMWC8vz3qmWmHMAhkjp2z+aNzK/7abayfWYr2cWcx0UOdQ5EaS7+k6
         Mv+j1EdP/ZlpGx3piDYOBBA8iwzFi1rpd1lsH3P/HYYgtTrR+z6eLT4WfN21EWY+iJKv
         0pTW8nEVf58H5O5rksnK15/doZ/hkCbMlinlxK+oe4U3VJwJRGTU6ENAenDfnr/Qi9CM
         BNPdPwfDAcTwRtl4rfAYXthc6QUBRkmovD6VeJvPDNrRR84Y0yFNbnNYUHPNiTbqP3wh
         10fC5JpYgb2gbgJKWfa1xsQlDgdbT6MiU1LTon9VDgEJ3VmeWDxxNjQOiR9Iqmr0S2ia
         W2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168360; x=1739773160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0qE5ztiMfOqU/NNNTmSKqQDaw+xnPVhX8L7HjFr4oA=;
        b=ZdXIA63t59WyLl2/xX2sBsZCmpOqKtu7/wSISFsutSMKzzmCau3LYn7XkulCI1j0bJ
         SHDNVOuFOW7x5wG2O8L5BqbDjXfQSEytOdD+dbnUi+BMyxt2i7uGLC0QFyMRrEcEWXlm
         ypc29etk5ZIfEn6rgEUtux64s6pSWEwCDqDUt2JUFYaMmN2DVLor/ityOQsTrEgpYspJ
         eoOLUQpsJZvobwJBNu/CdRC6E9kOeTUIOnrVZ5mfY4wTu59SiQg9FOxP8EOKw2FKRrH5
         S5uicX+z7md74DUUlxKdtAZaFarFuX2MPYY7rwqmxNgtZzk81TYeunKbNrOkblmG1/DJ
         YaMw==
X-Forwarded-Encrypted: i=1; AJvYcCVjskRpAChW+4xHyf5PySefrm/plQ86otkByKamET7W3qcytdNRDu7XRTaYPtcnruV/XnpAfhnV+nI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCeU3PqoKzpvoCn9bG+C2tqJ9AAff08RR1qYTdjsKsYpgOIJ6E
	HnABHnY8DsgudeFbjmTJ0Ngb0x8z5wpl0NDeFwIL0QvewyNz91eG4tLiEv2gWKYfM3twlHXPTQJ
	bCn/oqIuC8Ztd6KC3jI0Gds8XtiU=
X-Gm-Gg: ASbGncuZEaSn/7bKh69Uh78dh2PZDMCV/4DyZHKXXifPkqqkkpv/kzLD9Al43OgEJVB
	3ZVD+ypCWZUw6RQr1XGMf/ENOylq9NpFmy9eemwkAC8n0ItZ1GoZuCxkzD0a0m7+nKmdt0ksQ
X-Google-Smtp-Source: AGHT+IHEiyqiVUi2t1F1mNbx5wlvzLLnslQpCepJcKSarUrf6sjrv0hLv6E35ap/FJ/JwE1ea028muenoOeHERPobQQ=
X-Received: by 2002:a17:902:ef4c:b0:216:7c33:8994 with SMTP id
 d9443c01a7336-21f4e7aff63mr191970075ad.53.1739168360078; Sun, 09 Feb 2025
 22:19:20 -0800 (PST)
MIME-Version: 1.0
References: <20250207081846.362919-1-linchengming884@gmail.com>
 <20250207081846.362919-3-linchengming884@gmail.com> <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
In-Reply-To: <811f5b9d7b2842a3e1293ac6a0bb3b70@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 14:15:11 +0800
X-Gm-Features: AWEUYZnuectraYtl_EVRebn2CreWWpWoYznqXAdJHe52mJrzoXRk2t8dsoXwmPU
Message-ID: <CAAyq3SYdGWANRTobbTahBZqU77xDnjS_WDJof6qkH-G2sVxzhA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Add support for Macronix NOR Flash
To: Michael Walle <mwalle@kernel.org>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_221922_247214_7F6F8604 
X-CRM114-Status: GOOD (  13.39  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNeW5
tDLmnIg35pelIOmAseS6lCDkuIvljYg0OjM55a+r6YGT77yaCj4KPiBIaSBDaGVuZywKPgo+ID4g
RnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBE
dWUgdG8gaW5jb3JyZWN0IHZhbHVlcyBpbiB0aGUgNC1CQUlUIHRhYmxlIGZvciB0aGVzZSB0d28g
Zmxhc2ggSURzLAo+ID4gaXQgaXMgbmVjZXNzYXJ5IHRvIGFkZCB0aGVzZSB0d28gZmxhc2ggSURz
IHdpdGggZml4dXBzLgo+Cj4gV2hhdCdzIHRoZSBwYXJ0IG51bWJlciBvZiB0aGVzZSBmbGFzaGVz
Pwo+Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+ICsrKyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvbWFjcm9uaXguYwo+ID4gQEAgLTEyNyw2ICsxMjcsOSBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gbWFjcm9uaXhfbm9yX3BhcnRzW10KPiA+ID0gewo+
ID4gICAgICAgICAgICAgICAuc2l6ZSA9IFNaXzEyOE0sCj4gPiAgICAgICAgICAgICAgIC5ub19z
ZmRwX2ZsYWdzID0gU0VDVF80SyB8IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JF
QUQsCj4gPiAgICAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhfcXBwNGJfZml4dXBzLAo+
ID4gKyAgICAgfSwgewo+Cj4gQWx0aG91Z2ggd2UgZG9uJ3QgaGF2ZSAubmFtZSBhbnltb3JlLCBh
IGNvbW1lbnQgbGlrZQo+Cj4gLyogPHBhcnRuYW1lPiAqLwo+Cj4gaXMgcmVjb21tZW5kZWQuCgpH
b3QgaXQuIEknbGwgYWRkIHRoZSBwYXJ0bmFtZSBjb21tZW50IGluIHYyIGFuZCB3aWxsIGZvbGxv
dyB0aGlzIHJ1bGUKZ29pbmcgZm9yd2FyZC4KCj4KPiA+ICsgICAgICAgICAgICAgLmlkID0gU05P
Ul9JRCgweGMyLCAweDIwLCAweDFjKSwKPiA+ICsgICAgICAgICAgICAgLmZpeHVwcyA9ICZtYWNy
b25peF9xcHA0Yl9maXh1cHMsCj4gPiAgICAgICB9LCB7Cj4gPiAgICAgICAgICAgICAgIC5pZCA9
IFNOT1JfSUQoMHhjMiwgMHgyMywgMHgxNCksCj4gPiAgICAgICAgICAgICAgIC5uYW1lID0gIm14
MjV2ODAzNWYiLAo+ID4gQEAgLTE4Miw2ICsxODUsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZs
YXNoX2luZm8gbWFjcm9uaXhfbm9yX3BhcnRzW10KPiA+ID0gewo+ID4gICAgICAgICAgICAgICAu
bm9fc2ZkcF9mbGFncyA9IFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVB
RF9SRUFELAo+ID4gICAgICAgICAgICAgICAuZml4dXBfZmxhZ3MgPSBTUElfTk9SXzRCX09QQ09E
RVMsCj4gPiAgICAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhfcXBwNGJfZml4dXBzLAo+
ID4gKyAgICAgfSwgewo+Cj4gc2FtZSBzYW1lCj4KPiA+ICsgICAgICAgICAgICAgLmlkID0gU05P
Ul9JRCgweGMyLCAweDI1LCAweDNiKSwKPiA+ICsgICAgICAgICAgICAgLmZpeHVwcyA9ICZtYWNy
b25peF9xcHA0Yl9maXh1cHMsCj4gPiAgICAgICB9LCB7Cj4gPiAgICAgICAgICAgICAgIC5pZCA9
IFNOT1JfSUQoMHhjMiwgMHgyNSwgMHgzYyksCj4gPiAgICAgICAgICAgICAgIC5uYW1lID0gIm14
NjZ1Mmc0NWciLAo+Cj4gVGhhbmtzLAo+IC1taWNoYWVsCgpUaGFua3MsCkNoZW5nIE1pbmcgTGlu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
