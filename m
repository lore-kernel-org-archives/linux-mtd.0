Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182TTl-000598-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 10:31:37 +0100
Received: from localhost (henrik@localhost)
	by filer.marasystems.com (8.11.6/8.11.6) with ESMTP id g9I9VZn20519
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 11:31:35 +0200
Date: Fri, 18 Oct 2002 11:31:35 +0200 (CEST)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: linux-mtd@lists.infradead.org
Subject: Re: check disk usage
In-Reply-To: <20021018082514.GA3934@tkeitel001.bln.gelonet.local>
Message-ID: <Pine.LNX.4.44.0210181121090.20473-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Haven't used busybox in a while, but when using "the real thing" the 
following applies, and it might apply to busybox mount as well:

This problem is caused by a /etc/mtab not beeing in synch with your actual 
mounts.

There is two ways to go about this

a) Propely set up /etc/mtab when booting. This is done by when having
/etc/mtab writeable, clear it, and then redo all mounts done up to that
point by using the -f option to only update /etc/mtab.

b) Do not use a real /etc/mtab. Link it to /proc/mounts. For details and
limitations of not using a mtab see the mount(1) man page.. almost all
setups can work just fine without a real mtab.

Regards
Henrik


> On Thu, Oct 17, 2002 at 13:58:46 -0700, Xiaogeng (Shawn) Jin wrote:
> > Hi,
> > 
> > My root filesystem is jffs2, which is mounted by kernel getting booting 
> > parameters "root=/dev/mtdblock3 rw" from the command line. I noticed 
> > that running 'df -k' only shows the usage of those devices that are 
> > mounted explicitly by 'mount' command but not the root filesystem. The 
> > following is the result of 'df -k' running on busybox-0.60.2.
> > 
> > # df -k
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/mtdblock0           16384       688     15696   4% /usr
> > /dev/mtdblock1           16384      5836     10548  36% /home
> > /dev/mtdblock2           16384       652     15732   4% /var
> > 
> > On a regular linux system, e.g. RedHat, we do get information about the 
> > usage of the root filesytem, right?
> > 
> > Is this a problem? If it's is, is it related to jffs2 or busybox?
