Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lqkrl-0004WG-LB
	for linux-mtd@lists.infradead.org; Mon, 06 Apr 2009 09:11:48 +0000
Message-ID: <49D9C748.1080706@embeddedalley.com>
Date: Mon, 06 Apr 2009 13:11:36 +0400
From: Vladimir Barinov <vbarinov@embeddedalley.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v2)
References: <1238709260-17439-1-git-send-email-vbarinov@embeddedalley.com>	<1238748195-10757-1-git-send-email-vbarinov@embeddedalley.com>
	<20090404113725.GD23731@pengutronix.de>
In-Reply-To: <20090404113725.GD23731@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Lothar Wassmann <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha Hauer wrote:
> On Fri, Apr 03, 2009 at 12:43:15PM +0400, Vladimir Barinov wrote:
>   
>> The following patch fixes:
>>  - re-initialization of host->col_addr which is used as byte index
>>    between the successive READID flash commands.
>>  - compile error when CONFIG_PM is enabled
>>  - pass on the error code from clk_get()
>>  - return -ENOMEM in case of failed ioremap()
>>  - pass on the return value of platform_driver_probe() directly
>>  - remove excessive printk
>>  - let command line partition table parsing with mxc_nand name.
>>    The cmd_line parsing is done via <mtd-id> name that differs
>>    from mxc_nand by default and looks like "NAND 256MiB 1,8V 8-bit"
>>
>> Signed-off-by: Vladimir Barinov <vbarinov@embeddedalley.com>
>> Signed-off-by: Lothar Wassmann <LW@KARO-electronics.de>
>> ---
>>  drivers/mtd/nand/mxc_nand.c |   45 +++++++++++++++++++++++-------------------
>>  1 files changed, 25 insertions(+), 20 deletions(-)
>>
>>  
>>  	/* Register the partitions */
>>  #ifdef CONFIG_MTD_PARTITIONS
>> +#ifdef CONFIG_MTD_CMDLINE_PARTS
>> +	mtd->name = "mxc_nand";
>> +#endif
>>     
>
> Thinking about it I'm totally against this ifdef. The name should not
> depend on command line partition support being compiled into the kernel
> or not. Just because it's compiled in does not mean that the user
> actually wants to use it and it's quite confusing that the name changes
> when a totally unrelated option is changed. I think it should not even
> be inside CONFIG_MTD_PARTITIONS.
>   
Actually I agree to make the name permanent and put out of any ifdef.
I've added cmdline dependency here just because of too long command line 
name
needed to parse partition table and all other cases were useless.
> The rest of the patch seems ok to me.
>   
Then I'll put the driver naming out of ifdefs and resend the v3.
> Sascha
>   
