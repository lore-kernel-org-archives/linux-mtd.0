Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4g7s-0003Ci-0n
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 00:52:48 +0000
Message-ID: <53BC9221.1030708@huawei.com>
Date: Wed, 9 Jul 2014 08:51:45 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: ubifs error at boot "bad node type"
References: <53BBC39F.7010307@gmail.com>
In-Reply-To: <53BBC39F.7010307@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> # ls -l /mnt/rfs/
> [   87.054687] UBIFS error (pid 652): ubifs_read_node: bad node type (255 but expected 0)
> [   87.062500] UBIFS error (pid 652): ubifs_read_node: bad node at LEB 405:39728, LEB mapping status 1
> [   87.070312] Not a node, first 24 bytes:
> [   87.078125] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................

Seems LEB 405 is empty? This is not the first time I saw
an error like this.

Is this happen after an unclean umount like power cut?

Artem, do you have any ideas?
