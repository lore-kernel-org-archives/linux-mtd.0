Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Ph9-000572-SE
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2015 02:20:32 +0000
Subject: Re: [PATCH v2 2/2] mtd: nand: atmel_nand: fix a possible NULL
 dereference
To: LABBE Corentin <clabbe.montjoie@gmail.com>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448005517-26004-3-git-send-email-clabbe.montjoie@gmail.com>
 <564EDACA.30204@atmel.com> <20151124131218.GA7545@Red>
CC: <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
From: Josh Wu <josh.wu@atmel.com>
Message-ID: <56551AD2.3010607@atmel.com>
Date: Wed, 25 Nov 2015 10:20:02 +0800
MIME-Version: 1.0
In-Reply-To: <20151124131218.GA7545@Red>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Corentin

On 11/24/2015 9:12 PM, LABBE Corentin wrote:
> On Fri, Nov 20, 2015 at 04:33:14PM +0800, Josh Wu wrote:
>> Hi, Corentin
>>
>> Thanks for the patch. It looks fine to me, just one nitpick in below:
>>
>> On 11/20/2015 3:45 PM, LABBE Corentin wrote:
>>> of_match_device could return NULL, and so cause a NULL pointer
>>> dereference later.
>>>
>>> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
>>> ---
>>>    drivers/mtd/nand/atmel_nand.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
>>> index 475c938..7902967 100644
>>> --- a/drivers/mtd/nand/atmel_nand.c
>>> +++ b/drivers/mtd/nand/atmel_nand.c
>>> @@ -1496,8 +1496,9 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
>>>    	struct atmel_nand_data *board = &host->board;
>>>    	enum of_gpio_flags flags = 0;
>>>    
>>> -	host->caps = (struct atmel_nand_caps *)
>>> -		of_match_device(atmel_nand_dt_ids, host->dev)->data;
>>> +	host->caps = of_device_get_match_data(host->dev);
>>> +	if (!host->caps)
>>> +		return 1;
>> it's better to use -EINVAL here.
>>
> Hello
>
> I do that Uwe Kleine-König said to me to do in others thread:
> https://lkml.org/lkml/2015/11/12/70 and https://lkml.org/lkml/2015/11/16/211

Thank you for the information.
I checked the imx serial driver(drivers/tty/serial/imx.c) in 
serial_imx_probe():

     ...
     ret = serial_imx_probe_dt(sport, pdev);
     if (ret > 0)     --->  So here is why you need to return 1 in 
serial_imx_probe_dt().
         serial_imx_probe_pdata(sport, pdev);
     else if (ret < 0)
         return ret;

There has a branch to check whether ret is > 0 or < 0. So that's why you 
need to return 1 in imx serial driver.

But in atmel_nand driver, we don't have such code for that. The 
atmel_of_init_port() is only used for dt probe. So if dt is not matched, 
just return an error.

>
> Regards
>
Best Regards,
Josh Wu
