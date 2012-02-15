Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RxhiH-0006C4-FW
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2012 16:28:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by anubis.se.axis.com (Postfix) with ESMTP id F0C1C19F35
 for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2012 17:28:02 +0100 (CET)
Received: from anubis.se.axis.com ([127.0.0.1])
 by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id AvwQqJckML5J for <linux-mtd@lists.infradead.org>;
 Wed, 15 Feb 2012 17:27:57 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by anubis.se.axis.com (Postfix) with ESMTP id 8486019F33
 for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2012 17:27:52 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
 by thoth.se.axis.com (Postfix) with ESMTP id 9EC2F34103
 for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2012 17:27:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 q1FGRqoO021067
 for <linux-mtd@lists.infradead.org>; Wed, 15 Feb 2012 17:27:52 +0100
Date: Wed, 15 Feb 2012 17:27:52 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Problem with UBI/ubifs mount
Message-ID: <Pine.LNX.4.64.1202151723400.13194@lnxricardw.se.axis.com>
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


I'm having a problem I'm trying to get my head around.

I have a ubifs image, where the image file is about 3.7 MB in size.

If I ubiupdatevol it to a ubi volume that is 7.4 MiB in size (60 LEBs of=20
126 KiB each), and then try to mount the resulting volume, I get

UBIFS error (pid 1578): validate_sb: bad superblock, error 8

If instead try to ubiupdatevol it to a ubi volume that is 28.8 MiB in size=
=20
(234 LEBs), the mount goes fine and I can see the files in the file system=
=20
at the mount point as expected.

Does anyone have an inkling what could be going on here? Ubiupdatevol does=
=20
not give any error messages about the image being to big for the volume or=
=20
indeed any error messages at all.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
