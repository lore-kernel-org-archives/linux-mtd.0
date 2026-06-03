Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58809CD6E5D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtQkqY0BEe7Q5tkYkkfBKug2zjaKtFLj1fgLjjIhpTE=; b=I+dgVNmoG0pjhO
	RmtjE07MYN2p31Z9b3hPGcU5Rz3p3vN/ntUPo0cTHZWoGizm6fo+d9cZ+WKlpiVueeYUBZmOzwMUz
	gjyCHpjinhPZ4Vg01sa6oWhVIqkeChBj4D/xJwakMxFdfM+OkIol76EBp2Lfzzc+GU9dNyDBHbqFG
	sDyUeDKABxF4scL7VsRxvgAO9o4sx2Co6U00u9Sz8Uptc+BCQBfTJB17Sa2FpgopDwXEEpT4BCqbY
	RxWh3uSzbwaP1UL3Jq59hbMwSMojpYuaDs+WDvRjH/m/jLkXsth/KRTWNWl4ubZtCdqpFLIABfVGn
	nqZ/1BkfW1Ho2hC4Vchw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZFF-0000000Dz9Z-2npR;
	Wed, 03 Jun 2026 00:14:05 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZFD-0000000Dz8e-13Cx
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 00:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1780445643; x=1811981643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wKv/uP+DH0U5XirB5yo9ezmZw3vr6Vr1rbJY5ew+/cM=;
  b=j6Jpk0aS3/oN8Q1dzEpWzgMK8tYoXqLAQamG923p0idPxWSxJGYdZ8lW
   R9OzX3TQCmJ05cw2lclPZIiGCDDp1BdNVRhQkEGO8ny5wqmnGAGV6sBJd
   NeiyGjQBe4ZVJkqi8Yk0aT2PHNyt+jD4zzsw5Q8zta2bwheML7/C7lkEF
   w=;
X-CSE-ConnectionGUID: fc3L/NW+Rp2ggLGaKCtUnQ==
X-CSE-MsgGUID: 75I89awSSQy6qaCT/S9DhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="160461448"
X-IronPort-AV: E=Sophos;i="6.24,184,1774306800"; 
   d="scan'208";a="160461448"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:13:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 02:13:58 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Wed, 3 Jun 2026 02:13:58 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <mwalle@kernel.org>
CC: <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Thread-Topic: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
Thread-Index: AQHc8cXTO5f/tOgcMEyxMymmbryaJrYrCr5PgADpbEA=
Date: Wed, 3 Jun 2026 00:13:58 +0000
Message-ID: <c8f082b6deb4483b9a6a5f54ac549d62@infineon.com>
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <87tsrlmf7g.fsf@bootlin.com>
In-Reply-To: <87tsrlmf7g.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_171403_617366_4290A0CF 
X-CRM114-Status: GOOD (  22.77  )
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

Hi,

> Hi Michael,
> 
> On 01/06/2026 at 14:52:42 +02, Michael Walle <mwalle@kernel.org> wrote:
> 
> > Try to simplify the flash initialization and get rid of the legacy
> > handling. As default, all the flags of the in-kernel database are
> > taken and amended with the SFDP data.
> >
> > This might have the consequence that all the flashes now get a
> > RDSFPD opcode which might be an unknown opcode. But that was already
> > the case for any flashes which were unknown to the linux kernel. So
> > far, there was not a single complaint.
> >
> > See patch 3 for more information. If feedback is positive, this is
> > intended to be applied to the spi-nor tree after the next merge
> > window, so it will sit around in -next for quite some time and get
> > some testing.
> >
> > That being said, I've just did a quick test on my boards. Please
> > give it a test on your boards.
> 
> Interesting cleanup, thanks for pushing it. I'll run some tests with
> some old and newer SFDP based flashes. I do not have chips without SFDP
> though.
> 
I do have some non-SFDP chips (S25FL-S). Will get back to you with test
result.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
