Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17K9Jy-0003pO-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 04:06:18 +0100
Received: from emsoftltd.com (ip-244-195.cyberec.com [202.60.244.195])
	by school.cyberec.com (8.11.6/8.11.6) with ESMTP id g5I369T26020
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 11:06:12 +0800
Message-ID: <3D0EA22F.9050801@emsoftltd.com>
Date: Tue, 18 Jun 2002 10:59:59 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How to configure MTD so that JFFS2 work on 7312 NandFlash?
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi all,
    I am trying to configure MTD NandFlash and JFFS2 on EP7312 NandFlash 
driver.
However, when I try to access, it output "I/O Error".
But when the kernel bootup, I can see that the kernel successfully find 
out the nandflash device. So how can I make the JFFS2 and MTD work on 7312?

-- 
Best Regards,

Jason Chan
Emsoft Ltd.
