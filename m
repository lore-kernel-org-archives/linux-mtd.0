Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLEMC-0005VQ-Nc
 for linux-mtd@lists.infradead.org; Thu, 07 Jul 2016 18:49:05 +0000
Subject: Re: [PATCH 5/5] mtd: Don't print a scary message when trying to
 remove a busy MTD
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
 <1467669983-12105-6-git-send-email-richard@nod.at>
 <20160707165805.636d1b47@bbrezillon>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <577EA408.4000406@nod.at>
Date: Thu, 7 Jul 2016 20:48:40 +0200
MIME-Version: 1.0
In-Reply-To: <20160707165805.636d1b47@bbrezillon>
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

Boris,

Am 07.07.2016 um 16:58 schrieb Boris Brezillon:
> On Tue,  5 Jul 2016 00:06:23 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Just return -EBUSY and everything is fine.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/mtdcore.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index f49e103..f2dea88 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -499,11 +499,9 @@ int del_mtd_device(struct mtd_info *mtd)
>>  		goto out_error;
>>  	}
>>  
>> -	if (mtd->usecount) {
>> -		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
>> -		       mtd->index, mtd->name, mtd->usecount);
>> +	if (mtd->usecount)
>>  		ret = -EBUSY;
>> -	} else {
>> +	else {
> 
> Nit: can you keep the brackets around the if (mtd->usecount) block (we
> usually only drop them when both the 'if' and 'else' blocks contain
> a single instruction)?
> 

As discussed on IRC, the current kernel coding style is fine with that.
And checkpatch.pl is happy too.

Thanks,
//richard
