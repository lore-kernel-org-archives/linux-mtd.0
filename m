Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3DcQ-0007xc-7E
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 08:29:01 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j1LDSoLN010259
	for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2005 18:58:50 +0530
Received: from desh.cse.iitd.ernet.in ([127.0.0.1])
	by localhost (desh.cse.iitd.ernet.in [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 10146-02 for <linux-mtd@lists.infradead.org>;
	Mon, 21 Feb 2005 18:58:50 +0530 (IST)
Received: from [10.20.50.26] (electron.kritikal.iitd.ernet.in [10.20.50.26])
	by desh.cse.iitd.ernet.in (8.12.8/8.12.8) with ESMTP id j1LDSl3c010247
	for <linux-mtd@lists.infradead.org>; Mon, 21 Feb 2005 18:58:47 +0530
Message-ID: <4219E20F.80908@kritikalsolutions.com>
Date: Mon, 21 Feb 2005 18:58:47 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

             This is my first mail to the group and is hoping for some 
fruitful results from your mails. I am having problems in mounting my 
MTD device using mkfs.jffs2 . Though i have read mails on the group 
regarding mkfs.jffs2 but still i am not able to decipher my problem, so 
hoping a helpful hand from your side. Here are the steps that i am 
following:

eraseall -j /dev/mtd/1           ( -j as i need jffs2 file system 
/dev/mtd/1 is 1 MB partition)
mkfs.jffs2 -e 0x420 -d /tmp/Application -o image  ( created image of my 
application which is to be put into MTD)
cp image /dev/mtd/1           ( copied the image into MTD)
mount -t jffs2 /dev/mtdblock/1 /mnt is giving errors

Node at 0x00000048 with length 0x000006d2 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000004c: 
0x06d2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000050: 
0x39d7 instead
[...]
Further such events for this erase block will not be printed
Node at 0x0000071c with length 0x000003d7 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase size?
JFFS2: Erase block at 0x00000420 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000840: 
0xf42b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000844: 
0x68c7 instead
[....]
Further such events for this erase block will not be printed
Node at 0x00000af4 with length 0x000005a6 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase size?
JFFS2: Erase block at 0x00000840 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c60: 
0x6df1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c64: 
0x1283 instead
[...]
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000c60 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001080: 
0x8c70 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001084: 
0x8f13 instead
[...]

 From the output atleast i am sure that i am providing the right 
eraseblock to mkfs.jffs2 as Erase block is checking at an interval of 
0x420 everytime. When all these messages stops , i entered into /mnt to 
check if there is something in the mounted device and it does shows 
everthing that i copied into it, so why is this error coming ?
"Node at 0x00000048 with length 0x000006d2 would run over the end of the 
erase block" can this helps me out somehow where something is going 
wrong ???

Narinder
