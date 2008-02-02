Received: from vsnlchnsym02.vsnlxchange.com ([59.163.96.4])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JLIhu-0005Xw-LG
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 13:47:05 +0000
Received: from vsnlchnsym02.vsnlxchange.com (unknown [127.0.0.1])
	by vsnlchnsym02.vsnlxchange.com (Symantec Mail Security) with ESMTP id
	4C9FB52009E for <linux-mtd@lists.infradead.org>;
	Sat,  2 Feb 2008 19:16:55 +0530 (IST)
From: "vishalk" <vishalk@tataelxsi.co.in>
To: <linux-mtd@lists.infradead.org>
Subject: how to access nand flash from user space 
Date: Sat, 2 Feb 2008 19:19:15 +0530
Message-ID: <002201c865a2$66fa34c0$65053c0a@telxsi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
content-transfer-encoding: 7bit
Reply-To: vishalk@tataelxsi.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have been trying to access nand flash from user space.
I am using the functions 'mtd_write' and 'mtd_read' in mtdchar.c .
when I include the mtd.h file, I get compilation errors pertaining to the
mtd.h file. can someone please tell me how to access these functions 
from user space.

Thanks,
VK  

The information contained in this electronic message and any attachments to this message are intended for the exclusive use of the addressee(s) and may contain proprietary, confidential or privileged information. If you are not the intended recipient, you should not disseminate, distribute or copy this e-mail. Please notify the sender immediately and destroy all copies of this message and any attachments contained in it.

Contact your Administrator for further information.
