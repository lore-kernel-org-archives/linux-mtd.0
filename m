Received: from matrixvision.de ([217.160.213.229]
	helo=p15137414.pureserver.info)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlT24-00063i-Di
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 13:13:32 +0000
From: Howard Gray <rhea@matrix-vision.de>
To: Armin <armin@melware.de>
Date: Tue, 27 Jan 2004 14:13:09 +0100
References: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
In-Reply-To: <Pine.LNX.4.31.0401271245140.5630-100000@phoenix.one.melware.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200401271413.09390.rhea@matrix-vision.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
Reply-To: rhea@matrix-vision.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-26 at 14:26, Armin Schindler wrote:
> Hi,
> 
> together with latest CVS of jffs2 (one week old), I try to use
> my rootfs on a jffs2 NAND-Flash partition.
> 
> It seems to work pretty good, but when I have e.g. reset/power-down,
> on the next boot/rootfs-mount I get messages like:
> 
>  jffs2_scan_dirent_node(): Name CRC failed on node at 0x001b89dc: Read 
0xffffffff,

Sorry, I missed this posting originally, otherwise I wouldn't have top posted. 
I have also seen the problems you mentioned. Please see my mail "Problem 
deleting files with NAND/JFFS2 and a possible solution" posted today. The 
"solution" appears to cure these problems too, at least for me.

On Tuesday 27 January 2004 12:47, Armin wrote:
> What is the time the garbage collection starts or finished this?
> I waited some time (about 10 minutes) and the messages still occured after
> remount.

The following is based on my observation, not from any detailed understanding 
of the code. I'm sure David Woodhouse will correct me if I'm wrong.

Garbage collection is started by the kupdated/bdflush daemon or when there are 
not enough free blocks to carry out another file operation or by the sync 
command. Or you can kick it by sending SIGHUP to the GC process. But in your 
case the GC won't clean up your bad blocks until some other file really needs 
the space, so it doesn't matter how long you wait. You could try filling up 
your FLASH with data and then erasing it again. That'll do it. 

If the GC is started by kupdated/bdflush or sync it will only really do 
something if it thinks it's necessary i.e.if some inodes are marked as dirty. 

Older versions of the GC were started by a 2 second timer but that seems to 
have been abondoned in favour of kupdated (but you can still find some 
refrences to it in the code, which foxed me for a while...).

P.S.
You can adjust the frequency with which bdflush runs by writing to /proc/sys/
vm/bdflush. See the kernel documentaion file sysctl/vm.txt for details.


--
Howard
