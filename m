Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17twCd-0001jP-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 21:22:39 +0100
Date: Tue, 24 Sep 2002 13:22:37 -0700
From: Marc Singer <elf@buici.com>
To: Russ Dill <Russ.Dill@asu.edu>
Cc: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>,
  mtd <linux-mtd@lists.infradead.org>
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
Message-ID: <20020924202237.GA3537@buici.com>
References: <20020924034410.GA18915@buici.com> <20020924040150.A1499145FF@dragon.actrix.co.nz> <20020924044434.GA23917@buici.com> <1032854017.13283.3.camel@russ> <20020924165351.GA2533@buici.com> <1032886743.13283.6.camel@russ> <20020924171419.GA2733@buici.com> <1032889498.1600.22.camel@spawn> <20020924183704.GB3074@buici.com> <1032893263.21552.15.camel@timmy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1032893263.21552.15.camel@timmy>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, Sep 24, 2002 at 11:47:43AM -0700, Russ Dill wrote:
> 
> > > cramfs is a read only filesystem not an archive format like zip or tar
> > > so you do not have to copy the data into another filesystem to use it.
> > > You use cramfs instead of initrd+filesystem.
> > 
> > That isn't really the issue here.  We're talking about using gzip'd
> > ext2 versus cramfs to do initrd.  The thing is that in my tests,
> > cramfs images are larger than compressed ext2 images.  Not what I
> > would expect.
> 
> if you are talking about an initrd, then the features of cramfs aren't
> quite as usefull, as the whole thing will be loaded into ram anyway. On
> the other side:

I see.  That is where my understanding comes from.  Now it makes sense.

> A cramfs will always be exactly as small as it needs to be, no guessing
> on an image size. cramfs is created by population, not by making an
> image, formatting it, mounting it loopback, and then copying files.

Indeed.  It can be inconvenient knowing how big to make the loopback
file.

> incedentally, I have a copy of mkcramfs with device table support (as
> seen in mkfs.jffs2) as well as permission squashing, so that a cramfs
> image can be made withoutt root (complete with suid root programs, and
> /dev entries)

I'd appreciate a copy of your mkcramfs changes.

Thanks.
