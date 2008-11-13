Date: Thu, 13 Nov 2008 13:21:52 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH][nandsim]Fix RAM wasting via kmalloc (take 2)
In-Reply-To: <1226581562.16925.44.camel@sauron>
Message-ID: <alpine.LFD.2.00.0811131314190.31593@casper.infradead.org>
References: <alpine.LFD.1.10.0810291313140.30280@casper.infradead.org>
	<1226581562.16925.44.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> Would you please send a version which checks return pointer of
> kmem_cache_alloc() for NULL?
> 
I think it is  unnecessary to add one more check of return pointer for NULL
after kmem_cache_alloc() function.

PLease take a look at these lines of the patch:
----
-		mypage->byte = kmalloc(ns->geom.pgszoob, GFP_NOFS);
+		mypage->byte = kmem_cache_alloc(ns->nand_pages_slab, GFP_NOFS);
 		if (mypage->byte == NULL) {
 			NS_ERR("prog_page: error allocating memory for page %d\n", ns->regs.row);
 			return -1;
----
If I properly understand the code it already performs checking just after attempt of allocation. 
So this patch version should be correct.

Thanks,
Alexey
