Received: from smtp.atl.cbeyond.com ([64.238.96.29])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QqoZ-0001fj-JC
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 16:50:07 +0100
Received: from [64.238.96.22] (HELO mail.atl.cbeyond.com)
	by smtp.atl.cbeyond.com (CommuniGate Pro SMTP 4.0.6)
	with ESMTP id 30514013 for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2003 11:50:38 -0400
Received: from [64.25.14.193] (HELO sgluckman)
	by mail.atl.cbeyond.com (CommuniGate Pro SMTP 4.0.6)
	with SMTP id 42313028 for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2003 11:49:56 -0400
From: "Sid Gluckman" <sgluckman@omnitech.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 13 Jun 2003 09:47:19 -0600
Message-ID: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
MIME-Version: 1.0
In-Reply-To: <200306131051.42110.f.callaghan@ieee.org>
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Subject: RE: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am kind of a newbie to the jffs2 thing but are you sure that it is just
"sitting" there?  I found that when a jffs2 system is mounted for the first
time with something in the filesystem it goes through some kind of
cataloging function where I'm guessing it is characterizing the device for
bad flash bytes?  Anyways, if you do a 'df' in another shell while it is
sitting there you will see that the device is mounted and that the used
space first slowly cycles to fully used then slowly back down to the correct
used space.  I'm sure someone else could enlighten us both as to what it is
actually doing during this time.  Once it completes this cycle everything is
fine and it doesn't do it on subsequent mounts.  Depending on the flash size
this could take quite a while.

Hope this helps.

Sid

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Frank R
Callaghan
Sent: Friday, June 13, 2003 8:52 AM
To: linux-mtd@lists.infradead.org
Subject: Please Help, problem mounting jffs2


Hi All,

I have a problem with mounting my new mtd/jffs2 system
after lots of experiment I have found the after doing
'eraseall /dev/mtd0' I can 'mount -t jffs2 /dev/mtdblock0 /mnt/flash'
with no problem :) but if I umount it and try to re-mount it
will sit there forever !
If I cp a jffs2.img to the device the mount will also lockup
If I erase -> mount I can create files df with no problems,

It seem like the mount does not like mounting with anything
in the filesystem !

What infomation should I gather to find out whats gonig on here ?

Any help greatly appreciated,

TIA,
        Frank.







______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
