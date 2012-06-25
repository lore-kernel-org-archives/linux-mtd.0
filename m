Received: from dmz4.rosetechnology.dk ([95.154.61.7])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjA5x-0000hm-My
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2012 14:16:50 +0000
Received: from smlws1.rosetechnology.dk (unknown [95.154.61.6])
 by dmz4.rosetechnology.dk (Postfix) with ESMTPA id D72ADA05EC
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2012 16:16:35 +0200 (CEST)
Message-ID: <4FE872C3.1020402@rosetechnology.dk>
Date: Mon, 25 Jun 2012 16:16:35 +0200
From: =?ISO-8859-1?Q?Steven_Munk_=D8stergaard?= <sml@rosetechnology.dk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: How does UBI FS handle invalid PEB on nand flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Been reading all of the available documentation on UBI and UBIFS but I 
cannot  find a clear statement on how UBIFS handles production marked 
invalid PEB's, and if their location is saved; So when a format is done, 
this information is not lost.

is there a way to make sure UBIFS allways checks for production marked 
invalid PEB's when a device is started the first time?

Thanks in advance, hope the questions aren't too stupid. :)

- Steven Lauridsen
