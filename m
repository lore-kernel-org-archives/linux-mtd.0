Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDm4l-0001qa-1l
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 16:13:19 +0100
Message-ID: <407D550E.8090306@avtrex.com>
Date: Wed, 14 Apr 2004 08:13:18 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <407CC018.3030505@avtrex.com>
	<200404141443.56257.tglx@linutronix.de> <407D46AD.4000801@avtrex.com>
	<200404141648.12848.tglx@linutronix.de>
In-Reply-To: <200404141648.12848.tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd, mtdblock and nand ecc.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let me start by saying that I am not trying to cause problems, but just 
to understand the best options...

Thomas Gleixner wrote:

>On Wednesday 14 April 2004 16:11, David Daney wrote:
>
>  
>
>>>NAND aware filesystem drivers provide their own oobsel structure and use
>>>the xxx_ecc functions.
>>>      
>>>
>>I am using the cramfs on a NAND partition as my root file system.
>>cramfs is not NAND aware, and I cannot be running userspace programs
>>before mounting as it is the root file system.
>>    
>>
>
>I know, but why must you use cramfs ? Why dont you use jffs2 or yaffs as your 
>root fs. Mount it r/o, so you have no hassle at all.
>  
>
With my NAND drivers, booting the linux kernel and mounting a minimal 
root file system on a 16MB flash takes 1:08 for yaffs and 1:25 for 
jffs2.  Using cramfs it boots in under 0:10.

That is why I am thinking about using a non NAND aware file system for 
things that can be read-only.

>  
>
>>I have not completely educated myself on the mtdblock driver.  Since the
>>mtdblock driver can be used by non-mtd-aware filesystems, I am proposing
>>making mtdblock NAND aware so that it uses the xxx_ecc functions iff ECC
>>is available.  Perhaps there would be a kernel/module command line
>>switch to help manage the behavior.
>>
>>Thoughts?
>>    
>>
>
>mtdblock is a block device driver and only provides an interface. It must not 
>be aware of anything. 
>
That is not quite correct.  mtdblock is well aware of the mtd backend.  
It does this:
    ret = MTD_WRITE (mtd, pos, len, &retlen, buf);

All I am suggesting is to have it do MTD_WRITE_ECC when possible.

>Using NAND unaware filesystems on NAND is nothing we want to support.
>ECC is only one part of NAND support. What about bad blocks? NAND chips can 
>have bad blocks, even when they are new. Only block 0 is guaranteed to be not 
>bad at delivery time. How want you deal with a board, where a bad block is in 
>the partition which is reserved for your cramfs ?
>

>We have two reliable working NAND aware filesystems around. I don't see any 
>reason to provide support for predictable trouble. 
>
>  
>
You already support it.  /dev/mtd and /dev/mtdblock work off-the-shelf 
with NAND devices and allow arbitrary programs/filesystems to overwrite 
bad blocks if they choose.

All I was thinking about was the ECC issue.

David Daney.
