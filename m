Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKXBY-0003iy-VF
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 03:16:35 -0400
Message-ID: <41776231.3060803@yandex.ru>
Date: Thu, 21 Oct 2004 11:16:01 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu> <41775737.9080203@yandex.ru>
	<41775D17.9050508@inf.u-szeged.hu>
In-Reply-To: <41775D17.9050508@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> You are right, there is a small change which is really important (and 
> will be ready very soon) to extend jffs2_mark_node_obsolete() to mark 
> not only the node but also its entry in the summary.
Unfortunately, you can not mark entries as obsoleted in your summary 
node in case of NAND.

If you write your summary only for *full* blocks, you will not need to 
mark entries obsoleted, even if you have NOR flash (but you can on NOR). 
The partially filled blocks must not have the summary node (you can 
introduce special marker and write it to OOB of the last page of 
NAND/last word of sector on NOR which tells if there is the summary node 
present).

So, fully filled block will have summary and will be scanned very 
quickly, partially filled ones will have no summary and will be fully 
scanned, free blocks will have cleanmarkers and will not be scanned, 
other blocks will be either erased or considered free.

> 
> Any other improvement can be done later, because after it the filesystem 
> will be always coherent, because we write summary only at the of the 
> erasy blocks, when it is fully "finished" - so if there is a summary 
> somewhere we will not need to extend it, only to mark the obscolated nodes.
Yes, nice, but why do you need to mark obsoleted nodes in summary ??? 
When you insert node to the fragtree or dirents to the list, JFFS2 code 
will detect obsoleted nodes automatically, no need to mark them physically.

> 
> We also plan in the near future to implement the ability of generating 
> summary dinamically when the filesystem finishes an erase block - which 
> keep this "fast mount time" permament.
This would be perfect.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
