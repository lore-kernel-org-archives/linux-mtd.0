Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DGNv6-0000dk-1w
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2005 22:06:41 +0100
Received: from superfortress.nrl.navy.mil ([132.250.130.208])
	by osdsun1.nrl.navy.mil with esmtp (Exim 3.35 #1 (Debian))
	id 1DGNfI-0001tj-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2005 15:50:20 -0500
Message-ID: <4249C357.2040600@ieee.org>
Date: Tue, 29 Mar 2005 16:06:31 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As promised (albeit somewhat delayed), I have just checked into CVS some 
changes to DOCBoot supporting NFTL-based DOC2000 devices.  Full 
instructions are contained in the updated README file.

Please note that changes to the diskonchip driver were required in order 
to get this working.  I have just checked them in as well.  You WILL 
need to update the diskonchip driver in order to use DOCBoot on 
NFTL-based DOC2000 devices.

PLEASE PLEASE help me test this.  I've given it only the most cursory 
testing.  Let me know if it works for you.

Thanks,
	Dan Brown
