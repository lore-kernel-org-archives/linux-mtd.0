Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26711C34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 10:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA12A21D56
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 10:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHl3d7EW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VYcvuqLu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA12A21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iQQpIwX4cfT9tCiXBnXoMTMO86MhpjtZjVz6UYC3HQ=; b=GHl3d7EWXu7LrM
	cJECHM7g2nnxwdlm5Bm1EiF5r5HPPGne882lMPtrL9JAuh5qGCYQ5iDc8DDw2hDeRF7hGU7sQzxh9
	hCGcNPYEjyIPXibgaR7r+NLkpyWOoPxm0wyXpUoPr0Nv/FDrwsqoapvw5MmiJszTpz/SsLYmJhDwo
	vZjpo/TaPAw46Jq7pZ7ypMvFD2/Y5uvwTAxDbGDG8IkBm1kqYo1nDzeq7mLPMWCnv+ynIsQaROYzD
	krarm0CkQmRm9dU/KsadIl6qAmz4CGoDfINRvnlZW7TF32BiGVvrfhg9dAnCJCQbGSuUALo8I2u5r
	F6dfNogNoWZDAOMUl9AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Mvs-0001uK-HO; Wed, 19 Feb 2020 10:50:20 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Mvl-0001tj-UA
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 10:50:16 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200219105006epoutp037fec8c97929690ddc1c967acfc8896b8~0yB9sD1jT1867718677epoutp03r
 for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2020 10:50:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200219105006epoutp037fec8c97929690ddc1c967acfc8896b8~0yB9sD1jT1867718677epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582109406;
 bh=cLduOrg4wgL2ecvP3jBg95mKV9LAbYOMeSUE5fvcndA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=VYcvuqLuwO57V24IcVW7j4kJP01WnO15xp+zsPce/KUIhvyP/MhsymEvhe/A1eCas
 /WoRODf4ItQoKuWoDtPnkIfJfQMnfB+Zj11JuWT+14GlzZ51n11ekQeNBgr5ga8a5E
 0kvOeXA2WtOnQQ36fiNo2ajuU4GIyy/krVSiX6yI=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200219105006epcas1p1f9a9147227f3be43c3c3945a834c364e~0yB9ZIHg40719707197epcas1p1E;
 Wed, 19 Feb 2020 10:50:06 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.160]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 48Mvcs0PGMzMqYm2; Wed, 19 Feb
 2020 10:50:05 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.12.48019.CD21D4E5; Wed, 19 Feb 2020 19:50:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200219105004epcas1p44ddfea48e8764d944d2453ff250c6eef~0yB765K0B1644016440epcas1p45;
 Wed, 19 Feb 2020 10:50:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200219105004epsmtrp155c39243b22070b5c50b4232348f7c9c~0yB76Mkj-1611216112epsmtrp1d;
 Wed, 19 Feb 2020 10:50:04 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-45-5e4d12dcbccd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BC.2F.06569.CD21D4E5; Wed, 19 Feb 2020 19:50:04 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200219105004epsmtip20086250a6f596732f9090e032d340782~0yB7y0m-S3249932499epsmtip2G;
 Wed, 19 Feb 2020 10:50:04 +0000 (GMT)
Message-ID: <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, michael@walle.cc
Date: Wed, 19 Feb 2020 19:50:04 +0900
In-Reply-To: <132665276.5Rxbr4LpEM@localhost.localdomain>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SW0wTURD1dtvdxVi9LqIT/LCuGgMRbCmFRcWYiKaIEhL90cTWTdlQpK90
 CxGjwWhjlFiUD5RUVDT1RUIURAHf4oMIiEjU4IMIiE8oAd8GUbtujf6dmTlzz5m5QxPMATKa
 znV4BLeDt7HkeOWFmzHauG5mlUnb9hBxYxVDCq7vyaiKu7T9BMUFW89S3EhgCffr3jC1hDQ2
 +rsp47lAkfH5t+PIWFJXhYzNXfUK4/UrXjKLXGdbZBX4bMGtERwWZ3auIyeVzVhtXmo2JGl1
 cboULpnVOHi7kMqmrcyKW55rC7lgNQW8LT+UyuJFkZ2/eJHbme8RNFan6EllBVe2zaXTuuJF
 3i7mO3LiLU77Ap1Wm2AIMTfYrO0/z5OuGtj06fZrahvqZYpRBA04ESr6T5HFaDzN4AYEPY3D
 Kjn4gOBNoBPJwRcE3eWV1N+W4Xc3lHLhCoKbj64RUoHBgwgqyvOKEU2rsRGan2VJ6UicAQdL
 gqSESRwLXaO1KglPwTqoeftdIWECm6BlzKeUsBLPgcM9lX/4ETgF6kvbVbLuPAi2lCjl5yfD
 WEOk3DoD6oMVhGQHcBsJwYFyUuanQdPDH4SMI+F9c13YfzS827szjEVoPF1Kyc1eBH0nA+GC
 HoaC1YQkRuAYOHNxvpyeCY2jh5AsPBGGPu9RSRTAati1M7xRFgZ7vEoZA3S89IXtG2FP4GN4
 ufsV8Kq9n9qHNP5/4/j/G8f/T7gSEVVoquAS7TmCqHMl/v+/tejPUcZyDehy+8omhGnETlBf
 f5BhYlR8gVhob0JAE+wUdca0FSZGnc0XbhbcTrM73yaITcgQWnYpER1lcYZO3OEx6wwJer2e
 S0xKTjLo2Wnq3rUxJgbn8B4hTxBcgvtvn4KOiN6GfGhxcEdHVwdV3dM1qdV6G98afS+WH+os
 +uKfu+Pr1sz+WRO8mPPudl1WHakZeJv3YuGHq0Vtr2bPu1ZnKTtW3fw43bzGn75MM5TiO3H0
 CHUmoQytV9+30DM6k7x3buHVwtqnk/sOz5nVOnfjiO9zVObddKa/YMvs+8z0zvgWw+txrFK0
 8rpYwi3yvwHc7nR5qgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO4dId84g01fpC3+znnHZPHo5m9W
 i91Ny9gt3p7ewG7xcYmDxf+zH9gd2Dx2zrrL7rF5Sb3HnR9LGT36tqxi9Dh+YzuTx4G9LWwB
 bFFcNimpOZllqUX6dglcGef+bWUr2ChR8eXoM/YGxodCXYycHBICJhIfXh5k6WLk4hAS2M0o
 Mav3CCNEQkLi0c4vQAkOIFtY4vDhYoiaV4wST3ZcYAOJ8wp4SBy/HQBSLizgLTG77y0biM0m
 oCVx4/cmVhBbRMBQYuOLn0wgNrNAvMS15VvBbBYBVYl5DxaA1XMKWEpsn3iOFWL+LCaJmRse
 sUE0aEq0bv/NDnGPjsTbU30sEHsFJf7uEIYokZfY/nYO8wRGwVlIOmYhVM1CUrWAkXkVo2Rq
 QXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZw+Gtp7WA8cSL+EKMAB6MSD++Bi95xQqyJZcWV
 uYcYJTiYlUR4vcW94oR4UxIrq1KL8uOLSnNSiw8xSnOwKInzyucfixQSSE8sSc1OTS1ILYLJ
 MnFwSjUw8uS+eZm19Yym+++1C38/0vrXJKjtulniu3zqe6H5V05ulDA5rbvHRYj57Wn+NbNn
 3UgNZ2f9/HbP4YjQ+yoTJd7sCdtXGZz3xThp0b5XQuJZZkL7uP573/7S3ns6po7/62HRhYEm
 YmvfzVtk/Gz74rru5B7BlPpNyZIbSl9291c7qK3hmLEhV4mlOCPRUIu5qDgRAOXklsh7AgAA
