Received: from mail3.uklinux.net ([80.84.72.33])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIYMG-0006gp-R3
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 16:44:19 -0500
Message-ID: <441496CE.3050302@stafford.uklinux.net>
Date: Sun, 12 Mar 2006 21:46:54 +0000
From: Brian Stafford <brian@stafford.uklinux.net>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Building at91_nand.c for 2.6.15
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm trying to build a 2.6.15.3 kernel for the AT91RM9200 patched with 
current mtd from CVS and 2.6.15-at91.patch.gz (in that order), however 
compilation fails on at91_nand.c because struct at91_nand_data is not 
defined.  I would have expected the declaration of this struct to be in 
one of the at91 header files but I cannot find it mentioned in any other 
source files.  Any idea where I should be looking?

Thanks
Brian
