Received: from mail.eads-nadefense.com ([63.67.56.100])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ITK1C-0000Gq-CL
	for linux-mtd@lists.infradead.org; Thu, 06 Sep 2007 12:15:49 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: ramfs or ramdisk
Date: Thu, 6 Sep 2007 09:15:41 -0700
Message-ID: <0FAD7C008A1FEB448725A0EFAE2A3A4A06FFA154@eadsna-irvexch1.EADS-NAdefense.local>
In-Reply-To: <3547473BFF99D74F875EEE3E38BCDDFF23A5F0@tieroneserver.tier1design.com>
From: "Mo, Vincent" <vincent.mo@EADS-NAdefense.com>
To: "Michael Langford" <mlangford@tieronedesign.com>,
	"Saravanan Chanemouganandam" <schane@osmozis.com>,
	<linux-arm@lists.arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From "Embedded Linux System Design and Development":


RAMDISK:
Implemented as a block device in RAM, need to create a file system on
top of it.

Needs to be preallocated in RAM before use.

2 copies of program pages are maintained: in ramdisk and in the kernel
page cache when any program is executed out of ramdisk.

Slower because any data access needs to go through the file system and
block device driver.



RAMFS:
Is a file system implemented directly in RAM.

No preallocation necessary.  Dynamic growth based on requirement.

Whenever a program is executed from a RAMFS, only one copy that is in
the kernel cache is used.  No duplication.

Is relatively faster as actual file data and metadata are in kernel
cache and no file system and block device driver overheads are involved.

 =20

=20

=20
=20
=20
=20

Vincent Mo
Software Engineer
EADS NA Defense

>-----Original Message-----
>From: linux-arm-bounces@lists.arm.linux.org.uk [mailto:linux-arm-
>bounces@lists.arm.linux.org.uk] On Behalf Of Michael Langford
>Sent: Wednesday, September 05, 2007 8:06 AM
>To: Saravanan Chanemouganandam; linux-arm@lists.arm.linux.org.uk
>Cc: linux-mtd@lists.infradead.org
>Subject: RE: ramfs or ramdisk
>
>-----Original Message-----
>Subject: ramfs or ramdisk
>
>I would like to know which rootfs files system is best for the embedded
>systems, ramfs rootfs or ramdisk rootfs ?Can anyone point me interms of
>memory advantage.
>
>Thanks
>Sara
>
>---------------------------
>
>Timesys has a website(https://linuxlink.timesys.com/docs/initramfs) and
>podcast talking about the differences at their website. I believe the
>pertinent discussions of the different filesystems and the boot time
>tradeoffs are in the following episodes:
>
>http://www.timesys.com/podcasts/mp3/Episode_011_LinuxLink_Radio.mp3
>http://www.timesys.com/podcasts/mp3/Episode_012_LinuxLink_Radio.mp3
>
>     --Michael
>
>PS: I have no affiliation with them, just listen to their podcast.
>
>
>-------------------------------------------------------------------
>List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm
>FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
>Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
