Received: from web21002.mail.yahoo.com ([216.136.227.56])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eo2M-0007fR-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 03:37:30 +0100
Message-ID: <20020814023727.35575.qmail@web21002.mail.yahoo.com>
Date: Tue, 13 Aug 2002 19:37:27 -0700 (PDT)
From: kas turi <inox_kas@yahoo.com>
Subject: Mounting JFFS2 slows console prints. 
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi
 I am running timesys linux on our custom made 8260
board. The board has a 16 bit 8M Intel flash chip. I
have defined 2 partitions. The first partition
contains ppcboot and the second partition is for
jffs2. I am using root filesystem as NFS. After the
linux boots up I mount JFFS2 filesystem onto /mnt/jffs
directory. After I do the mounting it slows down the
console output. When I type a command it takes atleast
few seconds before it appears on the console. I am
running the console at 115200. When I unmount the
JFFS2 filesystem the console output is faster. I have
configured the verbose level for JFFS2 as 0. Any idea
what is the problem?.  
  Thanks in advance

__________________________________________________
Do You Yahoo!?
HotJobs - Search Thousands of New Jobs
http://www.hotjobs.com
