Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgyP-0005fd-Ov
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:45:41 +0000
Subject: Re: [PATCH v2 3/3] mtd: rawnand: marvell: set reg_clk to NULL if it
 can't be obtained
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, robert.jarzmik@free.fr, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
References: <20180707062852.26261-1-daniel@zonque.org>
 <20180707062852.26261-3-daniel@zonque.org>
 <20180707083655.2aa7aff6@bbrezillon>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <40365284-2fb9-bc1f-1552-8e4d7cac7e1c@zonque.org>
Date: Sat, 7 Jul 2018 08:45:26 +0200
MIME-Version: 1.0
In-Reply-To: <20180707083655.2aa7aff6@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, July 07, 2018 08:36 AM, Boris Brezillon wrote:
> On Sat,  7 Jul 2018 08:28:52 +0200
> Daniel Mack <daniel@zonque.org> wrote:
>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
>> index e72070fe8af9..9246c3ea6ebc 100644
>> --- a/drivers/mtd/nand/raw/marvell_nand.c
>> +++ b/drivers/mtd/nand/raw/marvell_nand.c
>> @@ -2752,15 +2752,19 @@ static int marvell_nfc_probe(struct platform_device *pdev)
>>   		return ret;
>>   
>>   	nfc->reg_clk = devm_clk_get(&pdev->dev, "reg");
>> -	if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
>> -		if (!IS_ERR(nfc->reg_clk)) {
>> -			ret = clk_prepare_enable(nfc->reg_clk);
>> -			if (ret)
>> -				goto unprepare_core_clk;
>> -		} else {
>> +	if (IS_ERR(nfc->reg_clk)) {
>> +		if (PTR_ERR(nfc->reg_clk) != -ENOENT) {
>>   			ret = PTR_ERR(nfc->reg_clk);
>>   			goto unprepare_core_clk;
>>   		}
>> +
>> +		nfc->reg_clk = NULL;
>> +	}
>> +
>> +	if (nfc->reg_clk) {
>> +		ret = clk_prepare_enable(nfc->reg_clk);
>> +		if (ret)
>> +			goto unprepare_core_clk;
> 
> No need to check nfc->reg_clk value here:
> 
> 	ret = clk_prepare_enable(nfc->reg_clk);
> 	if (ret)
> 		goto unprepare_core_clk;


Ah, true.
