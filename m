Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17chYM-0004Bz-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 08:17:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000d01c23e95$4c679060$1b0448c0@gv.com.tw> 
References: <000d01c23e95$4c679060$1b0448c0@gv.com.tw> 
To: "??" <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: will jffs2 write to device when doing "read-only" operation like "ls"? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 08:17:46 +0100
Message-ID: <27538.1028791066@redhat.com>
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


kevin@gv.com.tw said:
> will jffs2 write to device when doing "read-only" operation like "ls"?
> for example, if you do a "ls -lR" then a fs like ext2/minix will write
> stuff to block device (because of put_inode operation),thus might
> reduce life of nand flash....... 

Normal file systems write because they have to update the 'atime' (access 
time) field whenever an inode is read. Very few applications actually care 
about a correct atime, and JFFS2 does not implement atime.

--
dwmw2
