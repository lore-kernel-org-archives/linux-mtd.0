From: bbeers@edgeaccess.net (Bob Beers)
Date: Tue, 11 Feb 2003 09:46:30 -0500
Subject: Some GRUB + mtd + multi-partition diskonchip questions
Message-ID: <200302110946.30604.bbeers@edgeaccess.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hello,

My googling of the list archives didn't turn up the problems=20
I've been experiencing.  So here goes:

I followed the fine instructions from Mark Meade's rev.0.3
howto -- Boot GRUB on the DiskOnChip 2000.  I have 4=20
motherboard/CPU combinations I'm using, 2 COTS and two=20
homegrown, [34]86 from 66 to 600 Mhz.  I built a 2.4.20=20
kernel with all mtd modules compiled in.  My kernel is=20
working, I can access the diskonchip. =20
I built the mtd-patched GRUB and used dformat to load the=20
grub_firmware onto the diskonchip.  (dinfo /bbt so far=20
always shows 0 errors)
I then used "fdisk /dev/nftla" to create two partitions on=20
my 16M DoC2k, part1 for kernel, rfs image, and menu.lst,=20
part2 for user configuration files.  I used mke2fs -m 0 to=20
create file systems on both parts.  I have 64M ram, 32 of=20
which is for the ramdisk.

1) Sometimes, when I try to run e2fsck or mount on part2,=20
the display will not show the completion of the process=20
until I open another console and login.  Really, if I sit=20
and watch, it seems to be hung.  As soon as I open another=20
console, login and switch back to the first console, the=20
process has magically completed.  Really.  This is probably=20
completely unrelated to mtd, but I have to ask.

2) Also, it seems that whenever I modify the files on either=20
partition, booting will hang at the point in init where the=20
nftla device partitions are checked, unless I actually=20
cycle power.  Most recently, even that didn't work, so I=20
powered off, removed the diskonchip, reseated the=20
diskonchip, powered up, and finally success.  What's going=20
on?  I have previously been using lilo and the M-Sys=20
drivers with this same two-partition setup, and changing=20
data on part2 was no problem, changing data on part1=20
(kernel or rfs image) only required re-running lilo=20
(modified to work with M-Sys diskonchip driver).  Is there=20
a similar process with DoC2k, grub and mtd that I have=20
overlooked here?

Finally, a question about my file system choices.  Should I=20
be doing this differently?  I want to keep the DoC small, I=20
want to be able to remotely update the kernel and rfs=20
image, I expect the user to more frequently update the=20
config files in part2, so I create symbolic links to the=20
files on part2 from the ramdisk.  Would jffs2 be a better=20
option for either or both of my partitions' file systems? =20
I do want powerfail tolerance. ( that's one of the reasons=20
for the ramdisk )

Thanks,
-Bob
--=20
Bob Beers
bbeers at edgeaccess.net
