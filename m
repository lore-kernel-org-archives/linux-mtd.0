Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFoIg-0002ef-IR
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 10:18:21 +0000
Message-ID: <47907CDF.30802@dave-tech.it>
Date: Fri, 18 Jan 2008 11:18:07 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: sshahrom@micron.com
Subject: Micron NAND support in linux MTD
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found on MTD mailing list your patch that adds Micron manufacturer ID:
http://article.gmane.org/gmane.linux.drivers.mtd/17694

I'm going to use NAND Micron devices for a new project however I still 
have a doubt about how MTD/JFFS2 handle bad blocks. To detect blocks 
marked as bad it checks the 6th location of OOB area of first page, thus 
it seems it is not able to handle Micron devices properly. In fact these 
devices stores bad block marker in the first location of OOB of first or 
second page (for example see page 50 of MT29F1GxxABB data sheet). Am I 
misreading the datasheet? Could you help me to clear this point?


Thanks in advance,
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave-tech.it
email: r&d2@dave-tech.it
