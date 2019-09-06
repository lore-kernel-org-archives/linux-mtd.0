Return-Path: <SRS0=stAP=XB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17F4C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 10:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70CC2082C
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 10:13:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HH5p77U6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70CC2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I4kFd01UR0ov5LgnExop4UMJ3iBKZfsHFcSyP6i7h4=; b=HH5p77U6IynYQT
	tKvuH/8GhoYMmPnXJmK1nUY9vnVMi6lvqU1mKwfbPZdjnM42bH0BoPLQqwgkjzwilvDWHYEZBnhEi
	GyR1V2FlpwLKDcfXbaeQMf4KSKqiY8EcYuI3IkQvRqVLKRt6V/2UC4akfxEDVnGk8dVM2EkAMm+W0
	Dsqu2o5AB8QrnquvyKgjQZqkMlsiexseqgqjrBM7T/Iva9wPtuDoVohEH5Drp89lJzMKHzqgXS0JB
	MnDB7fd80hOKX/r44+dgK1974o6wIZ2fUee73MvNIbfDlejShWIdTQnpT6QS6Y2dUR3gSGl6FQ+Ah
	uQeeAkKGEwovFYzzq65Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6BF6-0005K5-GS; Fri, 06 Sep 2019 10:13:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6BF2-0005G7-HF
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2019 10:13:22 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1i6BEy-0000Nn-WA; Fri, 06 Sep 2019 12:13:17 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1i6BEx-0002FT-Ot; Fri, 06 Sep 2019 12:13:15 +0200
Date: Fri, 6 Sep 2019 12:13:15 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190906101315.3umeesryfrvn56jk@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190906071200.mzaa5tlnpsrylwhj@pengutronix.de>
 <cb9b0e43-2f8f-22a3-39f5-de44d0c8f800@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb9b0e43-2f8f-22a3-39f5-de44d0c8f800@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:06:13 up 60 days, 16:16, 82 users,  load average: 0.28, 0.26, 0.23
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_031320_623653_224270D7 
X-CRM114-Status: GOOD (  24.87  )
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
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 06, 2019 at 11:59:20AM +0200, Sean Nyekjaer wrote:
> 
> 
> On 06/09/2019 09.12, Sascha Hauer wrote:
> > Hi,
> > 
> > On Thu, Sep 05, 2019 at 10:26:06PM +0200, Sean Nyekjaer wrote:
> > > Hi,
> > > 
> > > I have been troubleshooting some CAN problems on our imx6ull with a raw nand
> > > flash.
> > > I normally run with a 4.19 series kernel, but to verify those CAN problems
> > > have been resolved in newer kernels i have been trying ~5.3-rc6.
> > > 
> > > But with that kernel i have run into trouble with ubifs, it throws a lot of
> > > errors:
> > > [  188.384572] Not a node, first 24 bytes:
> > > [  188.384588] 00000000: ff ff ff 00 00 00 00 e4 03 00 00 a0 81 00 00 01 00
> > > 00 00 00 00 00 00 00                          ........................
> > > [  188.402976] UBIFS error (ubi0:8 pid 117): ubifs_read_node: bad node type
> > > (0 but expected 3)
> > > [  188.411605] UBIFS error (ubi0:8 pid 117): ubifs_read_node: bad node at
> > > LEB 46:49888, LEB mapping status 1
> > > 
> > > I started a bisect from Linux 5.3-rc7 (bad) to 5.2 (good).
> > > And i'm ending up here:
> > > 
> > > commit ef347c0cfd619a9251e5a2f9ff72e33650a9bccb (HEAD)
> > > Author: Sascha Hauer <s.hauer@pengutronix.de>
> > > Date:   Tue May 21 09:06:43 2019 +0200
> > 
> > Damn it
> > 
> > > 
> > >      mtd: rawnand: gpmi: Implement exec_op
> > > 
> > > dmesg on boot:
> > > [    1.229431] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
> > > [    1.229472] nand: Toshiba NAND 512MiB 3,3V 8-bit
> > > [    1.229510] nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB
> > 
> > 4k page size NAND, I didn't have such a device for testing, so indeed it
> > could be that my patch is broken for 4k NANDs.
> > 
> > > size: 128
> > > [    1.229547] ------------[ cut here ]------------
> > > [    1.229604] WARNING: CPU: 0 PID: 1 at
> > > drivers/mtd/nand/raw/internals.h:114 nand_reset_op+0x198/0x1c0
> > > [    1.229633] Modules linked in:
> > 
> > This is unrelated. Please cherry-pick:
> > 
> > commit b2b5921fe4b363ff29fea9183aca089231a6bafc
> > Author: Sascha Hauer <s.hauer@pengutronix.de>
> > Date:   Tue May 21 10:43:35 2019 +0200
> > 
> >      mtd: rawnand: initialize ntargets with maxchips
> 
> Okay will do :-)
> 
> > 
> > > [    1.231060] ---[ end trace 12b9d19a5aac4c9f ]---
> > > [    1.234710] Bad block table not found for chip 0
> > > [    1.236076] Bad block table not found for chip 0
> > > [    1.236113] Scanning device for bad blocks
> > > [    1.244907] random: fast init done
> > > [    1.701764] Bad eraseblock 798 at 0x00000c780000
> > > [    2.132734] Bad eraseblock 1536 at 0x000018000000
> > > [    2.133094] Bad eraseblock 1537 at 0x000018040000
> > > [    2.434057] Bad block table written to 0x00001ffc0000, version 0x01
> > > [    2.437254] Bad block table written to 0x00001ff80000, version 0x01
> > 
> > I assume your device had a bbt before, right? In that case we won't have
> > to go down to UBI, even a plain read seems to be broken.
> 
> Yes my devicetree looks like this:
> &gpmi {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
> 
> 
> 
> 
>         nand-on-flash-bbt;
>         status = "okay";
> };
> > 
> > Could you dump some NAND page with and without ef347c0cfd619a and see if
> > and how they are different? Something like "nanddump -c -l 4096 /dev/mtdx"
> > should do it. Maybe you have to adjust the starting address with the -s
> > option to get some page with data.
> 
> nanddump -c -l 4096 -s 0x0040000 /dev/mtd0 > before
> nanddump -c -l 4096 -s 0x0040000 /dev/mtd0 > after
> files are attached... They don't differ
> 
> Is is better to dump them to gist?

With mtd0 you took the blocks containing the bootloader. Try the one on
which the UBI volume is. Also please pick a page that is almost full.

You could generate a page with this (on the working kernel preferably):

flash_erase /dev/mtd2 0 0
seq 2000 | dd bs=4096 count=1 | nandwrite /dev/mtd2 -

Note this will erase /dev/mtd2

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
