Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoA7-0002pK-JC
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:16:55 -0400
Message-ID: <4337AE41.3040807@yandex.ru>
Date: Mon, 26 Sep 2005 12:16:01 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
References: <4337A604.6050204@cetrtapot.si>
In-Reply-To: <4337A604.6050204@cetrtapot.si>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: fragtree method?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Hinko,

hinko.kocevar@cetrtapot.si wrote:
> Hello all,
> 
> We are using JFFS2 fs on toshiba NAND flash. There are several 
> partitions defined, but scan time at boot time gets longer every day of 
> usage. Eg.  when flash is empty it takes ~10 s to mount 20Mb of flash in 
> 3 partitions later when there are some files present it takes > 30s and 
> increasing.
The picture you are observing is normal for JFFS2. The more data is in 
your flash, the longer is JFFS2 being mounted. I would shortly explain 
this as follows.

There is no indexing information stored on the flash media. Each JFFS2 
node contains full information about itself, but there is no central 
index. The index is the crucial part of any file system as it is used to 
quickly locate any piece of information (i.e., find all the files kept 
in a directory, find the physical flash address where the files data is 
stored, etc.). In JFFS2, the index is maintained in RAM and takes 
significant amount of it. Roughly speaking, there is a in-RAM data 
structure for each on-flash node.

The in RAM index must be built on each mount. For this reason, JFFS2 
must scan the flash media. And it is logically then the more data you 
have on flash, the longer is JFFS2 mount time and memory consumption. 
Namely, the above 2 characteristics linearly depend on the flash size 
(O(N), N - flash size).

You may also glance at 
http://www.linux-mtd.infradead.org/tech/JFFS3design.pdf for some 
additional info.

So, what you see is the JFFS2's feature. One way to relax that bad 
property is to use the latest JFFS2 with EBS enabled. You'll mount much 
faster. But it is worth noting that this does not radically change the 
situation with JFFS2 as it still stays linearly scalable (O(N)).

> We have April MTD branch and are currently going for newer version. We 
> would also like to know if fragtree method posted by Artem in July [1] 
> would be wise to add. If anyone has some experience with it, please, 
> post it.
It is already in the CVS. And yes, it reduces the backgroung CPU load 
(the checking process) considerably.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
