Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QFO2z-0005ge-1x
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 10:02:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 42A8A11E9D
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 12:02:07 +0200 (CEST)
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qyreub3uXqtG for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 12:02:06 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by ra.se.axis.com (Postfix) with ESMTP id ADF1611E8F
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 12:02:06 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by thoth.se.axis.com (Postfix) with ESMTP id AC1303428D
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 12:02:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p3SA26Th005689
	for <linux-mtd@lists.infradead.org>; Thu, 28 Apr 2011 12:02:06 +0200
Date: Thu, 28 Apr 2011 12:02:06 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: How much RAM does JFFS2 use?
Message-ID: <Pine.LNX.4.64.1104281157040.15966@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I've been running some tests with jffs2/mtd vs ubifs/UBI/mtd. One=20
surprising thing was that when the root file system is ubifs, located in=20
an UBI volume (although I don't think the latter makes a difference),=20
there is much more available RAM as seen by the (busybox) free command.

The root file system is about 26 MB in size (26 MB if ubifs, almost 28 NB=
=20
if jffs2), and contains the same files in both cases. The difference in=20
free RAM space is stunning, about 32 MB.

I know jffs2 builds tables in RAM when it scans the device upon mount, but=
=20
I wouldn't expect that much memory to be used.

Now, I'll probably find the culprit as soon as I send this off :-), but at=
=20
the moment of writing I can't think of any other difference between the=20
two setups. I'm using the same source tree to build the ubifs and jffs2=20
images, and the only difference in the kernel is the compiled-in kernel=20
command line specifying which partition to boot from.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
