Return-Path: <SRS0=kTjQ=7J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20D5C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 07:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C101820C56
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2020 07:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sa0oGMMe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C101820C56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apMZ7mxGpxAUQdxKu56mTNgzRuqlO/L6rfJEAgAI4ns=; b=Sa0oGMMeh8dzX3
	iKy/9URrFXueszyDnTVxyEtfvn7QDww6sVTSHO3Odx7JPwVPACYUwRnwD2hvIX3J0gFmcYCvItXa2
	T1pZK8FE5U9SMfNL3Mmc7FeCnCrAqQLCjnoKYf408nR94PT/g7DcVUEq0zfa33kbWB7FQ15zCt5TK
	KU970MOKR26TKTF9nws42Uj711QPYZLH5nfqYpnGR+ULfTJGvIMc+bq4XeC+L4DjUTp/X5nmuajQ8
	J1y8YKpJ8RFhG5MZPsiZXhYAiqw8n45ksM5c8H7JG7U67a6RQ2RRpWtDmx5Ah3+sdtT8ND5M+qaWh
	9AkWDhFJxhpDOIUDcnKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdqN4-0007IC-9T; Wed, 27 May 2020 07:21:02 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdqMu-000789-7Z
 for linux-mtd@lists.infradead.org; Wed, 27 May 2020 07:20:54 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2971FFF80B;
 Wed, 27 May 2020 07:20:48 +0000 (UTC)
Date: Wed, 27 May 2020 09:20:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 17/28] mtd: rawnand: Define a unique reset data
 interface
Message-ID: <20200527092046.72280f6b@xps13>
In-Reply-To: <20200526232338.7d061be9@collabora.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-18-miquel.raynal@bootlin.com>
 <20200526232338.7d061be9@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_002052_581016_1EC9B9BC 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 26 May
2020 23:23:38 +0200:

> On Tue, 26 May 2020 21:17:14 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > All NAND chips will always use the same data interface for reset and
> > at startup: SDR mode 0. Instead of copying around the data interface
> > timings, let's just have a default reset data interface for that.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c    | 9 +++------
> >  drivers/mtd/nand/raw/nand_timings.c | 3 +++
> >  include/linux/mtd/rawnand.h         | 3 +++
> >  3 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index 89f10a8c1d62..1005035c233a 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -927,9 +927,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
> >  	 * timings to timing mode 0.
> >  	 */
> >  
> > -	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
> >  	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
> > -							&chip->data_interface);
> > +							  nand_reset_data_iface);
> >  	if (ret)
> >  		pr_err("Failed to configure data interface to SDR timing mode 0\n");
> >  
> > @@ -2484,7 +2483,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
> >   */
> >  int nand_reset(struct nand_chip *chip, int chipnr)
> >  {
> > -	struct nand_data_interface saved_data_intf = chip->data_interface;
> >  	int ret;
> >  
> >  	ret = nand_reset_data_interface(chip, chipnr);
> > @@ -2509,11 +2507,10 @@ int nand_reset(struct nand_chip *chip, int chipnr)
> >  	 * nand_setup_data_interface() uses ->set/get_features() which would
> >  	 * fail anyway as the parameter page is not available yet.
> >  	 */
> > -	if (!memcmp(&chip->data_interface, &saved_data_intf,
> > -		    sizeof(saved_data_intf)))
> > +	if (!memcmp(&chip->data_interface, nand_reset_data_iface,
> > +		    sizeof(*nand_reset_data_iface)))
> >  		return 0;
> >  
> > -	chip->data_interface = saved_data_intf;
> >  	ret = nand_setup_data_interface(chip, chipnr);
> >  	if (ret)
> >  		return ret;
> > diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> > index 52ee83e75646..343284c43e81 100644
> > --- a/drivers/mtd/nand/raw/nand_timings.c
> > +++ b/drivers/mtd/nand/raw/nand_timings.c
> > @@ -285,6 +285,9 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
> >  	},
> >  };
> >  
> > +/* All NAND chips share the same reset data interface: SDR mode 0 */
> > +const struct nand_data_interface *nand_reset_data_iface = &onfi_sdr_timings[0];  
> 
> Can we make that one a function?
> 
> const struct nand_data_interface *nand_get_reset_data_interface(void)
> {
> 	return &onfi_sdr_timings[0];
> }

Sure!

> 
> > +
> >  /**
> >   * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
> >   *                              set of timings
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 622da6527a36..6c334cca3977 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1203,6 +1203,9 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
> >  	return mtd_get_of_node(nand_to_mtd(chip));
> >  }
> >  
> > +/* Default/reset data interface */
> > +extern const struct nand_data_interface *nand_reset_data_iface;
> > +
> >  /*
> >   * A helper for defining older NAND chips where the second ID byte fully
> >   * defined the chip, including the geometry (chip size, eraseblock size, page  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
