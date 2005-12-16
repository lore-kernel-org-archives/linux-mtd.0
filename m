Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EnEcF-0004in-1L
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 07:23:18 -0500
Date: Fri, 16 Dec 2005 14:23:31 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051216122331.GA801@angel.research.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: zhao forrest <zhao_fusheng@hotmail.com>
Subject: EBH with OneNAND doesn't work
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to use JFFS2 (JFFS2 from cvs -D 'Nov 12, 2005' with the
mtd driver part from CVS head) on OneNAND simulator and real OneNAND
device.

I erased the test partition with "flash_eraseall /dev/mtd0". I mount the 
partition and no other fs operation is done.  When I just unmount and mount 
again, I get

  # mount -t jffs2 /dev/mtdblock0 /mnt
  ...
  Dec 16 12:35:11 slayer kernel: jffs2_scan_eraseblock(): Scanning block at 0x0
  Dec 16 12:35:11 slayer kernel: JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
  Dec 16 12:35:11 slayer kernel: jffs2_scan_eraseblock(): Scanning block at 0x10000
  Dec 16 12:35:11 slayer kernel: JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
  ...
  Dec 16 12:35:11 slayer kernel: Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
  Dec 16 12:35:11 slayer kernel: empty_blocks 0, bad_blocks 0, c->nr_blocks 256
  Dec 16 12:35:11 slayer kernel: c->used_size: 0
  Dec 16 12:35:11 slayer kernel: c->nr_free_blocks 0
  Dec 16 12:35:11 slayer kernel: (c->nr_free_blocks+empty_blocks+bad_blocks): 0
  Dec 16 12:35:11 slayer kernel: [JFFS2 DBG] (3779) jffs2_do_mount_fs: build_fs failed


JFFS2 is complaining about many pages being unformatted. It shouldn't
do this, since the pages should be properly formatted after the first
mount within a second when using a fast machine. At least on Nandsim and 
Ramtd they are.

Also, no pages are used so pages shold be either free or empty but the
number of free or empty pages is zero. This triggers the Cowardly
message,

I am seeing the same problem on both real OneNAND and OneNand
simulator.  On Nandsim or Ramtd everything seems to work ok.

The problem might be related to the free OOB bytes being scattered in 
OneNand. The first free OOB region start at offset 2 and with length 3 
bytes with autoplacement.

Regards
Jarkko Lavinen
