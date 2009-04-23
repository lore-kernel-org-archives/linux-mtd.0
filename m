Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LwxA6-0006DU-4T
	for linux-mtd@lists.infradead.org; Thu, 23 Apr 2009 11:32:21 +0000
Received: by bwz4 with SMTP id 4so512947bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Apr 2009 04:32:12 -0700 (PDT)
Message-ID: <49F051AF.6050808@gmail.com>
Date: Thu, 23 Apr 2009 15:31:59 +0400
From: Vladimir Barinov <vova.barinov@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] MXC NAND driver fixes (v4)
References: <1240414310-9245-1-git-send-email-vbarinov@embeddedalley.com>
	<1240469163.19218.16.camel@localhost.localdomain>
In-Reply-To: <1240469163.19218.16.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

Artem Bityutskiy wrote:
> On Wed, 2009-04-22 at 19:31 +0400, Vladimir Barinov wrote:
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
>> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
>> ---
>>  drivers/mtd/nand/mxc_nand.c |   43 +++++++++++++++++++++++--------------------
>>  1 files changed, 23 insertions(+), 20 deletions(-)
>>     
>
> Your patch does not apply to the latest mtd-2.6.git
>   
Sorry, my fault, I didn't verified the patch after the latest merge.
Will remake to apply cleanly in V5.

Vladimir
