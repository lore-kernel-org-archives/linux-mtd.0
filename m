Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOZfz-0007X7-4M
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 07:17:02 -0400
Date: Thu, 21 Apr 2005 13:16:45 +0200 (CEST)
From: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
To: carl liao <carlliao@21cn.com>
In-Reply-To: <DB949578818096.01258@send2.inner-21cn.com>
Message-ID: <Pine.LNX.4.61.0504211306400.1991@kukac.halom.u-szeged.hu>
References: <DB949578818096.01258@send2.inner-21cn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Sender: Kluba Patrik <pajko@halom.u-szeged.hu>
Cc: linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: Why nandwrite success but mount complain?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This "bug" relates to JFFS2.
User space tools are able to build a file system using 16KiB erase block size, 
but the kernel part of JFFS2 itself does not support it.
This is because JFFS2 uses kmalloc for allocating memory for jffs2_eraseblock 
structs. Smaller erase block size means more of this and more memory needed for 
storage. And kmalloc allows max. 128K allocations. (using 32K block size instead 
of 16K block size halves the memory requirements)

See jffs2_do_fill_super in fs.c

It's not very easy to circumvent this problem. Memory allocation and handling of 
jffs2_eraseblocks should be modified.

Bye,

   Patrik Kluba
