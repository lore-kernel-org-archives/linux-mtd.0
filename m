Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GrxG9-0003Re-B0
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 08:56:31 -0500
Message-ID: <4576CC07.2000107@valcom.com>
Date: Wed, 06 Dec 2006 08:56:23 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: mkfs.jffs2 not compiling, which acl.h?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux-mtd,
First off I am using uClinux-dist 2006-08-03 source code with the
m68k-uclinux-tools-20060615 cross compiler.  What I am trying to do is
compile the latest version of the mtd-utils.  I used git to retrieve the
latest version of the mtd-utils and put those files into
uClinux-dist/user/mtd-utils directory.  When I run make the compile
stops complaining that it can't find <sys/acl.h> and then gives errors
like listed below.
mkfs.jffs2.c:1093: error: 'ACL_MASK' undeclared (first use in this function)
mkfs.jffs2.c:1094: error: 'ACL_OTHER' undeclared (first use in this
function)
mkfs.jffs2.c:1100: error: 'ACL_USER' undeclared (first use in this function)
mkfs.jffs2.c:1101: error: 'ACL_GROUP' undeclared (first use in this
function)

I ran find uClinux-dist/ -name acl.h and got this list of files.
./linux-2.6.x/include/config/fs/posix/acl.h
./linux-2.6.x/fs/ext3/acl.h
./linux-2.6.x/fs/ext2/acl.h
./user/asterisk/include/asterisk/acl.h
./user/bind/lib/dns/include/dns/acl.h

After checking each of these files I found that ACL_* were not defined
in any of them.  I then ran grep -r ACL_MASK ./ and found ACL_MASK was
defined in the header file <linux/posix_acl.h> .  I tried #include
<linux/posix_acl.h> in place of <sys/acl.h> and got warnings about not
other info.  If I #include <asm-m68knommu/atomic.h> all the warnings and
errors dissappear.

Do I really have to include both <asm-m68knommu/atomic.h> and
<linux/posix_acl.h> in place of <sys/acl.h>?  By the way I never found
sys/acl.h anywhere in uClinux-dist.  What is the proper way to handle this?
Thank you,
Glen Johnson
