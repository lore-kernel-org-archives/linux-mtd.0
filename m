Received: from mail-da0-f47.google.com ([209.85.210.47])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ttwy3-00017c-F2
 for linux-mtd@lists.infradead.org; Sat, 12 Jan 2013 09:01:33 +0000
Received: by mail-da0-f47.google.com with SMTP id s35so1112018dak.6
 for <linux-mtd@lists.infradead.org>; Sat, 12 Jan 2013 01:01:29 -0800 (PST)
Message-ID: <50F12660.6010208@gmail.com>
Date: Sat, 12 Jan 2013 14:31:20 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Tormod Volden <lists.tormod@gmail.com>
Subject: Re: [PATCH] mtd: nand: print source of "uncorrectable error" message
References: <1357947835-20194-1-git-send-email-lists.tormod@gmail.com>
In-Reply-To: <1357947835-20194-1-git-send-email-lists.tormod@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/12/2013 5:13 AM, Tormod Volden wrote:
> From: Tormod Volden <debian.tormod@gmail.com>
>
> Add the function name to the error message.
>
> These messages are not very helpful:
>
> [183356.176682] uncorrectable error :
> [183356.180273] uncorrectable error :
> [183356.184194] uncorrectable error :
> [183356.187773] uncorrectable error :
> [183356.191280] uncorrectable error :
>
> Signed-off-by: Tormod Volden <debian.tormod@gmail.com>
> ---
>
> Not sure if above messages come from this code. I also believe there must be
> a better way, advice welcome. Maybe we need to make sure all possible callers
> print additional information if -1 is returned.
>
> But this small change should be better than nothing, meanwhile.
>
> Regards,
> Tormod
>
>
>   drivers/mtd/nand/nand_ecc.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
> index b7cfe0d..cee06e9 100644
> --- a/drivers/mtd/nand/nand_ecc.c
> +++ b/drivers/mtd/nand/nand_ecc.c
> @@ -507,7 +507,7 @@ int __nand_correct_data(unsigned char *buf,
>   	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
>   		return 1;	/* error in ECC data; no action needed */
>
> -	printk(KERN_ERR "uncorrectable error : ");
> +	printk(KERN_ERR "__nand_correct_data: uncorrectable error : ");

Better to use %s and __func__.
Despite adding the function name, it'd be much better to briefly convey 
what has happened.

Regards,
Vikram
