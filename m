Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE9DC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 12:31:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39D0C20729
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 12:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZuZAq4Ru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39D0C20729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BoqvtJFdAnxkri3usV4LY4SNpm4CIyK/YUNXMHXqXHE=; b=ZuZAq4Ru/UmLUZGZUGQw+zt+3
	9CTJywbwByoSaazlb39uY9vW1qckFoOSy+EkFV5NEPMoZ9ioHN5G1xdHIiYtckFHHxHPd+ndFmxSY
	8/LjgCEZWjiiLJfiB4f/Z8dQXiarrGv9D7Tan+MqDBbXfpc3e2wsNPEwnfZbWGtll9Xr8MiJ/6TDV
	XBjxw/BjJF2CFU85Lr+gQjjK1upImvVx2aPXYOPkRdeSsv4GRJa8Aov1UKgAZUQaE5e23WCNDIHcF
	bFRM1zRHnPWzQjW7Oxv3zDaMos0wfeG4FDbySXIuotUcy2qcWq7w5KWz6YpV8kwgMmTkwNaS3cCIA
	qKGLxyAzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf07c-0004h9-7m; Tue, 17 Nov 2020 12:30:08 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf07a-0004gZ-0m
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 12:30:06 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kf07W-0004Xh-UE; Tue, 17 Nov 2020 13:30:02 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kf07V-0005Ms-RP; Tue, 17 Nov 2020 13:30:01 +0100
Date: Tue, 17 Nov 2020 13:30:01 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Juergen Borleis <jbe@pengutronix.de>
Subject: Re: mtd: rawnand: gpmi: regression since
 e5e5631cc88987a6f3cd8304660bd9190da95916
Message-ID: <20201117123001.GE29830@pengutronix.de>
References: <315838324eb25d3a1ab37ee90fa28fa1cdc48cae.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <315838324eb25d3a1ab37ee90fa28fa1cdc48cae.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:28:49 up 271 days, 19:59, 95 users,  load average: 0.10, 0.21,
 0.25
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_073006_115396_1C33F371 
X-CRM114-Status: GOOD (  15.95  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 11:16:26AM +0100, Juergen Borleis wrote:
> Hi,
> 
> reading a NAND page in raw mode is required to check the consistence of the so-
> called FCBs (used to boot the SoC from NAND content).
> 
> Before e5e5631cc88987a6f3cd8304660bd9190da95916 ("mtd: rawnand: gpmi: Use
> nand_extract_bits()") it reads the first page of the NAND correctly as:
> 
> 00000000  00 00 88 fb ff ff 46 43  42 20 00 00 00 01 50 3c  |......FCB ....P<|
> 00000010  19 06 00 00 00 00 00 08  00 00 80 08 00 00 40 00  |..............@.|
> 00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 09 00  |................|
> 00000030  00 00 00 02 00 00 00 02  00 00 09 00 00 00 0a 00  |................|
> 00000040  00 00 03 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000060  00 00 00 00 00 00 00 00  00 00 00 01 00 00 80 10  |................|
> 00000070  00 00 55 01 00 00 55 01  00 00 01 00 00 00 9e 07  |..U...U.........|
> 00000080  00 00 02 00 00 00 00 08  00 00 00 00 00 00 00 00  |................|
> 00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000200  40 05 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
> 00000210  40 01 00 00 00 80 05 00  00 80 05 00 40 01 00 00  |@...........@...|
> 00000220  c0 03 00 00 80 02 00 00  00 00 00 00 00 00 00 00  |................|
> 00000230  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000240  00 00 00 00 00 00 00 00  00 00 00 00 00 00 07 00  |................|
> 00000250  80 83 06 00 00 00 07 00  00 00 07 00 00 07 00 00  |................|
> 00000260  00 42 06 00 80 05 00 00  00 40 06 00 00 00 00 00  |.B.......@......|
> 00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000790  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fc  |................|
> 000007a0  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 000007b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000800  ff 00 00 00 00 00 00 00  00 00 00 00 17 15 06 06  |................|
> 00000810  10 1f 03 07 00 00 00 1c  0f 17 1f 05 00 00 00 00  |................|
> 00000820  00 19 00 00 0e 19 00 00  00 00 00 00 00 00 00 00  |................|
> 00000830  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000880
> 
> After applying e5e5631cc88987a6f3cd8304660bd9190da95916 reading the same page
> the reported content is broken (the NAND page still contains correct data):
> 
> 00000000  00 00 88 fb ff ff 46 43  42 20 00 00 00 01 50 3c  |......FCB ....P<|
> 00000010  19 06 00 00 00 00 00 08  00 00 80 08 00 00 40 00  |..............@.|
> 00000020  00 00 00 00 00 00 00 00  00 00 00 00 00 00 09 00  |................|
> 00000030  00 00 00 02 00 00 00 02  00 00 09 00 00 00 0a 00  |................|
> 00000040  40 05 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |@...............|
> 00000050  40 01 00 00 00 80 05 00  00 80 05 00 40 01 00 00  |@...........@...|
> 00000060  c0 03 00 00 80 02 00 00  00 00 00 00 00 00 00 00  |................|
> 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 00000250  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 fc  |................|
> 00000260  03 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> 00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> *
> 000002c0  06 70 c0 a8 00 00 00 00  00 00 00 00 40 00 00 00  |.p..........@...|

Note beginning from offset 0x2c0 we get some uninitialized data. Among
other things we saw systemd unit files there.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
