Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQgvx-0002RU-T6
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:30:50 -0400
Date: Tue, 4 Apr 2006 10:30:20 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <20060404083019.GA9747@wohnheim.fh-wedel.de>
References: <20060329232520.1677d2b3.akpm@osdl.org>
	<442C0494.2040609@zytor.com>
	<20060330114014.53150d1b.akpm@osdl.org>
	<442C6B78.3060706@zytor.com> <m3hd5anj51.fsf@maxwell.lnxi.com>
	<4431E304.6020908@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4431E304.6020908@zytor.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	"Eric W. Biederman" <ebiederman@lnxi.com>
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 April 2006 20:07:48 -0700, H. Peter Anvin wrote:
> Eric W. Biederman wrote:
> 
> I thought (am I wrong?) that blkmtd referred to using a block device as 
> an MTD device.  Either which way, Jörn tells me that blkmtd is 
> deprecated by block2mtd anyway, and only retained for boot support, 
> which is pretty easy to do in klibc.

You are not wrong.

A possibly better way to deliver the same functionality (jffs2 rootfs
on block device through emulation) might be to add transparent
translation support to jffs2.  Something that will make "mount
/dev/hda1 /mnt -t jffs2" work.  How exactly the code for this should
look, I don't know yet.  But given that jffs2 is the only sane user of
bd->mtd translation, it looks like the Right Thing to me.

> >So I suggest what happens is that we deprecate blkmtd in 
> >Documentation/FeatureRemoval
> >of 2.6.17 and delete it in the -mm tree.
> >
> >Then you can merge klibc.
> >
> >Does any one have a problem with that plan?
> 
> That certainly works for me.  Jörn indicated he's going to sign off on a 
> patch to remove blkmtd, which will solve my problem.

Once the coffee kicks in, yes.  Good morning everyone.

Ordinarily, we should go through the usual 1 year deprecation period
for blkmtd.  But in this case I find it justified to pull the support
immediatly:
o An alternative exists that hasn't had  bug report for > 1 year.
o Most embedded people tend to use ancient kernels with custom patches
  from mtd cvs and elsewhere, so the 1 year warning period neither
  helps nor hurts them too much.
o It's in the way of klibc.  The problems caused by pulling blkmtd
  support are fairly low, while the problems caused by delaying klibc
  can be fairly substantial.  At best, this would be a severe burden
  on hpa's time.

That said, deprecating the driver in -linus and removing it in -mm
until klibc is merged to -linus sounds like a good idea.  Will do
that.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
