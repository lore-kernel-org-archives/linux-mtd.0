Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOxqm-0002Ni-0p
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 17:56:11 +0000
Date: Thu, 9 Jul 2009 19:55:59 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Adrian Hunter <adrian.hunter@nokia.com>,
	Artem Bityutskiy <dedekind@infradead.org>
Subject: UBIFS trouble
Message-ID: <20090709175559.GZ26160@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(re-posting with the correct linux-mtd ML address. Sorry)

Hey,

I'm running the latest git snapshot of the Linux kernel on a PXA3xx
based board. Connected to the PXA3xx is a 128MiB Nymonix NAND chip
which I've set to enourmously relaxed timings for now (factor 2 on all
values).

'nandtest -p 100 /dev/mtd3' runs for hours without any trouble and
succeeds every test. However, when I create an UBIFS on that mtd and
start bonnie to stress-test the filesystem layer, I keep on seeing
messages like this:

[  382.374993] UBIFS error (pid 1133): ubifs_read_node: bad node at LEB 58:106008
[  382.382178] UBIFS error (pid 1133): do_readpage: cannot read page 38693 of inode 66, error -22
[  382.390968] timed out writing command
[  382.394830] UBI error: ubi_io_read: error -74 while reading 76 bytes from PEB 245:105736, read 76 bytes
[  382.404186] UBIFS error (pid 1135): try_read_node: cannot read node type 1 from LEB 68:101640, error -74
[  382.413698] UBIFS error (pid 1135): ubifs_read_node: bad node type (255 but expected 1)
[  382.421718] UBIFS error (pid 1135): ubifs_read_node: bad node at LEB 68:101640
[  382.428941] UBIFS error (pid 1135): do_readpage: cannot read page 53753 of inode 66, error -22
[  648.164435] UBIFS error (pid 1138): ubifs_read_node: bad node type (70 but expected 9)
[  648.172317] UBIFS error (pid 1138): ubifs_read_node: bad node at LEB 110:112896
[  648.179677] UBIFS error (pid 1138): do_readpage: cannot read page 19432 of inode 32838, error -22
[  648.188650] timed out writing command
[  648.192379] UBI error: ubi_io_read: error -74 while reading 81 bytes from PEB 738:80616, read 81 bytes
[  648.201732] UBIFS error (pid 1136): try_read_node: cannot read node type 1 from LEB 72:76520, error -74
[  648.211137] UBIFS error (pid 1136): ubifs_read_node: bad node type (255 but expected 1)
[  648.219115] UBIFS error (pid 1136): ubifs_read_node: bad node at LEB 72:76520
[  648.226231] UBIFS error (pid 1136): do_readpage: cannot read page 26131 of inode 32838, error -22

Once in awhile only and not frequently, but it still scares me. Is there
anything I should consider? Any more information I can provide for
further debugging?

(btw - it happens with the timings found in the datasheet as well, I
just extended them to exclude timing issues as culprit.)

I'd like to use that filesystem in a device, but I need to get it to a
more stable point for that.

Many thanks,
Daniel
