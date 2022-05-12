Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1562C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCkqK8V81Rei3ycrhen4YtIvtKVWocMUrDxCeZjDc5U=; b=Vec8LjrrgizBeq
	9eFmn2g6ETmwzJzvfZAn6TaYmh01Hg9qlott9KUBOFVKx+jyRHMxiRUtX2w5IbhtXS7NpLOaSm7yb
	Uqc0JvDR2maY/XSoG7ju+q5NizVHFYRT0bJON0W/+59HrwCE0MfCKnETyna9Lg7Kk79Kn195o9EvT
	SHdnzZlAX8m7unOPDjh79cYH8tHoNRSecksJShsHcb3aWhgtms2fZrJVFJPO8CKBpwY2qzEKypuGN
	boF7+ZyW+dNHGXreAYSQJMo5VJlk58t/hbdEM3ssDHCN0MmOBOst48YUIdmwncU2PKWmh06wJaWDm
	8m7PV9jMIQJIdX5i7D3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7zY-00BonN-Ii; Thu, 12 May 2022 12:32:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7zV-00BolN-RN
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 12:32:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CCWESM067393;
 Thu, 12 May 2022 07:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1652358734;
 bh=MsVBxvyfgGwdtzvGgcuBz5n9dAHmwRvAG2ctFAEx0YE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uAz9oTYrCIN9LT2cx3D0A2LKdVIwQsxRVeVGUg+C/glF2ALLBGHCpF0u/X+EoPrsZ
 tHqBIRYlSEXmklkxJ15C9V/NEKfswZ8Nb1v4EirAn93p0WGmFG3mcMYkQ7TTfrj7WZ
 MOoTsl2/147S1S0jGVK+yds3lR+T8rkK91FbaOkc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CCWEek051917
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 May 2022 07:32:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 07:32:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 07:32:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CCWDK8094985;
 Thu, 12 May 2022 07:32:14 -0500
Date: Thu, 12 May 2022 18:02:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: debugfs: fix format specifier
Message-ID: <20220512123213.fzly4gollonlo27p@ti.com>
References: <20220512112027.3771734-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512112027.3771734-1-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_053226_071316_E9DB24CF 
X-CRM114-Status: GOOD (  22.45  )
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

Hi Michael,

On 12/05/22 01:20PM, Michael Walle wrote:
> The intention was to print the JEDEC ID in the following format:
>   nn nn nn
> 
> In this case format specifier has to be "%*ph". Fix it.
> 
> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
> index bf9fda5d4d0b..4b972bd4b80d 100644
> --- a/drivers/mtd/spi-nor/debugfs.c
> +++ b/drivers/mtd/spi-nor/debugfs.c
> @@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
>  	int i;
>  
>  	seq_printf(s, "name\t\t%s\n", info->name);
> -	seq_printf(s, "id\t\t%*phn\n", SPI_NOR_MAX_ID_LEN, nor->id);
> +	seq_printf(s, "id\t\t%*ph\n", SPI_NOR_MAX_ID_LEN, nor->id);

Patch does not apply. Are you basing this on some other commits you 
have? This line is different on my tree:

	seq_printf(s, "id\t\t%*phn\n", info->id_len, info->id);

In fact, I do not have a nor->id at all in my tree. BTW, I have applied 
https://lore.kernel.org/r/20220429102018.2361038-2-michael@walle.cc

I am going to apply the below patch. Please ACK/NACK. I did a quick 
test, the output stays the same before and after this patch.

-- 8< --
From c47452194641b5d27c20e557c84a46c85fd7ce37 Mon Sep 17 00:00:00 2001
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 May 2022 13:20:27 +0200
Subject: [PATCH] mtd: spi-nor: debugfs: fix format specifier

The intention was to print the JEDEC ID in the following format:
  nn nn nn

In this case format specifier has to be "%*ph". Fix it.

Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Link: https://lore.kernel.org/r/20220512112027.3771734-1-michael@walle.cc
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 1949905eefea..eaf84f7a0676 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -81,7 +81,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 	int i;
 
 	seq_printf(s, "name\t\t%s\n", info->name);
-	seq_printf(s, "id\t\t%*phn\n", info->id_len, info->id);
+	seq_printf(s, "id\t\t%*ph\n", info->id_len, info->id);
 	string_get_size(params->size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	seq_printf(s, "size\t\t%s\n", buf);
 	seq_printf(s, "write size\t%u\n", params->writesize);

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
