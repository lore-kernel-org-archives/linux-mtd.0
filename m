Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW10s-00072M-EB
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 11:10:51 +0000
Message-ID: <1426158625.1567.7.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH] ubifs: do not write master node if need recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sheng Yong <shengyong1@huawei.com>
Date: Thu, 12 Mar 2015 13:10:25 +0200
In-Reply-To: <1425465976-11116-1-git-send-email-shengyong1@huawei.com>
References: <1425465976-11116-1-git-send-email-shengyong1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: bengardiner@nanometrics.ca, linux-mtd@lists.infradead.org,
 hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-03-04 at 10:46 +0000, Sheng Yong wrote:
> The commits 781c571 ("UBIFS: intialize LPT earlier") and 0980119 ("UBIFS:
> fix-up free space earlier") move some initialization before marking the
> master node dirty. But the modification changes the conditions of writing
> master. 
> 
> If unclean umount happens, ubifs may fail when mounting. But trying to
> mount it will write new master nodes on the flash. This is useless but
> increasing sqnum. So check need_recovery before writing master node, and
> don't create new master node if filesystem needs recovery.
> 
> The behavour of the bug shows at:
> http://lists.infradead.org/pipermail/linux-mtd/2015-February/057712.html
> 
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>

Pushed to linux-ubifs.git/master, thank you!

Artem.
