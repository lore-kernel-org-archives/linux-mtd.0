Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRQxo-0000sy-3X
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 22:01:49 +0000
Received: by mail-wm0-x242.google.com with SMTP id c85so1056290wmi.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2017 14:01:24 -0800 (PST)
Subject: Re: [PATCH 02/18] mtd-cfi_cmdset_0001: Improve another size
 determination in cfi_intelext_partition_fixup()
To: SF Markus Elfring <elfring@users.sourceforge.net>,
 linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>,
 Richard Weinberger <richard@nod.at>
References: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
 <6bc5e888-47e2-270c-10b7-9198513f1ca1@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e8317d2b-3940-eb1e-68c0-c503171bcf76@gmail.com>
Date: Wed, 11 Jan 2017 22:57:31 +0100
MIME-Version: 1.0
In-Reply-To: <6bc5e888-47e2-270c-10b7-9198513f1ca1@users.sourceforge.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2017 09:37 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 10 Jan 2017 19:09:58 +0100

Please drop this stuff ^^^^^ git send-email should do that for you.

> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 68227aa74d22..0d7c2ef533d1 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -753,7 +753,7 @@ static int cfi_intelext_partition_fixup(struct mtd_info *mtd,
>  			kfree(newcfi);
>  			return -ENOMEM;
>  		}
> -		memcpy(newcfi, cfi, sizeof(struct cfi_private));
> +		memcpy(newcfi, cfi, sizeof(*cfi));
>  		newcfi->numchips = numvirtchips;
>  		newcfi->chipshift = partshift;
>  
> 


-- 
Best regards,
Marek Vasut
