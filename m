Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0370C07E9D
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Sep 2022 08:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVGczUNwYm1EsZTTRaG3sFRZLIzNWKrHPIO38CsAVno=; b=TTGHkp6RdGVneC
	SVOsSUft8G2hXdd79tFi8hJalh26GObDpHcQZTtxjzvtweJ1FhT/xNUswGVZKf5U6ioXpSl5xNmN+
	Ppu76f+8Yf9xoBM0+0jW1yo32ctzoZ9201qUkI9c64qh38nomSrXs4oTuiEDIRNunQYpPSvI2G57H
	Bbi/DU7BEsRsl/NfN8vShUIMw3kaAQdCvxYVcIHsz969wiqi01rilss8giPaIC+W+t3IiX3apXlUY
	L3n3LkQXg4eRvQpRHakKIXXHFCwqZ95GkyVE5fEMidWBoMBBbPnNUt4OJS4eMOiT5tXlMATQmDJiB
	I3F60Mc2fVeEPU6YQFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc0nv-006irp-68; Sat, 24 Sep 2022 08:46:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc0nr-006ir8-Tw
	for linux-mtd@lists.infradead.org; Sat, 24 Sep 2022 08:46:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1F69AB80AD0;
	Sat, 24 Sep 2022 08:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B163C433C1;
	Sat, 24 Sep 2022 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664009184;
	bh=CcEEfEzmwgcNfVrRYjABgYWLl6nWS4p/VMRs14C4hro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcHsy0doGginUWgjwPxrp/H3kbhKcR4wIR9uNQQ/y2NSfOaAbIxgWKy3EwT603iED
	 XY9RVIObc13AtgwD7/bwikbPyhbB/B7t20TyA76f+9S1iEq09XNdt0HD2auwzdUQWI
	 lNXIAUeSSq5oAi55bY0bEi9xg75LB4+61I0PW+uU=
Date: Sat, 24 Sep 2022 10:46:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, stable <stable@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix memory leak when using debugfs_lookup()
Message-ID: <Yy7D3hmH9dYDUsdR@kroah.com>
References: <20220902133724.278133-1-gregkh@linuxfoundation.org>
 <bcd0cc5153457fb52566519a76e7b5b4@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcd0cc5153457fb52566519a76e7b5b4@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_014628_135446_B3DDF7B8 
X-CRM114-Status: GOOD (  25.81  )
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

On Fri, Sep 02, 2022 at 04:01:36PM +0200, Michael Walle wrote:
> Hi,
> 
> Am 2022-09-02 15:37, schrieb Greg Kroah-Hartman:
> > When calling debugfs_lookup() the result must have dput() called on it,
> > otherwise the memory will leak over time.  Fix this up to be much
> > simpler logic and only create the root debugfs directory once when the
> > driver is first accessed.  That resolves the memory leak and makes
> > things more obvious as to what the intent is.
> > 
> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: Pratyush Yadav <pratyush@kernel.org>
> > Cc: Michael Walle <michael@walle.cc>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/mtd/spi-nor/debugfs.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/debugfs.c
> > b/drivers/mtd/spi-nor/debugfs.c
> > index df76cb5de3f9..3aab595e82d1 100644
> > --- a/drivers/mtd/spi-nor/debugfs.c
> > +++ b/drivers/mtd/spi-nor/debugfs.c
> > @@ -228,11 +228,11 @@ static void spi_nor_debugfs_unregister(void *data)
> > 
> >  void spi_nor_debugfs_register(struct spi_nor *nor)
> >  {
> > -	struct dentry *rootdir, *d;
> > +	static struct dentry *rootdir;
> > +	struct dentry *d;
> >  	int ret;
> > 
> >  	/* Create rootdir once. Will never be deleted again. */
> > -	rootdir = debugfs_lookup(SPI_NOR_DEBUGFS_ROOT, NULL);
> 
> IIRC I had that one and it didn't work with spi-nor as a module.
> Wouldn't it try to create the root dir twice if you remove the module
> and load it again?

Yes it would, that is a use-model I did not consider at all, thanks.
I'll rework this.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
