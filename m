Received: from obelix.vdslsystems.com ([193.65.143.93])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15c2ct-0004vk-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 11:31:15 +0100
Received: from amattila (amattila.dynamic.vdslsystems.com [193.66.63.68])
	by obelix.vdslsystems.com (8.11.3/8.9.3) with SMTP id f7TAbBv22286
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 13:37:11 +0300 (EEST)
	(envelope-from ari.mattila@vdslsystems.com)
Reply-To: <ari.mattila@vdslsystems.com>
From: "Ari Mattila" <ari.mattila@vdslsystems.com>
To: <linux-mtd@lists.infradead.org>
Subject: help ? MTD block device does not work
Date: Wed, 29 Aug 2001 13:35:09 +0300
Message-ID: <EGEIJICKBOGCKLFLECKCCEJICAAA.ari.mattila@vdslsystems.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

Could some one help me ?
I used kernel 2.4.9 with MTD and JFFS support.

I got the /dev/mtd0,1,2,3 partitions made (NOR FLASH, memory mapped flash),
but if I mount the /dev/mtdblockx (with jffs) I can not write to mount
point.

In smaller partition (2*64k) I get error message "not enough space",
and in bigger writing goes trough but then I get error message
"child sould wakeup" forever.

Any clues ?
Sould I format the partitions somehow or is erase enough ?

Cheers
Ari
