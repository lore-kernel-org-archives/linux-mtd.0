Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFrTG-0003DI-GK
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 10:23:14 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 linux-mtd@lists.infradead.org
Date: Tue, 20 Apr 2004 11:18:03 +0200
References: <01139FC052A0D411900B00508B9535FC13AC4046@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC4046@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404201118.03964.tglx@linutronix.de>
Subject: Re: ECC byte 4 and 5 not equal to what have just been writen
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 April 2004 09:35, Shen Aaron-r62966 wrote:
> Hi,
>
>   Is there anyone aware of such problem about ECC?
>   When I read back the OOB data after writing to a page, I find the offset
> 06 and 07 are not equal to what have just been writen into the page.
>
>   The part of codes are :
> ==========================================
>   ......
>   // char spare[16] is for oob data in spare area
>   mx2_write_ecc((char*)p, spare, last);		// My function to set the
> spare[16] before write a page printOut("The spare[ ] to write in flash is
> :\n");	// Messege printed out printOut(spare);					// Print out the spare[
> ]
>   if(NAND_Write_OnePage(page, (char*)p, spare))	// Write the page with
> spare[ ] into NAND flash return;
>   NAND_Read_OOB(0, page, spare, 16);		// Read back the oob data into spare[
> ] printOut("The spare[ ] to read back from flash is :\n");
>   printOut(spare);					// Print out the spare[ ]
>   ......

Which kernel version ?
Which MTD version are you using ?
Is this a userspace application ?
Which oob layout is selected ?

>   As you may have found out, the spare[0]~spare[5] are the same as writen.
> But spare[6] and spare[7] are different, while spare[8], spare[9] and
> spare[A] are so strange.
>
>   This will cause the failure of ecc correction for the upper 256 bytes of
> data in each page. Can you give me some comments?

Where is the ECC correction done ? 

>  Is this a known problem of NAND_Read_OOB( )?

No

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
