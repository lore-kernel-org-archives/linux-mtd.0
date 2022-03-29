Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9F9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 11:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYUUEFlMzokkynbYuQjFdE6rTH4Qp0Pk0SrYijXMWBE=; b=2E3eKTGDSROYi6
	sdxofmwzwxElxmE6VSUywUA7vgDsQbrC3v/VYikYMv5M5/JTWpUDbaIQYaCqWIynxTqsblWm2DVNi
	oL5FexpnHnsJ/GWeEjWeVAe8O7bjaCVjm+6XwOlszgYT2NDYRWxkkTjeYbDCYMOlCzKkv6BCLDuxX
	4IcT7i8xWdS1MCMwzPPiKei/bCOAjLfNOX9fiarkV6+xZIQxhn7MMOPNPc7rNribgxwrZARdXRdPT
	hRPXfl0nIi2G6wPDKRc4aDAO9yipBHHPIXckmXeVuiWEow/7TgOH76N3yxa/frmpvvLxma5UGUcQX
	AlOZzxP6udrD5I73xcgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZABe-00C0VR-Ct; Tue, 29 Mar 2022 11:38:58 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZABa-00C0TT-MT; Tue, 29 Mar 2022 11:38:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22TBciHg083594;
 Tue, 29 Mar 2022 06:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648553925;
 bh=CdYAIN7XqvtYBdmOgn+vkwITmsTrcIGAWqJUkyEBR7Q=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ytRO/G113p9ql61f/Y/RfElo9oNxC2sqM9KBhDR+NJs9dN1l4W7UF7H2xg4/bVPpZ
 YbhELC4A0W6j84wa4LC69pR+k9IZzuYyidi1KCb/35B7agKsSK/O+CznkBmxUfxgob
 bDc6xMZyiDuVICQ0g80U61dIP1yAOzxNb6shmbfM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22TBci8E094771
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Mar 2022 06:38:44 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 29
 Mar 2022 06:38:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 29 Mar 2022 06:38:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22TBchVA051849;
 Tue, 29 Mar 2022 06:38:44 -0500
Date: Tue, 29 Mar 2022 17:08:43 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Julia Lawall <julia.lawall@inria.fr>, <kbuild-all@lists.01.org>,
 <linux-arm-kernel@lists.infradead.org>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@xilinx.com>, Michal Simek <monstr@monstr.eu>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: fix minmax.cocci warnings
Message-ID: <20220329113843.nngzktxoa6c5vxcw@ti.com>
References: <alpine.DEB.2.22.394.2203260929310.3141@hadrien>
 <9a20ed24-be9d-bbec-19da-56c0ff68cbda@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a20ed24-be9d-bbec-19da-56c0ff68cbda@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_043854_880430_7C95AE02 
X-CRM114-Status: GOOD (  17.66  )
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

On 28/03/22 11:28AM, Vignesh Raghavendra wrote:
> Hi.
> 
> On 26/03/22 2:00 pm, Julia Lawall wrote:
> > From: kernel test robot <lkp@intel.com>
> > 
> > Use min to simplify the code.
> > 
> > Generated by: scripts/coccinelle/misc/minmax.cocci
> > 
> > Fixes: 2747bc2106aa ("mtd: spi-nor: Add dual parallel and stacked mode support")
> > CC: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Julia Lawall <julia.lawall@inria.fr>
> > ---
> > 
> > tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
> > head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
> > commit: 2747bc2106aa429773d9a932c799aa6229595148 [840/1029] mtd: spi-nor: Add dual parallel and stacked mode support
> > :::::: branch date: 34 hours ago
> > :::::: commit date: 8 weeks ago
> > 
> >  drivers/mtd/spi-nor/core.c |    5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2034,10 +2034,7 @@ static int spi_nor_read(struct mtd_info
> >  						(offset << nor->shift);
> >  			}
> >  		}
> > -		if (len < rem_bank_len)
> > -			read_len = len;
> > -		else
> > -			read_len = rem_bank_len;
> > +		read_len = min(len, rem_bank_len);
> 
> This chunk does not exist in mainline. Seems like xlnx local changes.

Yes. I was very confused for a bit until I realized. It would be nice if 
upstream maintainers and mailing lists were not Cced if the patch does 
not target the mainline branch.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
