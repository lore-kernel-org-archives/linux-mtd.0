Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOpvy-0007NJ-AP
	for linux-mtd@lists.infradead.org; Mon, 19 Jan 2009 08:56:41 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Bergeron <mho.linux-mtd@b2n.ca>
In-Reply-To: <A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
	<A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 19 Jan 2009 10:56:02 +0200
Message-Id: <1232355362.31319.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-01-16 at 10:34 -0500, David Bergeron wrote:
> On 2009-01-08, at 1:46, Artem Bityutskiy wrote:
> > On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
> >> # mount -o remount,rw,sync /
> >> # rsync -aHxvi --delete ... /
> >> # mount -o remount,ro /
> >> # reboot -d -f
> >>
> >> When rebooting, the kernel fails to mount the rootfs with the
> >> following error:
> >>
> >> [   61.033142] UBIFS error (pid 1): ubifs_read_node: bad node type  
> >> (11
> >> but expected 6)
> >> [   61.040965] UBIFS error (pid 1): ubifs_read_node: bad node at  
> >> LEB 0:0
> >
> > Hmm, OK. I'll try to look at this and figure out what is going wrong.
> > What would help a lot is if I was able to reproduce this at my  
> > setup. So
> > you may help by sending a shell script which reproduces this issue, if
> > you can. And it is better to work with nandsim, because this is the  
> > tool
> > I use here
> 
> Hi Artem,
> 
> So I am able to reproduce it on nandsim, with the following setup, it  
> takes on average ~30 cycles of rsync & remount before it breaks, which  
> is much more resilient than with my real setup.
> 
> Couple of observations:
> - It is the read-only mount followed by a 'remount,rw' that is the  
> problem enabler, nothing bad happens without doing that.
> - I first tried to play with extracting tarballs but it ran fine for  
> hours, when I went back to rsync'ing files it broke almost immediately.
> - rsync hops between syncing two rootfs userlands, mostly identical  
> besides a bunch of mtime differences and one having more files (55% vs  
> 88% used capacity), so far it always breaks after rsync has grown the  
> data footprint, shrinking seems to go well.
> 
> I will keep poking around this issue, let me know if you want me to  
> try anything.

Just tried to reproduce this on my x86_64 host without success.
Below is the script I used. I guess SystemA and SystemB contents
matters. I tried to put /bin from Fedora to SystemA, and /bin from
Debian to SystemB.

Would you share your SystemA and SystemB?

#!/bin/sh -x

UBIFS=ubi0:rootfs
MNT=/mnt/ubifs
SystemA=/home/dedekind/tmp/rsync/A
SystemB=/home/dedekind/tmp/rsync/B
step=1
count=0

umount $MNT &> /dev/null
rmmod ubifs &> /dev/null
rmmod ubi &> /dev/null
rmmod nandsim &> /dev/null

# Prepare UBIFS
modprobe nandsim first_id_byte=0x20 second_id_byte=0xa2 third_id_byte=0x00 fourth_id_byte=0x15 || exit 1
modprobe ubi
udevsettle
ubiformat /dev/mtd0 -s 512 -y || { echo ubiformat; exit 1; }
ubiattach /dev/ubi_ctrl -m 0  || { echo ubiattach; exit 1; }
ubimkvol /dev/ubi0 -N rootfs -s 40MiB || { echo ubimkvol; exit 1; }
mount -t ubifs $UBIFS $MNT || { echo mount; exit 1; }
umount $MNT

# Start the test
while true; do
mount -t ubifs -o ro $UBIFS $MNT || { echo GAME OVER score $count; break; }
mount -o remount,rw,sync $MNT

case $step in
   1)
     rsync -aHx --delete SystemA $MNT
     step=2 ;;
   2)
     rsync -aHx --delete SystemB $MNT
     step=1 ;;
esac

umount $MNT
count=$((count+1))
done

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
