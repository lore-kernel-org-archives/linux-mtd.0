Received: from 213-229-28-240.static.adsl-line.inode.at ([213.229.28.240]
	helo=contec-int.at)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By9I0-0006tM-MZ
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 09:18:44 -0400
From: Manfred Gruber <gruber.m@utanet.at>
To: linux-mtd@lists.infradead.org
Date: Fri, 20 Aug 2004 15:23:16 +0200
References: <200408201300.05579.gruber.m@utanet.at>
	<200408201327.16211.gruber.m@utanet.at>
	<1093002009.14552.3478.camel@hades.cambridge.redhat.com>
In-Reply-To: <1093002009.14552.3478.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Message-Id: <200408201523.16300.gruber.m@utanet.at>
Subject: Re: Number of CFI chips and Re: JFFS2 with AM29LV256M
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 20. August 2004 13:40 schrieben Sie:
> On Fri, 2004-08-20 at 13:27 +0200, Manfred Gruber wrote:
> > But the output of device size and erase size?
> > When it should be then seen as one chips, why is  erase size 0x10000 and
> > device size 0x200000 ?? That for one chip ....
>
> Yes, that's the debugging dump of the CFI table. You should find
> different results in /proc/mtd

OK. I see that finding the chips is correct.
Writing whith write buffer is also okay.
Then must be my problem in the write_word/write_oneword function be.

Any comment where here could be the problem, or how these functions work ?

Thanks regards manfred
