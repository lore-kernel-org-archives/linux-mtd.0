Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187kCA-0006Vm-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 22:23:14 +0000
Date: Fri, 1 Nov 2002 23:53:19 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Eugene Surovegin <ebs@innocent.com>
Cc: Anders Olsson <Anders.Olsson@matchpointds.com>,
   linux-mtd@lists.infradead.org
Subject: Re: MTD devices at the wrong place
Message-ID: <20021101225319.GB12891@wohnheim.fh-wedel.de>
References: <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net> <1036137508.26545.46.camel@Europa.matchpointds> <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net> <5.1.0.14.2.20021101144318.02cf71f0@pop.prodigy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.1.0.14.2.20021101144318.02cf71f0@pop.prodigy.net>
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

On Fri, 1 November 2002 14:46:53 -0800, Eugene Surovegin wrote:
> >> /dev/mtd4 should be c 90 8
> >
> >Correction:
> >/dev/mtd4 *should be* c 90 4, but for historical reasons, it is c 90 8.
> 
> Well, maybe I missing something, but mtdchar.c:
> 
> static int mtd_open(struct inode *inode, struct file *file)
> {
>         int minor = MINOR(inode->i_rdev);
>         int devnum = minor >> 1;
>         struct mtd_info *mtd;
> 
> ....
> 
> Notice "minor >> 1".
> 
> As far as I understand, even numbers are used for rw access, odd - for ro.

Yes, that is the status quo. But that is not, how is *should be*,
merely how it *is*.
There is no point in the -ro devices, they only lead to
misunderstandings like the current one.

Jörn, trying to kill those bastards sind 9/01

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
