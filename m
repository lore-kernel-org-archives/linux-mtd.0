Received: from bay106-f34.bay106.hotmail.com ([65.54.161.44] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E0ix7-0006FP-E9
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2005 17:52:18 +0100
Message-ID: <BAY106-F34B49101C8BF412805B6C098C40@phx.gbl>
In-Reply-To: <1123172469.26146.178.camel@tglx.tec.linutronix.de>
From: "Nathan H." <n_8_10@hotmail.com>
To: tglx@linutronix.de
Date: Thu, 04 Aug 2005 10:43:49 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mask error in nandbase.c: nand_scan(): oob_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ah ha!  Now it all becomes clear.  You are looking at the wrong bit field.  
I tried to make it clear in the first email, but accidentally used a 
variable width font- so that the "^error" may have been pointing in the 
wrong place.  Maybe that was not helpful as I had intended.

"oob_size" in the driver is related to the "Redundant Area Size" in the 
flash documentation.  Redundant Area Size (RAS) is a 1 bit field.  Yet in 
the driver a 2 bit field mask is used to mask it.  This means that the RAS 
and the Serial Access Miniumum bits are grabbed together.  Because the SAM 
is (for now) only "0" this error has not caused any problems.  But it is not 
right or future proof.

Please refer to my first email.  It is the mtd->oobsize and NOT the 
mtd->oobblock to which my comments refer.

Thank you for your reply.  I hadn't yet seen documentation about the 5th ID 
Data field.  That will be helpful for a problem that I am going to be 
working on soon.

-Nathan

>Sorry. The field is 2 (two) bits wide for _ANY_ FLASH which supports the
>extended ID. The code looks at bit 0 and bit 1 of 4th ID data. Why do
>you insist that it is a 1-bit field ?
>
> >From the datasheet you referred to
>
>         I/O1  I/O0
>1K       0      0
>2k       0      1
>reserved 1      0
>reserved 1      1
>
> >From the datasheet I referred to
>
>         I/O1  I/O0
>1K       0      0
>2k       0      1
>4k       1      0
>8k       1      1
>
