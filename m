Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDpHt-0003ug-CL
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 19:39:05 +0100
Message-ID: <407D8548.9020101@avtrex.com>
Date: Wed, 14 Apr 2004 11:39:04 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <407CC018.3030505@avtrex.com>
	<200404141815.18987.tglx@linutronix.de> <407D6BB6.6090504@avtrex.com>
	<200404141936.32655.tglx@linutronix.de>
In-Reply-To: <200404141936.32655.tglx@linutronix.de>
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

>Why did you modify nand.c ? 
>Almost everything in nand.c can be overridden by the board driver. Therefor we 
>call all the functions through chip->xxx().
>  
>
We need almost everything in nand.c, but the physical access to the NAND 
is through a hardware state machine that hides the raw chip registers 
that nand.c uses.  So we made a copy of nand.c and hacked it to work.

>>When ever jffs2 or yaffs are mounted, they both seem to read many
>>pages.  Perhaps the ECC overhead of reading all that data.
>>I suppose I could turn off ECC and see how fast it is...
>>    
>>
>
>Sure, that would give an estimation.
>
>  
>
>>>>That is why I am thinking about using a non NAND aware file system for
>>>>things that can be read-only.
>>>>        
>>>>
>>>But this does not answer my question how you want to deal with bad blocks
>>>?
>>>      
>>>
>>I want a file system very much like cramfs, but that can have holes in
>>it so that it works on NAND.
>>When mounted it would start scanning blocks starting from the beginning
>>of the NAND partition until it found a valid superblock (or what ever
>>you would call it).  Then it would be done because all of the indexes
>>would be built to work around the bad blocks.  Since this filesystem
>>would be read-only with a static structure, you would never have to read
>>more than necessary.
>>    
>>
>
>OK, so you are going to write a fs driver, which is NAND aware and behaves 
>similar to cramfs. 
>
I MAY do it, but would rather that someone else did all the hard work :)

>Whatfor then the discussion about making mtdblock nand aware ?
>If you write a nand aware fs then you just call the appropriate functions. 
>This fs will be specific for nand or selectable for nand, so what ?
>No need to touch anything in mtdblock.c
>  
>
I guess I am abandoning that for now...

David Daney.
