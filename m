Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85BC6C35242
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 18:35:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D32206D6
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 18:35:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXMvaNhT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D32206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNRtorcci+nJvDftz8eLbDj4CwvqBfb4BllfN22E0Z8=; b=qXMvaNhT5+XR8Y
	XAAk81QPXHaRSEJfLF3dGWN8tgOx+DzqyhpK7+U5vmeWPhGiZE/ba1/V/7OnZCKTjg5eJaRmnY/9S
	DEolRgIDcA2oTKfWOxDRbybG/9xnrn6ZEqCbtw5r46UQxRacUUkbrwnv3zg6+HvBTXM3OkSMsL0tw
	nsZc3w8mPWmjQO1r5ubn0Fv62pgIz3LtCZRk42n3qyN1WYCtWqoFwVgsF9QvK9FzpG0j9nmE8sDML
	5ENFVdxcMvdeVblS2lgD+V7KCGIzPXviTA8pAJcnLDGk8lpdzDZ/YB8/bS/zrJUmhKOvmdkxNgWib
	vKeOF+sCLKs5m0em9NaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1aNt-0000ZI-JT; Tue, 11 Feb 2020 18:35:45 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1aNq-0000Y0-Dg
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 18:35:44 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id A124367A878;
 Tue, 11 Feb 2020 19:35:39 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 11 Feb
 2020 19:35:39 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Tue, 11 Feb 2020 19:35:39 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <bbrezillon@kernel.org>, Jeff Kletsky
 <git-commits@allycomm.com>, liaoweixiong <liaoweixiong@allwinnertech.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Peter Pan
 <peterpandong@micron.com>
Subject: Re: [PATCH 1/3] mtd: spinand: Stop using spinand->oobbuf for
 buffering bad block markers
Thread-Topic: [PATCH 1/3] mtd: spinand: Stop using spinand->oobbuf for
 buffering bad block markers
Thread-Index: AQHV4PlH+VPeFWBm8k+U84JJEiFI46gWQWYA
Date: Tue, 11 Feb 2020 18:35:39 +0000
Message-ID: <0f4f2b38-3a5c-fff8-6cd8-e24c94504d9d@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-2-frieder.schrempf@kontron.de>
In-Reply-To: <20200211163452.25442-2-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <94A9D4CBC757454C994556A5FDC6A6D5@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: A124367A878.AD9A6
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, git-commits@allycomm.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 peterpandong@micron.com, richard@nod.at, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_103542_781002_6F7DBF1D 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11.02.20 17:35, Schrempf Frieder wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> For reading and writing the bad block markers, spinand->oobbuf is
> currently used as a buffer for the marker bytes. During the
> underlying read and write operations to actually get/set the content
> of the OOB area, the content of spinand->oobbuf is reused and changed
> by accessing it through spinand->oobbuf and/or spinand->databuf.
> 
> This is a flaw in the original design of the SPI MEM core and at the

This should be SPI NAND, of course.            ^

> latest from 13c15e07eedf ("mtd: spinand: Handle the case where
> PROGRAM LOAD does not reset the cache") on, it results in not having
> the bad block marker written at all, as the spinand->oobbuf is
> cleared to 0xff after setting the marker bytes to zero.
> 
> To fix it, we now just store the two bytes for the marker on the
> stack and let the read/write operations copy it from/to the page
> buffer later.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>   drivers/mtd/nand/spi/core.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 89f6beefb01c..5d267a67a5f7 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -568,18 +568,18 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
>   static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
>   {
>   	struct spinand_device *spinand = nand_to_spinand(nand);
> +	u8 marker[] = { 0, 0 };
>   	struct nand_page_io_req req = {
>   		.pos = *pos,
>   		.ooblen = 2,
>   		.ooboffs = 0,
> -		.oobbuf.in = spinand->oobbuf,
> +		.oobbuf.in = marker,
>   		.mode = MTD_OPS_RAW,
>   	};
>   
> -	memset(spinand->oobbuf, 0, 2);
>   	spinand_select_target(spinand, pos->target);
>   	spinand_read_page(spinand, &req, false);
> -	if (spinand->oobbuf[0] != 0xff || spinand->oobbuf[1] != 0xff)
> +	if (marker[0] != 0xff || marker[1] != 0xff)
>   		return true;
>   
>   	return false;
> @@ -603,11 +603,12 @@ static int spinand_mtd_block_isbad(struct mtd_info *mtd, loff_t offs)
>   static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>   {
>   	struct spinand_device *spinand = nand_to_spinand(nand);
> +	u8 marker[] = { 0, 0 };
>   	struct nand_page_io_req req = {
>   		.pos = *pos,
>   		.ooboffs = 0,
>   		.ooblen = 2,
> -		.oobbuf.out = spinand->oobbuf,
> +		.oobbuf.out = marker,
>   	};
>   	int ret;
>   
> @@ -622,7 +623,6 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
>   
>   	spinand_erase_op(spinand, pos);
>   
> -	memset(spinand->oobbuf, 0, 2);
>   	return spinand_write_page(spinand, &req);
>   }
>   
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
