Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9SnD-0004r6-BR
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 13:53:56 -0500
Date: Thu, 10 Mar 2005 19:53:57 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050310185356.GA12205@synertronixx3>
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

Look at this quick, dirty hack:

        printk("rd->nsize before memcpy: %x\n", rd->nsize);
        printk("rd->name: %c %x\n", rd->name[0], rd->name[0]);
        printk("rd->name: %c %x\n", rd->name[11], rd->name[11]);
        printk("rd->name: %c %x\n", rd->name[12], rd->name[12]);
        printk("rd->name: %c %x\n", rd->name[13], rd->name[13]);
        memcpy(&fd->name, rd->name, rd->nsize);
        printk("rd->nsize after memcpy: %x\n", rd->nsize);
        printk("rd->name: %c %x\n", rd->name[0], rd->name[0]);
        printk("rd->name: %c %x\n", rd->name[11], rd->name[11]);
        printk("rd->name: %c %x\n", rd->name[12], rd->name[12]);
        printk("rd->name: %c %x\n", rd->name[13], rd->name[13]);


rd->nsize before memcpy: 14
rd->name: l 6c             
rd->name: n 6e
rd->name: g 67
rd->name: - 2d
rd->nsize after memcpy: 14
rd->name: l 6c            
rd->name: n 6e
rd->name: g 67
rd->name: - 2d
fd->name: linux-wlan-nÒ
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0047aa4c: Read 0xb9570647, calculated 0x6ac2e146
Name for which CRC failed is (now) 'linux-wlan-nÒ', ino #210



        printk("rd->nsize before memcpy: %x\n", rd->nsize);
        printk("rd->name: %c %x\n", rd->name[0], rd->name[0]);
        printk("rd->name: %c %x\n", rd->name[14], rd->name[14]);
        printk("rd->name: %c %x\n", rd->name[15], rd->name[15]);
        printk("rd->name: %c %x\n", rd->name[16], rd->name[16]);
        printk("rd->name: %c %x\n", rd->name[17], rd->name[17]);
        memcpy(&fd->name, rd->name, rd->nsize);
        printk("rd->nsize after memcpy: %x\n", rd->nsize);
        printk("rd->name: %c %x\n", rd->name[0], rd->name[0]);
        printk("rd->name: %c %x\n", rd->name[14], rd->name[14]);
        printk("rd->name: %c %x\n", rd->name[15], rd->name[15]);
        printk("rd->name: %c %x\n", rd->name[16], rd->name[16]);
        printk("rd->name: %c %x\n", rd->name[17], rd->name[17]);



rd->nsize before memcpy: 16
rd->name: o 6f             
rd->name: e 65
rd->name: y 79
rd->name: g 67
rd->name: e 65
rd->nsize after memcpy: 16
rd->name: o 6f            
rd->name: e 65
rd->name: y 79
rd->name: g 67
rd->name: e 65
fd->name: openssh-host-key
jffs2_scan_dirent_node(): Name CRC failed on node at 0x003a52c8: Read 0x839452cb, calculated 0x262752af
Name for which CRC failed is (now) 'openssh-host-key', ino #350

So rd->name and rd->size seems to be both ok just before and after memcpy.

Weird...

Konsti 


-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
