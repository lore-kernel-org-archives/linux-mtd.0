Received: from law10-oe58.law10.hotmail.com ([64.4.14.193] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ay6TI-0006N9-1u
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2004 09:45:52 +0000
From: "Kishore" <kishoreseera@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 2 Mar 2004 15:21:35 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-ID: <LAW10-OE5849dFetJab0002da50@hotmail.com>
Subject: NetSC520 Demo board Network IP Problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dear All,
                      I'm working on NetSC520 demonstration board with Elan
SC520 microcontroller. I downloaded the zfi.bin (kernel Image) and
FlashFs.bin (File system) from the AMD site and loaded both the binaries
onto the target.  In the /etc/rc.d/inid.d directory there is S20network
file. In the file the IP address of the target board is defined as
163.181.x.x.  Now I want to change the IP address to 192.168.16.x. How
should I change the IP address of the target board. I don't have the source
files for the Flash File system. Or anyone who worked on the above board,
please help me to build a flash file system. Anybody's reply would be
helpful to me.

with Regards,
Kishore.S.Kumar
