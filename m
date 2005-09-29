Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKxh7-0008Iu-DB
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 08:39:53 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j8TCdKKc014880
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:39:20 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j8TCdK2V101718
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:39:20 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j8TCdJ4J024151
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 08:39:20 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050929115243.GB21332@wohnheim.fh-wedel.de>
References: <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<20050929101247.GD18741@wohnheim.fh-wedel.de>
	<433BC021.7090409@yandex.ru>
	<20050929102620.GE18741@wohnheim.fh-wedel.de>
	<433BD154.1050403@inf.u-szeged.hu>
	<20050929113533.GA21332@wohnheim.fh-wedel.de>
	<433BD3CA.1020500@inf.u-szeged.hu>
	<20050929115243.GB21332@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Sep 2005 07:39:09 -0500
Message-Id: <1127997549.3231.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-29 at 13:52 +0200, Jörn Engel wrote:
> On Thu, 29 September 2005 13:45:14 +0200, Ferenc Havasi wrote:
> > >
> > Yes, it is true. But if an attacker already has the permission to do it,
> > I think he has many simpler and faster way to crash the system. :)
> 
> Doesn't matter.  If there is a good way to avoid this, we should do
> it.
> 
> Problem is: Maybe there isn't.

Depending on what your definition of DoS is, JFFS2 _without_ EBS or CS
could be considered that already.  If mounts take extremely long times
on any decent sized flash, that could be perceived as a DoS.

Think along the lines of "new ogg vorbis player with 4 GiB NAND flash
using JFFS2 as the filesystem".  You think people are going to want to
wait for anything over 2 seconds for their music to be available?

I know, I know... far fetched perhaps.  But not any more than your
mount/unmount loop :).

josh
