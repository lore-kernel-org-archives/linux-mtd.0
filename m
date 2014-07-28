Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBndV-0003np-Af
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 16:18:53 +0000
Message-ID: <1406564281.23376.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] UBIFS: add a log overlap assertion
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Mon, 28 Jul 2014 19:18:01 +0300
In-Reply-To: <53CDBFDB.6080300@huawei.com>
References: <1405514528-14649-1-git-send-email-dedekind1@gmail.com>
 <1405514528-14649-2-git-send-email-dedekind1@gmail.com>
 <53CDBFDB.6080300@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-22 at 09:35 +0800, hujianyang wrote:
> I have to tell you this patch seems wrong. I've tested this patch
> and saw lots of 'assert_failed()'. We use ubifs_next_log_lnum()
> as an iterator to scan the hole log area and the return value of
> this function may equal to c->ltail_lnum.

OK, thanks. I've reverted my bogus patch.

Would you please re-send your patch with proper commit message, etc, so
that I could 'git am' it. This time I'd like to apply a patch which has
been tested. Thanks!

-- 
Best Regards,
Artem Bityutskiy
