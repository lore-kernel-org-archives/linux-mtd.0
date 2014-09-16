Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTuSP-0005bj-7P
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:14:18 +0000
Message-ID: <1410880416.28850.47.camel@sauron.fi.intel.com>
Subject: Re: mtd-utils-1.5.1 bug report
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: David Binderman <dcb314@hotmail.com>
Date: Tue, 16 Sep 2014 18:13:36 +0300
In-Reply-To: <1410178188.10764.159.camel@sauron.fi.intel.com>
References: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
 <1410178188.10764.159.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-09-08 at 15:09 +0300, Artem Bityutskiy wrote:
> On Sun, 2014-09-07 at 14:58 +0000, David Binderman wrote:
> > Hello there,
> > 
> > ubi-utils/ubiformat.c:636:28: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
> > 
> >                 if (!args.subpage_size != mtd->min_io_size)
> >                     normsg("may be sub-page size is "
> >                            "incorrect?");
> 
> Hi,
> 
> I'd propose this patch to fix the issue:
> 
> Subject: [PATCH] ubiformat: fix the subpage size hint on the error path

I've just pushed this patch to mtd-utils.git. I did not test it, but
hopefully it is trivial enough and not so risky since it changes the
error path.

-- 
Best Regards,
Artem Bityutskiy
