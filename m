Received: from [210.17.210.210] (helo=mail.avantwave.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CkDSO-0004F3-Lf
	for linux-mtd@lists.infradead.org; Thu, 30 Dec 2004 22:28:06 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id iBV3RSXb014258
	for <linux-mtd@lists.infradead.org>; Fri, 31 Dec 2004 11:27:28 +0800
Message-ID: <41D4C9AC.6020901@avantwave.com>
Date: Fri, 31 Dec 2004 11:38:20 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: porting to new flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all
    I have a development board with using 32 bit bus AMD flash and now 
move to 8-bit AM29LV652d. What do i need to do with my kernel mtd 
mapping? Just change the size, buswidth?
    As i have not yet got the new flash from hardware engineer, i am now 
just imagining and preparing the problem. I am wonder if anyone can give 
me a checklist or some hints on that.

best regard
Mike,Lee
