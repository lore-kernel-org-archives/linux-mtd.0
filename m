Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A54C282D8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268AE20989
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 13:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t2ac3aAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268AE20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPyONxmUlny039FdZmxDLJyREBqzYxdDPHd8t3H02GY=; b=t2ac3aAaToUgTu
	UbTQ+94DGJfWuE5q7rfuJF0JYSC/Xg6Tk17wqhaKr0dy+Pozgp3QlZSbfwvmVI8/hd3llIblbTcKH
	izu+XNQZGGRfV165I1d2Fl5vDRtvBRvcMYobLY2gY7axVRRxJnQkWZoSUzmmAxs7yI5wsWjFgyC89
	K+hJ7mNlC2K7tcJj0BQfX7SM6V6eSpmwczu7riNkYL7FfGxG95yMRl9V1ewYrsqj6paiMPmQb5ZBd
	wrYCG+chTPDNlZodNXYkw/4ygqWQr6BhJzKfyj5Yq/yWrwVAT9OcIwajWzRN8cGMaep/5M8JbmAjW
	UENHKqVOBIKs++Lu8InA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goq48-0004Ez-3S; Wed, 30 Jan 2019 13:38:08 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goq44-0004E3-Pa
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 13:38:06 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 133CB67C52C;
 Wed, 30 Jan 2019 14:37:58 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Wed, 30 Jan
 2019 14:37:57 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%5]) with mapi id
 15.01.1466.003; Wed, 30 Jan 2019 14:37:57 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v3 1/5] mtd: nand: Always store info about bad block
 markers in chip struct
Thread-Topic: [PATCH v3 1/5] mtd: nand: Always store info about bad block
 markers in chip struct
Thread-Index: AQHUuJvz9LZKjU9NdkCgOImqm/qQ2KXHvW4AgAACm4A=
Date: Wed, 30 Jan 2019 13:37:57 +0000
Message-ID: <872cfbb0-f0dd-df25-4835-bb0cca3044cc@kontron.de>
References: <20190130130111.32724-1-frieder.schrempf@kontron.de>
 <20190130130111.32724-2-frieder.schrempf@kontron.de>
 <20190130142838.5590f8b4@bbrezillon>
In-Reply-To: <20190130142838.5590f8b4@bbrezillon>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.43]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <7F7DB32BBC5F1B4DA87C94FDFF663BA5@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 133CB67C52C.A3712
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, kyungmin.park@samsung.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_053805_192379_7D839837 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek
 Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Thanks for reviewing.

On 30.01.19 14:28, Boris Brezillon wrote:
> On Wed, 30 Jan 2019 13:01:44 +0000
> Schrempf Frieder <frieder.schrempf@kontron.de> wrote:
> 
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The information about where the manufacturer puts the bad block
>> markers inside the bad block and in the OOB data is stored in
>> different places. Let's move this information to nand_chip.options
>> and nand_chip.badblockpos.
>>
>> As this chip-specific information is not directly related to the
>> bad block table (BBT), we also rename the flags to NAND_BBM_*.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>   drivers/mtd/nand/onenand/onenand_base.c |  2 +-
>>   drivers/mtd/nand/onenand/onenand_bbt.c  |  2 +-
>>   drivers/mtd/nand/raw/nand_amd.c         |  2 +-
>>   drivers/mtd/nand/raw/nand_base.c        | 12 ++++++------
>>   drivers/mtd/nand/raw/nand_bbt.c         |  4 ++--
>>   drivers/mtd/nand/raw/nand_esmt.c        |  2 +-
>>   drivers/mtd/nand/raw/nand_hynix.c       |  4 ++--
>>   drivers/mtd/nand/raw/nand_macronix.c    |  2 +-
>>   drivers/mtd/nand/raw/nand_micron.c      |  2 +-
>>   drivers/mtd/nand/raw/nand_samsung.c     |  4 ++--
>>   drivers/mtd/nand/raw/nand_toshiba.c     |  2 +-
>>   drivers/mtd/nand/raw/sh_flctl.c         |  4 ++--
>>   include/linux/mtd/bbm.h                 | 14 +-------------
>>   include/linux/mtd/rawnand.h             | 15 +++++++++++++++
> 
> Might be better to split that in 2 patches:
> - update onenand logic
> - update rawnand logic

Ok

> 
>>   14 files changed, 37 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
>> index 4ca4b194e7d7..d6701b8f031f 100644
>> --- a/drivers/mtd/nand/onenand/onenand_base.c
>> +++ b/drivers/mtd/nand/onenand/onenand_base.c
>> @@ -2458,7 +2458,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
>>                   bbm->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
>>   
>>           /* We write two bytes, so we don't have to mess with 16-bit access */
>> -        ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
>> +        ofs += mtd->oobsize + (this->badblockpos & ~0x01);
> 
> Looks like the ->badblockpos field does not exist in struct
> onenand_chip, which means you didn't compile test this part ;-).

Hm, indeed. I forgot to enable onenand in my config. I will add the 
field to the onenand_chip struct, to be consistent with rawnand.

> 
>>   	/* FIXME : What to do when marking SLC block in partition
>>   	 * 	   with MLC erasesize? For now, it is not advisable to
>>   	 *	   create partitions containing both SLC and MLC regions.
>> diff --git a/drivers/mtd/nand/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
>> index dde20487937d..880b0abd36c8 100644
>> --- a/drivers/mtd/nand/onenand/onenand_bbt.c
>> +++ b/drivers/mtd/nand/onenand/onenand_bbt.c
>> @@ -191,7 +191,7 @@ static int onenand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>>   		return -ENOMEM;
>>   
>>   	/* Set the bad block position */
>> -	bbm->badblockpos = ONENAND_BADBLOCK_POS;
>> +	this->badblockpos = NAND_BBM_POS_ONENAND;
> 
> This should be done in onenand_base.c not onenand_bbt.c.

Ok.

> 
>>   
>>   	/* Set erase shift */
>>   	bbm->bbt_erase_shift = this->erase_shift;
> 
> ...
> 
>> diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
>> index 1b722fe9213c..862eaa3a0552 100644
>> --- a/drivers/mtd/nand/raw/nand_bbt.c
>> +++ b/drivers/mtd/nand/raw/nand_bbt.c
>> @@ -466,7 +466,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>>   
>>   	pr_info("Scanning device for bad blocks\n");
>>   
>> -	if (bd->options & NAND_BBT_SCAN2NDPAGE)
>> +	if (this->options & NAND_BBM_SECONDPAGE)
>>   		numpages = 2;
>>   	else
>>   		numpages = 1;
>> @@ -487,7 +487,7 @@ static int create_bbt(struct nand_chip *this, uint8_t *buf,
>>   		from = (loff_t)startblock << this->bbt_erase_shift;
>>   	}
>>   
>> -	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
>> +	if (this->bbt_options & NAND_BBM_LASTPAGE)
> 
> You're not checking the right field here:
> 
> 	if (this->options & NAND_BBM_LASTPAGE)

I will fix this.

Regards,
Frieder

> 
>>   		from += mtd->erasesize - (mtd->writesize * numpages);
>>   
>>   	for (i = startblock; i < numblocks; i++) {
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
