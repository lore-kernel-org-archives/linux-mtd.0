Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCB3C5DF85
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 05:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FisrpCKTxv151tBJQn6mlk9WDXr2cE+CzE4KQ+DkoF8=; b=DSAIFwR4bGfw80
	5JwfMiLL8udqqIvK7S8E1RrR+QzauYYqj/c3XksWECPMVFcDDopnEjAewxr9KQWvPEnQn/FCJ8CtE
	NP/bXHBVAw9RmZGS0acNwyW+M53yMpEOjzC0oSvBBIxVtjR4NmvzSt986iZEFUM4dasIlJvpW5U6a
	lTXFgb7ASZlonOqRKoY8wBUOmtRGj4ajCg4jm7gsVNyesMWBVDLK7HQT9muDDaeb7iRUvz9IH6GRN
	p1BPGBTdoDZLnFb2ntU70zyUmxXZrs2PlZq+jj/tPV570RIRB4s+6PPBDAOSok7wDOqZUpSb2Of0A
	9M2S9bwzSHxJT6yMqfZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmU-0000000At9Y-3ytg;
	Thu, 20 Aug 2026 05:57:38 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmS-0000000At5k-1haU;
	Thu, 20 Aug 2026 05:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205457; x=1818741457;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rCMCnlVm4+ZYRv/IwB6MsayWprzl+dNBwx5Ic+qtN5Y=;
  b=KoZ7aK3gBFOO3ONApszvzZkFTZzdInmSnfC1jLysW4QBr9gs6r5mb0GT
   TDivlgJz2jTSNUtOKHWqk4EEFhUOjd/Wv8vXYqQNxc12dwNZYhs5Ly7xp
   Yy2oPl68PzN5pOpMsVO2xyBfyn5vzGixmH8a3pA+L6QYZyju18V3Dseuo
   k=;
X-CSE-ConnectionGUID: Bo52KQ4+T6miXnf+yps28Q==
X-CSE-MsgGUID: vXOrP4HDS8Sp+50fT9gIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105416088"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105416088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:57:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:18 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:57:18 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Topic: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Index: AQHdKzc1AHXJ+KOQ0UmpAsXDUzHYBramevIw
Date: Thu, 20 Aug 2026 05:57:18 +0000
Message-ID: <b8197d8e5f7d435397536b0187a4297b@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225736_777175_0817D1BC 
X-CRM114-Status: GOOD (  12.40  )
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

> We currently print through sysfs and debugfs the name of the part if the
> .name field, which is legacy, has been filled in the ID table (otherwise
> "(null)" is printed). These IDs had an interest until manufacturers
> started re-using more and more extensively the so called unique JEDEC
> IDs. At this stage, a name that was tailored for a chip sold in 2016 may
> no longer be relevant for a chip sold in 2026. Still showing this name
> through the various filesystems may confuse people, removing these names
> cannot be done since they are now part of the user ABI (because of
> sysfs).
> 
> In order to allow overwriting the .name field (which is part of a
> read-only structure), let's create a spi-nor pointer which will by
> default point to that .name, but which can be cleared in fixup hooks to
> make sure the name is hidden on newer parts.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
