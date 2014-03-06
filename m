Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLU4o-0007rW-26
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 08:54:50 +0000
Received: by mail-pd0-f173.google.com with SMTP id z10so2271088pdj.32
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 00:54:28 -0800 (PST)
Date: Thu, 6 Mar 2014 00:54:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 3/4] mtd: block2mtd: check device size
Message-ID: <20140306085422.GY13420@norris-Latitude-E6410>
References: <20140123205331.03314c6f82f24a6bb4b8ef53@skynet.be>
 <20140129100424.GA15271@localhost>
 <20140129205105.b88b00ea09c07de7014ab1d9@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140129205105.b88b00ea09c07de7014ab1d9@skynet.be>
Cc: rdunlap@infradead.org, joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Jan 29, 2014 at 08:51:05PM +0800, Fabian Frederick wrote:
> On Wed, 29 Jan 2014 07:04:25 -0300 Ezequiel Garcia <ezequiel.garcia@free-electrons.com> wrote:
> > I saw you sent a v2 for one of the patches on this series,
> > but maybe this is worth considering too.
> > 
> > On Thu, Jan 23, 2014 at 08:53:31PM +0100, Fabian Frederick wrote:
> > [..]
> > > -/* FIXME: ensure that mtd->size % erase_size == 0 */
> > >  static struct block2mtd_dev *add_device(char *devname, int erase_size)
> > >  {
> > >  	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> > > @@ -250,6 +249,11 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
> > >  		goto devinit_err1;
> > >  	}
> > >  
> > > +	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> > > +		pr_err("erasesize muse be a divisor of device size\n");
> > > +		goto devinit_err1;
> > > +	}
> > > +
> > 
> > Brian: What do you think?
> > 
> > Fabian: Have you tested this patch? Can you elaborate a bit more about
> > the effect it would have, compared to the current behavior?
> 
> Hi Ezequiel,
> 
>    This patch was tested with the following commands :
>    
> rmmod block2mtd;modprobe block2mtd block2mtd=/dev/loop0,<erasesize>;dmesg
> 
> with both correct and incorrect values.It tries to address the fixme 
> comment above the function.
> (/* FIXME: ensure that mtd->size % erase_size == 0 */) 
>    
>    From what I understand, global size must be a multiple of 
> erase_size when it comes to any MTD I/O operations. If Brian finds this one 
> interesting I can repost it with current error names against l2-mtd.git/next

I'm not sure block2mtd would have many users, but the hunk above looks
reasonable. Feel free to send a patch.

>    AFAICS, current behavior let any value work...

I bet this doesn't work out too well in the end. Maybe I'll give this a
whirl just to see.

>  PS : This would need further testing (eg boot command).

Brian
