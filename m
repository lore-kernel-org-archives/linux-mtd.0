Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ktqv-0007A7-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 23:02:53 +0100
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7UM2olg055654
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 17:02:50 -0500 (CDT)
Received: from koffer.arlut.utexas.edu (koffer.arlut.utexas.edu [10.8.17.114])
	by ns5.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7UM2n1j074323
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 17:02:49 -0500 (CDT)
Date: Fri, 30 Aug 2002 17:02:48 -0500
Mime-Version: 1.0 (Apple Message framework v543)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Subject: Smart card 64 MB v. 128 MB
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <3850FE6A-BC64-11D6-9352-000393467F1A@arlut.utexas.edu>
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

Hello all,

Does anyone know why a nand-driver which works for a 64 MB smart card 
would NOT work for a 128 MB smart card?  I've checked the data sheets 
and the two devices look very similar (same block size, same ecc size, 
same 22-pads, etc.)  My driver mounts the device just fine but when I 
try to erase I get I/O errors.  I'm going to look into the software 
side of this but I thought I'd consult the group to find if there are 
any hardware issues.

Thanks!

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
