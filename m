Received: from web14905.mail.yahoo.com ([216.136.225.57])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kkuG-0006JZ-00
	for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2002 13:29:44 +0100
Message-ID: <20020830122942.61137.qmail@web14905.mail.yahoo.com>
Date: Fri, 30 Aug 2002 05:29:42 -0700 (PDT)
From: Sriram Neelakandan Iyer <sriramneelakandan@yahoo.com>
Reply-To: sriramneelakandan@yahoo.com
Subject: jffs2 with rootmount_flags = rw
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

I have a jffs2 root partition mounted thru MTD.
I would like to know if i can mount jffs2 as rw
directly from mount_root().
In other words are there any implications if i do a
read_super on jjfs2 with root_mountflags = rw.

Read only mount make sense for filesystems that could 
be fscked.. but on jffs2 what is the use of mounting
read only. and i am going to always do a remount,rw

tia
sriram



__________________________________________________
Do You Yahoo!?
Yahoo! Finance - Get real-time stock quotes
http://finance.yahoo.com
