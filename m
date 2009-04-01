Received: from n30.bullet.mail.mud.yahoo.com ([68.142.207.49])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lor17-0005Vd-4g
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 03:21:35 +0000
From: David Brownell <david-b@pacbell.net>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
Date: Tue, 31 Mar 2009 20:21:25 -0700
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<a95a62fe0903311817i76f9f6d8qf7470fd14a62b912@mail.gmail.com>
In-Reply-To: <a95a62fe0903311817i76f9f6d8qf7470fd14a62b912@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200903312021.25165.david-b@pacbell.net>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 March 2009, Kevin Cernekee wrote:
> On Tue, Mar 31, 2009 at 2:18 PM, David Brownell <david-b@pacbell.net> wrote:
> > Hmm, no comments?  I had understood there was interest over on
> > the MTD side of things in exposing more information through
> > sysfs, to help avoid the need to add Even More Ioctls as part
> > of support for things like NAND chips with 4KB pages, or which
> > handle more than 4GBytes ...
> 
> Based on this post:
> http://lists.infradead.org/pipermail/linux-mtd/2009-March/025060.html
> 
> I am inferring that the following attributes are wanted in the MTD
> sysfs interface:
> 
> 1) mtd_info_user fields - type, flags, size, erasesize, writesize,
> oobsize.  So far we have "type," but it should be easy to add the
> rest.

Yes, easy to add those.  As noted in the $SUBJECT patch, the set
consisting of just "type" is a "starter set".  :)

For procfs elimination, a name/label would be needed too; that can
be an input to, or output from, cmdlinepart.

My question about the $SUBJECT patch is whether there's any reason
not to use that as the start of such driver model enhancements.
I'm thinking the answer to that seems to be "no", and that someone
more involved in *using* those sysfs attributes would be a better
choice for growing that set of attributes.


> 2) region_info_user fields?  Not really sure how this would work.
> Maybe a separate subdirectory for each region?

I'm not sure I've ever had reason to care about a "region" (whatever
that is!) with MTD hardware.

I suspect that a lot of interesting questions could come up in
the context of enhancing mtd-utils to work with sysfs and bigger
NAND chips.  Some might relate to "regions".

- Dave
