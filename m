Received: from zproxy.gmail.com ([64.233.162.206])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6KAS-0002nO-PM
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2006 23:09:34 -0500
Received: by zproxy.gmail.com with SMTP id q3so1425123nzb
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Feb 2006 20:09:27 -0800 (PST)
Message-ID: <7e560e180602062009v7fbe544ay4a93751778626b07@mail.gmail.com>
Date: Tue, 7 Feb 2006 17:09:27 +1300
From: Braden Simpson <braden.simpson@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 and INFTL compatibility
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Apologies for the partial post sent earlier but somehow I managed to press=
 a
magic key combination for Gmail and it decided to send the message for me]

Hi all,

I am having mixed success in using both JFFS2 and INFTL on different partit=
ions
of a Diskonchip 2000 TSOP and was wondering if I was missing something that
should have been obvious.

The intention is to have the main application residing on a seldom-modified=
 EXT2
over INFTL partition and the logs and such on a power-failure resistant JFF=
S2
partition.  The system currently boots the kernel from the Diskonchip using=
 the
Docboot bootloader and loads the root filesystem into a RAMDisk.

Formatting and mounting the EXT2 partition works just fine but I cannot get=
 the
JFFS2 partition to survive a reboot without being 'fixed' by the INFTL driv=
er on
kernel startup.  The kernel messages on startup are:

...
INFTL : corrupt block 8147 in chain 8147, chain length 0, erase mark 0xffff=
?
INFTL : formatting chain at block 8147
INFTL : formatting block 8147
...

If I use nanddump to view the OOB I can see that the OOB data for the fifth
512-byte page (after offset 0x05F0) in every 16KiB block is set to:

   FF FF FF FF FF FF FF FF 00 00 00 00 69 3C 69 3C

All the rest of the pages and OOB data look to be blank.

This is in contrast to the contents of the OOB after using "flash_eraseall =
-j"
where the OOB data for the first 512-byte page (after offset 0x01F0) is set=
 to:

   FF FF FF FF FF FF FF FF 85 19 03 20 08 00 00 00

Again all the rest of the pages and OOB data look to be blank.

The kernel is based on 2.6.12.6 with the latest MTD updates and a small
change I had to make to the fill_autooob_layout function to get it to work.
This is an embedded PC/104 platform so all the MTD code used is compiled
into the kernel.  The root filesystem was generated using Buildroot.

What do I need to do to stop the INFTL driver from corrupting the JFFS2
partition?

Regards,

Braden Simpson
