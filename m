Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDl7Q-0001QT-Uj
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 15:12:01 +0100
Message-ID: <407D46AD.4000801@avtrex.com>
Date: Wed, 14 Apr 2004 07:11:57 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <407CC018.3030505@avtrex.com>
	<200404141443.56257.tglx@linutronix.de>
In-Reply-To: <200404141443.56257.tglx@linutronix.de>
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

>On Wednesday 14 April 2004 06:37, David Daney wrote:
>  
>
>>Is there some reason that the mtd and mtdblock drivers do not use ECC
>>when the backing device is nand with ECC enabled?
>>    
>>
>
>Yes. 
>If the oobsel structure == NULL, then the nand driver uses the structure, 
>which is associated to this mtd device. This can be done from userspace using 
>MEMSETOOBSEL ioctl.
>NAND aware filesystem drivers provide their own oobsel structure and use the 
>xxx_ecc functions.
>  
>
I am using the cramfs on a NAND partition as my root file system.  
cramfs is not NAND aware, and I cannot be running userspace programs 
before mounting as it is the root file system.

I have not completely educated myself on the mtdblock driver.  Since the 
mtdblock driver can be used by non-mtd-aware filesystems, I am proposing 
making mtdblock NAND aware so that it uses the xxx_ecc functions iff ECC 
is available.  Perhaps there would be a kernel/module command line 
switch to help manage the behavior.

Thoughts?

David Daney
