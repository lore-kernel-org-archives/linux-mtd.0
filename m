Received: from mx0.gmx.de ([213.165.64.100] helo=mx0.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZrZE-0006WZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 12:23:00 +0100
Date: Wed, 31 Jul 2002 13:22:29 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
References: <14743.1028068151@redhat.com>
Subject: Root-FS on DOC2000 (was Re: Compiling Grub for DOC2000)
Message-ID: <712.1028114549@www55.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

> 
> frank.oltmanns.ml@gmx.de said:
> > NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> > ######################################
> > # I get this far when I use DoC as the root-fs  #
> > ######################################
> > Looking up port of RPC 100003/2 on 192.168.1.99
> > Looking up port of RPC 100005/1 on 192.168.1.99
> 
> Remove the bogus invalidate_device() from the mtdblock_release() function 
> in drivers/mtd/mtdblock.c.
I did, but nothing happened.

Here is what I get, when using DoC as root-fs (debug-level 3) after the
"NET4: Unix domain sockets 1.0/SMP for Linux NET4.0" -line:

NFTL_open
NFTL_open
NFTL_request
NFTL Read  request, from sector 0x0002 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 3 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0004 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 5 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x000a for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ b (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Write request, from sector 0x0002 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 3 (req->nr_sectors == 2)
Status of block 3 in EUN 1023 is 55
Status of block 3 in EUN 36 is 55
Status of block 3 in EUN 133 is 55
Status of block 3 in EUN 134 is 55
Status of block 3 in EUN 135 is 55
Status of block 3 in EUN 140 is 55
Status of block 3 in EUN 774 is 55
Status of block 3 in EUN 776 is 55
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
Status of block 4 in EUN 1023 is 55
Status of block 4 in EUN 36 is 55
Status of block 4 in EUN 133 is 55
Status of block 4 in EUN 134 is 55
Status of block 4 in EUN 135 is 55
Status of block 4 in EUN 140 is 55
Status of block 4 in EUN 774 is 55
Status of block 4 in EUN 776 is 55
Status of block 4 in EUN 1022 is ff
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
NFTL write request completed OK
end_request(1)
NFTL_release

1) I don't know what all of this means. Perhaps someone
   can explain that or tell me what is wrong.
2) Why are there two NFTL_open-calls and only one
   NFTL_release?

Thanks in advance
  Frank

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
