Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913FFC47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 10:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5548E60FE6
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5548E60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrAk6Mie9MA111omtB8DlIF2a1hUdw/AOGLyVqJ6KJs=; b=A+S6cmzesGsoJX
	SYPHdWu8K1/ANv+GyngLWfBmWVaPM2NP6Qy9UTUFfL2uGYh7bTEySFlnfaQUzMqhiTPyuK8QOB6Lt
	nUzb3lUpB7leH2Ra1n8e7ffuQX45L/2GImVx853msKdOm9lWQ+RPjg6lkLDoGkO/o0i4O28o2qz2h
	MTCAeoOVkSVdVhAOJrPDYprs3cKlxxUIqPijxq+EnFAhqIijwR5uqrAkIzk+vi++fv5mN/SJ27E9v
	0D5iNt/z1xcvLQr7bMVUrB7gv2zRaCdtQHHjks304FvL5oxwCD9TSwS9BbW0Qc/30G0Q2KIuEoUvD
	mdXlJJ0INEr7e4r+DW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrHbn-000O5v-61; Thu, 10 Jun 2021 10:08:19 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrHbi-000O4a-VY
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 10:08:17 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15AA84o6118534;
 Thu, 10 Jun 2021 05:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623319684;
 bh=Nzwl1maxkkM3tS11aSKlYLUOpSuNU9y2PTvlbUjk97A=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=K8NTQoIDxQth6lY/UeHuekQCripSgHA2VNDnpgVZ5a2GT9CClLAA6V3sfO7AMmBlV
 HPPinl8OW8seCyQQSiQP0K9N0R+gdlHyou0EZQZx23H3HaJJz8CQdFmejAhKz3C1KH
 SIkSlD5BrB27A3pp001HDQL+W8k+d8ZgvwNMtJYg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15AA83cJ046584
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Jun 2021 05:08:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 05:08:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 05:08:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15AA82hH031094;
 Thu, 10 Jun 2021 05:08:02 -0500
Date: Thu, 10 Jun 2021 15:38:01 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: John Thomson <git@johnthomson.fastmail.com.au>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mtd: spi-nor: write support for minor aligned partitions
Message-ID: <20210610100759.v57c5wa46ky33waj@ti.com>
References: <20210608040719.14431-1-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210608040719.14431-1-git@johnthomson.fastmail.com.au>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_030815_177955_5170A242 
X-CRM114-Status: GOOD (  17.12  )
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

On 08/06/21 02:07PM, John Thomson wrote:
> Do not prevent writing to mtd partitions where a partition boundary sits
> on a minor erasesize boundary.
> This addresses a FIXME that has been present since the start of the
> linux git history:
> /* Doesn't start on a boundary of major erase size */
> /* FIXME: Let it be writable if it is on a boundary of
>  * _minor_ erase size though */
> 
> Allow a uniform erase region spi-nor device to be configured
> to use the non-uniform erase regions code path for an erase with:
> CONFIG_MTD_SPI_NOR_USE_VARIABLE_ERASE=y
> 
> On supporting hardware (SECT_4K: majority of current SPI-NOR device)
> provide the facility for an erase to use the least number
> of SPI-NOR operations, as well as access to 4K erase without
> requiring CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
> 
> Introduce erasesize_minor to the mtd struct,
> the smallest erasesize supported by the device

Instead of having just a major and minor erase size, wouldn't it make 
more sense to have a list of all supported erases on a sector? That is, 
instead of hard coding two erase size instead of one, how about 
generalizing the erase machinery to allow any number of erase sizes on a 
sector and then choosing the most efficient one on run time?

For example, imagine a device can support 4K, 64K, and 256K erases on 
each sector. Then you should be able to use 2 x 4K erases if you want to 
erase 8K, 2 x 64K + 1 x 4K erases for 132K and so on.

I am not very familiar with MTD erase machinery so I would like someone 
else to chime in, but I think my suggestion above is the better way 
forward.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
