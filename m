Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JlRHT-0003G1-9f
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 16:11:44 +0000
Date: Mon, 14 Apr 2008 19:10:38 +0300
From: Adrian Bunk <bunk@kernel.org>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [2.6 patch] mtd/cmdlinepart.c: don't compare pointers with 0
Message-ID: <20080414161037.GZ6695@cs181133002.pp.htv.fi>
References: <20080414142004.GR6695@cs181133002.pp.htv.fi>
	<48036D43.6070307@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <48036D43.6070307@ru.mvista.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 14, 2008 at 06:42:11PM +0400, Sergei Shtylyov wrote:
> Hello.
>
> Adrian Bunk wrote:
>
>> Sparse spotted that 0 was compared to pointers.
>
>> While I was at it, I also moved the assignments out of the if's.
>
>> Signed-off-by: Adrian Bunk <bunk@kernel.org>
>
>> 32de76e83f37322dd85eaecf126e7b17327f606f diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
>> index b44292a..3e09043 100644
>> --- a/drivers/mtd/cmdlinepart.c
>> +++ b/drivers/mtd/cmdlinepart.c
>> @@ -119,7 +119,8 @@ static struct mtd_partition * newpart(char *s,
>>  		char *p;
>>   	    	name = ++s;
>> -		if ((p = strchr(name, delim)) == 0)
>> +		p = strchr(name, delim);
>> +		if (!p)
>>  		{
>
>    Wouldn't it be nice to join the standalone brace to if () while it?

Most of the file is written like this, so there's no point in changing 
it only here...

>>  			printk(KERN_ERR ERRP "no closing %c found in partition name\n", delim);
>>  			return NULL;
>
> WBR, Sergei

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
