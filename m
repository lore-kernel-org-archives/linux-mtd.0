Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X2rb-0002zl-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 14:08:59 +0000
Message-ID: <38D62CE9.43CC3019@nexus-tech.net>
Date: Mon, 20 Mar 2000 08:51:37 -0500
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
To: Oron Ogdan <Orono@m-sys.com>
CC: David Woodhouse <dwmw2@infradead.org>, Dvir Oren <dvir@lucidvon.com>,
        MTD <mtd@infradead.org>
Subject: Re: Questions about MTD
References: <B17893052A17D211A9860060978F7E63014A052F@mail.msys.co.il>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



Oron Ogdan wrote:
> 
> David W wrote :
> > Isn't docpmap /e supposed to reformat it with NFTL again
> > after doing that?
> >
> No it's just erasing the whole of the flash, Destroying the bad block
> table and all, This command is really low level command that should be
> executed with care. You have to save the bad block table somehow.
> 

I've seen reference to "saving the bad block table" in a couple of
places now. It seems that the file system should be able to dynamically
create/maintain the bad block table. Is this not true?

Just wondering... Kyle.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
