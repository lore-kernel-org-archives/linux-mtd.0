Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rumr6-0006gM-FZ
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 15:21:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id 3C240167314
 for <linux-mtd@lists.infradead.org>; Tue,  7 Feb 2012 16:21:12 +0100 (CET)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id TvVu4MHQAUYx for <linux-mtd@lists.infradead.org>;
 Tue,  7 Feb 2012 16:21:11 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by ra.se.axis.com (Postfix) with ESMTP id 415D1167304
 for <linux-mtd@lists.infradead.org>; Tue,  7 Feb 2012 16:20:58 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
 by thoth.se.axis.com (Postfix) with ESMTP id 3FA4F340C2
 for <linux-mtd@lists.infradead.org>; Tue,  7 Feb 2012 16:20:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 q17FKwcR017425
 for <linux-mtd@lists.infradead.org>; Tue, 7 Feb 2012 16:20:58 +0100
Date: Tue, 7 Feb 2012 16:20:58 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Userspace write to UBI partitions
Message-ID: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
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


Is it possible to do a userspace write to a UBI volume as if it were plain=
=20
flash memory, i.e. should I be able to do "cat somefile > /dev/ubi0_0" ? I=
=20
get a 'Write Error: Operation not permitted' when I do this (Linux 2.6.35)=
=20
but I'm pretty sure that I've used UBI volumes that way in the past, may=20
have been with older kernels then.

Since there are ioctls for volume update and atomic logical ereasblock=20
change, it would seem natural that writing to UBI volumes must be preceded=
=20
by these ioctls, still I can't seem to see anywhere that doing a plain=20
write would not be allowed, and as I say I'm pretty sure I've done so in=20
the past.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
