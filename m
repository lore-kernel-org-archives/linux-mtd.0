Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D17mz-0005e9-RD
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 13:51:14 -0500
Date: Tue, 15 Feb 2005 19:51:14 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050215185113.GB15503@synertronixx3>
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
	<20050215165048.GE831@synertronixx3>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050215165048.GE831@synertronixx3>
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hm, something is unstable yet.
Either my burstmode is too hard or something else...

The burst mode I tuned this day, it worked for a couple of hours, but my
xip kernels all brak now:

Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
0x00040000-0x00240000 : "kernel"    
0x00240000-0x00640000 : "root"  
0x00640000-0x01000000 : "fs"  
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
jffs2_scan_dirent_node(): Name CRC failed on node at 0x000b2128: Read
0x405647ad, calculated 0x7e3eb440
jffs2_scan_dirent_node(): Name CRC failed on node at 0x000b236c: Read
0xb9570647, calculated 0x35f96289
jffs2_scan_dirent_node(): Name CRC failed on node at 0x000b35a8: Read
0x9acd7a6e, calculated 0x87339b9f
jffs2_scan_dirent_node(): Name CRC failed on node at 0x000e8630: Read
0x03371d6d, calculated 0x4dcf6e71
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0010adac: Read
0xe2abe810, calculated 0xe0794e1f

And freeze then. Is my xipuImage frying the fs on its first boot?
Yes, obviously but why not an hour ago? hm...

Adressess are constant with every version and the rootfs is reflashed
every time. 
I am puzzled...

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
