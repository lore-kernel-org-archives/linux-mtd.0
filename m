Received: from school.cyberec.com ([202.153.122.103])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Jrb4-0002CR-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 09:10:47 +0100
Received: from emsoftltd.com (ip-244-195.cyberec.com [202.60.244.195])
	by school.cyberec.com (8.11.6/8.11.6) with ESMTP id g5H8AhT22415
	for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2002 16:10:43 +0800
Message-ID: <3D0D981D.8040602@emsoftltd.com>
Date: Mon, 17 Jun 2002 16:04:45 +0800
From: Jason Chan <jason@emsoftltd.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Bad Block management routine for MTD NandFlash driver?
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
    Any bad block management routine (eg. Invalid block table ) is 
implemented for MTD NandFlash driver?
It seems that the ECC routine is not enough for my nandflash driver. And 
I need a more robust bad block management routine for that. Should I 
implement the invalid block table by myself, or there are some already 
implemented?

-- 
Best Regards,

Jason Chan
Emsoft Ltd.
