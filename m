Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRO7y-0004qx-BC
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 10:23:54 +0000
Subject: Re: UBI resizing
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jelle Martijn Kok <jmkok@youcom.nl>
In-Reply-To: <4A5DAA5A.3010101@youcom.nl>
References: <4A5B4EC7.9010605@youcom.nl>
	<1247565935.3828.136.camel@localhost.localdomain>
	<4A5DAA5A.3010101@youcom.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 13:23:01 +0300
Message-Id: <1247739781.11353.111.camel@localhost.localdomain>
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

On Wed, 2009-07-15 at 12:07 +0200, Jelle Martijn Kok wrote:
> I just pull a piece of your reply to the front as this best describes my 
> need for the (automatic) resizing.
>  > create a special temporary throw-away volume, write stuff there, then 
> re-name it to an existing one.

I actually meant you could create a new ioctl which would do this
internally:

1. check if there are enough PEBs for a temporary volume
2. create a throw-away volume which is invisible for users
3. write your data there
4. when all data are there, re-name the old volume to the
   new one and kill the old volume

You would need to implement some locking to make writers to other
UBI volumes wait for atomic upgrade to finish. Indeed, because it
takes PEBs, other writers may find no PEBs, and they should be
blocked for some time.

The drawback would be that with this you do not have guarantee your
atomic upgrade succeeds, because you cannot be sure you have enough
empty PEBs, because you did not reserve them.

> I create a "temporary throw-away volume" with the following command: 
> 'ubimkvol /dev/ubi0 -n 2 -N "temp" -t static -s 2MiB'
> However for this to succeed I would need to have 17 available PEBs. I 
> would only ever need those during the upgrade, so during the rest of the 
> time I could not (easily) use these PEBs.

Right. But on the other hand, consider a situation when you need to make
an upgrade, but there are no PEBs because you did not reserve them. Is
it better :-) ?

>  > But what exactly would you like to have? Would you like to have UBI
>  > volumes with no size at all - unbounded / unlimited? Or you would like
>  > to have UBI volumes with size, but larger than the amount of available
>  > PEBs?
> 
> Ultimately all volumes would be able to access all available PEBs. So 
> all UBI volumes mention the same amount of available PEBs (and not more 
> than the total amount).
> However an application might thus not assume that all data is truly 
> available. (see below)
> I do realize that UBI itself is not a filesystem, and UBIFS might have 
> other requirements and expectations of UBI. (as you mention "UBI 
> guarantees that all LEBs may be written to at the same time").

...

> This is the same as your own machine does, assuming you are using a 
> "correct" operating system ;-). In my case I have several mounted NFS 
> partitions, which actually also "lie" about their available space. But I 
> also do not trust the  of total amount of available space in the ram 
> drives (tempfs / udev etc...) as this is much more than the amount of 
> RAM in my machine.

Probably... Not sure this is possible with the existing code base, but
you could try to come up with some patches :-)

But in the world with no guarantees, you never have any guarantee that
you can write something or can upgrade something. Not sure I realize the
beauty of this approach.

>  > So your boot-loader understands UBI?
> 
> Yes, I could sent it to you (in due time) as a code snippet. The code 
> itself always needs to be tailored a bit for nice integration into a 
> bootloader.
> The UBI loader uses currently around 800 bytes (ARM9) excluding the 
> crc32 code (which contains a large table) and the nand code (which is 
> boorloader specific). This code could still made somewhat smaller if 
> your remove some things, or much smaller if you do not use "ubi volume 
> names" but "ubi volume ids" directly. But it might grow if I'll add a 
> cached scan table (I currently scan the whole MTD twice).

BTW, it would be nice if the boot-loader passed scanning info to
the kernel UBI somehow, so that we avoided double-scanning.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
