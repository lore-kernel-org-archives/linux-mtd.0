Received: from smtp.lynuxworks.com ([207.21.185.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16CKcB-0004jc-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2001 13:00:31 +0000
Date: Fri, 7 Dec 2001 05:11:11 -0800 (PST)
From: Aleksander Sanochkin <asanochkin@Lnxw.COM>
To: <joern@wohnheim.fh-wedel.de>
cc: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <Pine.LNX.4.33.0112070507510.12712-100000@newbast.lynuxworks.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
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

> Hi!
>
> > Yes, I've looked through Jörn Engel's code. Our modifications are less
> > significant and are based on other goals in mind.
> >
> > Primary goal was to allow for creating Flash partitions that consist
of
> > non-consequent sectors. For instance, the user may wish to chose
sector
> > 2 for storing some binary data and use sectors 1,3,4..... as a single
> > JFFS partition.
> >
> > Another goal was a possibility of flexible (re-)configration of the
> > partitions, without having to change any C code. Supported methods
are:
> > build-time (via a CONFIG_... define), boot-time (via a kernel command
> > line), and run-time (via an mtdchar IOCTL command). With all the three
> > methods, the user uses a string notation to specify desired layout of
the
> > partitions. For instance, "0,3-8:1,2:9-25" means three partitions,
with
> > sectors 0 and 3 to 8 belonging to the first partition, 1 and 2 to the
> > second, and 9 to 25 to the third.
>
> We already have partitioning that is independent of the kernels normal
> partitioning. Now you send in the equivalent of the logical volume
> manager. The mtd code is getting there. :)
>
> What are your reasons to use mtdchar ioctl()s for runtime
> repartitioning? This should be pretty independent of the char device,
> (caching) block device or whatever the future might still bring. Why
> not a /proc interface?

One reason was that the user will most likely have mtdchar in the kernel
anyway, if he wants to use a tool for erasing Flash, but he may want
not to include /proc in the kernel for some reasons. So, we found it
more logical to have an IOCTL command for the repartitioning.

Best regards.
