Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9SNY-0004bp-RU
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 13:27:26 -0500
Date: Thu, 10 Mar 2005 19:27:25 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310182717.GA9555@synertronixx3>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310154640.GC4910@synertronixx3>
	<Pine.LNX.4.58.0503101621110.5506@phoenix.infradead.org>
	<20050310170223.GC7018@synertronixx3>
	<Pine.LNX.4.58.0503101717100.5506@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0503101717100.5506@phoenix.infradead.org>
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-03-10 17:17 +0000 schrieb Artem B. Bityuckiy:

> Well, then I offer to start debugging. Insert printk() calls and start 
> catching error step by step.

Mine or jffs2's or mtd's error...


	printk("totlen: %x\nnsize: %x\n", rd->totlen,rd->nsize);

before

	rc = crc32(0, rd, sizeof(*rd)-8);

and

        printk("rd->nsize before memcpy: %x\n", rd->nsize);
        printk("address of rd->name: %x\n", rd->name[0]);
        memcpy(&fd->name, rd->name, rd->nsize);
        printk("rd->nsize after memcpy: %x\n", rd->nsize);
        fd->name[rd->nsize] = 0;
        printk("fd->name: %s\n", fd->name);



totlen: 3e        
nsize: 16 
rd->nsize before memcpy: 16
address of rd->name: 6f    
rd->nsize after memcpy: 16
fd->name: openssh-host-key
jffs2_scan_dirent_node(): Name CRC failed on node at 0x003a52c8: Read 0x839452cb, calculated 0x262752af
Name for which CRC failed is (now) 'openssh-host-key', ino #350

totlen: 3c           
nsize: 14 
rd->nsize before memcpy: 14
address of rd->name: 6c    
rd->nsize after memcpy: 14
fd->name: linux-wlan-nÒ   
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0047aa4c: Read 0xb9570647, calculated 0x6ac2e146
Name for which CRC failed is (now) 'linux-wlan-nÒ', ino #210

This is cat "/dev/mtdblock3 > file" afterwards:

003a52c0: 0000 0000 ff45 79b6 8519 01e0 3e00 0000  .....Ey.....>... 
003a52d0: 4bc9 e11a 4901 0000 1600 0000 5e01 0000  K...I.......^... 
003a52e0: 9900 0000 1608 0000 333a 7af0 cb52 9483  ........3:z..R.. 
003a52f0: 6f70 656e 7373 682d 686f 7374 2d6b 6579  openssh-host-key 
003a5300: 6765 6e2e 7368 ffff 8519 02c0 2801 0000  gen.sh......(... 
003a5310: 91d9 c5e8 5e01 0000 0200 0000 ed81 0000  ....^........... 
003a5320: 0000 0000 9902 0000 9900 0000 9900 0000  ................

0047aa40: 0000 0000 0000 0000 3d99 4484 8519 01e0  ........=.D..... 
0047aa50: 3c00 0000 c001 e8b0 d100 0000 0200 0000  <............... 
0047aa60: d200 0000 9100 0000 1408 0000 56db cdde  ............V... 
0047aa70: 4706 57b9 6c69 6e75 782d 776c 616e 2d6e  G.W.linux-wlan-n 
0047aa80: 672d 7072 652d 7570 8519 02c0 8006 0000  g-pre-up........ 
0047aa90: fefe 5565 d200 0000 0200 0000 ed81 0000  ..Ue............ 
0047aaa0: 0000 0000 0010 0000 9100 0000 9100 0000  ................

So it could be rd->name contains garbage, "d2" in second case and
memcopy is terminated by "00". May be...

> All JFFS2 read/write goes through mtd->write(), mtd->writev(), 
> mtd->read(). You might just find the corresponded handlers and insert 
> printk's there. This will give us additional information.

Ok, I will try this tomorrow, I have to leave know, sadly as debugging
gets interesting :)

Kind Regards and thanks for your help, Konsti


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
