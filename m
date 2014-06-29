Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1FsE-00064U-Kf
 for linux-mtd@lists.infradead.org; Sun, 29 Jun 2014 14:14:31 +0000
Message-ID: <1404051245.3954.40.camel@sauron.fi.intel.com>
Subject: Re: ubifs: replay log error
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Sun, 29 Jun 2014 17:14:05 +0300
In-Reply-To: <1404049196.3954.35.camel@sauron.fi.intel.com>
References: <5396CCA8.7060303@huawei.com> <53A2A615.7070607@huawei.com>
 <1404049196.3954.35.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Sun, 2014-06-29 at 16:39 +0300, Artem Bityutskiy wrote:
> On Thu, 2014-06-19 at 16:57 +0800, hujianyang wrote:
> > I found there might be a race in do_commit(). If we perform
> > ubifs_log_end_commit() before write master node, another
> > process which run ubifs_add_bud_to_log() may destroy the
> > old cs_node in the next or latter leb. Because log_end_commit()
> > will change @c->ltail_lnum by new @ltail_lnum. If power off
> > happens before we write either master node, we will read the
> > old master nodes and find no cs node exist in the leb which
> > master node indicate in the next mount.
> > 
> > Am I right?
> 
> Frankly, I did not fully understand your explanation, but after spending
> some time looking at the code and trying to recall what is going on
> there, I see the race condition.
> 
> Excellent analysis, well done, thank you!
> 
> > Now I would like to show the undone patch.
> 
> Not sure this patch is the best way to fix the issue.
> 
> How about the following patch (also attached), which I did not test, and
> did not even compile-check.

Scratch that, let me re-send patches which compile.

-- 
Best Regards,
Artem Bityutskiy
