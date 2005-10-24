Received: from smtprelay02.ispgateway.de ([80.67.18.14])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ETzgV-0007jq-VG
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 06:36:13 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.89.151])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay02.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 24 Oct 2005 10:36:05 -0000
Received: from [192.168.0.63] (unknown [192.168.0.63])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id 2EA8265FE
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Oct 2005 12:35:03 +0200 (CEST)
Message-ID: <435CB911.4060005@gmail.com>
Date: Mon, 24 Oct 2005 12:36:01 +0200
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Subject: malloc.c:100: error: dereferencing pointer to incomplete type /
	dbg_memalloc()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

when trying to compile latest CVS MTD with JFFS2_FS_DEBUG=2 I get the 
following compiling errors on dbg_memalloc():

>   CC      fs/jffs2/malloc.o
> fs/jffs2/malloc.c: In function `jffs2_alloc_full_dirent':
> fs/jffs2/malloc.c:100: error: dereferencing pointer to incomplete type
> fs/jffs2/malloc.c: In function `jffs2_free_full_dirent':
> fs/jffs2/malloc.c:106: error: dereferencing pointer to incomplete type
> [...]
> fs/jffs2/malloc.c: In function `jffs2_alloc_inode_cache':
> fs/jffs2/malloc.c:199: error: dereferencing pointer to incomplete type
> fs/jffs2/malloc.c: In function `jffs2_free_inode_cache':
> fs/jffs2/malloc.c:205: error: dereferencing pointer to incomplete type
> make[2]: *** [fs/jffs2/malloc.o] Error 1
> make[1]: *** [fs/jffs2] Error 2
> make: *** [fs] Error 2

It's reproducible; with JFFS2_FS_DEBUG!=2 it does compile.
I hope this information helps; I would be grateful if it ran through.

Regards,
Bernhard
