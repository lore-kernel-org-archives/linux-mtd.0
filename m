Received: from wellington.concentric.net ([207.155.252.14]
	helo=wellington.cnchost.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7Nox-0007U7-PY
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 21:43:30 -0400
Errors-To: <arvind@4access-comm.com>
Message-ID: <035a01c5a783$65057ce0$6501a8c0@arvindwin2000>
From: "Arvind Agrawal" <arvind@4access-comm.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 22 Aug 2005 18:38:42 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: NAND support in BLOB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We have been using BLOB on a Lubbock Board using Intel Streta flash.
 Now we are planning on using a ST Micro NAND flash and boot from
 EPROM. Still need NAND support to Read linux Kernel Image in memory
 and to be able to write images on the NAND flash.
 
I was wondering if anybody already has such a solution which we can port
 or help in changing the existing Blob to support NAND.

thanks,

Arvind
