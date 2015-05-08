Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqVzY-00040M-O8
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 00:18:13 +0000
Received: by pdbnk13 with SMTP id nk13so55181931pdb.0
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2015 17:17:50 -0700 (PDT)
Date: Thu, 7 May 2015 17:17:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing
 mtd->usecount
Message-ID: <20150508001745.GW32500@ld-irv-0074>
References: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
 <20150508001012.GV32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150508001012.GV32500@ld-irv-0074>
Cc: lorenzo.restelli.ext@nokia.com, zhangxingcai <zhangxingcai@huawei.com>,
 stable@vger.kernel.org, fengfuqiu@huawei.com, alexander.sverdlin@nokia.com,
 tanhaijun@huawei.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 07, 2015 at 05:10:12PM -0700, Brian Norris wrote:
> On Tue, Apr 21, 2015 at 12:20:22PM +0200, Giuseppe Cantavenera wrote:
> > @@ -484,7 +486,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
> >  	if (old->open) {
> >  		if (old->tr->release)
> >  			old->tr->release(old);
> > -		__put_mtd_device(old->mtd);
> > +		put_mtd_device(old->mtd);
> 
> This looks wrong. See:
[...]
> deregister_mtd_blktrans()
> |_ mutex_lock(&mtd_table_mutex)
> |_ tr->remove_dev() -> inftl_remove_dev()
>    |_ del_mtd_blktrans_dev()
>       |_ put_mtd_device()
>          |_ mutex_lock(&mtd_table_mutex) <--- AA deadlock

What's more, this code in del_mtd_blktrans_dev() makes it obvious that
this hunk is wrong:

int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
{
        unsigned long flags;

        if (mutex_trylock(&mtd_table_mutex)) {
                mutex_unlock(&mtd_table_mutex);
                BUG();
        }
	...

So rather than a comment, the code is showing that it's a BUG() to not
be holding mtd_table_mutex already.

Brian
