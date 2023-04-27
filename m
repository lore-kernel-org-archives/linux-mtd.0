Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1655EC77B61
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Apr 2023 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUiJpw13nSFi/cKbw6dZ/SciB5E3JfzmXDDJK16ohes=; b=46NgJy058envXH
	JU4w5trKwJyLe36/JTI3VhJZ07ZnmTSa2YYNeo84cOmy1cqAcD44O/BSlNSEXjCvHxsWRS6LteFW2
	FjRf5oBCLdON4Svoqm/KSKmWUZoZu2TK86H9HCXTO3SdxlL46uQMJ3VR7Sjyl+Kg0eRVvYsHS0Yhx
	4cG99wACe7zm982jECPBp1I++V6F/2JcGUH2XbtOvcByy57+HnTSOU1qVvLl6WJTsAz8gbOGtKCau
	PyYW1z9CYBjHrz3hvEjfh4FRYnYGMvbK4V/457aE14aLdtmDjq6wZlWdFxC+xXZIRdVBE56nVAND0
	/QVGwxekLP57NrzNnprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps1dK-006dgY-0R;
	Thu, 27 Apr 2023 13:26:02 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps1dE-006dfS-2n;
	Thu, 27 Apr 2023 13:25:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RDPmJJ096873;
	Thu, 27 Apr 2023 08:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682601948;
	bh=b8AExFsegoctAr6d5U8odl38q2tDeqKo1U4bNOto0LY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uGmqvtqHSTQO90OsmgzoXQGALvQ+qDggdxQ2egUKBvTHG3Sx3sU0RuC90bwf8f9WL
	 jk3tzyakBz9Jmghm6g0TdOQLpZTmahcvEFvwau+eO6PtqWhAvDZF/b0gQ2m7ZJcHnw
	 qCC7zmmaJDelmTrcNIlPq67JPkhUsGoXZdcBmG5Y=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RDPmla062899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 08:25:48 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 08:25:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 08:25:48 -0500
Received: from [10.24.69.26] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RDPiPx112328;
	Thu, 27 Apr 2023 08:25:45 -0500
Message-ID: <b1d30948-ba3d-a4cc-e1ed-851a9dedba7c@ti.com>
Date: Thu, 27 Apr 2023 18:55:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: RE: [PATCH v2 4/4] spi: cadence-quadspi: use STIG mode for small
 reads
Content-Language: en-US
To: Yoshitaka Ikeda <ikeda@nskint.co.jp>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "Takahiro.Kuwano@infineon.com"
	<Takahiro.Kuwano@infineon.com>,
        Pratyush Yadav <ptyadav@amazon.de>, Mark
 Brown <broonie@kernel.org>
References: <20230125081023.1573712-1-d-gole@ti.com>
 <20230125081023.1573712-5-d-gole@ti.com>
 <OSZPR01MB70048CE259A3D63C4179199A8B659@OSZPR01MB7004.jpnprd01.prod.outlook.com>
 <044a723e-b81e-f6f2-8bf7-3680a10abc86@ti.com>
 <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
From: Dhruva Gole <d-gole@ti.com>
In-Reply-To: <OSZPR01MB7004D229048A950C93B40CC88B6A9@OSZPR01MB7004.jpnprd01.prod.outlook.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_062557_008291_1F15B35A 
X-CRM114-Status: GOOD (  18.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 27/04/23 06:11, Yoshitaka Ikeda wrote:
> Hi Dhruva,
> 
>> Please can you send me the register fields information for the CQSPI
>> controller used in this device?
>> I wanted to verify if atall there were any mismatch between the controller I
>> have tested with vs your SOC's controller.
> 
> You can find it in the pdf that can be obtained by pressing the download button in the upper right corner of the following website.
> - https://www.intel.com/content/www/us/en/docs/programmable/683126/15-0/introduction.html

Thanks for sharing, I went through and couldn't really find any major
changes at the controller level.
So I am wondering if some specific sequence of flash operations on your 
device is exposing some issues in the driver's STIG reads.


Please can you share some logs with the following patch:
I am trying to see a pattern that may be causing issues.
I am unable to reproduce this on my end at the moment.

...
diff --git a/drivers/spi/spi-cadence-quadspi.c 
b/drivers/spi/spi-cadence-quadspi.c
index 6ddb2dfc0f00..5fa71dbd37ef 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -1390,6 +1390,14 @@ static int cqspi_exec_mem_op(struct spi_mem *mem, 
const struct spi_mem_op *op)
         int ret;

         ret = cqspi_mem_process(mem, op);
+       /* debug */
+       printk("**********spi_mem_op dump**************");
+       printk("addr: nbytes:0x%X , buswidth 0x%X, dtr 0x%X, val 
0x%llX", op->addr.nbytes, op->addr.buswidth, op->addr.dtr, op->addr.val);
+       printk("cmd: nbytes:0x%X , buswidth 0x%X, dtr 0x%X, opcode 
0x%X", op->cmd.nbytes, op->cmd.buswidth, op->cmd.dtr, op->cmd.opcode);
+       printk("data: nbytes:0x%X , buswidth 0x%X, dtr 0x%X, data dir 
0x%X", op->data.nbytes, op->data.buswidth, op->data.dtr, op->data.dir);
+
+       printk("***************************************");
+       /* ---------------------------- */
         if (ret)
                 dev_err(&mem->spi->dev, "operation failed with %d\n", ret);


...

-- 
Thanks and Regards,
Dhruva Gole

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
