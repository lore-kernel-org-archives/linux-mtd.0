Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16b25H-0002vn-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 16:16:39 +0000
Received: from gad ([10.10.11.10]) by sphere.barak.net.il
          (InterMail vK.4.03.00.00 201-232-121 license 5444ddd44659357c6c93343e0ce38507)
          with SMTP id <20020213162537.EHBI445.sphere@gad>
          for <linux-mtd@lists.infradead.org>;
          Wed, 13 Feb 2002 18:25:37 +0200
Message-ID: <100e01c1b4ab$47f991f0$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: cannot mount jffs1 image from loop
Date: Wed, 13 Feb 2002 18:27:08 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

i use mediaEngine, a SA1110 board.
if i try to mount jffs1 file system that i made on 1 file (with mkfs.jffs),
it says:
[root@IMC-2 /root]$mount -t jffs -o loop jffs1 /mnt (jffs1 is the filename)
JFFS: Trying to mount a non-mtd device.
mount: wrong fs type, bad option, bad superblock on /dev/loop0,
       or too many mounted file systems

in the 2.4.17 kernel, i enabled all the mtd options, and also ram mtd block
support.
i have /dev/loop 0-2, and also jffs+jffs2 support on the kernel.

2. i saw in the prevous posts that jffs2 do not support 'looping' (mounting
from file). is that so untill now ?

3. is there any other read/write file system that i can put on flash chip
like in nanoengine/assabet ?

thanks

Gad
