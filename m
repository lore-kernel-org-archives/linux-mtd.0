Received: from mx.tdiedrich.de ([2001:6f8:1132::2])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRAGg-0006C1-GO
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 19:35:54 +0000
Date: Wed, 15 Jul 2009 21:35:52 +0200
From: Tobias Diedrich <ranma+kernel@tdiedrich.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Mounting more than one ubifs fails on 2.6.31-rc2
Message-ID: <20090715193552.GA24959@yamamaya.is-a-geek.org>
References: <20090715113210.GB16289@yamamaya.is-a-geek.org>
	<1247658731.11353.16.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1247658731.11353.16.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Wed, 2009-07-15 at 13:32 +0200, Tobias Diedrich wrote:
> > I get the following error when trying to mount a second ubifs:
> > "mount: File exists"
> > Apparently the problem is that ubifs is registered in /sys/class/bdi
> > with it's name 'ubifs' instead of the ubi device major/minor and
> > so can only be registered once.
> > 
> > navi:/home/ranma# mount -t ubifs ubi1:rootfs /mnt/ubi1
> > navi:/home/ranma# mount -t ubifs ubi0:rootfs /mnt/ubi0
> > mount: File exists
> > navi:/home/ranma# umount /mnt/ubi1
> > navi:/home/ranma# mount -t ubifs ubi0:rootfs /mnt/ubi0
> > navi:/home/ranma# mount -t ubifs ubi1:rootfs /mnt/ubi1
> > mount: File exists
> > 
> > The corresponding kernel error messages is:
> > sysfs: cannot create duplicate filename '/class/bdi/ubifs'
> > 
> 
> Was fixed recently:
> 
> http://git.infradead.org/ubifs-2.6.git?a=commit;h=7fcd9c3ecbf09c0a77db7ba01aac75b32fb79a93

It's indeed fixed in 2.6.31-rc3, sorry for the noise.

-- 
Tobias						PGP: http://9ac7e0bc.uguu.de
