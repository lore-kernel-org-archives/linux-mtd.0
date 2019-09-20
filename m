Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224CAC49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 09:17:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52B12070C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 09:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cb0TiSm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52B12070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BY6l32gTBkryG6HyIO2wptoK+w0PpqHKtsO6l6+BAcg=; b=Cb0TiSm9fVeW1A
	JTfDWh2DtGmJtzxy6Mhup9i7PrumWFJL6UiOhTF24JEKvxrE/RbHsw5Bjef4ZdjfwkH/CMpdE64Hn
	B8LXHJS4rfOn90f+OE7F4WRxWMSvi4Voa3Irb4Z1p7OycjG56jfFVexZ/A9obbeD1y4PFByc6nPCJ
	wfcfa+QB/y4dM6duKdwlztNuK9WNpE06lkNGTryX/V7HBSxkxSuXBGRPRTnmFpafWkWV7V0dvqC4y
	g4fcYj4FBAuRvobeuSuddmuAGLbEB0SstMHMozWdqF0ddrYSMUBYlqS3Ts6xLXojEGrf7mvWH3mIg
	PF1kxyMaB7YRTFVS+nHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBF2m-0006Qu-AK; Fri, 20 Sep 2019 09:17:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBF2g-0006QQ-Na
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 09:17:32 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iBF2c-0003VQ-QZ; Fri, 20 Sep 2019 11:17:26 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iBF2c-0000EG-D9; Fri, 20 Sep 2019 11:17:26 +0200
Date: Fri, 20 Sep 2019 11:17:26 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190920091726.qitfnktswgvpqxj5@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
 <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
 <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
 <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
 <20190919132719.3ca48967@xps13>
 <6c0a1fdb-45cc-87aa-d1fb-f07f7e21a4a5@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c0a1fdb-45cc-87aa-d1fb-f07f7e21a4a5@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:33:29 up 74 days, 14:43, 83 users,  load average: 0.02, 0.07, 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_021730_778572_6B2C8189 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 Martin =?iso-8859-15?Q?Hundeb=F8ll?= <martin@geanix.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 19, 2019 at 02:15:22PM +0200, Sean Nyekjaer wrote:
> =

> > > Hi Sascha
> > > =

> > > Please let me know when you have some time to look into this :-)
> > > I dosen't seem right that it writes the bbt on a 4.19 series kernel t=
wice
> > > =

> > =

> > For me the disturbing part is:
> > =

> > > > > > [=A0=A0=A0 4.175918] Bad block table not found for chip 0
> > > > > > [=A0=A0=A0 4.184059] Bad block table not found for chip 0
> > =

> > Writing the BBT twice is expected.
> > =

> > Thanks,
> > Miqu=E8l
> > =

> =

> Hi,
> =

> Tried this:
> =

> diff --git a/drivers/mtd/nand/raw/nand_bbt.c
> b/drivers/mtd/nand/raw/nand_bbt.c
> index 39db352f8757..b0337f8a0da4 100644
> --- a/drivers/mtd/nand/raw/nand_bbt.c
> +++ b/drivers/mtd/nand/raw/nand_bbt.c
> @@ -1200,6 +1200,8 @@ static int nand_scan_bbt(struct mtd_info *mtd, stru=
ct
> nand_bbt_descr *bd)
>         if (res)
>                 goto err;
> =

> +       search_read_bbts(mtd, buf, td, md);
> +
>         /* Prevent the bbt regions from erasing / writing */
>         mark_bbt_region(mtd, td);
>         if (md
> =

> Result is:
> =

> [    2.191412] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
> =

> =

> [    2.198095] nand: Toshiba NAND 512MiB 3,3V 8-bit
> =

> [    2.202848] nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, =
OOB
> size: 128
> =

> [    2.217337] Bad block table not found for chip 0
> =

> =

> [    2.225535] Bad block table not found for chip 0
> =

> =

> [    2.230475] Scanning device for bad blocks
> =

> =

> [    2.749832] Bad eraseblock 798 at 0x00000c780000
> [    3.230712] Bad eraseblock 1536 at 0x000018000000
> [    3.236263] Bad eraseblock 1537 at 0x000018040000
> [    3.574122] Bad block table written to 0x00001ffc0000, version 0x01
> [    3.584874] Bad block table written to 0x00001ff80000, version 0x01
> [    3.592306] Bad block table found at page 131008, version 0x01
> =

> =

> [    3.600059] Bad block table found at page 130944, version 0x01
> [    3.607129] 3 fixed-partitions partitions found on MTD device gpmi-nand
> =

> [    3.614105] Creating 3 MTD partitions on "gpmi-nand":
> [    3.619540] 0x000000000000-0x000000800000 : "boot"
> [    3.635437] 0x000000800000-0x00001ca00000 : "ubi"
> [    4.018183] 0x00001ca00000-0x000020000000 : "testing"
> =

> =

> [    4.070734] gpmi-nand 1806000.gpmi-nand: driver registered.
> =

> Seems like it's U-boot that is corrupting the table.

I don't think that U-Boot is corrupting the table. Apparently
ef347c0cfd619a925 introduces a unwanted change in the page layout of the
NAND. I would expect that with the known good kernel you have a bbt
written by either the Kernel or U-Boot, doesn't matter, both parties can
read it. Once you start the broken Kernel the kernel can no longer read
the table, re-writes it, can now read it itself, but U-Boot no longer
can read it, then re-writes it with the effect that Linux re-writes it
again.

I don't know how the differences look, you have to nail that down
yourself by systematically using nandwrite and nandread, maybe with or
without oob. Once you found the differences I can help you in finding
the issue in my patch. Alternatively I can offer you to have a look
myself, but you would have to provide me a board, either physically
by mail or virtually by ssh.

Sascha

-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
