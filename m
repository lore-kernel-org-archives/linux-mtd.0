Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nmkz-0002IO-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 20:27:53 +0100
Received: from nwcst286.netaddress.usa.net ([204.68.23.31])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14nmkx-0002IG-00
	for mtd@infradead.org; Thu, 12 Apr 2001 20:27:52 +0100
Message-ID: <20010412192716.20625.qmail@nwcst286.netaddress.usa.net>
Date: 12 Apr 2001 12:27:16 PDT
From: Eric <ebrower@usa.net>
To: mtd@infradead.org
Subject: [Q] MEMGETREGIONxxx ioctls
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Here are a few questions related to the MEMGETREGIONxxx ioctls.
I'd simply submit a patch, but I am not sure about the reasoning
and I'm not near a build system for verification:

	1) Why is MEMGETREGIONCOUNT declared with _IOW
	   instead of _IOR in mtd.h?  It seems to be a
	   read from kernelspace, rather than a write to
           kernelspace in mtdchar.c.

	2) Why is MEMGETREGIONINFO declared likewise with _IOW
	   instead of _IOWR?  The ioctl in mtdchar.c reads the
	   regionindex member and then populates the rest of the
	   struct accordingly.

	3) Do we need the declaration of =

		"struct mtd_erase_region_info *kr"
	   inside the MEMGETREGIONINFO ioctl handler?  It is =

	   initialized but never used, so I doubt it is necessary.

Thanks,
E

____________________________________________________________________
Get free email and a permanent address at http://www.netaddress.com/?N=3D=
1


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
