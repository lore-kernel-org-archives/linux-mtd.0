Received: from [199.221.73.29] (helo=marconi-gfw.marconicommerce.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vhXM-0002jS-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 16:30:33 +0100
Message-ID: <A3E34B558F5CD211B4980008C7A4A99003163EC8@sparrow.eng.gilbarco.com>
From: "Williams, Kevin M." <kevin.m.williams@marconi.com>
To: linux-mtd@lists.infradead.org
Subject: erase and 2.4.4 kernel
Date: Fri, 4 May 2001 11:30:06 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I upgraded my kernel from 2.4.3-pre3 to the 2.4.4 release.  I also copied
over the mtd snapshot from 25 April.  Now when I try the erase command, I
get:

bash#> /sbin/erase /dev/mtd2 0 6
MTD_open
Erase Total 6 Units
MTD_ioctl
Invalid ioctl 80044d07 (MEMGETINFO = 40204d01)
MTD_close

This was working fine when I load my 2.4.3 kernel with the 4 April mtd
snapshot patched in.  

Any advice?

Kevin




-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Thursday, May 03, 2001 5:55 PM
To: Jeff Smith
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Problem 




jsmith@vhbtech.com said:
>  I'm running jffs2 on a PPC/855T board. I mount the jffs2 and have two
> (2) test scripts that "dd" various sized files to the jffs2 flash. I
> seem to be running into a race condition or something.

> My 2 scripts just "dd" a bunch of files to the jffs2/flash, "ls -l "
> them, "rm *" them and then "ls -l" the dir/mnt point again in a loop.
> I'm running 2 of these and they always reach contention fairly
> quickly, ie. they lock up after 5 to 10 iterations. ps shows the
> processes sleeping. If I remove the "ls"portion of the scripts. That
> is I just "dd" and "rm" - everything "seems" ok.Anybody seen this? 

Sorry for the delayed response.

I've seen similar, and I thought I'd fixed it. You may have found a code 
path which I hadn't considered, and which still has locking problems. Or 
you may just be using the code from before I fixed it :)

What's the output of 'grep Id: fs/jffs2/*.[ch]'?

If it's still happening with the latest code, can you make sure you have 
SysRq enabled in your kernel and show me the backtraces of the offending 
processes? (SysRq-T and ksymoops for decoding)

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
