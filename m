Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOzrA-0007sE-4u
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 12:23:19 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zebra.brightstareng.com (Postfix) with ESMTP id 44E9D28C296
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 12:23:15 -0500 (EST)
Received: from zebra.brightstareng.com ([127.0.0.1])
	by localhost (zebra [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 31899-01 for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 12:23:07 -0500 (EST)
Received: from pippin (unknown [192.168.1.25])
	by zebra.brightstareng.com (Postfix) with ESMTP id A67E928C294
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Mar 2007 12:23:07 -0500 (EST)
From: ian@brightstareng.com
To: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 Support for Large Flash Designs
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
In-Reply-To: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Date: Wed, 7 Mar 2007 12:23:07 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200703071223.07485.ian@brightstareng.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 07 March 2007 08:01, Joern Engel wrote:
> Code is not in mainline Linux kernel. =A0I generally distrust
> such code; apart from the support question, it is an
> indication of other problems.

There are many software components that have intimate knowledge=20
of the kernel that are not in "mainline Linux kernel".  There is=20
nothing wrong with this. There are many many drivers that are=20
outside the "mainline"; much of the support for embedded=20
processors and their peripherals is not in the "mainline".
There are some positives of having components maintained outside=20
the context of "linux".

Yaffs actually has a life outside linux.  Using "outside the=20
mainline" as an argument is weak at best. The 2.6 kernel=20
makefile makes building a module outside the tree trivial -- so=20
lots of the older build hassles and arguments no longer exist.

Some random programs I build that know about the kernel=20
internals: busybox, e2fsprogs, genext2fs, Glibc, net-tools,=20
pthreads, uClibc, util-linux, wireless_tools the list goes on,=20
with plenty of drivers/modules too.

=2Dimcd
