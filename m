Return-Path: <SRS0=stAP=XB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6461C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 13:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D6E206BB
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2019 13:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEkuSLIw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D6E206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLuTWie45TEC/H6hKY2upxjeMQJ92jheTce7Mm7Mzyk=; b=WEkuSLIwa/wVFI
	C5DI04egK2N5dpjrY35kuINHeAvHIpPsPUoezQYaCTmjnVtQAVaD3Y5vFlBlrpTZ+y5WJnXVTUolD
	ulUhKTGfqdvKzBDLsVPV+ZbcCVuFWoFjdCK948yAqjb0Z3bie8Qs2VwztPCtAVFBmI8cdoPA1/XzG
	W57/01MVhyTgV8dqtX3Eolaujg+xcPx37Q/LCF46Z1XjGrgAmc2Y2NyUf/Q/WtRQYpRsxmYTSwmcK
	dRjsHoeZiqYEgx72Mw1DDQs/nG3lDvCuXwQh4BMUfZB4R3uHuU/SLaf/nmf2zqfidd2MBB2gGhfVN
	LQPqoGy+ZW5Y/Kit7l1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6EHp-0006i9-NN; Fri, 06 Sep 2019 13:28:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6EHm-0006hm-Ok
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2019 13:28:24 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1i6EHi-00067w-Lj; Fri, 06 Sep 2019 15:28:18 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1i6EHi-0001NG-6M; Fri, 06 Sep 2019 15:28:18 +0200
Date: Fri, 6 Sep 2019 15:28:18 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>
Subject: Re: [Bug] mtd: rawnand: gpmi
Message-ID: <20190906132818.i4er5xj6hpwi77ip@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190906071200.mzaa5tlnpsrylwhj@pengutronix.de>
 <cb9b0e43-2f8f-22a3-39f5-de44d0c8f800@geanix.com>
 <20190906101315.3umeesryfrvn56jk@pengutronix.de>
 <0d1e4391-178d-c6f3-5485-54020cd0af80@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d1e4391-178d-c6f3-5485-54020cd0af80@geanix.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:27:20 up 60 days, 19:37, 79 users,  load average: 0.04, 0.10, 0.12
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_062822_802136_58B5DDBD 
X-CRM114-Status: GOOD (  11.68  )
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

On Fri, Sep 06, 2019 at 01:06:58PM +0200, Sean Nyekjaer wrote:
> 
> 
> On 06/09/2019 12.13, Sascha Hauer wrote:
> > With mtd0 you took the blocks containing the bootloader. Try the one on
> > which the UBI volume is. Also please pick a page that is almost full.
> > 
> > You could generate a page with this (on the working kernel preferably):
> > 
> > flash_erase /dev/mtd2 0 0
> > seq 2000 | dd bs=4096 count=1 | nandwrite /dev/mtd2 -
> > 
> > Note this will erase /dev/mtd2
> > 
> > Sascha
> 
> did the commands decribed above ^^
> 
> root@iwg26:~# /tmp/nanddump -c -l 4096 /dev/mtd2
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 4
> Block size 262144, page size 4096, OOB size 128
> Dumping data starting at 0x00000000 and ending at 0x00001000...

Ok, both are identical, so this doesn't bring us further. Have you tried
the mtd test modules?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
