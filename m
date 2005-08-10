Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E2m0x-0007mx-2D
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 04:32:45 -0400
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.62.54])
	(envelope-sender <bernhard@prie.de>)
	by smtprelay03.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 10 Aug 2005 08:26:02 -0000
Received: from [192.168.0.141] (linux-og [192.168.0.141])
	by deepspace9.in2soft.meep (Postfix) with ESMTP id DC7C5B0
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Aug 2005 10:25:27 +0200 (CEST)
Message-ID: <42F9BA34.6090008@prie.de>
Date: Wed, 10 Aug 2005 10:26:28 +0200
From: Bernhard Priewasser <bernhard@prie.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Compiling JFFS3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

when trying to compile JFFS3 kernel module out-of-the-box, I get 
(pathnames stripped):

 > ~/mtd/fs/jffs3> make
 > make -C /lib/modules/2.6.11.4-21.7-default/build SUBDIRS=`pwd` 
mtd=`pwd` modules
 > make[1]: Entering directory `/usr/src/linux-2.6.11.4-21.7'
 >   CC [M]  /mtd/fs/jffs3/compr.o
 > In file included from /mtd/fs/jffs3/nodelist.h:205,
 >                  from /mtd/fs/jffs3/compr.h:27,
 >                  from /mtd/fs/jffs3/compr.c:17:
 > /mtd/fs/jffs3/debug.h: In function `jffs3_dbg_wbuf_acct_sanity_check':
 > /mtd/fs/jffs3/debug.h:366: error: structure has no member named 
`wbuf_pagesize'
 > /mtd/fs/jffs3/debug.h:366: error: structure has no member named 
`wbuf_len'
 > /mtd/fs/jffs3/debug.h:367: error: structure has no member named 
`wbuf_ofs'
 > /mtd/fs/jffs3/debug.h:367: error: structure has no member named 
`wbuf_len'
 > /mtd/fs/jffs3/debug.h:367: error: structure has no member named 
`wbuf_pagesize'
 > /mtd/fs/jffs3/debug.h:367: error: structure has no member named 
`wbuf_len'
 > make[2]: *** [/mtd/fs/jffs3/compr.o] Error 1
 > make[1]: *** [_module_/mtd/fs/jffs3] Error 2
 > make[1]: Leaving directory `/usr/src/linux-2.6.11.4-21.7'
 > make: *** [modules] Error 2

In jffs3.h, line 296ff, the write-behind and oob stuff (wbuf_* ...) is 
not added because CONFIG_JFFS3_FS_WRITEBUFFER is not defined.

Have a look at mtd/include/linux/config.h, line 38. Shouldn't
 > #define CONFIG_JFFS3_FS_WRITEBUFFER 1
be added there to consider JFFS_3_ too, not only JFFS_2_?

Regards,
Bernhard
