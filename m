Received: from gambit.linux.uk.assimilatedservers.net ([80.253.99.20]
	helo=mail1.uk.assimilatedservers.net)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ahdap-0001S3-0n
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2004 23:41:35 +0000
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 16 Jan 2004 23:39:10 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200401162339.10448.david@avoncliff.com>
Subject: Run out of memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I am running on a 486 with 4meg ram, and using mtd flash driver and jffs2, and 
I have now run out of ram.
As a very general guide can someone give me an idea how much ram the mtd 
driver and the jffs2 code should use up.
In round figures the kernel is using 2meg code,data,reserved, and free shows 
1700k used 300k free, before I try to run anything.

Some hints of whether this looks normal or odd would be much appreciated.
David
