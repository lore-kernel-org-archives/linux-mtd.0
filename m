Received: from karma.reboot.ca ([67.15.48.17])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DhysP-0000pm-Nj
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 20:01:58 -0400
Received: from niro (S01060004e28f4900.du.shawcable.net [70.67.196.121])
	by karma.reboot.ca (8.12.10/8.12.10) with SMTP id j5E01jiB028867
	for <linux-mtd@lists.infradead.org>; Mon, 13 Jun 2005 17:01:45 -0700
Message-ID: <004d01c57074$ad3758d0$6702a8c0@niro>
From: "Andre" <andre@rocklandocean.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 13 Jun 2005 17:04:46 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: suggestion on use of linux-mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My apologies for my previous post
http://lists.infradead.org/pipermail/linux-mtd/2005-June/012816.html

I managed to find the mtd-jffs2-howto in the mtd source tree, which contains
all the instructions for building the kernel.

I have been running ext3 on diskonchip2000 (using m-sys trueffs driver) for
quite a while now and have not run into any problems yet, although I never
did any asynchronous power off tests. I can boot off diskonchip using a
special version of lilo and initrd.

I would really like to try linux-mtd, however I am not quite sure if it is
suitable for my use of the diskonchip. First of all, my application will
create up to 32KB/s of data, and it will run for several hours (if not days
at lower data rate). The diskonchip will be at least 384MB up to a maximum
of 1GB. The OS (trimmed down LFS5.0, patched 2.4.27) is about 35M and lives
in the same partition. Asynchronous power offs cannot be ruled out due to
the nature of the instrument that will host the cpu board with the
diskonchip.

The mtd-jffs-howto refers to NFTL for diskonchip devices, but also talks
about JFFS2 and how production worthy it is and it looks like some work has
been done in the area of powercycle testing, but the link provided is not
valid.

What exactly does one get with *just* NFTL, i.e. does it makes sense to run
ext3 on top of NFTL? Is NFTL production ready?

There is also a comment that says JFFS2 does not work on DOC, but I assume
that comment is old. What exactly is the status of JFFS2 for diskonchip
devices?

regards,
AWS
