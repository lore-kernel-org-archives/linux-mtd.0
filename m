Received: from sonolo.xs4all.nl ([80.126.206.91] helo=sendmail.metro.cx)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbJMS-0002XM-Ud
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 08:57:10 -0500
Received: from dave.dh.sono (dave.dh.sono [10.1.2.5])
	by sendmail.metro.cx (8.13.1/8.13.1) with ESMTP id iB6Dv3EF008697
	for <linux-mtd@lists.infradead.org>; Mon, 6 Dec 2004 13:57:03 GMT
Received: from dave.dh.sono (localhost [127.0.0.1])
	by dave.dh.sono (8.12.9-20030917/8.12.9) with ESMTP id iB6Dv3E9002958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 6 Dec 2004 14:57:03 +0100
Received: (from gmc@localhost)
	by dave.dh.sono (8.12.9-20030917/8.12.9/Submit) id iB6Dv3Lr002957
	for linux-mtd@lists.infradead.org; Mon, 6 Dec 2004 14:57:03 +0100
Date: Mon, 6 Dec 2004 14:57:03 +0100
From: gmc@metro.cx
To: linux-mtd@lists.infradead.org
Message-ID: <20041206135703.GA2899@metro.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: More mtd problems: scheduling while atomic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Another problem with the mtd driver it seems. This time i'm looking at
cfi_cmdset_0002.c, and it seems there's more horrible bug stuff in there
(see the dump below). 

I'm at this point clueless at what to do with this. It is causing me
trouble however.. Is this a known issue?? Any hints whatsoever??

It's with 2.6.10-rc2-bk17 btw..

Koen

----- Forwarded message from Koen Martens <Koen.Martens@tomtom.com> -----

   scheduling while atomic: sh/0x00000001/44
   [<c01d2400>]        (schedule+0x0/0x680)       from       [<c014f078>]
   (do_write_oneword+0x610/0xc4c)
   [<c014ea68>]     (do_write_oneword+0x0/0xc4c)     from    [<c014fb54>]
   (cfi_amdstd_write_words+0x4a0/0x850)
   [<c014f6b4>]   (cfi_amdstd_write_words+0x0/0x850)   from  [<c00eb9b0>]
   (ngffs_write+0x64/0xcc)
   [<c00eb94c>]       (ngffs_write+0x0/0xcc)       from      [<c00e8314>]
   (ngffs_put_chunk+0x60/0x80)
    r7 = C1E07D5C  r6 = 00000001  r5 = C1E07688  r4 = C167F2B8
   [<c00e82b4>]      (ngffs_put_chunk+0x0/0x80)     from     [<c00e92ec>]
   (ngffs_create+0x3e8/0x530)
    r8 = C1E07688  r7 = C18A2040  r6 = 0001002A  r5 = C18A21F8
    r4 = 00000000
   [<c00e8f04>]      (ngffs_create+0x0/0x530)      from      [<c009f0ec>]
   (vfs_create+0x90/0xb8)
   [<c009f05c>]       (vfs_create+0x0/0xb8)       from       [<c009f498>]
   (open_namei+0x1b0/0x734)
    r8 = C0020A64  r7 = C1883F34  r6 = 00000241  r5 = C1E0627C
    r4 = C1E061D0
   [<c009f2e8>]       (open_namei+0x0/0x734)       from      [<c0087934>]
   (filp_open+0x30/0x4c)
   [<c0087904>]        (filp_open+0x0/0x4c)       from       [<c0088184>]
   (sys_open+0x48/0x8c)
    r4 = 000001B6
   [<c008813c>]        (sys_open+0x0/0x8c)        from       [<c00208e0>]
   (ret_fast_syscall+0x0/0x2c)
    r7 = 00000005  r6 = 00050CB0  r5 = 00050D08  r4 = FFFFFFFF
   ngffs: ngffs_create: about to invalidate at oldofs
   ngffs: ngffs_write: write at ofs 65582l, len=1l
   scheduling while atomic: sh/0x00000001/44
   [<c01d2400>]        (schedule+0x0/0x680)       from       [<c014f078>]
   (do_write_oneword+0x610/0xc4c)
   [<c014ea68>]     (do_write_oneword+0x0/0xc4c)     from    [<c014feb4>]
   (cfi_amdstd_write_words+0x800/0x850)
   [<c014f6b4>]   (cfi_amdstd_write_words+0x0/0x850)   from  [<c00eb9b0>]
   (ngffs_write+0x64/0xcc)
   [<c00eb94c>]       (ngffs_write+0x0/0xcc)       from      [<c00e8744>]
   (ngffs_invalidate_chunk+0x30/0x5c)
    r7 = C18A2040  r6 = 0001002A  r5 = C18A21F8  r4 = 00000000
   [<c00e8714>]   (ngffs_invalidate_chunk+0x0/0x5c)   from   [<c00e9328>]
   (ngffs_create+0x424/0x530)
   [<c00e8f04>]      (ngffs_create+0x0/0x530)      from      [<c009f0ec>]
   (vfs_create+0x90/0xb8)
   [<c009f05c>]       (vfs_create+0x0/0xb8)       from       [<c009f498>]
   (open_namei+0x1b0/0x734)
    r8 = C0020A64  r7 = C1883F34  r6 = 00000241  r5 = C1E0627C
    r4 = C1E061D0
   [<c009f2e8>]       (open_namei+0x0/0x734)       from      [<c0087934>]
   (filp_open+0x30/0x4c)
   [<c0087904>]        (filp_open+0x0/0x4c)       from       [<c0088184>]
   (sys_open+0x48/0x8c)
    r4 = 000001B6
   [<c008813c>]        (sys_open+0x0/0x8c)        from       [<c00208e0>]
   (ret_fast_syscall+0x0/0x2c)
    r7 = 00000005  r6 = 00050CB0  r5 = 00050D08  r4 = FFFFFFFF

----- End forwarded message -----

-- 
K.F.J. Martens, Sonologic, http://www.sonologic.nl/
Networking, embedded systems, unix expertise, artificial intelligence.
Public PGP key: http://www.metro.cx/pubkey-gmc.asc
Wondering about the funny attachment your mail program
can't read? Visit http://www.openpgp.org/