X-CMS-MailID: 20200219105004epcas1p44ddfea48e8764d944d2453ff250c6eef
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
 <CGME20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b@epcas1p1.samsung.com>
 <132665276.5Rxbr4LpEM@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_025014_403843_1359D76B 
X-CRM114-Status: GOOD (  21.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: js07.lee@samsung.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Tudor and all

2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
> On Monday, February 10, 2020 12:29:34 PM EET Michael Walle wrote:
> > > It's bytes. Take a look at W25Q128JV. The sector size for this
> > > flash is
> > > 64KByte. The flash has 256 sectors. For this specific case:
> > > bp_slots_available = 6;
> > > bp_slots_needed = 8;
> > > 
> > > The if condition is true, so
> > > bp_slot_count = 6;
> > > bp_min_slot_size = 64k << (8 - 6); //256k
> > 
> > But nor->info->n_sectors is not 64k, its 256. Do you mean
> > sector_size
> > (like in
> > my example below? Then we are on the same page 
> 
> Indeed, there is a typo in the pseudo code; I'm happy that the
> example is 
> correct at least. I meant sector_size, not sectors. Now we should
> exercise the 
> logic to all the known (corner) cases. Maybe Jungseung will tell us
> if he 
> spots a flaw in the overall logic.
> 

I didn't find any flaw in this logic. But IMHO for the pseudo code.

bp_slots_available = (bp_mask >> shift) + 1 - 2;
bp_slots_needed = ilog2(nor->info->n_sectors);
 
if (bp_slots_needed > bp_slots_available) {  
    bp_slot_count = bp_slots_available;
    bp_min_slot_size = nor->info->sector_size <<
        (bp_slots_needed - bp_slots_available);
} else {
    bp_slot_count = bp_slots_needed;
    bp_min_slot_size = mtd->size >> bp_slot_count;
}

Probably we can use directly nor->info->sector_size for bp_min_slot_
size.

sector_size x n_sectors = mtd->size
mtd->size / n_sectors = mtd->size >>
ilog2(n_sectors) = sector_size

bp_slot_count is equal to log2(n_sectors) now so if we can trust the
value, we can also trust sector_size.

After change it,

if (bp_slots_needed > bp_slots_available)
    bp_min_slot_size = nor->info->sector_size <<
        (bp_slots_needed - bp_slots_available);
else
    bp_min_slot_size = nor->info->sector_size;

This is a comment from my previous mail.
> > The exact fact is that locks operate in two different ways
> > according to flash model.
> > 
> > (1) the smallest protected portion is fixed.
> >     for BP0-2 : 1/64
> >     for BP0-1 : 1/4
> > (2) the smallest protected portion is inversely propotional with
> > number of sectors.

(1) - if the slot is insufficient.
(2) - if the slot is sufficient.

From the fact, that could be rewritten like below. I think it's more
intuitive one.

if (bp_slots_needed > bp_slots_available)    // (1)
    bp_min_slot_size = mtd->size >> bp_slots_available;
else                                         // (2)
    bp_min_slot_size = nor->info->sector_size;

We could also find a few flashes that does not following the overall
logic. For example, "en25qh256" and "en25qh16" which was manufactured
by EON. They are always following way (2) no matter what the number of
slot is. It seems that it could be handled like below with custom hook
later.

if (bp_slots_needed < bp_slots_available || force)
    bp_min_slot_size = nor->info->sector_size;
else
    bp_min_slot_size = mtd->size >> bp_slots_available;

> Cheers,
> ta
> 

Thanks,



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
