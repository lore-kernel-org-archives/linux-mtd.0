Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BFsrR-0003jZ-Sp
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2004 11:52:17 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 "'tglx@linutronix.de'" <tglx@linutronix.de>,
 linux-mtd@lists.infradead.org
Date: Tue, 20 Apr 2004 12:47:39 +0200
References: <01139FC052A0D411900B00508B9535FC13AC404A@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC404A@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404201247.39527.tglx@linutronix.de>
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

On Tuesday 20 April 2004 12:37, Shen Aaron-r62966 wrote:
> > -----Original Message-----
> > On Tuesday 20 April 2004 11:40, Shen Aaron-r62966 wrote:
> > So you are debugging your bootloader code and not kernel code ?
> > Did you copy the code from 2.4.18 ? If yes, use code from
> > actual MTD CVS.
> > If no, which version of MTD code did you use to copy from ?
>
> Yes, right. I'm debugging my bootloader code. I'm using the 2.4.18 kernel,
> so I didn't use the code from actual MTD CVS. There're many differences for
> the actual CVS, for example, the nand_ecc.h and other head files are added
> into linux/mtd/. I don't think it's a good choice to use the mtd code from
> actual CVS if it's not a known problem. And I'm not sure whether such
> update will do harm to my system. I think the code in 2.4.18 should work
> for it. But I need to find out what's the problem.

Hmm, known problem is a nice phrase. The code in 2.4.18 was not used in 
production AFAIK. 

All you need is pageprogramming which is quite straight forward:
Write the start programm command
Write out 512 byte data + 16 byte oob
Write the programm command 
Wait for ready

> > The page write function is the right place to look
>
> Yes, The only step before I re-read the oob data is the page write
> function. But I have added more debugging information into this function
> and still can't find the causing. Is it possible that the Nand Flash
> Controller does some operation after a page has been writen?

Is this the builtin controller on iMX2 ?
I dont know, what this does, as I have no datasheet. The product brief tells 
something about automatic ECC...
Maybe you have to check this first

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
