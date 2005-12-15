Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Emq6H-0006i0-Vh
	for linux-mtd@lists.infradead.org; Thu, 15 Dec 2005 05:12:41 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 2B7AB2EFDF
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Dec 2005 11:12:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 1E9A31E1AC8
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Dec 2005 11:12:33 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 4D9D2125DB
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Dec 2005 11:12:32 +0100 (CET)
Message-ID: <43A1418F.3060701@imc-berlin.de>
Date: Thu, 15 Dec 2005 11:12:31 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

we're using JFFS2 as rootfs for embedded devices.

>From time to time we have to reboot shortly after writing to this fs,
e.g. a firware update is basically copying the new fw to the jffs2
partition and call "reboot".

Now I wonder if it is needed to umount this partition explicitly before
rebooting? Or mount it read only first by having

::shutdown:/bin/umount -a -r

in /etc/inittab. Or call "sync"?

Or is the unmounting done by the kernel before actually rebooting?
So the system only reboots when all writing to flash is finished?

(I've lately seen corrupt root fs and want to find out if these reboots
could cause the trouble...)

Thanks a million!

-- 
Steven
