Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eDD7-0005cn-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 10:45:53 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_make_ino_cache() in scan.c very slow, new improvment
Date: Fri, 22 Feb 2002 11:56:04 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLAELGFBAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <005701c1bb29$393df6e0$e0d9b5d4@jocke>
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

Hi again

I done some more digging and as far as I can tell it's not possible to omit the
CRC check. Questions:
Is it possible to change the writeout of inode's in such away that the
CRC check can be omitted?
Idea: write the whole node, but replace the data_crc with 0xffffffff, then
write the real data_crc. At scan time you only need to check if the data_crc is 0xfffffff
or not. This wont work if 0xffffffff is a legal CRC value, does someone know?
One could also use the flags field in same way?

Comments? 

Adler32:
I ran a quick test where I swapped crc32 to adler32 in jffs2_scan_inode_node () and
that lowered my mount time with 21 % (from 848 jiffies to 666 jiffies). How 
about swapping crc32 to adler32? This could be a compile time option or stored somewhere
in the FS.

Comments?

 Jocke

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Joakim
> Tjernlund
> Sent: Thursday, February 21, 2002 23:44
> To: David Woodhouse
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: jffs2_scan_make_ino_cache() in scan.c very slow, new
> improvment
> 
> 
> Is the CRC check needed for the data part(if (ri.csize ....) in
> jffs2_scan_inode_node ()
> in ? Removing this check halves my already improved mount time :-)
