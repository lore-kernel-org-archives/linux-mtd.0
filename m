Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170rTo-00008S-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 23:12:44 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 170rKM-00060i-00
	for linux-mtd@lists.infradead.org; Thu, 25 Apr 2002 16:02:58 -0600
Message-ID: <3CC87F1F.2010407@yottayotta.com>
Date: Thu, 25 Apr 2002 16:11:43 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: removing invalidate_device makes it boot /dev/mtdblock/0
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

I got past my last problem (last post by me today) by erasing 
invalidate_device line in mtdblock_release

Is this OK? I'm using 2.4.18-rmk3

Murtada
