Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oQAT-0001xz-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 15:05:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0110021433460.250-100000@lisa.rhpk.springfield.inwind.it> 
References: <Pine.LNX.4.33.0110021433460.250-100000@lisa.rhpk.springfield.inwind.it> 
To: Cristiano Paris <c.paris@libero.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD newbie 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 15:14:11 +0100
Message-ID: <13487.1002032051@redhat.com>
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

c.paris@libero.it said:
> modprobe mtdcore 
> modprobe mtdram total_size=16384 erase_size=8
> modprobe mtdblock
> modprobe jffs2

> mount -t jffs2 /task-familiar-etc /mnt 

What is /task-familiar-etc? Did you mean:
 dd if=/task-familiar-etc of=/dev/mtdblock0
 mount -t jffs2 /dev/mtdblock0 /mnt

c.paris@libero.it said:
> After that the system just hangs (no kernel ooops shown). David, have
> you tried yourself with the mtdram fake device ? 

Yes, I've tested both JFFS and JFFS2 on the mtdram device with 2.4.10-ac1 
and the patch which Alan included into 2.4.10-ac3. Please could you compile 
with CONFIG_JFFS2_FS_DEBUG=1, set the loglevel to 9 by running the command
"echo 9 > /proc/sys/kernel/printk" and show me what it says?

--
dwmw2
