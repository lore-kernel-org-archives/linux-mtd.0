Received: from mail.linuxfoundation.org ([140.211.169.12])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1iyI-0007C8-8J
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 21:50:59 +0000
Date: Thu, 18 Dec 2014 13:50:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: <chenjie6@huawei.com>
Subject: Re: [PATCH] [RESEND] jffs2: bugfix of summary length
Message-Id: <20141218135030.66660cb137ff34314c19449c@linux-foundation.org>
In-Reply-To: <1418900688-21760-1-git-send-email-chenjie6@huawei.com>
References: <1418900688-21760-1-git-send-email-chenjie6@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, lizefan@huawei.com,
 linux-mtd@lists.infradead.org, David.Woodhouse@intel.com,
 zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 18 Dec 2014 19:04:48 +0800 <chenjie6@huawei.com> wrote:

> From: Chen Jie <chenjie6@huawei.com>
> 
> sm->offset maybe wrong but magic maybe right, the offset 
> do not have CRC.

How does this situation arise?  Corrupted device contents?
