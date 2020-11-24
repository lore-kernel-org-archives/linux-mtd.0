Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0CDC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:53:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 103CD2076E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YlBy5MB0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="diKZmGIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103CD2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkLkvpkKDQCmNtHSroKyrHuZk+5/qTCaVMMNagZyNNI=; b=YlBy5MB0clZeT6XnA16YlIEYbg
	aV+JWr+AQkQyWysPiJzQ63VZykjIsZ6JvVTCfeXljm8o4GYBXegpKUKnNdv0u5GGOjqJoik/5du/c
	jyJgEBtlZ7mSDYPEqM54eQ5op7Ej66WBKFNFgsDc+euczdkhe4BOUQqFKsFNL+7CAazkIxXdynwuW
	RxOcdq0isS+YFG0jBRSZJHnr6+NEafST4UaU3TEw0Q1/RWDA32jnLtc33P8L+ZThZAFDFQCl4q9AG
	o8qGkwmgKoReK55Nmlcc6XOr8lfPlaNZV0DXke/dbtlePAK0QNtyt/K5nTBAxTF6fBacitcjqYZXO
	H4JATBvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYjz-0007CZ-JZ; Tue, 24 Nov 2020 13:52:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYeH-0003p7-LE
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 13:46:27 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AODkLXg055894;
 Tue, 24 Nov 2020 07:46:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606225581;
 bh=XcV4HWBN2J0sF2FulGtrQUKZH8qYfI7pApSvMca8Jbg=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=diKZmGIzvxgXT99+wtQ5Po9H59CWCjYajGTlo0W4MzBj5yIQIjlFValPmwinL8pnv
 bTDU4wW1DYBUD8h7m4jlq2DD9n3SVmvOO9sHdQ92aE5rrrKTdvHIecRaW29rblL0Hv
 acmEYOvctwIMpkGh9VXYfdjfw+4CIC3rLSnuL6VQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AODkL3n005940
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 07:46:21 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 07:46:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 07:46:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AODkKLw106370;
 Tue, 24 Nov 2020 07:46:20 -0600
Date: Tue, 24 Nov 2020 19:16:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
Message-ID: <20201124134619.2pbg7zejbvwc3e2w@ti.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118182459.18197-1-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_084625_947362_6CA7329D 
X-CRM114-Status: GOOD (  24.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 18/11/20 11:54PM, Pratyush Yadav wrote:
> Hi,
> 
> The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
> this ECC scheme, multi-pass page programs result in a program error.
> This means that unlike many other SPI NOR flashes, bit-walking cannot be
> done. In other words, once a page is programmed, its bits cannot then be
> flipped to 0 without an erase in between.
> 
> This causes problems with UBIFS because it uses bit-walking to clear EC
> and VID magic numbers from a PEB before issuing an erase to preserve the
> file system correctness in case of power cuts.
> 
> This series fixes that by setting mtd->writesize to the ECC block size
> (16) and making sure UBIFS does not try to do a multi-pass write on
> flashes with writesize > 1.
> 
> It is based on the xSPI/8D series that adds support for Cypress S28
> flash [0] (it is in next now). The patches themselves are independent of
> that series in the sense that they don't rely on 8D support. But since
> S28 flash is not supported without that series, these patches don't make
> much sense without it.
> 
> Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
> respectively.
> 
> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/

Any comments on the series? If not, can it be picked up?
 
> Pratyush Yadav (3):
>   UBI: Do not zero out EC and VID on ECC-ed NOR flashes
>   mtd: spi-nor: core: Allow flashes to specify MTD writesize
>   mtd: spi-nor: spansion: Set ECC block size
> 
>  drivers/mtd/spi-nor/core.c     | 4 +++-
>  drivers/mtd/spi-nor/core.h     | 3 +++
>  drivers/mtd/spi-nor/spansion.c | 1 +
>  drivers/mtd/ubi/build.c        | 4 +---
>  drivers/mtd/ubi/io.c           | 9 ++++++++-
>  5 files changed, 16 insertions(+), 5 deletions(-)
> 
> --
> 2.28.0
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
