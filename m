Received: from smtp5.libero.it ([193.70.192.55])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRvEm-0007hS-UN
	for linux-mtd@lists.infradead.org; Fri, 07 Apr 2006 13:59:18 -0400
Received: from localhost (172.16.1.48) by smtp5.libero.it (7.0.027-DD01)
	id 43F225CF0511F1FC for linux-mtd@lists.infradead.org;
	Fri, 7 Apr 2006 19:59:10 +0200
Received: from smtp2.libero.it ([172.16.1.225])
	by localhost (asav8.libero.it [193.70.193.94]) (amavisd-new, port 10024)
	with ESMTP id 23418-02 for <linux-mtd@lists.infradead.org>;
	Fri,  7 Apr 2006 19:59:10 +0200 (CEST)
Received: from [151.28.241.13] (ppp-13-241.28-151.libero.it [151.28.241.13])
	by smtp2.libero.it (Postfix) with ESMTP id 15259A8C23
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Apr 2006 19:59:08 +0200 (MEST)
Message-ID: <4436A961.7050209@libero.it>
Date: Fri, 07 Apr 2006 20:03:13 +0200
From: Massimiliano Galanti <massiblue@libero.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: checking write_cached_data return status inside _release and _flush?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi!

i experienced some corruption of data on flash memories i am using, and
discovered that this is related to these functions in mtdblock.c:

	static int mtdblock_release(struct mtd_blktrans_dev *mbd)
	static int mtdblock_flush(struct mtd_blktrans_dev *dev)

not checking the return value of the function:

         write_cached_data(mtdblk)

i fixed that by checking the return value inside a while cycle but is 
there any particular reason the original code is written that way?

Thank you.

-- 
Massimiliano Galanti

-IM-----------------------
MSN:  viperzed@hotmail.com
Yahoo: massimilianogalanti
ICQ:             227544335
Skype: massimilianogalanti
--------------------------
