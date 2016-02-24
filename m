Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYe2v-0001rL-6E
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 18:20:21 +0000
Received: by mail-pa0-x229.google.com with SMTP id fl4so16795157pad.0
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2016 10:20:00 -0800 (PST)
Date: Wed, 24 Feb 2016 10:19:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: onenand: fix deadlock in onenand_block_markbad
Message-ID: <20160224181957.GI21465@google.com>
References: <1456000068-8862-1-git-send-email-aaro.koskinen@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456000068-8862-1-git-send-email-aaro.koskinen@iki.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 20, 2016 at 10:27:48PM +0200, Aaro Koskinen wrote:
> Commit 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")
> incorrectly changed onenand_block_markbad() to call mtd_block_markbad
> instead of onenand_chip's block_markbad function. As a result the function
> will now recurse and deadlock. Fix by reverting the change.
> 
> Fixes: 5942ddbc500d ("mtd: introduce mtd_block_markbad interface")

Good to know onenand has been getting tested sometime in the last 5
year! /s

> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
> 
> 	v2: Don't ignore the return value.
> 
> 	v1: http://lists.infradead.org/pipermail/linux-mtd/2016-February/065582.html

Marked for -stable and pushed to l2-mtd.git.

Thanks,
Brian
