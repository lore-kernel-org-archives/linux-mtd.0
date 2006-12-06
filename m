Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Grm8T-0005Pr-Ei
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 21:03:54 -0500
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e2.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id kB623fQK014431
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 21:03:41 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kB623fmQ206612
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 21:03:41 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kB623f1r012907
	for <linux-mtd@lists.infradead.org>; Tue, 5 Dec 2006 21:03:41 -0500
Subject: Re: Finding flash type...
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Siddharth Choudhuri <siddh_c@yahoo.com>
In-Reply-To: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
References: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Tue, 05 Dec 2006 20:05:53 -0600
Message-Id: <1165370753.2679.5.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-12-05 at 17:44 -0800, Siddharth Choudhuri wrote:
> --- Artem Bityutskiy <dedekind@infradead.org> wrote:
> > It would be ideal if somebody added sysfs support to
> > MTD. Then you could
> > just look at sysfs and find it out. Now you should
> > use ioctl's.
> >
> I could start adding the sysfs support to reflect
> flash type.  I have the following questions though:
> 
> 1. Should the information be exported in the
> /sys/block/mtd* directory ? The other place would be
> /sys/class/mtd*.

/sys/class/mtd would be preferable.  MTD isn't a block driver, so it
doesn't really belong under block.

> 2. Should any other information be also exported ? The
> mtd_info_user structure [include/mtd-abi.h] has
> additional fields that might be useful - size,
> erasesize, oobblock(if present) ?

Yes, most of mtd_info_user would be good to export.

josh
