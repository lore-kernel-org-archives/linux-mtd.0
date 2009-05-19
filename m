Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6D1H-0007uM-Ho
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 00:17:30 +0000
Message-ID: <4A11FA90.3060403@boundarydevices.com>
Date: Mon, 18 May 2009 17:17:20 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: nsnehaprabha@ti.com
Subject: Re: [PATCH 2.6.30-rc6 3/3] NAND: Add 4-bit ECC support for large
	page	NAND chips
References: <1242682705-19845-1-git-send-email-nsnehaprabha@ti.com>
	<4A11F5FC.40709@boundarydevices.com>
In-Reply-To: <4A11F5FC.40709@boundarydevices.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	dwmw2@infradead.org, tglx@linutronix.de, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Troy Kisky wrote:
> nsnehaprabha@ti.com wrote:
>> From: Sneha Narnakaje <nsnehaprabha@ti.com>
>>
>> This patch adds 4-bit ECC support for large page NAND chips using the new ECC
>> mode NAND_ECC_HW_OOB_FIRST. The platform data from board-dm355-evm has been
>> adjusted to use this mode.
>>
>> The patches have been verified on DM355 device with 2K Micron devices using
>> mtd-tests and JFFS2. Error correction upto 4-bits has also been verified using
>> nandwrite/nanddump utilities.
>>
>> Reviewed-by: David Brownell <dbrownell@users.sourceforge.net>
>> Signed-off-by: Sneha Narnakaje <nsnehaprabha@ti.com>
>> ---
>>  drivers/mtd/nand/davinci_nand.c |   37 +++++++++++++++++++++++++++++++------
>>  1 files changed, 31 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>> index ba6940d..4557b8d 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -689,15 +707,22 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
>>  				info->mtd.oobsize - 16;
>>  			goto syndrome_done;
>>  		}
>> +		if (chunks == 4) {
>> +			info->ecclayout = hwecc4_2048;
>> +			info->ecclayout.oobfree[1].length =
>> +				info->mtd.oobsize - 49;
> 
Most drivers set chip->ecc.layout = ... Is it ok to use ecclayout instead?????
