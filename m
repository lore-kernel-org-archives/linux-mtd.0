Received: from mta04.mail.t-online.hu ([195.228.240.57]
	helo=mta01.mail.t-online.hu)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GXxbC-0003Ha-PN
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 06:15:41 -0400
Received: from [192.168.1.11] (dsl51B696AD.pool.t-online.hu [81.182.150.173])
	(Authenticated sender: takacs.aron@infracont.hu)
	by mail.t-online.hu (Postfix) with ESMTP
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Oct 2006 12:15:33 +0200 (CEST)
Message-ID: <452E15C6.4000303@infracont.hu>
Date: Thu, 12 Oct 2006 12:15:34 +0200
From: =?ISO-8859-2?Q?Tak=E1cs_=C1ron?= <takacs.aron@infracont.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 summary problem
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have to shorten the mount time of a jffs2 filesystem. I am working on 
a PXA270 based board witha 2.6.18 kernel. I have the jffs2 filesystem in 
the fourth partition of the flash  (dev/mtdblock3), its size is about 
10Mb. The mount time is about 1.5sec. I am doing the followings:

My kernel config looks likde this:

CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_SUMMARY=y

Now I create the jffs2 image:

mkfs.jffs2 -r rootfs/adatok -o colibri.jffs2 -e 0x40000 --pad=0xa40000
Result: colibri.jffs2 10,2Mb

After that I am running sumtool:

sumtool -e 0x40000 -p 0xa40000 -v -icolibri.jffs2 -ocolibri_sum.jffs2
Result: colibri_sum.jffs2 256kb

Now I copy the file (from filesystem on nfs) to the flash:

dd if=/colibri_sum.jffs2 of=/dev/mtdblock3 bs=256k

After all I have the following situation:
Mount time is the same. After mounting the first "ls" takes a long time. 
On the serial console I can se a lot of characters.
What I am doing wrong?
Thanks for your help!


Best regards:
Áron Takács
