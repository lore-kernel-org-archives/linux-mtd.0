Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJmj9-0007Gh-6m
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 17:29:59 +0000
Message-ID: <1423243771.8637.581.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] ubifs: do not write master node if recovery needed
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sheng Yong <shengyong1@huawei.com>
Date: Fri, 06 Feb 2015 19:29:31 +0200
In-Reply-To: <1423130080-79705-2-git-send-email-shengyong1@huawei.com>
References: <1423130080-79705-1-git-send-email-shengyong1@huawei.com>
 <1423130080-79705-2-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-02-05 at 09:54 +0000, Sheng Yong wrote:
> If unclean umount happens, ubifs may fail when mounting. Trying to mount
> it will write new master nodes on the flash. This is useless but wasting
> space and increasing sqnum. So check need_recovery before writing master
> node, and don't create new master node if filesystem needs recovery.

Looks like you caught a bug, thanks, but I need to check the code a bit
more carefully. So when will the master not be updated then, if you do
not mark it dirty now?

Artem.
