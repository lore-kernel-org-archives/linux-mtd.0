Received: from rwcrmhc53.attbi.com ([204.127.198.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194VQU-0007IA-G9
	for <linux-mtd@lists.infradead.org>; Sun, 13 Apr 2003 01:32:54 +0100
From: Arun Dharankar <ADharankar@ATTBI.Com>
To: linux-mtd@lists.infradead.org
Date: Sat, 12 Apr 2003 20:31:20 -0400
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304122031.20901.ADharankar@ATTBI.Com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Module parameters for cmdlinepart 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings!

Are there any enhancements made to the cmdlinepart  module to
pass the parition information via insmod/modprobe command line
arguments? 

I am aware of:
  - if this driver is configured to be statically linked driver into the
    Linux kernel, the partitioning information can be nicely passed
    via the bootloader. 
  - hardcoding the partitioning information into the driver.

What I am looking for is for use as a Linux kernel dynamically
loadable driver module.

Best regards,
-Arun.
