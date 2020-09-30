Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49ADFC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:55:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05D02075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yCSdNuRA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="t3QoV6nR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05D02075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B6aXFUL6ZEkCBrFpWcKvPRCjDRnAuWhYE9NlJWa3ckI=; b=yCSdNuRAR5lqdwluUWMoCYwPN
	u9ixO0A54CrAngYD5OUtX5zwHrn9whCrz8lKfirA7Md0VjGFHyn3bGyem5oWhm2/D5TTfYBxkrQXp
	SXuJLx3dDdOgkRAhruHr3d8mOFoaqXC2KsYDx6Iw5D3a7GxdV5vB9kDKGMZqgfdn7BZLndfNcMhVP
	b0dxN07CYdBDUuneCpcBqeml5RA06H3d79jPuV0Ci/WrNc4+v1/JSm5X+9N1sdw7qDojQGg55rRnU
	GMe8hGIygw33UwTtn+HgVN/CL5Peqrq3k8pY+HY8+YlgY1TZ7Tq3+tk+5d0ZGCetOv3Y53GIrnSTE
	GZWLUZ5zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNW1M-0005uo-Io; Wed, 30 Sep 2020 06:55:24 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNW1J-0005uO-5b
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:55:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08U6tH3S111524;
 Wed, 30 Sep 2020 01:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601448917;
 bh=SjwzTMQn23wkJCILPpI4P6hiSeNglvKKYyq3k2vlQng=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=t3QoV6nRSNnRHIAcSrC7Zz5zfRkl/uPdPNQ/2iZhNQaDFdugJWy9g1OS1pfcTQGLP
 usYqIX146qqvqtOZgw7b2pyoqdiiQozpUUncbN/WqHJcX0uMNDKJu5Yi1jcnY89eed
 j+dQGrrxFrmRiP7cQuTgPCkGDbWKmYHsEcoJsUEA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08U6tH3r004249
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 01:55:17 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 01:55:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 01:55:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08U6tGxX115213;
 Wed, 30 Sep 2020 01:55:17 -0500
Date: Wed, 30 Sep 2020 12:25:15 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v13 08/15] mtd: spi-nor: core: do 2 byte reads for SR and
 FSR in DTR mode
Message-ID: <20200930065513.bwieuiyt4hwwgods@ti.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-9-p.yadav@ti.com>
 <6198a69a-2800-d14f-1d29-9511ba6a3f5f@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6198a69a-2800-d14f-1d29-9511ba6a3f5f@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_025521_301710_042B0799 
X-CRM114-Status: GOOD (  21.03  )
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

On 30/09/20 06:50AM, Tudor.Ambarus@microchip.com wrote:
> On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Some controllers, like the cadence qspi controller, have trouble reading
> > only 1 byte in DTR mode. So, do 2 byte reads for SR and FSR commands in
> 
> did you get garbage when reading only one byte?

Yes.
 
> > DTR mode, and then discard the second byte.
> > 
> > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 88c9e18067f4..87c568debf14 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -368,7 +368,7 @@ int spi_nor_write_disable(struct spi_nor *nor)
> >   * spi_nor_read_sr() - Read the Status Register.
> >   * @nor:       pointer to 'struct spi_nor'.
> >   * @sr:                pointer to a DMA-able buffer where the value of the
> > - *              Status Register will be written.
> > + *              Status Register will be written. Should be at least 2 bytes.
> >   *
> >   * Return: 0 on success, -errno otherwise.
> >   */
> > @@ -386,6 +386,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
> >                 if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
> >                         op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> >                         op.dummy.nbytes = nor->params->rdsr_dummy;
> > +                       /*
> > +                        * We don't want to read only one byte in DTR mode. So,
> > +                        * read 2 and then discard the second byte.
> > +                        */
> > +                       op.data.nbytes = 2;
> 
> just for octal dtr, but should be fine if you update the previous patch

Ok.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
