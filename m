Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL5r4-0004Nn-HY
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 08:07:35 +0000
Message-ID: <1423555627.2573.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V3] UBIFS: return -EINVAL if log head is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 10 Feb 2015 10:07:07 +0200
In-Reply-To: <54D97AF9.8040407@huawei.com>
References: <54D97AF9.8040407@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-02-10 at 11:28 +0800, hujianyang wrote:
> CS node is recognized as a sign in UBIFS log replay mechanism.
> Log relaying during mount should find the CS node in log head
> at beginning and then replay the following uncommitted buds.
> 
> Here is a bug in log replay path: If the log head, which is
> indicated by @log_lnum in mst_node, is empty, current UBIFS
> replay nothing and directly mount the partition without any
> warning. This action will put filesystem in an abnormal state,
> e.g. space management in LPT area is incorrect to the real
> space usage in main area.
> 
> We reproduced this bug by fault injection: turn log head leb
> into all 0xFF. UBIFS driver mount the polluted partition
> normally. But errors occur while running fs_stress on this
> mount:
> 
> [89068.055183] UBI error: ubi_io_read: error -74 (ECC error) while reading 59 bytes from PEB 711:33088, read 59 bytes
> [89068.179877] UBIFS error (pid 10517): ubifs_check_node: bad magic 0x101031, expected 0x6101831
> [89068.179882] UBIFS error (pid 10517): ubifs_check_node: bad node at LEB 591:28992
> [89068.179891] Not a node, first 24 bytes:
> [89068.179892] 00000000: 31 10 10 00 37 84 64 04 10 04 00 00 00 00 00 00 20 00 00 00 02 01 00 00                          1...7.d......... .......
> [89068.180282] UBIFS error (pid 10517): ubifs_read_node: expected node type 2
> 
> This patch fix the problem by checking *lnum* to guarantee
> the empty leb is not log head leb and return an error if the
> log head leb is incorrectly empty. After this, we could catch
> *log head empty* error in place.

Pushed to linux-ubifs.git, thank you!

Artem.
