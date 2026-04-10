Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71199E9905D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 10:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkJdl1uPfZQrzPIlHavXcB/kkSwC/RoUViPFn83ZMow=; b=Y+RTd5O0iQrUjn
	cqr0qeOYTuUsgY+NHcjsptR8+4ORiOtPwNnsBGH4IdgIqolXN5hQYkpLkZEi3UQYqnFnRgluE0iT3
	GPZQnWUt3rVeCF+8WXEUB6A8YIHwj19SQJZbuLdZaKAKWOjh46S9XR47wGtR2Nq3y4Cdbg30SGaHO
	NgLwS5PT0Ow2CUGFwsIudbbrtS6hywbH0crf4OXvNv9FQSFkAhhbiKGXgNWILTGpN0pwqS5kxzHOR
	HVSi9wHz5DWIG5e85UaUGWhKKvmy1j9kq/GnoairUsPjmmPE1mj7yRfDGqMDqEKs3jFCPA9sxWGsh
	Fim9NhZCx26DYSlDxJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8fV-0000000Bxmc-1vxF;
	Fri, 10 Apr 2026 10:00:53 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8fT-0000000Bxlb-0zQs
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 10:00:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35c124d2613so1229178a91.2
        for <linux-mtd@lists.infradead.org>; Fri, 10 Apr 2026 03:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815250; cv=none;
        d=google.com; s=arc-20240605;
        b=E2o+OiyvQrIVPj/V8b/60epIvU0IrZTkTxaQIMtQ8I450i/aLamq4bIbILqooOudPN
         XCo/8UsD08/77B4yl1UuRNjnhDaeLdT4yQQtAxABls0GoJZD6l/dK65NrQ2tRMZf4Z69
         LcBDx0EzVmn1xCqE5qGhjkPRW0qvkCKPSP1IzskZ9eMp8vkP4mB+NJVwbsEBNWDxRPZ5
         Pqfk8pPTCboH8Inm3ABDxZVEr8zlC63AekbA/yi1qWkI1Gng+xA+0Z9fD+wBYTZzGibr
         JYIdRuxfE/ED2m5EeJ83Do3g88Gy/c53KPPKLhgkzrEFMEg8W0+n8dMl2x0mcffPgKiO
         d2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pIhmkPr3ljqAQVTz4NNitAqeHl6KBJ+WJ/NqtWf+tVU=;
        fh=XZM1LdBOkfGNP+JTK4UAaJ9C4KlGgj7qugPXYBkeDro=;
        b=CNh3pttfNblD5g9cgWY426bdQvJd3x9KdEDoIshJ2s8tbcWq/mhPnaXzufyMaqF5Vn
         kwOxZUxyc8R2MbL+4hzKmspquOPyqJXSIWms+qdSPjwJAy9tRD6ABmdFzI5+AGE1/DsB
         tpMIZMcynmZk1da8yxAj+OkG7kIgqUhfq41h3BHnbvmPtbprXDhU3wkgybrquoM8E6A/
         2D1tE8ga/SWoJdyq2oWcWsyyca1OUZNyh0bUWi8VsJuL5STCVGk26MM4/i0ECk+85UN/
         XWU1qHr3zKa0GSNNc1Pjgiaws7SA+ZIR7nZSBic931vAXEQDZ7yNs9I52p1ChxNcO7io
         A3fA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815250; x=1776420050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIhmkPr3ljqAQVTz4NNitAqeHl6KBJ+WJ/NqtWf+tVU=;
        b=YTiq5OppYo6pSev0H+URJXJo62ESiAf9kx5TTZ8vnrrgxeSlzgG9YlMA5PIx8hwjuv
         tgxMhPScJ2AoZhUUVMdqVA5xMXVgs503u8GaLh034P/R8pF4VfrrjsW9x1WKDhZGUiVe
         qnRAHNgziCLY4sPRL8xJcbuxNZnp2pcqcvLOBlQFyrExcH6y3R5wDiRcr/9qb2lz8Bqs
         opXTnS9OSM+7rkDOZmmr/+YTo4P0Yv61Y/LzPdoKdUQAU8eMSp1vBFisCSNKzIrjMxHq
         rB4Dy+87ITTBcqeznL4Sh5/aStUmi8iV6nSMi+oro+Fe9Wfc0EGqSylFlDRQaCiRqyYt
         YhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815250; x=1776420050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIhmkPr3ljqAQVTz4NNitAqeHl6KBJ+WJ/NqtWf+tVU=;
        b=HhIW3W0YiNDPPjurcq5Bk3rq5E563feL11KiHxOP6g7hCYrgyAMX9OlbyLU6bK50JR
         b/7o0RwVB8t39T/qamO6LKaDqIZ92xoieNjojrjGdEn7kMMZG2RdVUSn1NpTwMtt9woS
         19/Jg7Rqaf/oCpQ/wwpMEJy1i2vFnH0xO60MJA+vN5bNUwFTCtGnX4pgdFEiIBX+c2UH
         QItCE5Y1neyVkkL7niTBZJHS34jor8INzr19zOAY6CwPBBj19sXqYZU1pRu8Rtg11hXI
         rHcPhXJrkso5jLlNF1Jpr87XWUpcYD6Whqi4ZHDJpbTdLX4clbXOQUQRotpM9rZNr0x8
         1EZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/jALopIARzCbXebU1ba3OlU63cVypBuXPHzCDmWp6lulqO94hb2kGm2TiX7JaCnYuKN7xj2oZtLo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2OFQdZrcWv3jsDV2ryCbqO1/e/0uNcI5HwM4n9O0KTwl7a7t/
	ra5VNRCzKROEx2lNWGmcD9h//oF/q+YC5sBqCSzHp38Y75QeiCmNR8Fv0OBmNyJW2h20DPT+nQ9
	YBwstlD8yL0kXtcHUeqgAxSRtYorjBQM=
