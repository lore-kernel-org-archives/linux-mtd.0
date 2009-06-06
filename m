Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MClpx-0005px-RG
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 02:40:56 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MClpv-0001wJ-DR
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 02:40:47 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Jun 2009 02:40:47 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sat, 06 Jun 2009 02:40:47 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: Re: Nandwrite's behavior in case of write failure
Date: Fri, 05 Jun 2009 19:40:35 -0700
Message-ID: <4A29D723.1010109@gmail.com>
References: <h09s2s$ar6$1@ger.gmane.org>
	<1244205087.5847.66.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
In-Reply-To: <1244205087.5847.66.camel@localhost.localdomain>
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Thu, 2009-06-04 at 18:23 -0700, Nahor wrote:
>> Hi,
>>
>> If the call to pwrite fails, nanwrite tries first to erase the block 
>> then to mark it as bad. If erase fails, nandwrite aborts. If setting the 
>> bad block flag fails, nandwrite just ignores it and go to the next block.
> 
> I think this is a bug. It should not aborts in erase fails, but mark
> the block as bad instead. But it should check the error code as well,
> and mark it as bad only if the error was EIO. I.e., it should not
> mark the block as bad on ENOMEM.
> 
> And yes, if mark_bad() fails, nandwrite should not ignore this.
> 
> This is what we do in ubiformat, I think. Also, ubiformat asks the user
> if he wants to mark the block as bad, unless the -y option was used.
> nandwrite could do something similar.

nandwrite has the -m/--markbad option instead of -y.
However, if the option is not set, the blocks are skipped without being
marked. I guess nandwrite should either ask the user or fail immediately.
Continuing seems useless.


>> My questions are:
>> - Why erase the block?
> Just in case. We should be very careful with marking blocks as bad,
> because if you do this by mistake, you may loose your device. Indeed,
> imagine you marked 100 blocks as bad my mistake, and you do not remember
> the block numbers. How will you know which blocks you should then
> unmark?

Well, one could unmark all of them and run nandtest, then flog oneself and
swear to pay more attention next time :)

More seriously, in my case, I want to use nandwrite for automatic updates
so I prefer that it marks too many blocks bad than have the update abort
because nandwrite wants to be conservative and exits instead of flagging
the offending block and continuing.


> So the idea of erase is to check whether the block is really bad
> or this is just a driver bug or something.

Do you mean that if the erase succeeds, nandwrite shouldn't mark the block
bad and just exit?

I'm not too familiar with the NAND technology but it is not possible that
a block can be erasable but not written to? At least nandtest thinks so, it
mark blocks as bad on either erase or write failures.

And so does ubiformat. flash_image() either exits or marks the block
bad if mtd_write fails. It doesn't try to erase it first.


	Nahor
