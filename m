Received: from jakorasia.nic.fi ([212.38.224.80])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XfPU-0006tv-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 09:55:20 +0100
Received: from netti.nic.fi (netti.nic.fi [212.38.224.82])
	by jakorasia.nic.fi (8.9.3/8.9.3) with ESMTP id MAA11517
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 12:01:07 +0300 (EET DST)
Date: Fri, 17 Aug 2001 12:01:04 +0300 (EET DST)
From: Riipinen Petri <riipinen@nic.fi>
To: <linux-mtd@lists.infradead.org>
Subject: [Novice] Few simple questions on DOC.
Message-ID: <Pine.GSO.4.31.0108171144030.404-100000@netti.nic.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi folks,

I'm setting up a Linux system on a SBC which has a DOC 2000 socket on it.
This is going to be a pretty small setup for the simple purpose of running
a dedicated program, so no need for very large setup.

So far I've built my setup (kernel + devices + boot stuff + few libs +
binaries + my application binaries) on a hard disk that's connected to
the SBC and it works fine, booting the system to run only my application
and nothign else. I'm not using Lilo/Grub, instead I'm booting directly
the Kernel (2.4.7). My whole setup requires about 10 megs of space, so I
thought I'd use 16M DOC chip, although I might expand to 32M as well,
haven't really decided on that yet.

The next step is to transfer the setup to the DOC, remove the hard disk
and use only DOC for bootin the system and starting my application. And
that's where I would like to ask some "novice" questions to avoid
making some obvious mistakes in the beginning.

Ok, now on to few of questions:

1) I found a DOC driver for Linux from M-Systems website. Do I need this
at all or is everything included in the 2.4.7 kernel? I have read the
mtd-jffs-HOWTO and configured the kernel accordingly.

2) Do I really need to use Lilo/Grub, or can I just write the kernel
directly into beginning of the DOC to make it boot? I don't need to
give any parameters to the kernel when booting from hd, so I don't really
see a need for a boot manager from my point of view.

3) How should I partition the DOC? First a small partition for the kernel,
and then another partition for the rest of the files? Do I use fdisk for
that?

4) Maybe I should use jffs on the DOC, can I just make it with mkfs -t
jffs ...?

5) If I want to write some data into the DOC to keep between boots,
would it be a good idea to make a small partition (and mount it to /var?)
and mount that RW and then mount the other partition with other files as
RO?

6) To write the kernel bzImage to DOC boot sector, would I just use dd
if=input of=/dev/mtd ... or what?

Thanks!

- Petri

PS. I haven't really done anything with the DOC-chips so far (only with
hard disk) so bear with me if I'm not making the right questions...;)
