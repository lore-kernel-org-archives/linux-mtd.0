Received: from sccrmhc12.attbi.com ([204.127.202.56])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8Sn-0005rR-Tv
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:28:42 +0100
Message-ID: <3EE75C78.4020408@mvista.com>
Date: Wed, 11 Jun 2003 12:44:40 -0400
From: "George G. Davis" <gdavis@mvista.com>
MIME-Version: 1.0
To: Siddharth Choudhuri <choudhri@cs.tamu.edu>
References: <Pine.GSO.4.44.0306111054540.7463-100000@unix.cs.tamu.edu>
In-Reply-To: <Pine.GSO.4.44.0306111054540.7463-100000@unix.cs.tamu.edu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 vs. ext3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Siddharth Choudhuri wrote:
> I am trying jffs2 and ext3 on a 3MB Intel NOR flash. I have a piece of
> code in function part_write (mtdpart.c) that outputs the size in bytes and pid
> of the process (current) sending write requests.
> 
> With ext3, no matter how many bytes are written (by an application/user
> level program), the part_write function always gets a request that is
> multiple of 128K (131072 bytes). This does not happen with jffs2 though.
> Also, with ext3, the process is always mtdblockd, whereas with jffs2 the
> process sending the request is the actual user/application process.
> 
> Any ideas why it happens ?

... also with ext3, you'll have a brick(TM) pretty soon too. ; )
Hint: ext3 doesn't not do flash wear levelling. You'll burn out
your flash chips pretty soon.

--
Regards,
George

> 
> thanks in advance,
> -siddharth
> 
> _____________________________________________________________________
>      Unix is user friendly - its just picky about its friends.
> _____________________________________________________________________
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
