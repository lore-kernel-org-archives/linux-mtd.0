Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18JcJD-0008DW-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2002 16:23:35 +0000
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id gB4Gs8lg026458
	for <linux-mtd@lists.infradead.org>; Wed, 4 Dec 2002 10:54:08 -0600 (CST)
Received: from arlut.utexas.edu (koffer.arlut.utexas.edu [10.8.17.114])
	by ns5.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id gB4Gs61j014205
	for <linux-mtd@lists.infradead.org>; Wed, 4 Dec 2002 10:54:06 -0600 (CST)
Date: Wed, 4 Dec 2002 10:54:06 -0600
Mime-Version: 1.0 (Apple Message framework v548)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Subject: Problem: 51MB partition max size on jffs2
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <0067E3B6-07A9-11D7-937A-000393467F1A@arlut.utexas.edu>
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

I've run into a strange problem and I wonder if any of you have seen 
this and perhaps understand it better.

I've got a Toshiba 128MB Smart Card in my embedded system and I wrote a 
custom nand driver to support it.  I have discovered that I cannot 
mount a jffs2 partition larger than 51MB on the card (so at this point 
I have two 51MB partitions and 1 26MB partition).  Trying to mount a 
larger partition yields a less than helpful error message from mount.  
I've tried adding printk statements to the jffs2 code, but none of them 
get hit during the errant mount process.

So... is 51MB a valid jffs2 limitation?  If so, why?

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
