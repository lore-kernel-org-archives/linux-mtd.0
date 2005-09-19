Received: from xproxy.gmail.com ([66.249.82.204])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHQjA-0004X1-O2
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 14:51:06 -0400
Received: by xproxy.gmail.com with SMTP id i30so1017080wxd
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2005 11:50:47 -0700 (PDT)
Message-ID: <432F0884.2020409@gmail.com>
Date: Mon, 19 Sep 2005 14:50:44 -0400
From: "David A. Braun" <braunster@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <432C2E6C.6050400@gmail.com>
	<20050919093300.GB21380@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>
	<20050919153217.GA26968@wohnheim.fh-wedel.de>
In-Reply-To: <20050919153217.GA26968@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Robert Kaiser <rkaiser@sysgo.com>,
	Marius Groeger <mgroeger@sysgo.com>
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the name in master->name doesn't match any of the partitions 
mentioned on the kernel command line then *pparts->offset is not 
initialized. The result is that all the partitions start at 0. Also the 
length of the "SIZE_REMAINING" partition is never initialized. Also the 
return value is -EINVAL instead of the number of partitions. This 
results in none of the partitions being pass to the driver. The only 
partition that appears in /proc/partitions is one for the whole device.

There are two problems. The if statement

    if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
    {
          ...

before the innermost for loop prevents the non-matching cmdline 
partitions from being initialized. Secondly the return statement just 
after this same for loop stops processing any remaining partitions 
following the matching partition.

As it turns out after looking over the code some more the table in 
question is internal to the cmdline parser anyway so no harm is done. 
Any partition declared on the cmdline that is referenced by a mtd driver 
gets initialized correctly. Unreferenced ones don't and need not be. 
There is however a small amount of kernel memory wasted on the partition 
table in cmdlineparts. It doesn't look like it ever gets released, not 
even if the cmdline parser gets de-registered (which it doesn't).

dave

Jörn Engel wrote:

>On Mon, 19 September 2005 16:26:07 +0200, Marius Groeger wrote:
>  
>
>>On Mon, 19 Sep 2005, Jörn Engel wrote:
>>    
>>
>>>On Sat, 17 September 2005 10:55:40 -0400, David A. Braun wrote:
>>>      
>>>
>>>>Is there any particular reason parse_cmdline_partitions() in
>>>>drivers/mtd/cmdlineparse.c doesn't completely setup the partition
>>>>table(s) it builds? It fails to initialize the offsets and sizes of any
>>>>partition tabled unless it is the one named by "master". This one has
>>>>the offsets and lengths filled in but the others are left zero with the
>>>>exception of partitions specified with "-" or SIZE_REMAINING. I would
>>>>have expected all partitions described in the cmdline to be initialized
>>>>if any are.
>>>>        
>>>>
>>>Iirc, the code was written by someone at Sysgo, possibly Robert, and
>>>hasn't been touched for quite a while.  So if you have any patches
>>>that improve the situation for you, feel free to send them.
>>>      
>>>
>>Acutally it was me :-), but someone decided to remove my name and just 
>>leave in the reference to our company... Anyway you're right about my 
>>not having touched that code. Looking at it briefly, though, I don't 
>>really spot anything suspicous. Apart from the (potential) oddity that 
>>the cmdline is saved and processed much later at a time the flash 
>>hardware is actually, I don't see what is not initialized.
>>    
>>
>
>[ slightly off-topic ]
>
>If you want your copyright line restored and don't have cvs access,
>send me a patch.
>
>For those less aware of how copyright law works:
>The copyright itself is independent of some lines explicitly claiming
>it for somebody.  So this is not about a legal issue, just politeness.
>
>Jörn
>
>  
>
