Received: from [195.134.130.80] (helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19l3Xq-0004Gt-Mj
	for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2003 10:28:22 +0100
Received: from elsoft.ch (IDENT:1000@pcdm.elsoft.loc [192.168.11.10])
	h789S8In029716
	for <linux-mtd@lists.infradead.org>; Fri, 8 Aug 2003 11:28:10 +0200
Message-ID: <3F336DA8.4040706@elsoft.ch>
Date: Fri, 08 Aug 2003 11:30:16 +0200
From: =?ISO-8859-1?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: Tips and Tricks for S3C2410 NAND controller? 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

I have written a hardware driver for the NAND controller built in
Samsung's S3C2410 SoC. I followed the instruction on
http://linux-mtd.infradead.org/tech/nand.html to implement it but it
doesn't seem to work correctly.

Does anybody have some tricks or ideas what needs to be specially
observed when using this controller?

TIA

Dave
