Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E34CC3A5A2
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 11:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A581207FC
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 11:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKUmv2Wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A581207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKEZeufCf0Pb/Pn089uCtn1soKAwVoM5SW7BjIiS6yg=; b=UKUmv2WlSzN8dy
	OOdDe125/LcOoNfFCURRP7PKwSLRcEqZRVsS29Ejis8fsS5fZXXzDBvZf5MPEnMG7x/7rXUMNUEc8
	g6KSuVJpYnkaugTrsC78wIcDFWdPnOrDls4CovXyxAZzrug8I2qvdOcD0XqR1Em7CzJS+VsNpHZpk
	6nJ0PMlIzixWz/dLALlJDqixGL1UN0+iFmaUNOcjyWrKcxbPJYgu3dZKQQuF3yZ9qXmOFP5/2m3Q7
	rRLPcPxmq0RIQLwj1eidkUGSx3XRvLbqhRuROCYnPrA+iXPdwPV+X49FtV69/854/4AHjfo8AVAxG
	YGtWDf4sOtSdU0mKFBtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7e0m-0007xG-Bu; Tue, 10 Sep 2019 11:08:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7e0j-0007wl-4i
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 11:08:38 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1i7e0f-0007Qb-TS; Tue, 10 Sep 2019 13:08:33 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1i7e0f-0000Ym-Hd; Tue, 10 Sep 2019 13:08:33 +0200
Date: Tue, 10 Sep 2019 13:08:33 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:04:58 up 64 days, 17:15, 85 users,  load average: 0.16, 0.22, 0.19
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_040837_188054_5C8EAFCD 
X-CRM114-Status: GOOD (  17.35  )
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

On Tue, Sep 10, 2019 at 01:00:30PM +0200, Sean Nyekjaer wrote:
> 
> 
> On 10/09/2019 12.48, Sascha Hauer wrote:
> > On Tue, Sep 10, 2019 at 12:18:25PM +0200, Sean Nyekjaer wrote:
> > > 
> > > 
> > > On 10/09/2019 11.55, Sascha Hauer wrote:
> > > > > [    2.434057] Bad block table written to 0x00001ffc0000, version 0x01
> > > > > [    2.437254] Bad block table written to 0x00001ff80000, version 0x01
> > > > What about this "Bad block table written" message? You should see this
> > > > exactly once. Do you see this multiple times, especially when switching
> > > > kernels between the good one and the bad one?
> > > > 
> > > > Sascha
> > > 
> > > Not exactly sure what you mean, but here is the dumps:
> > > 
> > > Before (mtd: rawnand: gpmi: Implement exec_op)
> > > [    3.389352] Bad block table written to 0x00001ffc0000, version 0x01
> > > [    3.399019] Bad block table written to 0x00001ff80000, version 0x01
> > > 
> > > After
> > > [    3.301096] Bad block table written to 0x00001ffc0000, version 0x01
> > > [    3.310599] Bad block table written to 0x00001ff80000, version 0x01
> > 
> > The Bad block table is written once. When you see this message multiple
> > times then this means that Linux can't read the BBT and writes it again.
> > So the question is: Start the good kernel multiple times. Do you see
> > this message once or on each boot? Then start the bad Kernel multiple
> > times. Do you see the message once or on each boot?
> > 
> > Sascha
> > 
> 
> U-boot:
> => nand erase.chip
> 
> NAND erase.chip: device 0 whole chip
> Skipping bad block at  0x0c780000
> Skipping bad block at  0x18000000
> Skipping bad block at  0x18040000
> Skipping bad block at  0x1ff00000
> Skipping bad block at  0x1ff40000
> Skipping bad block at  0x1ff80000
> Skipping bad block at  0x1ffc0000
> 
> Look weird it marks the bbt location bad ?

Yes, that's normal. The BBT itself is marked as bad. Otherwise the they
would just be used by regular mtd users.

> Or is it a uboot feature?
> I have tried another board, and uboot marks the bbt location bad on that as
> well
> 
> First boot:
> [    4.149870] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xdc
> 
> 
> [    4.156589] nand: Toshiba NAND 512MiB 3,3V 8-bit
> [    4.161500] nand: 512 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB
> size: 128
> 
> [    4.175918] Bad block table not found for chip 0
> [    4.184059] Bad block table not found for chip 0
> [    4.188808] Scanning device for bad blocks
> [    4.690183] Bad eraseblock 798 at 0x00000c780000
> [    5.155504] Bad eraseblock 1536 at 0x000018000000
> [    5.161008] Bad eraseblock 1537 at 0x000018040000
> [    5.487883] Bad block table written to 0x00001ffc0000, version 0x01

And is this the bad kernel or the good kernel? The question I am trying
to answer is: Can the good kernel read the BBT it has written? Can the
bad Kernel do that?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
