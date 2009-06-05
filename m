Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYb3-0005ij-Vp
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:32:40 +0000
Subject: Re: Nandwrite's behavior in case of write failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nahor <nahor.j+gmane@gmail.com>
In-Reply-To: <h09s2s$ar6$1@ger.gmane.org>
References: <h09s2s$ar6$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Jun 2009 15:31:27 +0300
Message-Id: <1244205087.5847.66.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-04 at 18:23 -0700, Nahor wrote:
> Hi,
> 
> If the call to pwrite fails, nanwrite tries first to erase the block 
> then to mark it as bad. If erase fails, nandwrite aborts. If setting the 
> bad block flag fails, nandwrite just ignores it and go to the next block.

I think this is a bug. It should not aborts in erase fails, but mark
the block as bad instead. But it should check the error code as well,
and mark it as bad only if the error was EIO. I.e., it should not
mark the block as bad on ENOMEM.

And yes, if mark_bad() fails, nandwrite should not ignore this.

This is what we do in ubiformat, I think. Also, ubiformat asks the user
if he wants to mark the block as bad, unless the -y option was used.
nandwrite could do something similar.

> My questions are:
> - Why erase the block?
Just in case. We should be very careful with marking blocks as bad,
because if you do this by mistake, you may loose your device. Indeed,
imagine you marked 100 blocks as bad my mistake, and you do not remember
the block numbers. How will you know which blocks you should then
unmark?

So the idea of erase is to check whether the block is really bad
or this is just a driver bug or something.

> - Probably linked to the first question, why abort if erase fails? Why 
> not just ignore it and rely on the bad block flag?
I guess this is a bug in nandwrite

> - Why ignore the bad block flag error? If nandwrite can't set it and 
> just goes on, the caller (app ou user) will think that everything is 
> good. But when reading the partition later, the user will garbage when 
> reaching that page.
And this must be a bug, IMO.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
