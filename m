Received: from mailout09.sul.t-online.com ([194.25.134.84])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFsH0-0003Ul-Bq
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 11:14:38 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 linux-mtd@lists.infradead.org
Date: Tue, 20 Apr 2004 12:09:32 +0200
References: <01139FC052A0D411900B00508B9535FC13AC4049@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC4049@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404201209.32094.tglx@linutronix.de>
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

On Tuesday 20 April 2004 11:40, Shen Aaron-r62966 wrote:
> >
> > Which kernel version ?
> > Which MTD version are you using ?
> > Is this a userspace application ?
> > Which oob layout is selected ?
>
> Actually, I'm adding ECC part into the spl code for NAND flash bootloader.
> Most of the algorithm and the interfaces to calculate ecc code and to
> read/write a page is copied from driver/mtd/nand/. The version of linux
> kernel is 2.4.18. The oob layout is 16 byte size.

So you are debugging your bootloader code and not kernel code ?
Did you copy the code from 2.4.18 ? If yes, use code from actual MTD CVS.
If no, which version of MTD code did you use to copy from ?

> >
> > Where is the ECC correction done ?
>
> ECC correction should be done after reading each page. But here I
> only need to read out the OOB data of a page after writing to it.
> The obvious problem is that ecc data is writen into spare[0~3] and
> spare[6~7], but only spare[0~5] is what we expected when read out.
> The spare[6~7] has changed and some unexpected data is writen
> into spare[8~A]. I still can't find out the reason. Any more suggestion?

The page write function is the right place to look

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
