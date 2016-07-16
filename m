Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOEh3-0000tT-BQ
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 01:47:01 +0000
Received: by mail-pa0-x243.google.com with SMTP id hh10so6997419pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 18:46:40 -0700 (PDT)
Date: Fri, 15 Jul 2016 18:46:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Frans Klaver <fransklaver@gmail.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [patch] mtd: maps: sa1100-flash: potential NULL dereference
Message-ID: <20160716014637.GE76613@google.com>
References: <20160715110629.GB9258@mwanda> <20160716003209.GC76613@google.com>
 <20160716004825.GA10855@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160716004825.GA10855@kroah.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Jul 16, 2016 at 09:48:25AM +0900, Greg Kroah-Hartman wrote:
> On Fri, Jul 15, 2016 at 05:32:09PM -0700, Brian Norris wrote:
> > + stable
> > 
> > Hi Dan,
> > 
> > Patch looks good, but one question.
> > 
> > On Fri, Jul 15, 2016 at 02:06:30PM +0300, Dan Carpenter wrote:
> > > We check for NULL but then dereference "info->mtd" on the next line.
> > > 
> > > Fixes: 72169755cf36 ('mtd: maps: sa1100-flash: show parent device in sysfs')
> > 
> > What am I supposed to do about tags like this? It appears that the
> > -stable folks have started taking patches with a 'Fixes' tag alone [0],
> > even though that's not mentioned in [1]. I ask because I strongly
> > suspect this patch doesn't fit the rules in [1] -- it quite likely has
> > only been compile tested; and it qualifies quite well as violating
> > bullet 4:
> > 
> > """
> >  - It must fix a real bug that bothers people (not a, "This could be a
> >    problem..." type thing).
> > """
> > 
> > So, I'd like to keep the tag, but I'd like to avoid having to NAK it in
> > the stable review process. (And really, I often don't care enough to
> > even do that. I believe there's a very low chance that something like
> > this would cause additional problems more than the original bug.)
> 
> Only sometimes will I pick up something that only has a fixes: tag in
> it, not all the time, I try to review the patch to see if it does match
> the rules or not.

OK, good to know. I've seen other -stable maintainers do similarly, but
I don't know what their process is.

> But, fixing an oops is a good thing, I'm sure you can figure out how to
> trigger it otherwise you would not be taking such a patch as it would be
> not be needed :)

Of course. But it's still not always clear whether such fixes will
trigger other errors in poorly-tested error paths. Is (for instance) an
oops that we know about better than a use-after-free that we don't know
about?

Anyway, applied to l2-mtd.git.

Regards,
Brian
