Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E5ACD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 05:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dxpFp8PkjqKeuLMyd1GNMJd4HEweiqBI9QTYVUEKk0=; b=d4e4h8YJqwzl4h
	U9vnwb+PaeZZuc0PtqBI7NE/y6/1uLCNvCsvQ1lp/1HF//mp7h7I0JPIb9z48Uomu+yAM6DBvvzLw
	Dnm0ddzjpg1Jf+uxe5DDzUQ4HtC7QIiWHjaproStnk3JfyTTzyDAjZErHKv/OAC+kuhv29CjCSQ+R
	3cB0jeNxAQQ4T/ryYzpuHERO3mWNeR4DEIEYVLiPsMUDEAPUvo51j3gmCuDvbKl1+U8/B6wEIxaYC
	wTDPf3J9xyi6tYBgMyqTSVbh79YAab0f7UxD35r6eadW9rXPxncgHkNd7lNifrL0ilfohUS/R0A3K
	D3lytfp0qkFJIV7lF9Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTYn-000000059va-2Nkh;
	Thu, 28 May 2026 05:45:37 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTYk-000000059vC-1FQS
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 05:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1779947134; x=1811483134;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UmWC9J4b9Tfm3v53S9gv2ORhgG85eJth/m1QLBDtMWs=;
  b=pzupy3Vi1FOdM+SwakX0yH/DyxDN0BWuLgFZAcP9N/iYdeK5LeTIT/ap
   ny+jM1VM2ZrbkXbFN4sRi+X8CQVAuLgTn9SGxuTn58Ys2WgSpkdOUs8e6
   NgUACy4AfcN9rtRaqm6XGaa3le5wKUwX22KL+Mky7K1LJtsf47/2NetLV
   k=;
X-CSE-ConnectionGUID: g+EyvFWESVWAJSQS4yo+ng==
X-CSE-MsgGUID: YiTK84iVQ+mwhaiDMkYp0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="131641230"
X-IronPort-AV: E=Sophos;i="6.24,172,1774306800"; 
   d="scan'208";a="131641230"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:45:31 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 07:45:31 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Thu, 28 May 2026 07:45:31 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <tkuw584924@gmail.com>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mtd: spi-nor: spansion: add die erase support in
 s28hx-t
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: spansion: add die erase support in
 s28hx-t
Thread-Index: AQHc7bgtBnrqF59rFEuTYkFqzA4gyLYhtUiAgAEvQzA=
Date: Thu, 28 May 2026 05:45:31 +0000
Message-ID: <92e7ecf4df5046c99090ca3f45500562@infineon.com>
References: <cover.1779872008.git.takahiro.kuwano@infineon.com>
 <36045be168c5e9525f9c649986b0f1a54dcb2be1.1779872008.git.takahiro.kuwano@infineon.com>
 <DITH9ULJ3A8X.1Y9MP83UY2MHB@kernel.org>
In-Reply-To: <DITH9ULJ3A8X.1Y9MP83UY2MHB@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_224534_644655_63491DAE 
X-CRM114-Status: GOOD (  20.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> 
> On Wed May 27, 2026 at 11:05 AM CEST, tkuw584924 wrote:
> > From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> >
> > S28Hx-T family has multi-die devices that support die erase opcode.
> > Update die erase opcode when the device is multi-die.
> >
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> > ---
> >  drivers/mtd/spi-nor/spansion.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> > index b6023076903a..65227d989de1 100644
> > --- a/drivers/mtd/spi-nor/spansion.c
> > +++ b/drivers/mtd/spi-nor/spansion.c
> > @@ -762,6 +762,9 @@ static int s28hx_t_late_init(struct spi_nor *nor)
> >  	params->ready = cypress_nor_sr_ready_and_clear;
> >  	cypress_nor_ecc_init(nor);
> >
> > +	if (params->n_dice > 1)
> > +		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
> > +
> 
> So this seems to be a common theme for the spansion/cypress flashes.
> Does it make sense to have a .mfr_flag USE_DIE_ERASE or
> SUPPORTS_DIE_ERASE that can be set in the flash entry instead of
> having many different fixups?

Yes, actually I plan to cleanup spansion.c later on, by using mfr_flags.
There are common features (incl. die-erase) across the device families that
appear in different fixups. I think I need to consolidate them and reduce
the number of fixup functions.

Thanks,
Takahiro



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
