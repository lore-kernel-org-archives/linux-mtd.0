Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AEHu-00038a-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 17:50:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1007229199.1713.4.camel@gromit> 
References: <1007229199.1713.4.camel@gromit>  <1007224058.1712.2.camel@gromit> <27599.1007225846@redhat.com> 
To: Michael Rothwell <rothwell@holly-springs.nc.us>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2: cannot execute /bin/bash: Permission denied 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 18:01:32 +0000
Message-ID: <29225.1007229692@redhat.com>
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

Dec  1 12:43:51 gromit kernel: Argh. Special inode #1589 had more than
one node
Dec  1 12:48:43 gromit kernel: Eep. read_inode() failed for ino #1589
Dec  1 12:48:43 gromit last message repeated 96 times

Hmmm. Device nodes, symlinks etc should have only one valid physical node at
any time. It's strange that your filesystem has violated that. Can I have a 
complete copy of the JFFS2 filesystem?

I should make jffs2_read_inode() recover better from this situation. 
Currently, it's just failing to read that inode, and the GC then gets stuck 
because it requires jffs2_read_inode() to succeed. I need to make the GC 
deal with that situation too.

 
--
dwmw2
