Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18373C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04D1611F2
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 12:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D04D1611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZhx4C+CPMjl3vCtKq9f/TeoYmnwK7fgKNl9HvlenYo=; b=FiVzjdnJ7A10Lg
	4SdL/aO8EpZ08arN2PGn1Y9373c/m+na1dLDiGd1w4CYl5wykhoZMiVfQkG4bBTRUU2nexUHxghMX
	G0ldJKqPERaJmTQkrAMTOGJjDQFkvChShEP97rLlKicGoEuuXhknnGitqqsDaevtBpw7UeBt3G1s2
	e1g7DkLUGLxqNwIeNORodaHuBOR25NrQ9u1aY8bEhUiphnDrJQLuxmbYGoOW6ywKhZXGKwgGeckcC
	4Px8JW3Z4FbHyVlrf299MFAqImtrTMrln57MUkG4oMJCwg8JY2hRxnXr1hsWkhLjmbF357mx2Nr6A
	kBMcqKEgfRddaSQB0mdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdtNo-00Amq4-Jh; Fri, 22 Oct 2021 12:10:48 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdtNm-00Amoe-6D; Fri, 22 Oct 2021 12:10:47 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19MCAEND110426;
 Fri, 22 Oct 2021 07:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1634904614;
 bh=NN6RuxeOoSnQqGsiaIc8oeHSON4ia+KScZNp/QEIULU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=aMnq7qPkHNr3Ao7WqP9x8X/hcnC5r53H//ycOro0sjjpX2M5NsMwSk2sKU8UBoKHe
 9+fMHVix3Cxyb/g9YyzGP5OdL1BqZdOYgvlzd/Ihp+NHCtGj0+hPbeC8AITs4HBHK/
 c4NXRPMb3iM3iiMKPIap+DbnpewQN1e6MLaceogs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19MCAEXD066620
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Oct 2021 07:10:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Oct 2021 07:10:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Oct 2021 07:10:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19MCADIt124786;
 Fri, 22 Oct 2021 07:10:14 -0500
Date: Fri, 22 Oct 2021 17:40:12 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
Message-ID: <20211022121010.mzul7qsxi6s4ru2w@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
 <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_051046_418539_7DE3063D 
X-CRM114-Status: GOOD (  19.10  )
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

On 22/10/21 01:21PM, Michael Walle wrote:
> Am 2021-08-17 12:24, schrieb Pratyush Yadav:
> > On 27/07/21 07:52AM, Tudor Ambarus wrote:
> > > Used to initialize the NOR flags for settings that are not defined
> > > in the JESD216 SFDP standard, thus can not be retrieved when parsing
> > > SFDP. No functional change.
> > 
> > I am worried if the order in which these flags are set can cause some
> > subtle bugs.
> > 
> > I can see one instance of it with SNOR_F_HAS_LOCK.
> > spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there are
> > no locking ops specified, it sets the default locking ops. This works
> > fine before this patch because the flag is set before the function is
> > called. But now, the flag will be set _after_ the function is called,
> > and so you will never be able to set the default flags.
> 
> Maybe we should just forbid to look at the SNOR_F_ flags in these
> functions. Instead the information could also be deduced by looking at
> the SPI_NOR_ flags.

TBH I never quite understood why we have two sets of flags in the first 
place, when the SNOR_F* flags pretty much mirror what SPI_NOR* flags 
mean. Dunno...

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
