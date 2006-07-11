Received: from bay0-omc2-s34.bay0.hotmail.com ([65.54.246.170])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G0QyE-0000h1-IF
	for linux-mtd@lists.infradead.org; Tue, 11 Jul 2006 18:44:56 -0400
Message-ID: <BAY110-F38A943ADF26D7AEF738A26BC680@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: File size limitation on JFFS2.
Date: Tue, 11 Jul 2006 15:32:08 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to put a file of size 1G on the JFFS2/NAND. I got "Out of Memory" 
error. Looks like the max size of file I can put on it is 500M, though my 
NAND has 2G space. This is on Linux. I noticed JFFS2 is using filemap in the 
Linux mm, where it crashed. Any help?

Thanks,
Han
