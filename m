Received: from pop.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3h4S-0001XT-Nl
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 19:51:20 +0000
From: dkey <dk.dbox2@gmx.net>
To: linux-mtd@lists.infradead.org,
 dvrabel@arcom.com
Date: Wed, 17 Mar 2004 20:51:22 +0100
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200403172051.22120.dk.dbox2@gmx.net>
Subject: Erasebug on AMD flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list!

we are using jffs2 on the dbox2 and AMD flash chips, but since rev. 1.96 of 
cfi_cmdset_0002.c we can't erase the flashes. rev. 1.94 works without 
problems.
here are some debug infos, tell me if you need more!

when we want to erase the flashes with MEMERASE ioctl, we get these errors:


Erase at 0x00080000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout
Erase at 0x00060000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout
Erase at 0x00040000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout
Erase at 0x00020000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout
Erase at 0x00000000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout
Erase at 0x000c0000 failed immediately: errno -5
MTD do_erase_oneblock(): flash internal timeout



when we do erase with "eraseall" binary:


eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 20000 -- 14 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout

eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 40000 -- 28 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout

eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 60000 -- 42 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout

eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ 80000 -- 57 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout

eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ a0000 -- 71 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout

eraseall: /dev/mtd/3: MTD Erase failure: Input/output error
Erasing 128 Kibyte @ c0000 -- 85 % complete.MTD do_erase_oneblock(): flash 
inter
nal timeout


would be please if anybody can take a look over the code or revert revision of 
cfi_cmdset_0002.c to 1.94.
thx!

greets dkey
