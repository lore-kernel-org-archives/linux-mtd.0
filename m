Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfQn-0005FG-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:25:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1028064443.23642.52.camel@mahi190.austin.ibm.com> 
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com> 
To: Stephen Hui <gromit1463@mailworks.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: "Read-only file system" error while writing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:25:26 +0100
Message-ID: <14660.1028067926@redhat.com>
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

gromit1463@mailworks.org said:
> When I write to the chips using either cat, dd, stdout redirection, or
> cp, the CFI driver complains of attempting to write to a "Read-only
> file system", even after unlocking all blocks in the partition and
> erasing the partition.  I can mount /dev/mtdblock*, but mount
> complains and I still can't put anything into the mounted partition.
> do_write_buffer() in cfi_cmdset_0001.c is returning the error (EROFS).

The only case in which do_write_buffer() should return -EROFS is if the 
status bit is set which means that the block in question was locked. Try 
using the MEMUNLOCK ioctl to unlock it?



--
dwmw2
