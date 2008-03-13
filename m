Received: from mail.feig.de ([212.184.177.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZkr7-00053Z-Fs
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 10:40:14 +0000
Message-ID: <47D90489.5090909@feig.de>
Date: Thu, 13 Mar 2008 11:40:09 +0100
From: Manuel Sahm <Manuel.Sahm@feig.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd-utils 1.0.1 Cross Compile error
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I want to CrossCompile mtd-utils 1.0.1 with an ARM Crossompiler but 
through the process an error occurs:

mkfs.jffs2.c68:21 sys/acl.h: No such file or directory
mkfs.jffs2.c: In function 'formalize_posix_acl' :
.
.
.
.

with Version 1.0.0 all works ?

What could be the problem ?

Thank you

Best regards 

Manuel Sahm	
