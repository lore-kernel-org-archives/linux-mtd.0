Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410B4CA0FE8
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Aug 2025 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb6HlXdgl+gxrJNbm/F3bFoWlHb/wNeqyPuwe/jokVQ=; b=IU/NEquu9C2qjC
	MfJN38mSqos90PS0pyfB7TR9qcQ4qTWaMfoQ4024aVidRet+tpVlH2WglZwtIw1pduMerdWS4spJk
	xPBm77+antqLpsfAe3DaMMifj/oazT5Pn30VcFwPlGsgxweL5nXxgHYFsoCS0bJcH3eN3i4suyXuG
	DvxIcZ7DG42ZrUp8Kyn6y743+gFeF/4YU31a2hemy3pPTw3Q9S234KTnvhAeRmYX3GDUpjyOrZy+Q
	eISEf7QkJ8Y/1uGbhYbcRDa0Mp+piCRRZsLLH8s5yafratYxdOn2j7x5NdqNwMcYdN698VWla67ii
	RMH3JEBLeddcW4xXsBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usldu-0000000ATj8-3gA5;
	Sun, 31 Aug 2025 17:15:02 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usldr-0000000ATiL-31Py
	for linux-mtd@lists.infradead.org;
	Sun, 31 Aug 2025 17:15:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1usldj-000000003Qc-1n39;
	Sun, 31 Aug 2025 17:14:51 +0000
Date: Sun, 31 Aug 2025 18:14:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
Message-ID: <aLSDB5ySaZv8yfHg@pidgin.makrotopia.org>
References: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250831-mtd-validate-ooboffs-v1-1-d3fdce7a8698@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_101459_759867_0CFC502D 
X-CRM114-Status: GOOD (  37.02  )
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

On Sun, Aug 31, 2025 at 04:40:10PM +0200, Gabor Juhos wrote:
> Using an OOB offset past end of the available OOB data is invalid,
> irregardless of whether the 'ooblen' is set in the ops or not. Move
> the relevant check out from the if statement to always verify that.
> 
> The 'oobtest' module executes four tests to verify how reading/writing
> OOB data past end of the devices is handled. It expects errors in case
> of these tests, but this expectation fails in the last two tests on
> MTD devices, which have no OOB bytes available.
> 
> This is indicated in the test output like the following:
> 
>     [  212.059416] mtd_oobtest: attempting to write past end of device
>     [  212.060379] mtd_oobtest: an error is expected...
>     [  212.066353] mtd_oobtest: error: wrote past end of device
>     [  212.071142] mtd_oobtest: attempting to read past end of device
>     [  212.076507] mtd_oobtest: an error is expected...
>     [  212.082080] mtd_oobtest: error: read past end of device
>     ...
>     [  212.330508] mtd_oobtest: finished with 2 errors
> 
> For reference, here is the corresponding code from the oobtest module:
> 
>     /* Attempt to write off end of device */
>     ops.mode      = MTD_OPS_AUTO_OOB;
>     ops.len       = 0;
>     ops.retlen    = 0;
>     ops.ooblen    = mtd->oobavail;
>     ops.oobretlen = 0;
>     ops.ooboffs   = 1;
>     ops.datbuf    = NULL;
>     ops.oobbuf    = writebuf;
>     pr_info("attempting to write past end of device\n");
>     pr_info("an error is expected...\n");
>     err = mtd_write_oob(mtd, mtd->size - mtd->writesize, &ops);
>     if (err) {
>             pr_info("error occurred as expected\n");
>     } else {
>             pr_err("error: wrote past end of device\n");
>             errcnt += 1;
>     }
> 
> As it can be seen, the code sets 'ooboffs' to 1, and 'ooblen' to
> mtd->oobavail which is zero in our case.
> 
> Since the mtd_check_oob_ops() function only verifies 'ooboffs' if 'ooblen'
> is not zero, the 'ooboffs' value does not gets validated and the function
> returns success whereas it should fail.
> 
> After the change, the oobtest module will bail out early with an error if
> there are no OOB bytes available on the MDT device under test:
> 
>     # cat /sys/class/mtd/mtd0/oobavail
>     0
>     # insmod mtd_test; insmod mtd_oobtest dev=0
>     [  943.606228]
>     [  943.606259] =================================================
>     [  943.606784] mtd_oobtest: MTD device: 0
>     [  943.612660] mtd_oobtest: MTD device size 524288, eraseblock size 131072, page size 2048, count of eraseblocks 4, pages per eraseblock 64, OOB size 128
>     [  943.616091] mtd_test: scanning for bad eraseblocks
>     [  943.629571] mtd_test: scanned 4 eraseblocks, 0 are bad
>     [  943.634313] mtd_oobtest: test 1 of 5
>     [  943.653402] mtd_oobtest: writing OOBs of whole device
>     [  943.653424] mtd_oobtest: error: writeoob failed at 0x0
>     [  943.657419] mtd_oobtest: error: use_len 0, use_offset 0
>     [  943.662493] mtd_oobtest: error -22 occurred
>     [  943.667574] =================================================
> 
> This behaviour is more accurate than the current one where most tests
> are indicating successful writing of OOB data even that in fact nothing
> gets written into the device, which is quite misleading.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>


> ---
>  drivers/mtd/mtdcore.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 5ba9a741f5ac3c297ae21329c2827baf5dc471f0..9a3c9f163219bcb9fde66839f228fd8d38310f2d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1590,12 +1590,12 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
>  	if (offs < 0 || offs + ops->len > mtd->size)
>  		return -EINVAL;
>  
> +	if (ops->ooboffs >= mtd_oobavail(mtd, ops))
> +		return -EINVAL;
> +
>  	if (ops->ooblen) {
>  		size_t maxooblen;
>  
> -		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
> -			return -EINVAL;
> -
>  		maxooblen = ((size_t)(mtd_div_by_ws(mtd->size, mtd) -
>  				      mtd_div_by_ws(offs, mtd)) *
>  			     mtd_oobavail(mtd, ops)) - ops->ooboffs;
> 
> ---
> base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
> change-id: 20250831-mtd-validate-ooboffs-e35c796540fe
> 
> Best regards,
> -- 
> Gabor Juhos <j4g8y7@gmail.com>
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
