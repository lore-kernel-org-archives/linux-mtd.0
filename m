Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRZHs-0004h0-EC
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 04:46:02 +0000
Message-ID: <54F147A7.50701@hisilicon.com>
Date: Sat, 28 Feb 2015 12:44:23 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [patch] mtd: hisilicon: && vs & typo
References: <20150211102509.GB18515@mwanda>
 <20150212213740.GA18140@ld-irv-0074>
In-Reply-To: <20150212213740.GA18140@ld-irv-0074>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/13 5:37, Brian Norris wrote:
> Hi,
> 
> On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
>> The intent was to mask away some bits here, not to test true or false.
>>
>> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
>> index 484e1db..289ad3a 100644
>> --- a/drivers/mtd/nand/hisi504_nand.c
>> +++ b/drivers/mtd/nand/hisi504_nand.c
>> @@ -495,7 +495,7 @@ static void hisi_nfc_cmdfunc(struct mtd_info *mtd, unsigned command, int column,
>>  		flag = hinfc_read(host, HINFC504_CON);
>>  		if (chip->ecc.mode == NAND_ECC_HW)
>>  			hinfc_write(host,
>> -				    flag && ~(HINFC504_CON_ECCTYPE_MASK <<
>> +				    flag & ~(HINFC504_CON_ECCTYPE_MASK <<
> 
> Looks good to me. Zhou, can I get an ack?

Hi Brian,

Sorry for late for the reason of Chinese new year vacation.
You can apply that above, My mistake there.

Thanks,
Zhou Wang

> 
>>  				    HINFC504_CON_ECCTYPE_SHIFT), HINFC504_CON);
>>  
>>  		host->offset = 0;
> 
> Brian
> 
> 
