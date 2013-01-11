Received: from mail.hostingconnect.net ([72.18.140.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TtYHF-00076s-Kk
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 06:39:42 +0000
Received: from localhost (localhost [127.0.0.1])
 by brd.matrixcomsec.com (Postfix) with ESMTP id 3EE1517104A3
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2013 12:08:23 +0530 (IST)
Message-ID: <20130111120823.74341p4jvugnac80@192.168.50.55>
Date: Fri, 11 Jan 2013 12:08:23 +0530
From: PrakashKamliya <prakash.kamliya@matrixcomsec.com>
To: linux-mtd@lists.infradead.org
Subject: how to use latest JFFS2 and MTD code and port to older kernel 2.6.35
MIME-Version: 1.0
Content-Type: text/plain;
	charset=;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi There,

We are using linux 2.6.35 given by the vendor. we are facing issue  
with the JFFS2 file system. When ever i download any tar.gz file to  
the filesystem using ftp of my board and when i do reboot to this  
board i get kenel panic on next reboot . We have mounted JFFS2 as a  
root filesystem of our board

i found there are many changes in the JFFS2 and MTD driver since then.  
I wanted to use the latest JFFS2 and MTD drivers to the older 2.6.35  
kernel. How would i achieve this ?

thanks in advance.

prakash
