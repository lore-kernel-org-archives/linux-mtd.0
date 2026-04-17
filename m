Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59253F8E497
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 00:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/OpPno2vr1iM56M3VK1oaqJYlyHCt/HDIxjGCC/If4=; b=qZf3xIBw9tD0V1
	bls2xe1jsB221DNaUxNVxpUZclvnE8YtdcOrHjUaKWcVlaTj2RPn/KVd12Sp2ScbyE2Ui7ytxD/9i
	KKKG/SfjAKgyDnZJBpeUXwQNFeEaVQD1758Au+LF3mPwI7PCjZIArO2BB0oKsn7GUdcsoBvbKOSS+
	fmBVzfS6Tk0eQhJY75mBF7FCfurTMvtT6JtH9s3pSaPcoKzvru1Nb49Un4lG34q15NvD0FQKAkme1
	6E8JOFWukFW9khmE6Aaz8f26Z/O6JtuhOYbtv7ZWBcFwnnOzwcf8OE0uMt4AP2Kqm8qnNrE3zjevB
	X2wQaSLE427WavqKSC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDX3P-00000003ETF-1i9L;
	Fri, 17 Apr 2026 00:27:27 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDX3M-00000003ESr-3Bol
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 00:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1776385645; x=1807921645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7+5YtD5SG96eKLiGK4YhtAOHxB6PjNm4F/9O22VNsw0=;
  b=fZjEwUp4DKMQNZTbEhESszb6js9sqGRmlAtGd6d+3AtcHm2tHlsqTbcC
   zk6uWY8v1at5Bsy6J4NphV8V+oV/u2woWrL0mzVEJync1GkmYPrOru2vc
   iCOFHNzQqcBcs53vBHnCcN8WSIpheNGXXpWY9gajV956QgFvAyn2JpB/o
   o=;
X-CSE-ConnectionGUID: LrmRtx0pR9+K0XIrBYLeQA==
X-CSE-MsgGUID: D1s4+bkkR5WKgRh96R0tmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="126444703"
X-IronPort-AV: E=Sophos;i="6.23,183,1770591600"; 
   d="scan'208";a="126444703"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:27:20 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Apr
 2026 02:27:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Apr
 2026 02:27:19 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.037; Fri, 17 Apr 2026 02:27:19 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <tkuw584924@gmail.com>,
	<linux-mtd@lists.infradead.org>
CC: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>
Subject: RE: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Thread-Topic: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Thread-Index: AQHczYAYPhFMkHaWPk6VkJBjnfwHvLXhX+6AgAED9yA=
Date: Fri, 17 Apr 2026 00:27:19 +0000
Message-ID: <97a94aa30860409fabe0ce97dbc92cd8@infineon.com>
References: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
 <DHUIOTOESC19.117TN18W5AV86@kernel.org>
In-Reply-To: <DHUIOTOESC19.117TN18W5AV86@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_172725_134207_163C974B 
X-CRM114-Status: GOOD (  13.13  )
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

> Hi,
> 
> On Thu Apr 16, 2026 at 11:03 AM CEST, tkuw584924 wrote:
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -124,23 +124,22 @@
> >  /* Keep these in sync with the list in debugfs.c */
> >  enum spi_nor_option_flags {
> >  	SNOR_F_HAS_SR_TB	= BIT(0),
> > -	SNOR_F_NO_OP_CHIP_ERASE	= BIT(1),
> 
> Can we just drop this line and leave the rest as is? It's already
> hard to follow any development in spi-nor due to code churn. I don't
> think one hole in the flags hurts. The next new flag can then just
> reuse it.
> 
> -michael
> 
Sounds fine to me. With a placeholder like this?
/* NEW FLAG HERE : BIT(1) */

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
