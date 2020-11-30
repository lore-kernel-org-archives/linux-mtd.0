Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42832C64E8A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 13:21:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24F82073C
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 13:21:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jN99eCIP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s0MeHiUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24F82073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=px3acC+57EZyRymdBNFRgqkemV/3n8Mez6ANOeFfCNI=; b=jN99eCIPrKSs5h1Kyl4z7MinC
	A9AOWAi4m1yQPMtR6Lv2oFj/GNNi5b7C1zT0xziYA1f6kmAEevBTgNGWnjksa2LQI4Y0IgcUnb5Ie
	x6gUdzCDw/hCDfyhleCXoz9hvYZX1W+XkSehfmLG4Pw2Cth19iVYbWhV8nnwYCPAiaceUkNL/Hgr9
	QHUMLDvEHrhQ1FSyJnsMck+eH/NBNHEQhW2aCDOVrQjnd0tU2MgAuDK+WhI3MtqFduwTQpLUaSazc
	xyTWBUC0h80R4XHFGjIXVnuPQu3FBt8IO/4idj0raeITG4PZYcKfZ3WBcPvwyrtVCeGeBW2FQZ8M0
	d/o+Nt4LA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjj6o-0000Qp-2P; Mon, 30 Nov 2020 13:20:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjj6l-0000Q0-0w
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 13:20:47 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUDKivx107486;
 Mon, 30 Nov 2020 07:20:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606742444;
 bh=+/K2hKRb4yFQ1S8essiKDUp57a+GuXxB2VSy72qWHik=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=s0MeHiUzmbuNp+WqVoprFNIW3M61M0iO0vl5mYjqtvPTCl3cdLMOA04eL3qfpAmYY
 d7PLL//JI8tEIBWvZHINxGVh7wNDVChc/apNRjz5Q8CndsEacgZeQBtazPMFt5EZOK
 CliRAV7U7FgzZp3UJRCdPR23G0EJLuI8LVe0rnX4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUDKiMh085505
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 30 Nov 2020 07:20:44 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 07:20:43 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 07:20:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUDKg3p059300;
 Mon, 30 Nov 2020 07:20:43 -0600
Date: Mon, 30 Nov 2020 18:50:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR
 flashes
Message-ID: <20201130132040.ouzlqm6mnhhjmkzl@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201118182459.18197-2-p.yadav@ti.com>
 <2f07715e-fe44-c5fd-6194-b74ba9f22545@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2f07715e-fe44-c5fd-6194-b74ba9f22545@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_082047_200090_A1A90483 
X-CRM114-Status: GOOD (  32.54  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/11/20 10:58AM, Tudor.Ambarus@microchip.com wrote:
> On 11/18/20 8:24 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > For NOR flashes EC and VID are zeroed out before an erase is issued to
> > make sure UBI does not mistakenly treat the PEB as used and associate it
> > with an LEB.
> > 
> > But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
> > multi-pass page programming is not allowed on the default ECC scheme.
> > This means zeroing out these magic numbers will result in the flash
> > throwing a page programming error.
> > 
> > Do not zero out EC and VID for such flashes. A writesize > 1 is an
> > indication of an ECC-ed flash.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> > 
> > Notes:
> >     Changes in v2:
> > 
> >     - Use mtd->writesize to check if multi-pass programming can be done
> >       instead of using MTD_NO_MULTI_PASS_WRITE.
> >     - Remove the assertion that a NOR flash most have writesize of 1.
> > 
> >  drivers/mtd/ubi/build.c | 4 +---
> >  drivers/mtd/ubi/io.c    | 9 ++++++++-
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index e85b04e9716b..25fd7816b1f4 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -628,10 +628,8 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
> >                 ubi->bad_peb_limit = get_bad_peb_limit(ubi, max_beb_per1024);
> >         }
> > 
> > -       if (ubi->mtd->type == MTD_NORFLASH) {
> > -               ubi_assert(ubi->mtd->writesize == 1);
> > +       if (ubi->mtd->type == MTD_NORFLASH)
> >                 ubi->nor_flash = 1;
> > -       }
> > 
> >         ubi->min_io_size = ubi->mtd->writesize;
> >         ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
> > diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> > index 14d890b00d2c..2f3312c31e51 100644
> > --- a/drivers/mtd/ubi/io.c
> > +++ b/drivers/mtd/ubi/io.c
> > @@ -535,7 +535,14 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
> >                 return -EROFS;
> >         }
> > 
> > -       if (ubi->nor_flash) {
> > +       /*
> > +        * If the flash is ECC-ed then we have to erase the ECC block before we
> > +        * can write to it. But the write is in preparation to an erase in the
> > +        * first place. This means we cannot zero out EC and VID before the
> > +        * erase and we just have to hope the flash starts erasing from the
> > +        * start of the page.
> > +        */
> > +       if (ubi->nor_flash && ubi->mtd->writesize == 1) {
> 
> Are there any SPI NORs with ECC block size of 4 bytes? Should we call
> nor_erase_prepare() in this case?

None that I know of. But even if there was such a flash this check would 
continue to be correct.

Like Vignesh explained in the previous version, mtd->writesize > 1 means 
that multi-pass writes are not allowed in that ECC block. So even if a 
flash has ECC block size of 4, we still are not allowed to write 4 (or 
less) bytes to it before erasing first.
 
> Anyway, there's none in SPI NOR as of now, so:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> >                 err = nor_erase_prepare(ubi, pnum);
> >                 if (err)
> >                         return err;
> > --
> > 2.28.0
> > 
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
