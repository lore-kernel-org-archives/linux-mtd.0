Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZQy0-0000AV-UK
	for linux-mtd@lists.infradead.org; Mon, 25 Jan 2010 15:35:09 +0000
In-Reply-To: <OF0B5BF9CC.0D78D861-ONC12576B6.005059A9-C12576B6.00529164@phytec.de>
References: <OF0B5BF9CC.0D78D861-ONC12576B6.005059A9-C12576B6.00529164@phytec.de>
Subject: Re: JFFS2 problems with  NumonyxTM StrataFlash P33 256-Mbit 65nm
To: PHYTEC Mailinglists <mailinglists@phytec.de>
Message-ID: <OF94E9B7A1.FCB5F2C9-ONC12576B6.00550443-C12576B6.00556D0B@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 25 Jan 2010 16:33:04 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> After switching to the shrunk flashes 256P33F (NumonyxTM StrataFlash P33
> 256-Mbit), we run in this problems:
>
> JFFS2 notice: (377) jffs2_get_inode_nodes: Node header CRC failed at
> 0xaccfcc. {1545,e001,00000057,d657036c}
> JFFS2 warning: (377) jffs2_do_read_inode_internal: no data nodes found for
> ino #584
> Returned error for crccheck of ino #584. Expect badness...
> JFFS2 notice: (377) jffs2_get_inode_nodes: Node header CRC failed at
> 0xba1270. {1945,d002,00000072,3bf57266}
> JFFS2 warning: (377) jffs2_do_read_inode_internal: Truncating ino #618 to
> 254168 bytes failed because it only had 253952 bytes to start with!
> JFFS2 notice: (377) jffs2_get_inode_nodes: Node header CRC failed at
> 0xc129dc. {1985,d002,00000056,62e76405}
> JFFS2 warning: (377) jffs2_do_read_inode_internal: no data nodes found for
> ino #632
> Returned error for crccheck of ino #632. Expect badness...
> JFFS2 notice: (377) jffs2_get_inode_nodes: Node header CRC failed at
> 0xc36b54. {1945,e002,00000059,3a44745f}
> JFFS2 warning: (377) jffs2_do_read_inode_internal: no data nodes found for
> ino #648
> Returned error for crccheck of ino #648. Expect badness...
>
> The problem occurs while booting the image the first time after flashing.
> After reflashing other inodes are damaged. We run the 2.6.31.6 kernel on
> an i.MX35 and i.MX31
> With the older Intel 256P33B flashes it works fine.
>
> The image was build with mtd-utils 1.3 using
> mkfs.jffs2  -d root/ --eraseblock=131072 -o root.jffs2
>
> Because the program buffer size is increased from 64 to 1024, I also
> tested without any buffer support. But with the same results.
> Any idea?

Just one, make sure you don't have bad/old sample chips. We experienced
something similar and it was due to bad samples that were old
and had an errata.

Oh, one more thing. The WAIT signal is probably inverted (our was)
so if you have it connected you will have to reprogram the WAIT polarity.

         Jocke
