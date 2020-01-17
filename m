Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04563C33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4092073A
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rom60god"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4092073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLkpx4OfkNV31ITpptCdRBpnduiaWjz/7tv24BwGXFY=; b=rom60godNmnWep
	zA+QhkrTBn2t5j/NuvWd+dnaIDU++dzFzcw4u39I0INYK0V0R+mF1mjdBR/vRsqsqsfjB0tY+c24U
	r43B3oYUhdCL2gcZuVh7Lgv/8KTFTcUPuH1XGKPIC0ODgHLt8DU7h43YhWzLBMogcSbQJxEjHq4VH
	i9xVlu6XC8A95uag7AuSH4bl8iP6q8b6c3QvNR58i8/84kpHj1EX3EMThUVcvLbEsEvu4DowWflNw
	gCrotfr6SbndEEom4/81SqA0DpTnM9agu7YSDqWjvvejVCQNiyMGsSEYszGNl8xHwuUWkzezgCJUg
	3+RDLMvP+BHc+8tANJTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isLte-0006nb-1e; Fri, 17 Jan 2020 07:18:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isLtY-0006n2-VK
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 07:18:20 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1isLtT-0004Df-Gn; Fri, 17 Jan 2020 08:18:11 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1isLtS-0000nK-CZ; Fri, 17 Jan 2020 08:18:10 +0100
Date: Fri, 17 Jan 2020 08:18:10 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [EXT] [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
Message-ID: <20200117071810.2kuiwr6rhlofp6th@pengutronix.de>
References: <20191108074852.18507-1-m.felsch@pengutronix.de>
 <DM6PR08MB6396AB87FEE731C7B3588358B84D0@DM6PR08MB6396.namprd08.prod.outlook.com>
 <20191118140951.dlvsozieeatnmd7d@pengutronix.de>
 <20191118183954.4091abdc@collabora.com>
 <20191119092704.mz4pie37z6ngxyyn@pengutronix.de>
 <20200109171200.49f299e5@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109171200.49f299e5@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:17:35 up 62 days, 22:36, 55 users,  load average: 0.00, 0.06, 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_231817_007973_E3034176 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "Shivamurthy Shastri \(sshivamurthy\)" <sshivamurthy@micron.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 20-01-09 17:12, Miquel Raynal wrote:
> Hi Marco,
> =

> > > > > =

> > > > > I think, this should be NAND_ECCREQ(4, 512).    =

> > > > =

> > > > I don't thinks so, according the datasheet [1], section ECC Protect=
ion:
> > > > =

> > > > 8<--------------------------------------
> > > > During a PROGRAM operation, the device calculates an ECC code on th=
e 2k
> > > > page in the cache register, before the page is written to the NAND
> > > > Flash array. The ECC code is stored in the spare area of the page.
> > > > 8<--------------------------------------  =

> > > =

> > > Looking at "Table 11: ECC Protection" it really seems to be 4bit/512.=
 I
> > > think the sentence you quoted just means the ECC is calculated for ea=
ch
> > > 512 bytes block in the page and written at once (no subpage write).  =

> > =

> > Yes that part confuses me a bit and than I used the description above..
> > I will change that, thanks for the explanation.
> > =

> > > BTW, there's an easy way to know who's right =3D> nandbiterrs.  =

> > =

> > Thanks for that hint :)
> > =

> > Regards,
> >   Marco
> =

> Would you mind sending an updated version of this patch please?

Of course, thanks for the ping.

Regards,
  Marco

> =

> Thanks!
> Miqu=E8l
> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
