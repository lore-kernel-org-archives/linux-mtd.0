Received: from relay01.mail-hub.dodo.com.au ([203.220.32.149])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D7mnS-0004F9-5K
	for linux-mtd@lists.infradead.org; Sat, 05 Mar 2005 22:51:15 -0500
Received: from [220.240.204.94] (helo=APOLLO)
	by relay01.mail-hub.dodo.com.au with smtp (Exim 3.36 #2)
	id 1D7mnP-00050l-00
	for linux-mtd@lists.infradead.org; Sun, 06 Mar 2005 14:51:11 +1100
From: "Matt Garratt" <m.garratt@adfa.edu.au>
To: <linux-mtd@lists.infradead.org>
Date: Sun, 6 Mar 2005 14:51:38 +1100
Message-ID: <HMEGLJJFEGIOMNFLAPOFCEAICEAA.m.garratt@adfa.edu.au>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: docboot freeze
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am trying to get docboot to work with a new inftla DOC2000 but docboot
freezes after:

Loading kernel.......Loading initrd.....

My cmdline is:

  root=/dev/ram0 rootfstype=ext2 ro console=tty0,9600

My /etc/lilo.conf stanza (which works from hard disk with the same bzImage
and initrd file) is:

image = /boot/bzImage
  root = /dev/ram0
  label = ramOS
  initrd = /boot/tiny.image.ext2.gz
  read-only

I may be misinterpreting the meaning of the cmdline parameters, but any
suggestions would be very welcome.

I am using a 2.6.9 kernel patched from cvs. I am not using jffs2.

Matt
