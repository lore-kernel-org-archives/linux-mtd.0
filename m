Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Ps0-0002iV-PK
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 10:46:42 -0500
Date: Thu, 10 Mar 2005 16:46:41 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310154640.GC4910@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 13:15 +0000 schrieb Artem B. Bityuckiy:

> Try to mount empty filesystem then copy your tree there by "cp -r -a", 
> umount, mount. This will exclude errors during JFFS2 image 
> creation/flashing.

Ok. I did following:
I copied the root-fs directory into the nfs export so I can reach it
from the embedded system. I put a tar with /dev into it also.

I erased /dev/mtdblock3 with bootloader and
bootet with nfsroot again. I mounted empty /dev/mtdblock3, cd'ed into it
and did "cp -a -r /usr/src/root/* ."

sh-2.05b# mount -t jffs2 /dev/mtdblock3 /mnt
jffs2_scan_dirent_node(): Name CRC failed on node at 0x003a52c8: Read 0x839452cb, calculated 0x262752af
Name for which CRC failed is (now) 'openssh-host-key', ino #350
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0043566c: Read 0x9fcfc7a9, calculated 0x445e56d8
', ino #269ich CRC failed is (now) 'libpthread-0
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0047aa4c: Read 0xb9570647, calculated 0x6ac2e146
Name for which CRC failed is (now) 'linux-wlan-nÒ', ino #210

i.e.:

003a52c0: 0000 0000 ff45 79b6 8519 01e0 3e00 0000  .....Ey.....>... 
003a52d0: 4bc9 e11a 4901 0000 1600 0000 5e01 0000  K...I.......^... 
003a52e0: 9900 0000 1608 0000 333a 7af0 cb52 9483  ........3:z..R.. 
003a52f0: 6f70 656e 7373 682d 686f 7374 2d6b 6579  openssh-host-key 
003a5300: 6765 6e2e 7368 ffff 8519 02c0 2801 0000  gen.sh......(... 
003a5310: 91d9 c5e8 5e01 0000 0200 0000 ed81 0000  ....^........... 
003a5320: 0000 0000 9902 0000 9900 0000 9900 0000  ................ 

00435660: 0000 0000 0000 0000 b882 2ec7 8519 01e0  ................ 
00435670: 3c00 0000 c001 e8b0 fb00 0000 1300 0000  <............... 
00435680: 0d01 0000 9400 0000 1408 0000 55ff 2d7c  ............U.-| 
00435690: a9c7 cf9f 6c69 6270 7468 7265 6164 2d30  ....libpthread-0 
004356a0: 2e39 2e32 362e 736f 8519 02c0 a906 0000  .9.26.so........ 
004356b0: 4a1e 6fb8 0d01 0000 0200 0000 a481 0000  J.o............. 
004356c0: 0000 0000 0010 0000 9400 0000 9400 0000  ................ 

Filenames truncated by 0000?

0047aa40: 0000 0000 0000 0000 3d99 4484 8519 01e0  ........=.D..... 
0047aa50: 3c00 0000 c001 e8b0 d100 0000 0200 0000  <............... 
0047aa60: d200 0000 9100 0000 1408 0000 56db cdde  ............V... 
0047aa70: 4706 57b9 6c69 6e75 782d 776c 616e 2d6e  G.W.linux-wlan-n 
0047aa80: 672d 7072 652d 7570 8519 02c0 8006 0000  g-pre-up........ 
0047aa90: fefe 5565 d200 0000 0200 0000 ed81 0000  ..Ue............ 
0047aaa0: 0000 0000 0010 0000 9100 0000 9100 0000  ................ 
0047aab0: 9100 0000 0000 0000 3c06 0000 0010 0000  ........<....... 

The `O is d2, third line first byte.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
