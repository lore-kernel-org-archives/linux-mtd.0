From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <6BEF91EC1C3A@baydel.com>
References: <6BEF91EC1C3A@baydel.com>
Content-Type: multipart/mixed; boundary="=-rcwB6qDM26dARYnoqrsH"
Date: Sat, 20 Nov 2004 18:04:28 +0000
Message-Id: <1100973868.7949.32.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: oops line 231 of latest readinode.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rcwB6qDM26dARYnoqrsH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-11-17 at 15:56 +0000, Simon Haynes wrote:
> In my case all arguments appear to be valid kernel addresses. The call to 
> jffs2_lookup_node_frag returns a 0.  So the 'if (this)' takes the else route 
> and lastend is set to 0. We then execute the code in if (lastend <= 
> newfrag->ofs)' and then in the next if as newfrag->ofs contains -1. The oops 
> is produced by the line 'if(this->node)' because this is 0. I have checked 
> this against the latest CVS code and it would seem that this could still 
> happen.
> 
> I don't really know the flow of the code here but could I just put 
> 'if(this)' in front of 'if(this->node)' or is there some other more serious 
> problem here.

Looks like a correct diagnosis and cure; thanks. 

This can only happen 
if ((lastend-1) >> PAGE_CACHE_SHIFT == newfrag->ofs >> PAGE_CACHE_SHIFT)

That's if you have no previous nodes in the fragtree, and the _first_
node it finds is in the range 0xFFFFF000-0xFFFFFFFF (the last possible
page of the file).

Do you have a file with data in that range? This will trigger only if
garbage collection has happened such that a node in that range is the
one with the lowest version number.

Actually I'm not going to make it also depend on (this) but on (lastend)
since it keeps the logic in the above statement consistent, and has much
the same effect.


-- 
dwmw2

--=-rcwB6qDM26dARYnoqrsH
Content-Disposition: inline
Content-Description: Attached message - mtd/fs/jffs2 readinode.c,1.116,1.117
Content-Type: message/rfc822

Return-path: <linux-mtd-cvs-bounces+dwmw2=infradead.org@lists.infradead.org>
Envelope-to: dwmw2@baythorne.infradead.org
Delivery-date: Sat, 20 Nov 2004 18:00:03 +0000
Received: from [2002:cde9:da46::1] (helo=canuck.infradead.org) by
	baythorne.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVZWk-0007PD-Sm for dwmw2@baythorne.infradead.org; Sat, 20 Nov 2004
	18:00:03 +0000
Received: from localhost ([127.0.0.1] helo=canuck.infradead.org) by
	canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux)) id
	1CVZdZ-0008EH-OJ; Sat, 20 Nov 2004 13:07:05 -0500
Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux)) id
	1CVZdT-0008EC-AZ for linux-mtd-cvs@canuck.infradead.org;
	Sat, 20 Nov 2004 13:06:59 -0500
Received: from dwmw2 by phoenix.infradead.org with local (Exim 4.42 #1 (Red
	Hat Linux)) id 1CVZdR-0005FE-0x for linux-mtd-cvs@lists.infradead.org;
	Sat, 20 Nov 2004 18:06:57 +0000
Content-Type: TEXT/PLAIN; charset=US-ASCII
To: linux-mtd-cvs@lists.infradead.org
X-CVS-Module: mtd
X-CVS-Directory: mtd/fs/jffs2
Precedence: first-class
Message-Id: <E1CVZdR-0005FE-0x@phoenix.infradead.org>
From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2004 18:06:57 +0000
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
	phoenix.infradead.org See http://www.infradead.org/rpr.html
Subject: mtd/fs/jffs2 readinode.c,1.116,1.117
X-BeenThere: linux-mtd-cvs@lists.infradead.org
X-Mailman-Version: 2.1.5
List-Id: Linux MTD CVS commit list <linux-mtd-cvs.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd-cvs>
List-Post: <mailto:linux-mtd-cvs@lists.infradead.org>
List-Help: <mailto:linux-mtd-cvs-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs>,
	<mailto:linux-mtd-cvs-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-cvs-bounces@lists.infradead.org
Errors-To: linux-mtd-cvs-bounces+dwmw2=infradead.org+dwmw2=infradead.org@lists.infradead.org
X-Evolution-Source: imap://dwmw2@pentafluge.infradead.org/
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Update of /home/cvs/mtd/fs/jffs2
In directory phoenix.infradead.org:/tmp/cvs-serv20158

Modified Files:
	readinode.c 
Log Message:
Fix oops if we happen to have a node in the range 0xfffff000 onwards as the
lowest versioned node in the inode.


Index: readinode.c
===================================================================
RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.116
retrieving revision 1.117
diff -u -r1.116 -r1.117
--- readinode.c	16 Nov 2004 20:36:12 -0000	1.116
+++ readinode.c	20 Nov 2004 18:06:54 -0000	1.117
@@ -227,7 +227,7 @@
 		   If so, both 'this' and the new node get marked REF_NORMAL so
 		   the GC can take a look.
 		*/
-		if ((lastend-1) >> PAGE_CACHE_SHIFT == newfrag->ofs >> PAGE_CACHE_SHIFT) {
+		if (lastend && (lastend-1) >> PAGE_CACHE_SHIFT == newfrag->ofs >> PAGE_CACHE_SHIFT) {
 			if (this->node)
 				mark_ref_normal(this->node->raw);
 			mark_ref_normal(newfrag->node->raw);


__________________________________________________________
Linux-MTD CVS commit list
http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/

--=-rcwB6qDM26dARYnoqrsH--
