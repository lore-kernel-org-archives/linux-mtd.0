Subject: Re: [PATCH 1/6] nand: davinci: rename the platform driver
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Santosh Shilimkar
 <ssantosh@kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20180216164712.25898-1-brgl@bgdev.pl>
 <20180216164712.25898-2-brgl@bgdev.pl> <20180216201923.16bfca7f@bbrezillon>
From: David Lechner <david@lechnology.com>
Message-ID: <93fd5120-28c6-96c7-4a0d-a4bd065f5ae6@lechnology.com>
Date: Fri, 16 Feb 2018 13:22:20 -0600
MIME-Version: 1.0
In-Reply-To: <20180216201923.16bfca7f@bbrezillon>
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

On 02/16/2018 01:19 PM, Boris Brezillon wrote:
> On Fri, 16 Feb 2018 17:47:07 +0100
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Commit d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock
>> lookup table") broke the nand support in board file mode for
>> da850-based boards. Instead of reverting it and breaking the DT users
>> in the process (due to clock lookup), rename the driver to match the
>> clock table before renaming the users.
>>
>> Fixes: d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock lookup table")
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>   drivers/mtd/nand/davinci_nand.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>> index ccc8c43abcff..4fb143bf1872 100644
>> --- a/drivers/mtd/nand/davinci_nand.c
>> +++ b/drivers/mtd/nand/davinci_nand.c
>> @@ -865,7 +865,7 @@ static struct platform_driver nand_davinci_driver = {
>>   	.probe		= nand_davinci_probe,
>>   	.remove		= nand_davinci_remove,
>>   	.driver		= {
>> -		.name	= "davinci_nand",
>> +		.name	= "davinci-nand",
> 
> Another side-effect of this change you should be aware of: by doing
> that you also break all users that were defining partitions through the
> cmdline using mtdparts=davinci_nand.0:<part-layout>.
> 
> Not sure this is a good idea ;-).

Also, once we move to the common clock framework, the AUXDATA that causes
the DT clock lookup breakage you are trying to avoid will go away, so that
won't be a reason for changing this either.
