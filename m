Received: from mailout2.samsung.com ([203.254.224.25])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GDu5T-00058s-W7
	for linux-mtd@lists.infradead.org; Fri, 18 Aug 2006 03:27:57 +0100
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J46005EW9HAPQ@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 18 Aug 2006 11:27:10 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J4600IIR9H9DI@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 18 Aug 2006 11:27:10 +0900 (KST)
Date: Fri, 18 Aug 2006 11:27:27 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: RE: JFFS2 problem(amit Kumar sharma)
In-reply-to: <44E2D85B.6030303@yandex.ru>
To: "'Artem B. Bityutskiy'" <dedekind@yandex.ru>
Message-id: <007e01c6c26d$d9629c20$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

I am able to solve this problem .I have one more. I lost data after reboot
but without reboot, I try mount, umount and then mount so I did not lost any
data. I find JFFS2 erase my all blocks, as it did not find any valid clean
marker in OOB area. 

I am getting these debug messages.


Unknown but compatible feature node (0x2005) found at offset 0x00380000
jffs2_check_nand_cleanmarker(): Clean marker node not detected in block at
003a00
OOB at 003a0000 was ff ff 85 19 05 ff ff ff a6 9a a9 3f ff ff ff ff ff ff ff
ff
jffs_check_nand_cleanmarker returned 1
Unknown but compatible feature node (0x2005) found at offset 0x003a0000
jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block at
003c00
OOB at 003c0000 was ff ff 85 19 05 ff ff ff aa 95 55 3f ff ff ff ff ff ff ff
ff
jffs_check_nand_cleanmarker returned 1
Unknown but compatible feature node (0x2005) found at offset 0x003c0000
jffs_check_nand_cleanmarker returned 0
jffs2_check_oob_empty returned 1
JFFS2: Erase block at 0x003e0000 is not formatted. It will be erased
jffs_check_nand_cleanmarker returned 0
jffs2_check_oob_empty returned 1
JFFS2: Erase block at 0x00400000 is not formatted. It will be erased
jffs_check_nand_cleanmarker returned 0
jffs2_check_oob_empty returned 1
JFFS2: Erase block at 0x00420000 is not formatted. It will be erased
jffs_check_nand_cleanmarker returned 0




Thanks
Amit

-----Original Message-----
From: Artem B. Bityutskiy [mailto:dedekind@yandex.ru] 
Sent: Wednesday, August 16, 2006 5:34 PM
To: Amit Kumar Sharma
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 problem(amit Kumar sharma)

Amit Kumar Sharma wrote:
> I have one problem related to JFFS2 partition ,My partition size is  20MB
> but I am able to copy more then 20 MB in this partition and strange is
after
> rebooting file exist with out any problem ,Can u tell me ,how JFFS2
maintain
> partition size information during copy or file write command.In which area
I
> must check in JFFS2 or mtd.

JFFS2 compresses the data so ir is possible that you fit more then 
20MiB. Try to copy mp3 files - you'll you fit less then 20MiB. WRT to 
your question, I'm not sure what to answer - it's too general.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
