Received: from pimout3-ext.prodigy.net ([207.115.63.102])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187k5u-0006VC-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 22:16:46 +0000
Message-Id: <5.1.0.14.2.20021101144318.02cf71f0@pop.prodigy.net>
Date: Fri, 01 Nov 2002 14:46:53 -0800
To: Jörn Engel <joern@wohnheim.fh-wedel.de>
From: Eugene Surovegin <ebs@innocent.com>
Subject: Re: MTD devices at the wrong place
Cc: Anders Olsson <Anders.Olsson@matchpointds.com>,
   linux-mtd@lists.infradead.org
In-Reply-To: <20021101223615.GA12891@wohnheim.fh-wedel.de>
References: <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
 <1036137508.26545.46.camel@Europa.matchpointds>
 <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="koi8-r"; format=flowed
Content-Transfer-Encoding: 8bit
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

At 02:36 PM 11/1/2002, Jörn Engel wrote:
>On Fri, 1 November 2002 00:28:22 -0800, Eugene Surovegin wrote:
> > At 11:58 PM 10/31/2002, you wrote:
> >
> > >##I guess it's ok to just create one device? or do I have to create them
> > >all? Or a directory structure under /dev/mtd0 and /dev/mtd1
> > >mknod /dev/mtd4 c 90 4
> >
> > /dev/mtd4 should be c 90 8
>
>Correction:
>/dev/mtd4 *should be* c 90 4, but for historical reasons, it is c 90 8.

Well, maybe I missing something, but mtdchar.c:

static int mtd_open(struct inode *inode, struct file *file)
{
         int minor = MINOR(inode->i_rdev);
         int devnum = minor >> 1;
         struct mtd_info *mtd;

....

Notice "minor >> 1".

As far as I understand, even numbers are used for rw access, odd - for ro.

Regards,

Eugene
