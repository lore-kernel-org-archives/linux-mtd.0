Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dup4g-0004mH-Iw
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 06:11:56 -0400
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id BBEFAB904
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 12:11:38 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80897-06 for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 12:11:32 +0200 (CEST)
Received: from [192.168.0.77] (mail.iskramedical.si [193.77.157.20])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 862D8B8B1
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Jul 2005 12:11:32 +0200 (CEST)
Message-ID: <42DCD1D3.8070303@cetrtapot.si>
Date: Tue, 19 Jul 2005 12:11:31 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to use latest MTD CVS snapshot to create jffs2 image and boot my ARM 
target using that image as rootfs. Booting halts at:
...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: 0xfe48 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: 0xa2f9 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: 0x8db7 
instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: 0x9549 
instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x000073a0
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
SR.4 or SR.5 bits set in buffer write (status b0). Clearing.

This is on 2.6.12.2. On 2.6.9 image is correctly mounted and booted. I belive 
that mkfs.jffs2 is one of the latest -
$ mkfs.jffs2 --version
mkfs.jffs2: revision 1.45

- and image is created with:
mkfs.jffs2 -e 131072 -r <dir> -o rootfs.jffs2

Am I missing something here?

regards,
hk
-- 
..because under Linux "if something is possible in principle,
then it is already implemented or somebody is working on it".

					--LKI
