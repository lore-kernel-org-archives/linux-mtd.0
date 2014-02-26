Received: from mx5.zte.com.cn ([63.217.80.70])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIatR-00080h-EC
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 09:35:11 +0000
Received: from mse02.zte.com.cn (unknown [10.30.3.21])
 by Websense Email Security Gateway with ESMTPS id EBD7712AC5B1
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 17:34:29 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse02.zte.com.cn with ESMTP id s1Q9YSRR057701
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 17:34:28 +0800 (GMT-8)
 (envelope-from wang.bo116@zte.com.cn)
Subject: Is UBIFS need backgroud gc?
To: linux-mtd@lists.infradead.org
Message-ID: <OFC030C4C7.8C547214-ON48257C8B.00314D67-48257C8B.00349BF7@zte.com.cn>
From: wang.bo116@zte.com.cn
Date: Wed, 26 Feb 2014 17:34:18 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: cui.yunfeng@zte.com.cn
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


	UBIFS now use ubifs_budget_space to ensure there is enough space to complete an operation.
When an operation cannot be budgeted, make_free_space -> run_gc called to make some free space.
	My questions is that why not attempt run gc in backgroud when UBIFS is in idle? Do gc
when an operation cannot be budgeted is too late, and this may block the operation for a while.
	Maybe now it is time to add backgroud gc in ubifs_bg_thread?
