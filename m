Received: from mail.wiscore.com ([210.241.236.27] helo=server3.wiscore.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F7SBX-0007f2-TD
	for linux-mtd@lists.infradead.org; Fri, 10 Feb 2006 01:55:23 -0500
Received: from [192.168.0.75] (milk.wiscore.com [210.241.236.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server3.wiscore.com (Postfix) with ESMTP id E71FD11D
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Feb 2006 14:55:06 +0800 (CST)
Message-ID: <43EC38E0.9060007@wiscore.com>
Date: Fri, 10 Feb 2006 14:55:28 +0800
From: Robert Liu <robertliu@wiscore.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 summary error!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I am using Linux-2.6.10 with the lastest CVS MTD codes.
My device is a Intel IXP E.V. board, configured as a big-endian machine,
with 8M NOR flash and 32M NAND flash.

I can mount a JFFS2 partition correctly without enabling the JFFS2 
summary support.
But, I usually got warning messages, when turn on the JFFS2 summary support.
(I don't know this problem occurs unders what condition)
The following steps are used to test:
  1. flash_eraseall /dev/mtdblock/3
  2. mount -t jffs2 /dev/mtdblock/3 /mnt
  3. do some operations (mkdir, touch, dd, ...)
  4. umount /mnt
  5. mount -t jffs2 /dev/mtdblock/3 /mnt
then the warning (error!?) meesage showed:
  JFFS2 warning: (86) jffs2_sum_process_sum_data: Unsupported node type 
found in summary! Exiting...
  mount: Mounting /dev/mtdblock/3 on /mnt failed: Input/output error

I added some debug code and found the warrnig always occured with 
nodetype 02E0.
This looks like a endian problem.
Would someone help me to debug?

Regards,
Robert
