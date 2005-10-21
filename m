Received: from mail.ureach.com ([63.150.151.36] helo=ureach.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESuiY-0006ql-02
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2005 07:05:50 -0400
Date: Fri, 21 Oct 2005 07:05:30 -0400
Message-Id: <200510211105.HAA13098@www23.ureach.com>
To: ktdann@gmail.com, linux-mtd@lists.infradead.org
From: yogesh shivabasappa <yogesh@ureach.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Cc: 
Subject: NOR with out file system
Reply-To: yogesh@ureach.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi 
 I have a nor flash in our custom board. My boot loader image
will be in NAND flash. Nand flash has jffs2 fils system.
The NOR flash does not have a filesystem.
Then the read(), write() calls from the appication 
to copy the boot image from the NAND to NOR maps to which
calls??

regards

yogesh s
 


________________________________________________
Get your own "800" number
Voicemail, fax, email, and a lot more
http://www.ureach.com/reg/tag
