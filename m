Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16FzsO-0003HD-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Dec 2001 15:40:24 +0000
Received: from tomts10.bellnexxia.net ([209.226.175.54] helo=tomts10-srv.bellnexxia.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 16G02k-0001cE-00
	for linux-mtd@lists.infradead.org; Mon, 17 Dec 2001 15:51:07 +0000
Date: Mon, 17 Dec 2001 10:43:38 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: dharmu bavale <dharmu@linuxmail.org>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: After installing firmware
In-Reply-To: <20011217053502.11397.qmail@linuxmail.org>
Message-ID: <Pine.LNX.4.33.0112171039130.19177-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Dharmu,

The full-screen menu not showing up means the boot loader couldn't find
the configuration file /boot/grub/menu.lst in the DiskOnChip whole disk
NFTL partition (mke2fs /dev/nftla) and in the first partition (fdisk
/dev/nftla; mke2fs /dev/nftla1).

What is the output of the "root (dc0)" command in the GRUB shell?  What is
the output of the "root (dc0,0)" command?

Ilguiz

On Mon, 17 Dec 2001, dharmu bavale wrote:

>    I just got installed grub firmware on to the DOC. After removing
> the harddisk, I am getting the grub prompt, where in I cant able to
> boot linux. What may be the problem?
