Received: from mailout.ltindia.com ([125.18.18.115])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JQHUP-0007Pw-Bq
	for linux-mtd@lists.infradead.org; Sat, 16 Feb 2008 07:29:44 +0000
Received: from EBGMAIL2.MAIL.LNTEBG.COM (ebgmail2.lntebg.com [172.18.224.201])
	by mailout.ltindia.com (Symantec Mail Security) with ESMTP id
	140E24E4002 for <linux-mtd@lists.infradead.org>;
	Sat, 16 Feb 2008 12:30:28 +0530 (IST)
Message-Id: <47B6D8DD02000076000005C4@EBGMAIL2.MAIL.LNTEBG.COM>
Date: Sat, 16 Feb 2008 12:36:45 +0530
From: "Vanita Suryavanshi" <suryavanshivj@LNTEBG.com>
To: <linux-mtd@lists.infradead.org>
Subject: cloning jffs2 file system
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sir,
Seeking of help.
We have developed jffs2 file system using block2mtd driver.
Our compact flash has 2 partitions.
First partition is boot partition having fat file system.This contains =
syslinux bootloader and kernel.
Second partition is jffs2 partition, formatted using flash_eraseall -j =
/dev/mtd0
and put the file system using dd.
Flash is working fine.

But to burn large number flash,this method is not suitable.
So If I have a working flash with jffs2 can I make multiple flash using =
any tool like norton ghost.
Norton ghost does not support jffs2. Is there any other tool or method for =
doing this.

Thanks & Regards,

Best Regards,
Vanita Suryavanshi
Design Engineer,
Automation Systems Center,
Navi Mumbai.
