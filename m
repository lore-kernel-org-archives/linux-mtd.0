Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHWuw-00016j-1h
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 21:27:50 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Tue, 20 Sep 2005 13:32:31 +1200
References: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
In-Reply-To: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200509201332.31431.manningc2@actrix.gen.nz>
Cc: Gagan Prakash <gagpcool@hkn.eecs.berkeley.edu>
Subject: Re: FAT on raw Nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 September 2005 10:36, Gagan Prakash wrote:
> Hi
>
> I am trying to solve the problem of allowing a device with raw nand to be
> exposed to any Desktop OS (OS 10, Windows and Linux) without having to
> install any sort of driver on the Desktop OS that is not already present.
> The only solution I have read of/come up with is for the device to act as
> USB external drive and let the host OS mount it as a FAT filesystem. This
> means that the filesystem on device partition that is exposed needs to be
> FAT.

If you can't install any drivers then FAT is probably the only way to go for a 
FS.

The only alternative I can think of to this is to use ethernet + nfs  instead. 
ie. Your device looks like a USB ethernet device with a host running nfs  on 
the other end. That would allow you to run an alternative FS like YAFFS.

>
> Now from the archives I know its not the easiest and safest thing to
> expose a partition as FAT on raw nand. And it also requires the writing of
> a FTL layer. I was wondering if there is a better solution for this
> problem.
>
> For example is there a way to emulate FAT on top of existing nand fs like
> YAFFS or JFFS2 (this would seem hard specially for writes). Or is the only
> solution is to format the device as FAT and expose it as an external USB
> drive to the host OS.

Unfortunately there is no USB-NFS. There is only a USB mass storage device 
which can be used with most block file systems (typically FAT). USB-NFS would 
have been a good idea because it would allow devices to use their own FS 
internally.

The USB Mass Storage spec has no notion of a file system, just read/write 
blocks of data. To use YAFFS etc on the device and make it look like a USB 
mass storage device running FAT is probably too much to ask.
