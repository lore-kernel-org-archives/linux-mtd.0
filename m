Received: from relay1.clb.oleane.net ([213.56.31.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HTeF-0000EA-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 18:44:27 +0000
Received: from dg ([217.167.163.86])
	by relay1.clb.oleane.net with SMTP id gASJEoU1002990
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 20:14:53 +0100
From: "Damien GERANTON" <dgeranton@alpha3i.com>
To: "MTD mailing liste" <linux-mtd@lists.infradead.org>
Subject: JFFS/MTD and Raw access
Date: Thu, 28 Nov 2002 17:21:40 +0100
Message-ID: <BNEJIGKFJNJLELKBCMDAMEFGCEAA.dgeranton@alpha3i.com>
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

Hello,

I face a strange problem, i use MTD with JFFS and i want to clone my systeme
from one card
to another.
I thought that some think like :
dd if=/dev/mtd0 of=/master.img

and

dd if=/master.img of=/dev/mtd0

But it does not work, if after i do

dd if=/dev/mtd0 of=/test.img
diff test.img master.img
i says they are different.

Is it normal.

Is RAW acces really RAW ?

Do i miss some think ?

Thanks

PS : I use MTD on 2.2.17 kernel
