Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14yyrU-0005r2-00
	for <linux-mtd@lists.infradead.org>; Sun, 13 May 2001 17:36:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <617933180D08D311AB500090273F1F96016767EB@storm.corp.directvbroadband.net> 
References: <617933180D08D311AB500090273F1F96016767EB@storm.corp.directvbroadband.net> 
To: "Fry, Dan" <dfry@bb.directv.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mips compiler controversy 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 13 May 2001 17:40:41 +0100
Message-ID: <22394.989772041@redhat.com>
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

dfry@bb.directv.com said:
> 	Mips doesn't seem to compile the JFFS2 code as is.  In write.c within
> function jffs2_new_inode there is an undefined reference to
> new_inode(). 

It's an inline function in newer kernels. See include/linux/fs.h I think.

JFFS2 certainly does work on MIPS.

--
dwmw2
