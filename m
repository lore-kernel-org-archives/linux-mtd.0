Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDED1-00056T-Rp
	for linux-mtd@lists.infradead.org; Sun, 07 Jun 2009 08:58:39 +0000
Subject: Re: Nandwrite's behavior in case of write failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nahor <nahor.j+gmane@gmail.com>
In-Reply-To: <4A29D723.1010109@gmail.com>
References: <h09s2s$ar6$1@ger.gmane.org>
	<1244205087.5847.66.camel@localhost.localdomain>
	<4A29D723.1010109@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 07 Jun 2009 11:57:56 +0300
Message-Id: <1244365076.5847.317.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-05 at 19:40 -0700, Nahor wrote:
> Artem Bityutskiy wrote:
> > This is what we do in ubiformat, I think. Also, ubiformat asks the user
> > if he wants to mark the block as bad, unless the -y option was used.
> > nandwrite could do something similar.
> 
> nandwrite has the -m/--markbad option instead of -y.

OK.

> However, if the option is not set, the blocks are skipped without being
> marked. I guess nandwrite should either ask the user or fail immediately.
> Continuing seems useless.

Yes. It might as well suggest using -m/

> >> My questions are:
> >> - Why erase the block?
> > Just in case. We should be very careful with marking blocks as bad,
> > because if you do this by mistake, you may loose your device. Indeed,
> > imagine you marked 100 blocks as bad my mistake, and you do not remember
> > the block numbers. How will you know which blocks you should then
> > unmark?
> 
> Well, one could unmark all of them and run nandtest, then flog oneself and
> swear to pay more attention next time :)

The problem is that factory-marked bad blocks do not have to manifest
themselves easily. They may appear to work fine, and file later, e.g.
when the temperature is higher.

> More seriously, in my case, I want to use nandwrite for automatic updates
> so I prefer that it marks too many blocks bad than have the update abort
> because nandwrite wants to be conservative and exits instead of flagging
> the offending block and continuing.

Then you probably need to fix the tool. I wonder, it it would make sense
to use libmtd.c from UBI utils and re-write nandwrite? Of course
libmtd.c would need to be improved as well. But the benefit would be
shared code between ubiformat and nandwrite.

> > So the idea of erase is to check whether the block is really bad
> > or this is just a driver bug or something.
> 
> Do you mean that if the erase succeeds, nandwrite shouldn't mark the block
> bad and just exit?

I think it should do something like UBI is doing - erase the eraseblock,
then torture it by writing several patterns and reading them back. If
the eraseblock survived torturing, nandwrite may re-try writing,
otherwise it marks the eraseblock as bad.

> I'm not too familiar with the NAND technology but it is not possible that
> a block can be erasable but not written to? At least nandtest thinks so, it
> mark blocks as bad on either erase or write failures.

Yes, write and erase failure mean that the erasblock is bad. But I think
marking a block as bad straight away is just dangerous. Who knows may be
this is a small glitch in a bus, or a software bug, or some-one
corrupted driver's memory, or whatever. This is why UBI is doing
eraseblock torturing before marking it as bad. And it is very careful
about error codes - only EIO code is considered as a reason to mark an
eraseblock as bad.

> And so does ubiformat. flash_image() either exits or marks the block
> bad if mtd_write fails. It doesn't try to erase it first.

Yes, this is not very good, I've added TODO there. It should torture the
eraseblock - I'll implement this later in libmtd.c.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
