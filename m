Received: from [208.28.249.7] (helo=ktc_internet)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MIXD-0002lT-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 00:48:35 +0000
Subject: JFFS II Performance
To: linux-mtd@lists.infradead.org
Message-ID: <OF1FA9A659.B3900388-ON88256B37.000396BC@LocalDomain>
From: Steve_Chen@kingston.com
Date: Thu, 3 Jan 2002 16:51:05 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
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

Hi all,
We have just ported the JFFS II source code to Linux kernel "2.4.6".  And
we like to report a performance issue on JFFS II.  Comparing to JFFS, the
"mount" , "copy" and "ls" all take much longer to complete.  In one case,
we have 3 files on a flash NAND partition.  The size of first  two files is
1717 bytes, the size of the third file is 2M bytes.  After the JFFS II was
mounted (took 30 seconds), it took 35 seconds to complete the "ls -la"
command.

I like to get some expert advice.

Did anyone experience a similar performance issue on JFFS II when dealing
with large files ?

Thanks.
Steve...
