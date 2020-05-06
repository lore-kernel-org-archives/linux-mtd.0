Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A3DC28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:45:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7E5206D5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 08:45:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sgdoW24I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7E5206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHcVucF9UKMja3/LnvDlUrnkkZi6NANUJdhmo4BjfbI=; b=sgdoW24IkFOztC
	gAnYEis1Cz+uXFesEH1XP6tF3IV+aFtQR6tDIzdfV6ynhdB3aYXLTMKb036Wl/oRCZ+IT7EqG/Q8V
	RzqDiecyZ5w5NI3wX5IrOfpefJqjk77tXPAAv4x+vL3HF+QthS8DnuayqA0axSYxTNBW21MFImHu9
	ospcTMf837u/pyxC2yOMp4kX28DBeGkLVYFQezLBZlq15dgXTDlw6p9oZN7sFfvdYinidQPWKI2nr
	odemSswX+p9lZg0l1vIrYOOqLYzV/8O+wQSxfyM24P355zHixhSaUK66kAGDHdUpTHJ3TkjNh/Zvx
	/EYgi+QB2LyEoRVkrE1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWFgJ-0007T2-3l; Wed, 06 May 2020 08:45:31 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWFgF-0007S1-9Y
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 08:45:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AB12D2A2186;
 Wed,  6 May 2020 09:45:25 +0100 (BST)
Date: Wed, 6 May 2020 10:45:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
Message-ID: <20200506104522.6c90f88f@collabora.com>
In-Reply-To: <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-4-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_014528_072140_E1CFBB66 
X-CRM114-Status: GOOD (  20.50  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 "Zoltan Szubbocsev \(zszubbocsev\)" <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 6 May 2020 08:28:43 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> Hi, Miquel
> I have two questions about your patch, please help me. 
> 
> > +	 */
> > +	for (eb = first_eb; eb < first_eb + nb_eb; eb++) {
> > +		/* Il all the first pages are not written yet, do it */
> > +		if (micron->writtenp[eb] != MICRON_PAGE_MASK_TRIGGER)
> > +			micron_nand_avoid_shallow_erase(chip, eb);
> > +
> > +		micron->writtenp[eb] = 0;
> > +	}  
> 
> 
> Here, if the power loss happens before erasing this block, for the next time boot up,
> What will happen from FS layer in case FS detect this filled data?

Most likely ECC errors will be returned, but that doesn't matter since
this block was about to be erased. You have pretty much the same
problem for partially erase blocks already, and that should be handled
by the wear-leveling/FS, if not, that would be bug (note that it's
properly handled by UBI, which just considers the block as invalid and
schedules an erase).

> 
> > +
> > +	return nand_erase_nand(chip, instr, allowbbt); 
> >+ }  
> 
>  static int
> > +micron_nand_write_oob(struct nand_chip *chip, loff_t to,
> > +				 struct mtd_oob_ops *ops)
> > +{
> > +	struct micron_nand *micron = nand_get_manufacturer_data(chip);
> > +	unsigned int eb_sz = nanddev_eraseblock_size(&chip->base);
> > +	unsigned int p_sz = nanddev_page_size(&chip->base);
> > +	unsigned int ppeb = nanddev_pages_per_eraseblock(&chip->base);
> > +	unsigned int nb_p_tot = ops->len / p_sz;
> > +	unsigned int first_eb = DIV_ROUND_DOWN_ULL(to, eb_sz);
> > +	unsigned int first_p = DIV_ROUND_UP_ULL(to - (first_eb * eb_sz), p_sz);
> > +	unsigned int nb_eb = DIV_ROUND_UP_ULL(first_p + nb_p_tot, ppeb);
> > +	unsigned int remaining_p, eb, nb_p;
> > +	int ret;
> > +
> > +	ret = nand_write_oob_nand(chip, to, ops);
> > +	if (ret || (ops->len != ops->retlen))
> > +		return ret;
> > +
> > +	/* Mark the last pages of the first erase block to write */
> > +	nb_p = min(nb_p_tot, ppeb - first_p);
> > +	micron->writtenp[first_eb] |= GENMASK(first_p + nb_p, first_p) &
> > +				      MICRON_PAGE_MASK_TRIGGER;
> > +	remaining_p = nb_p_tot - nb_p;
> > +
> > +	/* Mark all the pages of all "in-the-middle" erase blocks */
> > +	for (eb = first_eb + 1; eb < first_eb + nb_eb - 1; eb++) {
> > +		micron->writtenp[eb] |= MICRON_PAGE_MASK_TRIGGER;
> > +		remaining_p -= ppeb;
> > +	}
> > +
> > +	/* Mark the first pages of the last erase block to write */
> > +	if (remaining_p)
> > +		micron->writtenp[eb] |= GENMASK(remaining_p - 1, 0) &
> > +					MICRON_PAGE_MASK_TRIGGER;
> > +  
> 
> 
> This micron->written is stored in the system memory, once power cut,  for the next time
> Boot up, will it be reinstated or it will be 0x00?

Yep, and that shouldn't be a problem, it just means we might have
unneeded page writes if the pages were already written, but, other than
the perf penalty it incurs, it should work fine.

We can optimize that a bit by adding a ->post_read_page() hook
so we can flag already read pages as written/erased and avoid those
unneeded writes in some situations.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
