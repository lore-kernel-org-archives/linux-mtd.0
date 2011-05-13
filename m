Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKs3L-0002b9-HU
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 13:05:12 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QKs3G-0000Pr-Oi
	for linux-mtd@lists.infradead.org; Fri, 13 May 2011 15:05:06 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 May 2011 15:05:06 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 May 2011 15:05:06 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: [newbie] uClinux can't access NAND
Date: Fri, 13 May 2011 14:49:53 +0200
Message-ID: <pt9qs6lpake6fj7k4i6lmu5f2oisdkhr16@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

(This is really a newbie question, as I have very little knowledge
about NAND and device drivers. If there is a better place to ask,
please point me in the right direction.)

I'd like to try and upgrade an appliance to uClinux2010, but can't get
it to access the NAND and find its partitions. 

>From what I've read... 
1. Since 2009, the bfin_nand.c NAND driver has been replaced with
plat_nand.c 
2. Unlike bfin_nand.c, plat_nand.c only contains code 
3. Board resources should now only live in the board driver, ip0x.c in
this case 

So, after checking bfin_nand.c, ip0x.c, and the BF537's stamp.c, I
came up with this updated ip0x.c: 

www.pastebin.com/fqwr9Qev 

I also slightly edited nand_base.c to display the values of
Manufacture ID and Device ID: 
============ 
/* Read manufacturer and device IDs */ 
*maf_id = chip->read_byte(mtd); 
dev_id = chip->read_byte(mtd); 
//Added by me 
printk("*********\n First read\nMaf ID %d \n Dev ID
%d\n",*maf_id,dev_id); 

chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1); 

/* Read manufacturer and device IDs */ 
tmp_manf = chip->read_byte(mtd); 
tmp_id = chip->read_byte(mtd); 
//Added by me 
printk("*********\n Second read\nMaf ID %d \n Dev ID
%d\n",tmp_manf,tmp_id); 
============ 

Here's what dmesg says about NAND: 
============ 
... 
Found mtd parition at 0x0020a000, (len=0x800000), moving to 0x03700000
... 
ip0x_init(): registering device resources 
CLE is 4 and ALE is 2 
... 
uclinux[mtd]: RAM probe address=0x3700000 size=0x800000 
Creating 1 MTD partitions on "RAM": 
0x000000000000-0x000000800000 : "ROMfs" 
mtd: Giving out device 0 to ROMfs 
Generic platform RAM MTD, (c) 2004 Simtec Electronics 
********* 
First read 
Maf ID 15 
Dev ID 15 
********* 
Second read 
Maf ID 15 
Dev ID 15 
No NAND device found. 
... 
mtdblock_open 
ok 
============ 

As shown in ip0x.c, I've tried playing with start/end in
bfin_plat_nand_resources, to no avail. 

I'm also told to check that the ready pin is correctly declared, and
that the async timings aren't too fast for the NAND. 

With very little knowledge of NAND, I have no idea what else to try. 

What could prevent uClinux from accessing the NAND and reading its
partitions?

Thank you for any help.
