Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBxDZ-0005ND-LR
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 03:05:03 +0000
Message-ID: <54B87F96.9040804@huawei.com>
Date: Fri, 16 Jan 2015 11:03:50 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: nick <xerofoify@gmail.com>
Subject: Re: Patch Issues
References: <54B874F6.6090405@gmail.com>
In-Reply-To: <54B874F6.6090405@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nick,

I'm not quite sure about if it is a correct modification. But,

On 2015/1/16 10:18, nick wrote:
> drivers/mtd/inftlmount.c:336:12: warning: ‘check_free_sectors’ defined but not used [-Wunused-function]

check if this function is still called by other functions, if it
is not, just remove it in your patch.

>  static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
>             ^
> drivers/mtd/inftlmount.c: In function ‘INFTL_formatblock’:
> drivers/mtd/inftlmount.c:781:1: warning: control reaches end of non-void function [-Wreturn-type]
>  }
> Patch:
> From 6b481c8f5030da2e9616bd038193d68340c0b5d0 Mon Sep 17 00:00:00 2001
>   2 From: Nicholas Krause <xerofoify@gmail.com>
>   3 Date: Thu, 15 Jan 2015 20:10:37 -0500
>   4 Subject: [PATCH] mtd: Remove unneeded call to check_free_sectors in the
>   5  function,INFTL_formatblock
>   6 
>   7 Removes unneeded call to check_free_sectors internally in the function,INFTL_formatblock.
>   8 This call is no longer needed due to us checking to see if erasing the block against the
>   9 structure pointer passed to the function,inftl internal variable state is equal to the
>  10 macro,MTD_ERASE_FAILED to see if the block has failed in being erased successfully.Due
>  11 to this we can remove the no longer needed check to check_free_sectors and comments
>  12 related to questioning the reason for it's use with the check against MTD_ERASE_FAILED
>  13 for inftl's state variable already checking for successfully erasing of the mtd block.
>  14 
>  15 Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
>  16 ---
>  17  drivers/mtd/inftlmount.c | 10 ----------
>  18  1 file changed, 10 deletions(-)
>  19 
>  20 diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
>  21 index 1388c8d..def5cea 100644
>  22 --- a/drivers/mtd/inftlmount.c
>  23 +++ b/drivers/mtd/inftlmount.c
>  24 @@ -367,7 +367,6 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
>  25   *
>  26   * Return: 0 when succeed, -1 on error.
>  27   *
>  28 - * ToDo: 1. Is it necessary to check_free_sector after erasing ??
>  29   */
>  30  int INFTL_formatblock(struct INFTLrecord *inftl, int block)
>  31  {
>  32 @@ -401,15 +400,6 @@ int INFTL_formatblock(struct INFTLrecord *inftl, int block)
>  33                         goto fail;
>  34                 }
>  35 
>  36 -               /*
>  37 -                * Check the "freeness" of Erase Unit before updating metadata.
>  38 -                * FixMe: is this check really necessary? Since we have check
>  39 -                * the return code after the erase operation.
>  40 -                */
>  41 -               if (check_free_sectors(inftl, instr->addr, instr->len, 1) != 0)
>  42 -                       goto fail;
>  43 -       }

You should keep this '}'.

>  44 -
>  45         uci.EraseMark = cpu_to_le16(ERASE_MARK);
>  46         uci.EraseMark1 = cpu_to_le16(ERASE_MARK);
>  47         uci.Reserved[0] = 0;
>  48 -- 
>  49 2.1.0
>  50 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
