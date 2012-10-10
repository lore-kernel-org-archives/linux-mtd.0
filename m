Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLsDS-000498-Ny
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 09:04:37 +0000
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Marcus Prebble <marcus.prebble@axis.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1349851661.20594.6.camel@sauron.fi.intel.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Oct 2012 11:04:16 +0200
Message-ID: <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-10-10 at 08:47 +0200, Artem Bityutskiy wrote:
> Yeah, I am probably confused.

Or, I have explained it in a not-so-clear way ;)

> 
> On Mon, 2012-10-08 at 17:04 +0200, Marcus Prebble wrote:
> > We have remounted a static UBI volume which happens to be the rootfs (/)
> > onto another location, /tmp/newrootfs
> 
> So, you have your UBI volume, it contains your root file-sytem, right?

Exactly.

> Then you "remount your" root to /tmp/newrootfs? If yes, I would like to
> understand how exactly you do this? Give some more details.

The mount command is: 

mount -t ubifs -o ro ubi0:rootfs /tmp/newrootfs

which results in the following mount table:

[root@axis-00408c93d266 /tmp]4517# mount
ubi0:rootfs-11 on / type ubifs (ro,relatime)
proc on /proc type proc (rw,relatime)
sysfs on /sys type sysfs (rw,relatime)
udev on /dev type tmpfs (rw,relatime)
/dev/ubi0_23 on /mnt/flash type ubifs (rw,relatime)
/dev/part/persistent on /lib/persistent type ubifs (rw,relatime)
/dev/part/iv on /usr/local type ubifs (rw,relatime)
tmpfs on /var type tmpfs (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,mode=600)
tmpfs on /dev/shm type tmpfs (rw,relatime)
tmpfs on /var/cache/recorder type tmpfs
(rw,relatime,size=111320k,nr_inodes=0)
ubi0:rootfs-11 on /var/tmp/newrootfs type ubifs (ro,relatime)

> 
> > We are trying to make an image of /tmp/newrootfs with mkfs.ubifs and
> > where the output file is /tmp/newrootfs.img.

> If the inode number of / is the same as /tmp/newroofs, and the device
> number is the same, this is the same inode, no?

I wrote a small program to test this seeing we don't have stat on target

[root@axis-00408c93d266 /tmp]4530# ./a.out / 
Stat() info for '/':
st_mode=0x41ed
st_ino=1
st_dev=10
st_rdev=0
st_size=0

[root@axis-00408c93d266 /tmp]4530# ./a.out /tmp/newrootfs/
Stat() info for '/tmp/newrootfs/':
st_mode=0x41ed
st_ino=1
st_dev=10
st_rdev=0
st_size=0

So according to stat() it is the same inode.

> 
> This means that /tmp/newrootfs.img will also be visible
> in /tmp/newrootfs/tmp/newrootfs.img, no?

No, as /tmp is a tmpfs mounted on  /var/tmp

[root@axis-00408c93d266 /]4530# touch /tmp/foo.txt   
[root@axis-00408c93d266 /]4530# ls /tmp/newrootfs/tmp/       
ls: /tmp/newrootfs/tmp/: No such file or directory
[root@axis-00408c93d266 /]4530# 

.. and is thus not reachable from /tmp/newrootfs/ 

[root@axis-00408c93d266 /]4530# ls /tmp/newrootfs/var/
[root@axis-00408c93d266 /]4530# 

Apologies for the long-winded explanation - but the output file really
isn't in the the root directory, even though apparently the inodes are
the same. 

Thanks and kind regards,

/Marcus Prebble
