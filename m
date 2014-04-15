Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wa3Sh-00036i-BS
 for linux-mtd@lists.infradead.org; Tue, 15 Apr 2014 13:31:43 +0000
Message-ID: <1397568673.4441.10.camel@karhu>
Subject: Re: [PATCH] ubifs: atomically set inode->i_flags in
 ubifs_set_inode_flags()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Zhang Zhen <zhenzhang.zhang@huawei.com>
Date: Tue, 15 Apr 2014 16:31:13 +0300
In-Reply-To: <534CCE74.9090306@huawei.com>
References: <1397465159-45836-1-git-send-email-zhenzhang.zhang@huawei.com>
 <534CCE74.9090306@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-04-15 at 14:15 +0800, Zhang Zhen wrote:
> Use set_mask_bits() to atomically set i_flags instead of clearing out the
> S_IMMUTABLE, S_APPEND, etc. flags and then setting them from the
> UBIFS_IMMUTABLE, UBIFS_APPEND_FL, etc. flags, since this opens up a race
> where an immutable file has the immutable flag cleared for a brief
> window of time.
> 
> Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>

Looks correct to me. Does it fix a real-life bug or just a hypothetical
issue? Also, did you test it?

-- 
Best Regards,
Artem Bityutskiy
