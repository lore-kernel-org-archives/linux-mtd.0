Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1730Xr-0002SA-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 21:17:47 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GVG00J0189VP2@asu.edu> for linux-mtd@lists.infradead.org; Wed,
 01 May 2002 13:15:31 -0700 (MST)
Date: Wed, 01 May 2002 13:15:36 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Booting from DOC2000 with GRUB loader
In-reply-to: <02050120383503.07252@diva.localdomain>
To: John Sutton <john@scl.co.uk>
Cc: linux-mtd@lists.infradead.org
Message-id: <1020284137.873.2359.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <02050120383503.07252@diva.localdomain>
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

 
> or nftl_format /dev/mtd0 98304  (bytes)

this one is correct

> I'm nervous about messing this up because since I put grub on the DoC, the
> machine only ever boots from the DoC - completely ignores floppy, scsi disks
> and cdrom.  So if I screw up this nftl_format and trash grub, I'm going to end
> up with an unbootable system ;-(  (OK, I'll just have to pull the DoC chip out
> of the board *again*, but even this gives me the eebies, so tight is the damn
> thing stuck in its socket!  And anyway, if the system is unbootable with the
> DoC chip in there, how am I ever going to reprogram it?)
> 
> Help much appreciated!

*** WARNING *** WARNING *** WARNING *** WARNING ***

THIS CAN DAMAGE YOUR HARDWARE AND BLOW YOU UP
(but it seems to work for me)

*** WARNING *** WARNING *** WARNING *** WARNING ***

I have an ISA card for the DOC2000, I boot up my workstation, carefully
plug in the isacard, modprobe doc2000, insmod docprobe insmod mtdchar
(if necessary) insmod nftl (if necessary). Do whatever I need to do,
rmmod nftl, rmmod docprobe, rmmod doc2000, and remove the card. On my
machine, doing this using the devfsd nodes causes an oops after the
first time, a simple workaround is using hand made device files.

*** WARNING *** WARNING *** WARNING *** WARNING ***

THIS CAN DAMAGE YOUR HARDWARE AND BLOW YOU UP
(but it seems to work for me)

*** WARNING *** WARNING *** WARNING *** WARNING ***
