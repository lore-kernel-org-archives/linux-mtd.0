Received: from smtp12.mail.yahoo.co.jp ([211.14.15.235])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197dqg-0002Rb-6p
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 17:08:54 +0100
Message-ID: <001501c30820$3be142e0$a10486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: <tglx@linutronix.de>,
	<csperandeo@intrinsyc.com>,
	<linux-mtd@lists.infradead.org>
References: <200304101926.h3AJQ8b05913@marmot.intrinsyc.com>
	<002a01c304fc$e3e4d3c0$a10486da@w0a3t0>
	<200304172105.05365.tglx@linutronix.de>
Date: Tue, 22 Apr 2003 01:08:23 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 on NAND reboot problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Thursday 17 April 2003 18:17, matsunaga wrote:
> > It seems to me that the system was rebooted without wbuf flush.
> > If it is true, another problem I think is that mount process cannot detect
> > the inode inconsistency. This fs should be designed on the premise that
> > power failure happens. The last accessing file do not need to be saved, but
> > fs does.
> > Sorry if this is solved on the latest code
> 
> It is designed this way. But we are neither perfect nor can we predict every 
> 10e12 possibilities to produce a hidden bug.
> 
> I cannot reproduce it here. 
> That's why I asked for a bainary Image of the flash content, but I received 
> none until now.

To tell the truth, I saw the same BUG() last month, but I had other things to fix and put it aside.
Now it is hard for me to reproduce it, too. I might be solved on the updated code.
Sending binary image could reveal confidential information, so he might hesitate to do it...
 
> We can only solve problems, which are either reproducable or which can be 
> reproduced by some user supplied pattern / image. 
> 
> We all do our very best to make this code stable and reliable, but we need the 
> help from _USERS_ to detect insufficiencies. That's the way open source 
> software works. If we don't get the requested feedback / help we can only 
> say: You got the code. Feel free to fix it.

I understand. We are all users and not guests.

P.S.
It is trivial, but I think gc.c line 125 ic is not necessary, or the name be changed.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