X-Gm-Gg: AeBDiesJmSfk+CRmlwh3cVuZXXys9muzfNr+oiYzXwBrKh/j7nLSP1nfXA3Vw+ZoGII
	U6eRG7uPsVJaQkjVLfIxAsUrYRfskzY816fx4gFFyyobqNZMntflAqjbosU4+vw6qBjdzG/kKbs
	3f39Oo6oMuutG2IoJIc5uO3iLPFc6IZoYuOOuwJFHPvav3wE2sSYg/wcrYWmDgmqWrEKsw2hc3+
	E/EF1pv23J/dKGMmUgaxRCstLQ8y7dDhfjlEU4SteVJtuB7RIs2sWL6u7eatfmvextF/jxSXIGO
	Z8eOcVI=
X-Received: by 2002:a17:90a:d40b:b0:35b:cd3e:c4ab with SMTP id
 98e67ed59e1d1-35e42815adbmr2864713a91.14.1775815249943; Fri, 10 Apr 2026
 03:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260410091039.389911-1-linchengming884@gmail.com> <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
In-Reply-To: <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 10 Apr 2026 18:00:07 +0800
X-Gm-Features: AQROBzDqh-swL7iAZ2RSFAMT48TOWV50I4clRbAdiQe6uLPTHYgQI3ogFLdp8Tc
Message-ID: <CAAyq3SZU34Wg7qLFz4j+Bi8AyedCsAaR8PEJYJTuOLrsFmXP6g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for additional
 flash aliases
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_030051_276114_34F4252C 
X-CRM114-Status: GOOD (  14.98  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDTmnIgxMOaXpemAseS6lCDkuIvljYg1OjI25a+r6YGT77yaCj4KPiBPbiBGcmkgQXByIDEwLCAy
MDI2IGF0IDExOjEwIEFNIENFU1QsIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4gRnJvbTogQ2hl
bmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBTZXZlcmFsIE1h
Y3Jvbml4IFNQSSBOT1IgZmxhc2ggZGV2aWNlcyBzaGFyZSB0aGUgc2FtZSBJRC4KPiA+IEZvciBp
bnN0YW5jZSwgdGhlIE1YMjVMNTEyNDVHIGFuZCBNWDI1TDUxMjczRyBzaGFyZSB0aGUgc2FtZSBJ
RAo+ID4gKDB4YzIyMDFhKSB3aXRoIHRoZSBjdXJyZW50bHkgbGlzdGVkIE1YNjZMNTEyMzVGLgo+
ID4KPiA+IEFkZCB0aGVzZSBlcXVpdmFsZW50IHBhcnQgbnVtYmVycyB0byB0aGUgY29tbWVudHMg
YWJvdmUgdGhlaXIKPiA+IGNvcnJlc3BvbmRpbmcgZmxhc2hfaW5mbyBlbnRyaWVzLgo+ID4KPiA+
IFdoaWxlIHRoaXMgY2hhbmdlIGRvZXMgbm90IGFmZmVjdCB0aGUgZnVuY3Rpb25hbCBkcml2ZXIg
bG9naWMsIGl0Cj4gPiBzaWduaWZpY2FudGx5IGltcHJvdmVzIHRoZSBzZWFyY2hhYmlsaXR5IG9m
IHRoZSBrZXJuZWwgc291cmNlIHRyZWUuCj4gPiBUaGlzIGhlbHBzIHVzZXJzIGVhc2lseSB2ZXJp
ZnkgdGhhdCB0aGVpciBzcGVjaWZpYyBwaHlzaWNhbCBwYXJ0IGlzCj4gPiBmdWxseSBzdXBwb3J0
ZWQsIHByZXZlbnRpbmcgY29uZnVzaW9uIGFuZCBkZXRlcnJpbmcgcmVkdW5kYW50IHBhdGNoCj4g
PiBzdWJtaXNzaW9ucyB0aGF0IGF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBlbnRyaWVzIGZvciB0
aGVzZSBhbGlhcyBwYXJ0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Cj4gSGkgQ2hlbmcsCj4KPiBjb3VsZCB5b3UgcGxl
YXNlIHByb3ZpZGUgYW4gU0ZEUCBkdW1wIG9mIGFsbCB0aGVzZSBjaGlwcz8gU2VlIFsxXQo+IGZv
ciBtb3JlIGluZm9ybWF0aW9uLgoKU3VyZS4gSSB3aWxsIHJlcGx5IHdpdGggdGhlIFNGRFAgZGF0
YSBhcyBzb29uIGFzIEkgaGF2ZSB0aGVtIHJlYWR5LgoKPgo+IFRoYW5rcywKPiAtbWljaGFlbAo+
Cj4gWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IuaHRt
bAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
