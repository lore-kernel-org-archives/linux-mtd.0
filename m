Received: from pimout4-ext.prodigy.net ([207.115.63.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187mGj-0006j5-00
	for <linux-mtd@lists.infradead.org>; Sat, 02 Nov 2002 00:36:05 +0000
Message-Id: <5.1.0.14.2.20021101170236.035dc4b0@pop.prodigy.net>
Date: Fri, 01 Nov 2002 17:06:15 -0800
To: Jörn Engel <joern@wohnheim.fh-wedel.de>
From: Eugene Surovegin <ebs@innocent.com>
Subject: Re: MTD devices at the wrong place
Cc: Anders Olsson <Anders.Olsson@matchpointds.com>,
   linux-mtd@lists.infradead.org
In-Reply-To: <20021101225319.GB12891@wohnheim.fh-wedel.de>
References: <5.1.0.14.2.20021101144318.02cf71f0@pop.prodigy.net>
 <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
 <1036137508.26545.46.camel@Europa.matchpointds>
 <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
 <5.1.0.14.2.20021101144318.02cf71f0@pop.prodigy.net>
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

At 02:53 PM 11/1/2002, Jörn Engel wrote:
>On Fri, 1 November 2002 14:46:53 -0800, Eugene Surovegin wrote:
> > >> /dev/mtd4 should be c 90 8
> > >
> > >Correction:
> > >/dev/mtd4 *should be* c 90 4, but for historical reasons, it is c 90 8.
> >
> > Well, maybe I missing something, but mtdchar.c:
> >
> > static int mtd_open(struct inode *inode, struct file *file)
> > {
> >         int minor = MINOR(inode->i_rdev);
> >         int devnum = minor >> 1;
> >         struct mtd_info *mtd;
> >
> > ....
> >
> > Notice "minor >> 1".
> >
> > As far as I understand, even numbers are used for rw access, odd - for ro.
>
>Yes, that is the status quo. But that is not, how is *should be*,
>merely how it *is*.
>There is no point in the -ro devices, they only lead to
>misunderstandings like the current one.

OK, I got your point :)). Agreed.

But Anders *should* use "c 90 8" otherwise he have to change code for char 
device to not right-shift minor number.

Eugene
