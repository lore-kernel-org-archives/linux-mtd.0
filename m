Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44056C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:38:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87DF20780
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6pmL6g/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o0Y2JkOb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C87DF20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kxd7BIIFy7zc7ameJRfxfYkZkg2Z2zkgJ8GSNNkAz+A=; b=C6pmL6g/LG2WQh4Tsk2nKZvar
	GxurJ5f2oKhVG3NHadD1G4EFF26tPASSWdihPl5AkWGjnWKq5CiE7ZTx3aCZ9ctw4Ga1PfSfvHNGo
	/Dx5W7yddYCgkmB6CuBm/q9b54A88sitt13sbfHagYj3sUL2aAOUpri3BhlokOi3xAlULYt2OhJ0+
	l3yiG4afzW0Kooa3fQXEVH9fqD+M70IjvoDoCZe91To9iNBy/eP3MWp8NdFhVjFZpOSSqWtqxpLiR
	H2bPNbEgWKGrdAHLrKh83KbmRBy/5/4WYbnu+wkAD6EEvbbBeAPpgza2b4C9YmJpvxK6fhfySw/HT
	NKXiolRwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNu64-00041s-TG; Thu, 01 Oct 2020 08:37:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNu62-00040i-Ei
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:37:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0918bgBD053910;
 Thu, 1 Oct 2020 03:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601541462;
 bh=Hi8WgMTw+/dEZZLoXlkBElU7G3gt+3V10JrngjJzxwI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=o0Y2JkObjtO7UyzG5aFY2Q7/r7HweK13KhBazrgv1MR+vMjjUfYe1KJCqlsPWLunD
 jZLGTMmOB7FPNcFpI7AN7cEG955mGy7yTEzxHA+Ftr/Fd6qw/GaejBFAlszK1ANxdU
 hyp3W3smevtMJE/n7pp8vK0K3Ae86WbWyWM3SNR4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0918bgvs059099
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 03:37:42 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 03:37:41 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 03:37:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0918beBV092139;
 Thu, 1 Oct 2020 03:37:41 -0500
Date: Thu, 1 Oct 2020 14:07:39 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v14 03/15] mtd: spi-nor: add support for DTR protocol
Message-ID: <20201001083737.iacunfb7l75elvex@ti.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-4-p.yadav@ti.com>
 <67f14906-ef28-ff4c-b41f-3500c9212ad7@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67f14906-ef28-ff4c-b41f-3500c9212ad7@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_043750_614378_47EE2528 
X-CRM114-Status: GOOD (  24.91  )
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
Cc: vigneshr@ti.com, richard@nod.at, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 01/10/20 07:46AM, Tudor.Ambarus@microchip.com wrote:
> On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> > @@ -2387,12 +2496,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor 
> > *nor, u32 *hwcaps)
> >         struct spi_nor_flash_parameter *params = nor->params;
> >         unsigned int cap;
> > 
> > -       /* DTR modes are not supported yet, mask them all. */
> > -       *hwcaps &= ~SNOR_HWCAPS_DTR;
> > -
> >         /* X-X-X modes are not supported yet, mask them all. */
> >         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
> > 
> > +       /*
> > +        * If the reset line is broken, we do not want to enter a stateful
> > +        * mode.
> > +        */
> > +       if (nor->flags & SNOR_F_BROKEN_RESET)
> > +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
> 
> SNOR_HWCAPS_X_X_X is already masked out above. Do we need to do it again?

That might change later and the person removing that line might not 
remember or even know to add it back here.
 
> > +
> >         for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
> >                 int rdidx, ppidx;
> > 
> > @@ -2967,7 +3098,9 @@ static int spi_nor_init(struct spi_nor *nor)
> >                 return err;
> >         }
> > 
> > -       if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES)) {
> > +       if (nor->addr_width == 4 &&
> > +           nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
> > +           !(nor->flags & SNOR_F_4B_OPCODES)) {
> >                 /*
> >                  * If the RESET# pin isn't hooked up properly, or the system
> >                  * otherwise doesn't perform a reset command in the boot
> > @@ -3024,7 +3157,21 @@ static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> > 
> >  static int spi_nor_set_addr_width(struct spi_nor *nor)
> >  {
> > -       if (nor->addr_width) {
> > +       if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> 
> This should come as an "else if". We need to let the posibility to retrieve
> addr_width from SFDP, the standard knows better than us.

Ok. Will fix.
 
> With these addressed, one can add:
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> > +               /*
> > +                * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
> > +                * in this protocol an odd address width cannot be used because
> > +                * then the address phase would only span a cycle and a half.
> > +                * Half a cycle would be left over. We would then have to start
> > +                * the dummy phase in the middle of a cycle and so too the data
> > +                * phase, and we will end the transaction with half a cycle left
> > +                * over.
> > +                *
> > +                * Force all 8D-8D-8D flashes to use an address width of 4 to
> > +                * avoid this situation.
> > +                */
> > +               nor->addr_width = 4;
> > +       } else if (nor->addr_width) {
> >                 /* already configured from SFDP */
> >         } else if (nor->info->addr_width) {
> >                 nor->addr_width = nor->info->addr_width;

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
