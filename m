Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EghJ9-0001fe-6S
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 06:36:38 -0500
Message-ID: <438AEB9B.7010504@yandex.ru>
Date: Mon, 28 Nov 2005 14:35:55 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "zhao, forrest" <forrest.zhao@intel.com>
References: <1133169095.3156.98.camel@localhost.localdomain>
In-Reply-To: <1133169095.3156.98.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Basic problems and possible solutions for GC in JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao, forrest wrote:
> Basic problem:
> Whatever the GC policy is adopted in JFFS3, the goal is
> the same: achieve the good reclamation efficiency while
> try to keep wear-leveling delta within a reasonable value.
Agreed.

> To achieve the good reclamation efficiency, the accounting
> information of each erase block(which record which pages
> within the erase block are obsolete, which are valid) need
> to be stored in sorted order, the sort key is (the number
> of obsolete pages). This way GC can select erase block
> with largest key value to do efficient reclamation.
> To keep wear-leveling delta within a reasonable value,
> the erase count of each erase block need to be stored in
> sorted order, the sort key is erase count. This way GC can
> select the erase block with least erase count to do WL.
Are you sure we must keep this sorted? Can we implement an algorithm 
when we keep this sorted byt the eraseblock number and do partial search 
in a small group? Sure, this means we don't choos the best every time, 
but maintaining this information on flash becomes easier.

> Possible solutions:
> 1 stored in RAM
> For this approach, accounting information and erase count
> are stored in normal files on flash without order. During
> system initialization(or mount), they are read into RAM and
> the indexing tree is built. And the whole indexing tress is
> in RAM.
> After a write or an erase operation, the indexing tree
> in RAM is updated to reflect the change, also accounting
> information and erase count on flash is updated.
> The disadvantage of this approach is: the RAM consumption
> is O(N), N is the number of erase blocks on flash, the time
> spent on building indexing tree in RAM is also O(N).
> The advantage of this approach is: it's fast since all the
> operations related with sort are accomplished in RAM.
This is the worst solution which I'd like to avoid.

> 2 stored in flash
> For this approach, accounting information and erase count
> are stored in normal file on flash. Also the indexing tree
> is in flash. After a write or an erase operation, the file
> for storing accounting information and erase count is
> updated, also the indexing tree in flash is updated to
> reflect the order change.
> In particular, for accounting information, an indexing tree
> is built in flash, the key is (the number of obsolete page), 
> the leaf node is erase block number. Those who
> only have valid pages are not indexed by this indexing tree.
> Those who are in clean state(just be erased and haven't 
> been written) have key value 0.So if the tree is sorted 
> by ascending order,by walking down the leftest branch, we
> can find free blocks; by walking down the rightest branch,
> we can find the dirtiest block.
> The similar idea applies to erase count tracking.
> The advantage of this approach is: it's O(1).
> Its disadvantage is: by storing indexing tree in flash,
> it'll involve more update operations on flash.

I thought about storing the accounting/WL information in a file. But for 
effeciency reasons, this file should not be a part of the tree. It ought 
to be stored in a distinct data structures and distinct eraseblocks/ 
This may be one more dedicated mini acounting-tree or we may use ext3 
technique with direct/indirect blocks here. To provide atomicity, the 
accounting-tree and the tree will have one root (SB for example).

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
