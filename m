Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrxN4-0003fy-U0
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 09:03:49 -0500
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	kB6E3Uve018492
	for <linux-mtd@lists.infradead.org>; Wed, 6 Dec 2006 15:03:30 +0100
Date: Wed, 6 Dec 2006 15:02:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2 not compiling, which acl.h?
In-Reply-To: <4576CC07.2000107@valcom.com>
Message-ID: <Pine.LNX.4.64.0612061502000.29536@lnxricardw.se.axis.com>
References: <4576CC07.2000107@valcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 6 Dec 2006, Glen Johnson wrote:

> <linux/posix_acl.h> in place of <sys/acl.h>?  By the way I never found
> sys/acl.h anywhere in uClinux-dist.  What is the proper way to handle thi=
s?

There was a patch posted a week or two ago on this list which enables you=
=20
to compile mkfs.jffs2 on systems where acl.h (and the features it=20
supports) are missing. Check the archives.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
