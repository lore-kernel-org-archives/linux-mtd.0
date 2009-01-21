Received: from mail-bw0-f18.google.com ([209.85.218.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LPZOW-00019R-V1
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2009 09:29:11 +0000
Received: by bwz11 with SMTP id 11so25659bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jan 2009 01:29:06 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 21 Jan 2009 10:29:05 +0100
Message-ID: <d459bb380901210129sb54eb47j2a67a11710f185b5@mail.gmail.com>
Subject: JFFS2 losing files on mount
From: Marco Braga <marco.braga@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am doing some power failure tests on an ARM7 based device using
JFFS2 on NAND flash and I am a bit disappointed by the early results.
At the moment I've done only some informal tests so I don't have a
detailed bug report or logs to provide. Information gathered on the
net gave me the impression that JFFS2 could withstand repeated power
failures without major damages. Losing last written data is not a
problem, but preserving filesystem consistency is.

The worst situation happened to me is a JFFS2 file system that keeps
loosing files after mount. This is what happened: After a lot of power
cycles, errors during mount are increasing (nothing really strange:
lost inodes, ECC errors, etc.), but infos on the internet say that
they must be considered "warnings". After last reboot, all the files
in the JFFS2 partition are lost on mount. Not a good situation...
I copy some more files in the fs, without any apparent problem. If I
read back them, they are ok. I sync the file system, check the files
again. Everything seems fine. Then I umount the partition, and mount
it back again. The same errors appear and the content of the file
system is lost again. All previous files are lost. This happened every
time I retried the same thing on that partition. At the end I had to
erase the partition and rebuild the JFFS2 file system again.

Disappearing file is not a good thing, but a filesystem that loses all
files every time it is mounted is even worse.

I'd like to hear your experiences. What do you think?

Regards,
Marco
