Received: from relay01.mail-hub.dodo.com.au ([203.220.32.149])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Gb4-0004FN-A7
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 06:40:27 -0500
Received: from [220.240.204.94] (helo=APOLLO)
	by relay01.mail-hub.dodo.com.au with smtp (Exim 3.36 #2)
	id 1D8Gaz-0006Pq-00
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 22:40:21 +1100
From: "Matt Garratt" <m.garratt@adfa.edu.au>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 7 Mar 2005 22:40:48 +1100
Message-ID: <HMEGLJJFEGIOMNFLAPOFKEALCEAA.m.garratt@adfa.edu.au>
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

I am still trying to get docboot to work from a DOC200 after giving up on
grub after much time wasted. Getting the DOC to boot is the most frustrating
thing I have done for quite a while. I get as far as:

Loading kernel.......Loading initrd.....

My cmdline is:

  root=/dev/ram0 rootfstype=ext2 ro console=tty0

I was wondering if the arguments for the cmdline were defined somewhere and
if there any limitations? For example, does root have to be an mtd device?

It sais in the README that there is no serial port support yet the default
cmdline contains console=ttyS0,115200 - I am a bit confused by this.

 I am trying to run the root filesystem from RAM.

I get the same kernel and initrd file to boot on the same machine from a
hard diskc using lilo. The lilo stanza for doing this is:

image = /boot/bzImage
  root = /dev/ram0
  label = ramOS
  initrd = /boot/tiny.image.ext2.gz
  read-only

I may be misinterpreting the meaning of the cmdline parameters, but any
suggestions would be very welcome.

I am using a 2.6.9 kernel patched from cvs. I am not using jffs2. I have a
new DOC2000 with inftla.

Matt
