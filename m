Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192oMK-00012W-Og
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 09:21:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <3E927803.9060205@imc-berlin.de>
References: <3E927803.9060205@imc-berlin.de>
Message-Id: <1049790098.18045.91.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 08 Apr 2003 09:21:38 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: Inode corrupted after CVS update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-04-08 at 08:19, Steven Scholz wrote:
> I pulled the CVS yesterday, patched my linuxppc-2.4.20, build and 
> flashed my image.

> I am using JFFS2 as root fs. While booting I get loads of
> 
> ...
> jffs2_get_inode_nodes(): Inode corrupted at 0x000ff370, totlen 70, 
> #ino  130, version 1, isize 0, csize 2, dsize 2

Argh. device nodes have data in the nodes but isize is zero, triggering
an overly-zealous sanity check. Fixed in cvs...

-- 
dwmw2
