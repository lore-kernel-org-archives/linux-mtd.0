Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190ipa-0005Ni-Hi
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 15:03:10 +0100
Date: Wed, 2 Apr 2003 16:03:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030402140304.GA752@wohnheim.fh-wedel.de>
References: <002201c2f91d$8c6ff330$1200a8c0@JOHNB>
	<1049291095.2652.2.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1049291095.2652.2.camel@passion.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
cc: John Burch <jburch@vincisystems.com>
Subject: Re: reach of jffs2 within image vs. partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 April 2003 14:44:56 +0100, David Woodhouse wrote:
> On Wed, 2003-04-02 at 14:41, John Burch wrote:
> > Is there any advantage or disadvantage to creating the jffs2 image file
> > with the exact same size (via padding) as the partition, as opposed to
> > creating the jffs2 image with some size that's less than the partition
> > size?
> 
> Not generally, no.
> 
> If you use the 'cleanmarker' option then it'll prevent the kernel from
> erasing the remaining blocks on the first mount, and with some
> bootloaders you can't define a partition while installing an image which
> is smaller than the total intended size of that partition -- so you had
> to pad with 0xFF to avoid writing crap to the end of it.

In my experience, better always use images of the same size as the
partition.

You don't *have* to, but then some will figure out how to not erase
the partition, write the image to it, remount the partition and find
some old data in the filesystem that was supposed to be erased.

Give people the option to shoot themselves in the foot and eventually
someone will do it - and blame you. ;)

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
