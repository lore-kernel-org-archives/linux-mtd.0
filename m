Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EY1np-0000Ws-T9
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2005 08:40:25 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id jA4DeIZi004914
	for <linux-mtd@lists.infradead.org>; Fri, 4 Nov 2005 08:40:18 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	jA4DeHBu060316
	for <linux-mtd@lists.infradead.org>; Fri, 4 Nov 2005 08:40:17 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id jA4DeHZO027705
	for <linux-mtd@lists.infradead.org>; Fri, 4 Nov 2005 08:40:17 -0500
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.29])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id jA4DeHRi027533
	for <linux-mtd@lists.infradead.org>; Fri, 4 Nov 2005 08:40:17 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Fri, 04 Nov 2005 07:40:05 -0600
Message-Id: <1131111605.3681.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [Fwd: mtd/fs/jffs2 erase.c, 1.85, 1.86 fs.c, 1.66, 1.67
	nodelist.h, 1.140, 1.141 nodemgmt.c, 1.127, 1.128 os-linux.h, 1.64,
	1.65
	scan.c, 1.125, 1.126 summary.c, 1.4, 1.5 summary.h, 1.2, 1.3 wbuf.c,
	1.100, 1.101]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-------- Forwarded Message --------
> From: Forrest Zhao <forrest.zhao@intel.com>
> To: linux-mtd-cvs@lists.infradead.org
> Subject: mtd/fs/jffs2 erase.c, 1.85, 1.86 fs.c, 1.66, 1.67 nodelist.h,
> 1.140, 1.141 nodemgmt.c, 1.127, 1.128 os-linux.h, 1.64, 1.65 scan.c,
> 1.125, 1.126 summary.c, 1.4, 1.5 summary.h, 1.2, 1.3 wbuf.c, 1.100,
> 1.101
> Date: Fri, 04 Nov 2005 08:06:28 +0000
> 
> Update of /home/cvs/mtd/fs/jffs2
> In directory phoenix.infradead.org:/tmp/cvs-serv31513/fs/jffs2
> 
> Modified Files:
> 	erase.c fs.c nodelist.h nodemgmt.c os-linux.h scan.c summary.c 
> 	summary.h wbuf.c 
> Log Message:
> Clean marker is gone! This patch introduce Erase Block Header(EBH) to JFFS2. EBH resides at the beginning of each eraseb block and carries the meta data for that erase block. If you want to add new per-erase-block information, you may use EBH to make extension. Now we record the erase count of each erase block in EBH.
> Also this patch modified the user-space utilities to make them accormodate to EBH.

Erm... why did this get merged?  I don't recall a consensus on it yet.
And I thought we had said we were going to wait until the current code
was sync'd with Linus...

josh
