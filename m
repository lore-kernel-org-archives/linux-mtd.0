Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A79CC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 13:58:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7AB20880
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 13:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GS69Fxff"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7AB20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eX2RQQFeUutGDh//BT167K6L9HGZaGeSVo/7GSINQrQ=; b=GS69Fxffvf4M2S
	wOwZ9x3EeScFw5SffFrGm6M+EPfr/MN0Z93vjcOd43Mc7+rJFZKlE/WDOILZd3hgcSZOW8imWRwbc
	J6W4r9iqCFhrKq35/t1f8Gsm9BV8KYqjRfDWvo9KQox6Ll6/YrkdrwOirgyPkmRczyweODlso4K5s
	yqcw0NBFpxzrsv7sM3jECKRS9iaKDuvfPmo2u36tsDBXSkpSCUL6/anw/hUnl16FwtcW0FVTGaWLe
	hId8atxnNj/iaoeMpFDr/lt5xGzRrH90vx3vqxg5C8RRtl6rGE5QXpVA2+oMZSnaPT8i8cNRs0lkn
	fP/LjwUg2JTvkeXferdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwSOL-0000Qr-TY; Wed, 20 Feb 2019 13:58:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwSOE-0000QX-8E
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 13:58:24 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwSOC-0002KB-KM; Wed, 20 Feb 2019 14:58:20 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1gwSOC-0007XA-CP; Wed, 20 Feb 2019 14:58:20 +0100
Date: Wed, 20 Feb 2019 14:58:20 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Prevent Nand page writes on Power failure
Message-ID: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:30:09 up 8 days, 21:55, 76 users, load average: 0.21, 0.17, 0.17
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_055823_352926_6837769C 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi All,

I have hardware here for which the normal way to turn off is just to cut
the power. When the powercut happens during a NAND page write then we
get more or less completely written pages during next boot. Very rarely
it seems to happen that such a half written page with only very few
flipped bits is erroneously detected as empty and written again which
then results in ECC errors when reading the data.

The Nand in question is a Micron MT29F4G08ABADAH4 and in TN2917 Micron
clearly states:

| Power loss during NAND array operations (especially Program/Erase) is a
| violation of the NAND voltage specifications, which is not supported and
| should be avoided

Micron suggests to make the capacitors on the Nand chips supply input
big enough that every started operation will be finished before the
power goes down. Now we don't have that situation here, what I have
though is a power good status GPIO, so my job is to wire that up to the
Nand write operations.

Now my question is how could that be done? I assume for some people a
power good failure means that we should write all important data away,
rather than preventing any Nand access. Given it's a policy decision I
assume user space should be involved, right?  An option might be to
introcude some sysfs entry to switch mtd devices to readonly mode. Would
that be fine? Other suggestions?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
