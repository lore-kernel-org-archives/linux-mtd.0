Return-Path: <SRS0=de6p=NP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8663C4320A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 18:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791EF60F58
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Aug 2021 18:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 791EF60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmRnfOgyqwGHYT6OZKk2DIb5PZB5iboYkPtcN5noRFs=; b=kKN00aVj1UR/fS
	U2vmP0kjEyVgA9cj1/ih/G8zGemt3AUif2NFPHvznRmS8JqOpzl6JUN5nAo0s8x0YA3RdwLC4/Jdy
	A/Ci+1mnrnB/NYO7r9JgJ0Gc1VXV3OHLnuLz64h6FWm8woOcFMGsMoy2lzz1NXemlJSO3JfGutONx
	bf4d1xsxvjdEr4lPqWXQrr7tDtdPE9qHq2HL39//pW3P6cF0GlogdPeSkaaqeYdl/fIgald/+xQjX
	ZMlG2iaHNtBVQklspYTay+q2BVBX0wsD++eaGKMjZjPO0MPtvhqk62xoCa153Unf22erE39fKTLXU
	OmnjqsCZjHLD/RY21yGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIahl-004Haw-V6; Tue, 24 Aug 2021 17:59:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIahf-004HZ6-SA; Tue, 24 Aug 2021 17:59:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17OHwiM7098609;
 Tue, 24 Aug 2021 12:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1629827924;
 bh=ef47aSKlddxxCMoTEss/zcru0u4Kw4n0SsJD3elA2vc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=OETboGyH7TEKg3GiEHqifBZVqy5GNSgTucBypCznmQomW0dgoA9LgAvFY6qCDY6Wz
 KMKTopnJfxCjewUKg0vKPfdTts6/DhUgNbLlERulC5ituXQruLhfquXyObtOVRiuGC
 OIT6x3vEz1Yhn2+77CEJu0jkAhiUnbwNU6BCVWNo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17OHwieN072859
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Aug 2021 12:58:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 24
 Aug 2021 12:58:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 24 Aug 2021 12:58:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17OHwhoh081072;
 Tue, 24 Aug 2021 12:58:43 -0500
Date: Tue, 24 Aug 2021 23:28:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 35/35] docs: mtd: spi-nor: Add details about how to
 propose a new flash addition
Message-ID: <20210824175840.276vh2qaltjmsdte@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-36-tudor.ambarus@microchip.com>
 <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4304e19f3399a0a6e856119d01ccabe0@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_105916_037852_D733ECE1 
X-CRM114-Status: GOOD (  21.95  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/07/21 09:22AM, Michael Walle wrote:
> Am 2021-07-27 06:52, schrieb Tudor Ambarus:
> > Add some guideliness on how to propose a new flash addition.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> >  Documentation/driver-api/mtd/spi-nor.rst | 65 ++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/mtd/spi-nor.rst
> > b/Documentation/driver-api/mtd/spi-nor.rst
> > index 4a3adca417fd..ffb8d97a2766 100644
> > --- a/Documentation/driver-api/mtd/spi-nor.rst
> > +++ b/Documentation/driver-api/mtd/spi-nor.rst
> [..]
> > +Every new flash addition that define the SFDP tables, should hexdump
> > its SFDP
> > +tables in the patch's comment section below the --- line, so that we
> > can
> > +reference it in case of ID collisions.
> 
> Nice, but could you add some guidelines how to do it? That is the exact
> commands, maybe with a notice one should use these whenever possible. I
> want to prevent having all sorts of variations of the output and I want
> to be able to reverse the operation and verify it.
> 
> # xxd -p /path/to/sfdp
> # md5sum /path/to/sfdp
> # cat /path/to/jedec_id
> # cat /path/to/partname
> # cat /path/to/manufacturer

It would be nice if we could have checkpatch.pl check for these. But I 
don't know how difficult that would be to add.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
