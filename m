Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142l5M-0001wk-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 02:10:32 +0000
Message-ID: <3A2AFC82.6E1521FD@sis.com.tw>
Date: Mon, 04 Dec 2000 10:08:02 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, linuxbios@lanl.gov
Subject: Re: DiskOnChip 2000/Millennium driver merge.
References: <Pine.LNX.4.30.0012021050140.22169-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> On Sat, 2 Dec 2000, Ollie Lho wrote:
> 
> > David,
> >       I just tried the updated CVS version. The Millennium part of
> > doc2000.c works for some extend. It has some bugs which will offset/lost
> > 1 or 2 bytes at begin/end of each 512byte page. It is a common problem if
> > you are not programming the chip fully comply to M-Systems Spec (actually
> > you have to do some "undocumented" tricks too). I will review the new code
> > next week possiblly after you get the SiS 630 LinuxBIOS demo/devel platform.
> 
> Thanks. I'll go through the driver and look for the remaining differences.
> Were these changes made in doc2001.c since the Millennium support was
> merged into doc2000.c, or did they get lost in the merge? If the former,
> do you remember the entry in the CVS log that I should be looking for?
> 
> I note you changed DoC_Command() so it no longer finishes with
> DoC_WaitReady(). Is there a situation in which DoC_Command shouldn't wait
> for FR_B after sending the command? Does it do any harm to do so, or is
> the removal just an optimisation?
> 

The reason that I removed DoC_WaitReady() for DoC_Command() is you are using
DoC_Command to find how many flash chip on a single DoC. If there is no more
chip, the ready bit will never get high. And the driver hangs.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
