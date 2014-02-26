Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIdbj-0004ot-Hc
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 12:29:04 +0000
Message-ID: <1393417719.3412.158.camel@sauron.fi.intel.com>
Subject: Re: Is UBIFS need backgroud gc?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: wang.bo116@zte.com.cn
Date: Wed, 26 Feb 2014 14:28:39 +0200
In-Reply-To: <OFC030C4C7.8C547214-ON48257C8B.00314D67-48257C8B.00349BF7@zte.com.cn>
References: <OFC030C4C7.8C547214-ON48257C8B.00314D67-48257C8B.00349BF7@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, cui.yunfeng@zte.com.cn
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-02-26 at 17:34 +0800, wang.bo116@zte.com.cn wrote:
> 	UBIFS now use ubifs_budget_space to ensure there is enough space to complete an operation.
> When an operation cannot be budgeted, make_free_space -> run_gc called to make some free space.
> 	My questions is that why not attempt run gc in backgroud when UBIFS is in idle? Do gc
> when an operation cannot be budgeted is too late, and this may block the operation for a while.
> 	Maybe now it is time to add backgroud gc in ubifs_bg_thread?

May be. Someone should just experiment with this, come up with some
numbers and the solution.

-- 
Best Regards,
Artem Bityutskiy
