Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EfcEC-0004O2-Nw
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 06:59:04 -0500
Message-ID: <4386FC5F.9050305@yandex.ru>
Date: Fri, 25 Nov 2005 14:58:23 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Zhao, Forrest" <forrest.zhao@intel.com>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>
In-Reply-To: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Zhao,

> I have been thinking the GC in JFFS3 during these days. But I can't
> think out a perfect answer for it. So I want to have some discussion 
> with you.
Yeah, we still cannot invent something perfect.

> I think the basic problem is: we need to keep track of both erase
> blocks usage(which pages on block are obsolete) and erase blocks
> with small erase count in order to achieve the reclamation
> efficiency and wear-leveling in GC.
Imagine that this is not needed so far or that we keep this information 
in RAM. Does it help in inventing GC algorithm?

> If we store the erase block usage information in a file on flash,
> we need to sort it in RAM in order to find the dirtiest one.
> Then this sort operation is O(N), N is the number of erase blocks.
> Also the memory consumed by this sorted data structure is O(N).
We may devide this file on constant-size chunks, and search only one 
chunk at a time. And we may have a list of 10 most worn out eraseblocks 
and keep it in the superblock. So the scalability will be O(1) IMO.


> Whether erase count is stored in erase block header or in a file on
> flash, we need to sort it in RAM in order to find the one with least
> erase count for WL. Also this sort operation is O(N), N is the number
> of erase blocks. Also the memory consumed by this sorted data
> structure is O(N).
Similar is applicable here I think.

For erase count we may maintain a separate 'file', which is not part of 
the tree. Data of this file is put to distinct separate eraseblocks. The 
file is refered from SB.

> I used to think that we could put the sorted data structure on flash,
> but this will incur enormous update operations.
Enormous? This needs measuring and evaluating. Let's create a user-level 
prototype and see.

>  Seems there's no a perfect solution for it. What's your idea
>  about this?
Something like described above. Let's at least invent GC algorithm 
without thinking about wear-levelling/accounting so far. I believe this 
may be added independently afterwards.

> BTW. I read some news that Samsung planned to use NAND of large
> Volume (8G, 16G) to replace harddisk. But I think the out-of-place
> update and limited erase times nature of flash memory makes this
> replacement impossible(at least in new future).
Why? FTL-like stuff will work, just add more RAM.

> Although flash has
> a faster RW speed than HD, I don't think the real writing operation
> (running a file system) on flash will have a better performance than
> the one on HD since an update operation on HD will incur multiple
> update operations on flash.
May be. Tests are needed.

> I think the FS write performance on
> flash and FS scalability contradicts with each other. 
I still believe - not.

> What's your opinion about the NAND replacing HD?
Well, flash consume less energy, it is more compact, it may operate in 
environments with high vibration, so there are applications where flash 
beat HDD.

I dare not to argue about NAND vs HDD in general, this requires too much 
efforts to make an analysis.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
