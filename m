Received: from cs10p04.dial.cistron.nl ([62.216.2.69] helo=planck.gaussian-it.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16LEQ6-0007a5-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Jan 2002 02:12:51 +0000
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by planck.gaussian-it.com (Postfix) with ESMTP id 842E29EF
	for <linux-mtd@lists.infradead.org>; Sat, 29 Dec 2001 23:29:35 +0100 (CET)
Subject: Which major/minor for DOC2000?
From: Krist van Besien <krist@vanbesien.org>
To: mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 29 Dec 2001 23:29:35 +0100
Message-Id: <1009664975.9699.2.camel@planck.gaussian-it.com>
Mime-Version: 1.0
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

Hi all...

I have a problem...

The situation is as follows: I have an (three year old) system with a
8MB DOC2000 on it. No HD, no floppy. It has two ethernet cards, adn I
can connect a keyboard and monitor. I want to use it to build a
firewall.

Currently the system contains the "lrp" distribution, which was
installed on it for my the guys that sold me the system. The system
boots through syslinux , which loads a kernel and root image, and boots.
The kernel is an 2.0.7 kernel linked with the old (binary only) DOC2000
driver. (Which means that tohse guys that sold me the system in fact
violated the GPL. I do not plan on holding it against thme though...)

I want to replace the Os with a miny distro I built myself (based on
floppyfw). So I built a kernel, based on 2.4.17, with mtd, doc2000 and
ntfl support. Made my own initrd etc... By booting the original
kernel/root img. I was able to copy the new kernel and root image to the
DOC2000, and modify syslinux.cfg so I can choose between the old and the
new kernel when booting.

My problem is the following: Somehwere during startup I need to mount
the filesystem on the DOC2000. The filesystem is fat, and the original
lrp based distro mounted it from /dev/fla1, which the kernel considers
the first partition on /dev/fla   /dev/fla1 has major/minor 62/0 

I have been digging in the kernel Documentation and found some
indication that I need a block device, with major 31 and minor 16. So I
made one in the /dev/ directory on my initrd image. 

But upon mounting I get a "device not initialised" error. I do get a lot
of messages (repeatedly) like .... seems to be a DiskOnChip... or
something. They scroll away to fast. And I do not get to the point that
I can cal them back using dmesg...

So can anybody help me with this? What is needed apart from built in
support in the kernel to be able to mount a fat filesystem on a DOC2000?

TIA

Krist
