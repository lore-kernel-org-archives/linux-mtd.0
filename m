Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JV9AL-0006HD-2w
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 17:37:02 +0000
Message-ID: <47C84111.6030103@gmx.net>
Date: Fri, 29 Feb 2008 19:29:53 +0200
From: Dimitrios Apostolou <jimis@gmx.net>
MIME-Version: 1.0
To: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: swap file over jffs2 partition
References: <47C772E9.2000000@gmx.net> <20080229084345.GA16507@lazybastard.org>
In-Reply-To: <20080229084345.GA16507@lazybastard.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> On Fri, 29 February 2008 04:50:17 +0200, Dimitrios Apostolou wrote:
>> I intend to build a diskless linux system (root over NFS). Because it
>> has 1GB of embedded flash storage, I'm thinking of using this as swap 
>> (I've been bitten many times by the problems linux has with *no* 
>> swap...). And to avoid wearing out the flash storage too fast, I 'm 
>> thinking to format the 1GB partition as JFFS2, and create the swapfile 
>> on top of it.
>>
>> I'm not so experienced with JFFS and I don't know if it's too heavy for
>> the CPU, for swapping. Or if there are other issues I 'll face. What do
>> you think about it? Any other ways you 'd propose?
>>
>> Sorry for sending this at LKML but jffs-dev mailing list seems to be 
>> off. And JFFS is the only in-kernel filesystem that does wear-leveling, 
>> right?
> 
> Replying in reverse order...
> 
> The relevant mailing list is linux-mtd, added to Cc:.  JFFS and JFFS2
> are two different things, JFFS is older and was removed from the kernel
> not too long ago.

Thanks and sorry for intruding LKML. It seems that even wikipedia has 
wrong address for the mailing list, see the last link of the article:

http://en.wikipedia.org/wiki/JFFS2

> 
> The real fun comes not from CPU usage, but from interactions with the
> memory management subsystem.  In a nutshell, JFFS2 may require memory in
> order to write data.  When the system is under memory pressure, it needs
> JFFS2 to write out pages, which will try to allocate memory.  It is
> theoretically possible to deadlock the system in this way.

Interesting. I guess nobody has experimented with it yet so I'll try. 
Unfortunately it seems I'll face another problem, that JFFS2 doesn't 
support having a swap-file at all. Why would this happen? More info:

http://dev.laptop.org/ticket/6469

> 
> On the plus side, the write path of JFFS2 is relatively simple and
> extremely low-latency.  It shouldn't be too hard to review the code and
> handle all problem cases wrt. memory allocations.
> 
> One issue that is hard to solve is space reservation.  JFFS2 compresses
> data and allows users to write as long as there is space remaining.  It
> is possible to swap out data that compresses well, have some other
> process fill up the filesystem, then try to swap out data that
> compresses badly and get -ENOSPC in return.  As a system administrator
> you can prevent others from ever writing to JFFS2 - and you better do!

Of course! I intend to use all the 1GB of flash only for swap, the 
system will be practically diskless. And I don't think enabling 
compression for such a task would be wise.

> 
> Jörn
> 

Thanks for the help,
Dimitris
