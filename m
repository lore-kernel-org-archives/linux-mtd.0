Received: from nwd2mail3.analog.com ([137.71.25.52])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Djfs4-0005fe-8H
	for linux-mtd@lists.infradead.org; Sat, 18 Jun 2005 12:08:38 -0400
Received: from nwd2mhb2.analog.com (nwd2mhb2.analog.com [137.71.6.12])
	by nwd2mail3.analog.com (8.12.10/8.12.10) with ESMTP id j5IG8PiL015464
	for <linux-mtd@lists.infradead.org>; Sat, 18 Jun 2005 12:08:29 -0400
Received: from nwd2exm3.ad.analog.com (nwd2exm3.ad.analog.com [10.64.51.19])
	by nwd2mhb2.analog.com (8.9.3 (PHNE_28810+JAGae91741)/8.9.3) with ESMTP
	id MAA06315 for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jun 2005 12:08:23 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jun 2005 12:07:58 -0400
Message-ID: <E21A9A52FF03B249B20F0DC563DEBB311B814609@nwd2exm3.ad.analog.com>
From: "Li, Aubrey" <Aubrey.Li@analog.com>
To: <linux-mtd@lists.infradead.org>
Subject: Soft link of JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have constructed a root file system consisting of some soft link
files, like:
 ls --> busybox
 init --> busybox
 ... ... ... ...=20
 and so forth and so on.
I used mkfs.jffs2 to make a image of the root file system.
But when I startup kernel using the image as the root file system under
MTD,
It crashed.
After I digged into the kernel code, I found the soft link file of the
JFFS2 image could not be read properly.

Doesn't JFFS2 support soft link?

What should I do to over this hurdle?

Thanks.
-Aubrey
