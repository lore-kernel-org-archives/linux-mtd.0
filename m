Received: from [61.30.80.237] (helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALgXg-0004CG-9e
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 10:23:36 +0000
Received: from serversw.iei.com.tw (root@localhost)
	by serversw.iei.com.tw with ESMTP id hAHADY704454
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Nov 2003 18:13:34 +0800 (CST)
Received: from MailSQR.softnext.com.tw ([172.16.2.41])
	by serversw.iei.com.tw with ESMTP id hAHADXF04450
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Nov 2003 18:13:33 +0800 (CST)
Received: from navgw.hq.iei ([172.16.2.30])hAHAIeDs034648
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Nov 2003 18:18:40 +0800 (CST)
	(envelope-from kevinliao@iei.com.tw)
Received: (from rdkevinliaonb [172.16.10.248])
 by navgw.hq.iei (SAVSMTP 3.1.1.32) with SMTP id M2003111718212416317
 for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 18:21:24 +0800
Message-ID: <013301c3acf4$8d3033d0$f80a10ac@rdkevinliaonb>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 17 Nov 2003 18:21:22 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Garbage collection problem for nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I have a nand flash system with one Jffs2 partition on it. The kernel
version is 2.4.18 and the mtd snapshot I use to patch is 20031112. I write
that Jffs2 partition on the nand flash by the following methods:

1. Build a Jffs2 image based on the directory "config" using the command:
mkfs.jffs2 -p -r config -e 16384 -o config.jffs2 -l -n
2. Erase the partition on the nand flash using the command: eraseall -j
/dev/mtd2
3. Write the image to that partition using the command: nandwrite -j
/dev/mtd2 config.jffs2
4. Mount the partition using the command: mount -t jffs2 /dev/mtdblock2
/mnt/config

After that, each time I try to touch or modify some file in /mnt/config. The
kernel complains about the following messaes:

jffs2: No clean, dirty _or_ erasable blocks to GC from! Where are they all?
jffs2: Couldn't find erase block to garbage collect!

It seems that the file content is still correct. Does anyone know what's
wrong with it? Thanks a lot.

Regards,
Kevin
