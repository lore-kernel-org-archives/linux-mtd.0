Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EY1zy-0000nl-V7
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2005 08:52:57 -0500
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 7541EBB6A
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Nov 2005 14:52:32 +0100 (CET)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70453-09 for <linux-mtd@lists.infradead.org>;
	Fri,  4 Nov 2005 14:52:17 +0100 (CET)
Received: from [192.1.1.75] (unknown [192.168.66.2])
	by n1.cetrtapot.si (Postfix) with ESMTP id 6F9BAB9B7
	for <linux-mtd@lists.infradead.org>;
	Fri,  4 Nov 2005 14:52:17 +0100 (CET)
Message-ID: <436B6791.70004@cetrtapot.si>
Date: Fri, 04 Nov 2005 14:52:17 +0100
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: sumtool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are about to use newer version of MTD in our product - the one with 
EBS and summary. Until now we managed to measure performance on old/new 
system setup.

As some of you confirmed that the only way to upgrade is to use sumtool 
to convert old format (summary-less) image to new format. What I've done 
here does not result in successfull mount:

on old mtd setup:
flash_eraseall /dev/mtd2
mount /dev/mtd2 /mnt

# make some files
cd /mnt
while [ $I -lt 100 ]; do dd if=/dev/urandom of=$I$I$I$I$I count=10; let 
"I+=1"; done
cd ..

umount /dev/mtd2

on new mtd setup:
sumtool -i /dev/mtd0 -o /tmp/filee -p
flash_eraseall /dev/mtd0
cp /tmp/filee /dev/mtd0

mount /dev/mtd0
^^^^^^^^^^^^^^^^

This last command hangs the system ---
What am I doing wrong?

On host machine I can loop-mount /tmp/filee just fine:
modprobe loop
losetup /dev/loop0 filee
modprobe blkmtd device=/dev/loop0
mount -t jffs2 /dev/mtdblock0 /mnt/mtd0


regards,
hinko
