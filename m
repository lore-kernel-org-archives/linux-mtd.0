Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15x6Zn-0007g4-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 13:59:08 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id PAA18003
	for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 15:06:50 +0200
Date: Fri, 26 Oct 2001 15:08:26 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning rewrite
Message-ID: <20011026150826.A19450@wohnheim.fh-wedel.de>
References: <20011017105143.B319@wohnheim.fh-wedel.de> <20011024142842.A16290@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011024142842.A16290@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Wed, Oct 24, 2001 at 02:28:42PM +0200
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

Hi!

> To install it, simply unpack it into a linux source tree, recompile
> and - pray.

http://wh.fh-wedel.de/~joern/software/kernel/mtd-0.0.4.tar.gz

New version, less FIXME's less TODO's. It is now running on my
hardware with the rw block driver. Next will be a new physmap driver,
then char, then block_ro.

Here is some output, if anyone is interested.

root:~ > ls -l /dev/root 
lr-xr-xr-x   1 root     root           12 Jan  1 00:00 /dev/root ->
mtdblock/0/2
root:~ > ls -l /dev/mtdblock/  
total 0
drwxr-xr-x   1 root     root            0 Jan  1 00:00 0
root:~ > ls -l /dev/mtdblock/0/
total 0
brw-rw-rw-   1 root     root      31,   0 Jan  1 00:00 0
brw-rw-rw-   1 root     root      31,   1 Jan  1 00:00 1
brw-rw-rw-   1 root     root      31,   2 Jan  1 00:00 2
brw-rw-rw-   1 root     root      31,   3 Jan  1 00:00 3
brw-rw-rw-   1 root     root      31,   4 Jan  1 00:00 4
brw-rw-rw-   1 root     root      31,   5 Jan  1 00:00 5

Jörn

-- 
A defeated army first battles and then seeks victory.
	Sun Tzu
