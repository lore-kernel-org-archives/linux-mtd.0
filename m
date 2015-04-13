Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhbmJ-0003Av-28
 for linux-mtd@lists.infradead.org; Mon, 13 Apr 2015 10:39:43 +0000
Message-ID: <1428921555.4291.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: fix output format of INUM_WATERMARK
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sheng Yong <shengyong1@huawei.com>
Date: Mon, 13 Apr 2015 13:39:15 +0300
In-Reply-To: <1428030822-51540-1-git-send-email-shengyong1@huawei.com>
References: <1428030822-51540-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-04-03 at 03:13 +0000, Sheng Yong wrote:
> The INUM_WATERMARK is a unsigned 32bit value, `%d' prints it as negatave:
> [  103.682255] UBIFS warning (ubi0:0 pid 691): ubifs_new_inode: running out of inode numbers (current 122763, max -256)
> 
> Fix it as:
> [  154.422940] UBIFS warning (ubi0:0 pid 688): ubifs_new_inode: running out of inode numbers (current 122765, max 4294967040)
> 
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>

Picked this one. It fixes one of your previous patches, and it is
trivial, so I put it straight to linux-next.
