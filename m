Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDnaa-0002pK-Pc
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 17:50:18 +0100
Message-ID: <407D6BB6.6090504@avtrex.com>
Date: Wed, 14 Apr 2004 09:49:58 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <407CC018.3030505@avtrex.com>
	<200404141648.12848.tglx@linutronix.de> <407D550E.8090306@avtrex.com>
	<200404141815.18987.tglx@linutronix.de>
In-Reply-To: <200404141815.18987.tglx@linutronix.de>
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

Thomas Gleixner wrote:

>On Wednesday 14 April 2004 17:13, David Daney wrote:
>  
>
>>Let me start by saying that I am not trying to cause problems, but just
>>to understand the best options...
>>    
>>
>
>I was not saying, that you are causing problems :)
>
>  
>
>>Thomas Gleixner wrote:
>>    
>>
>>>On Wednesday 14 April 2004 16:11, David Daney wrote:
>>>      
>>>
>>>>>NAND aware filesystem drivers provide their own oobsel structure and use
>>>>>the xxx_ecc functions.
>>>>>          
>>>>>
>>>>I am using the cramfs on a NAND partition as my root file system.
>>>>cramfs is not NAND aware, and I cannot be running userspace programs
>>>>before mounting as it is the root file system.
>>>>        
>>>>
>>>I know, but why must you use cramfs ? Why dont you use jffs2 or yaffs as
>>>your root fs. Mount it r/o, so you have no hassle at all.
>>>      
>>>
>>With my NAND drivers, booting the linux kernel and mounting a minimal
>>root file system on a 16MB flash takes 1:08 for yaffs and 1:25 for
>>jffs2.  Using cramfs it boots in under 0:10.
>>    
>>
>
>He ? 1 minute ? Where is the time spent ?
>
How should I know?


>Thats totaly out of the usual time. My boot time with JFFS2 is well below 30s 
>on an ARM7. I have no YAFFS root fs handy, but it is much faster.
>
>The solution is checking where the time is lost and fixing it.
>  
>
I have a custom nand driver (based on nand.c, but adapted to a non 
standard nand physical interface) that uses software ECC.  On a 300 MHz 
mips32 cpu.

When ever jffs2 or yaffs are mounted, they both seem to read many 
pages.  Perhaps the ECC overhead of reading all that data.

I suppose I could turn off ECC and see how fast it is...

>  
>
>>That is why I am thinking about using a non NAND aware file system for
>>things that can be read-only.
>>    
>>
>
>But this does not answer my question how you want to deal with bad blocks ?
>  
>
I want a file system very much like cramfs, but that can have holes in 
it so that it works on NAND.

When mounted it would start scanning blocks starting from the beginning 
of the NAND partition until it found a valid superblock (or what ever 
you would call it).  Then it would be done because all of the indexes 
would be built to work around the bad blocks.  Since this filesystem 
would be read-only with a static structure, you would never have to read 
more than necessary.

David Daney
