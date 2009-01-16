Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LNqiP-0007Fw-7l
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 15:34:35 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Received: from eris.born2network.net ([74.59.45.108])
	by VL-MO-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KDK00FANLXJ7Q90@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 10:34:31 -0500 (EST)
Message-id: <A64FA742-7434-4BAD-9CCC-8BED4D4F7326@b2n.ca>
From: David Bergeron <mho.linux-mtd@b2n.ca>
To: dedekind@infradead.org
In-reply-to: <1231397205.6608.119.camel@localhost.localdomain>
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
Date: Fri, 16 Jan 2009 10:34:31 -0500
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
	<1231397205.6608.119.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-01-08, at 1:46, Artem Bityutskiy wrote:
> On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
>> # mount -o remount,rw,sync /
>> # rsync -aHxvi --delete ... /
>> # mount -o remount,ro /
>> # reboot -d -f
>>
>> When rebooting, the kernel fails to mount the rootfs with the
>> following error:
>>
>> [   61.033142] UBIFS error (pid 1): ubifs_read_node: bad node type  
>> (11
>> but expected 6)
>> [   61.040965] UBIFS error (pid 1): ubifs_read_node: bad node at  
>> LEB 0:0
>
> Hmm, OK. I'll try to look at this and figure out what is going wrong.
> What would help a lot is if I was able to reproduce this at my  
> setup. So
> you may help by sending a shell script which reproduces this issue, if
> you can. And it is better to work with nandsim, because this is the  
> tool
> I use here

Hi Artem,

So I am able to reproduce it on nandsim, with the following setup, it  
takes on average ~30 cycles of rsync & remount before it breaks, which  
is much more resilient than with my real setup.

Couple of observations:
- It is the read-only mount followed by a 'remount,rw' that is the  
problem enabler, nothing bad happens without doing that.
- I first tried to play with extracting tarballs but it ran fine for  
hours, when I went back to rsync'ing files it broke almost immediately.
- rsync hops between syncing two rootfs userlands, mostly identical  
besides a bunch of mtime differences and one having more files (55% vs  
88% used capacity), so far it always breaks after rsync has grown the  
data footprint, shrinking seems to go well.

I will keep poking around this issue, let me know if you want me to  
try anything.

The setup:

64MiB, 2048 bytes page
nandsim.first_id_byte=0x20 nandsim.second_id_byte=0xa2  
nandsim.third_id_byte=0x00 nandsim.fourth_id_byte=0x15

ubiformat /dev/mtd0 -s 512 -y
ubiattach /dev/ubi_ctrl -m 0
ubimkvol /dev/ubi0 -N rootfs -s 40MiB

mounted once rw to init empty filesystem then I run this:

#!/bin/sh -x

UBIFS=ubi0:rootfs
MNT=/mnt
step=1
count=0

while true; do
mount -t ubifs -o ro $UBIFS $MNT || { echo GAME OVER score $count;  
break; }
mount -o remount,rw,sync $MNT

case $step in
   1)
     rsync -aHx --delete host::systemA $MNT
     step=2 ;;
   2)
     rsync -aHx --delete host::systemB $MNT
     step=1 ;;
esac

umount $MNT
count=$((count+1))
done
-EOF-

Regards,
-david
