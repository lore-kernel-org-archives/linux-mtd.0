Received: from c51008675.inet.catch.no ([81.0.134.117] helo=tronrud.no)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C3XLt-0007rP-0f
	for linux-mtd@lists.infradead.org; Sat, 04 Sep 2004 06:00:58 -0400
Received: from mail by tronrud.no with SMTP (MDaemon.v3.5.0.R)
	for <linux-mtd@lists.infradead.org>; Sat, 04 Sep 2004 12:02:27 +0200
From: "Jan Vestby" <jan@tronrud.no>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 4 Sep 2004 12:02:38 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <MDAEMON-F200409041202.AA022737md50000535465@tronrud.no>
Subject: Using partitions on DOC2000 (nftl)
Reply-To: jan@tronrud.no
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


The new diskonchip code can handle one additional partition beyond the
formatted part.
I have only been able to use this by invoking the dformat /SIZE option in
the 
4.2 version of the DOS utilities. Howvever, this option is rather brutal: 
bad block table entries beyond the new "size" is silently dropped.

Formatting the DOC with the /USE percentage option preserves the bbt data.
The resulting smaller size shows up in nftl media header entry
FormattedSize.

Is there any problems with using this parameter to perform the partioning, 
or have I overlooked something ?


Regards
jan vestby
