Received: from zeus.bridgeport.edu ([216.87.96.66])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDm2o-0000FV-VU
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2005 12:48:16 -0400
From: itche <itche@bridgeport.edu>
To: uclinux-dev@uclinux.org
Date: Fri, 9 Sep 2005 12:47:42 -0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200509091247.42340.itche@bridgeport.edu>
Cc: linux-mtd@lists.infradead.org
Subject: MTD help
Reply-To: itche@bridgeport.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello all, 
thanks for all those who replied to my previous messages.
I am still stuck.
I am trying to make this nand to work
i can get the device id and creating the partitions with no problem.
i have a problem with erasing, mounting, etc.
i think my problem lies with the R/!B line.
it is connected to my 5272 on PB4.
i have no problem to access the other control lines.
how do i "make" the driver to look at this line on PB4?
is there a file where these definitions are defined?

i am using uclinux 2.4.19 
i have modified NAND.C and created my own board specific .C fie as well.  

thanks in advance 
Isack
