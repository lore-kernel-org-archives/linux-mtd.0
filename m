Received: from gate.epygi.de ([212.126.211.241] helo=epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17In8k-0003p6-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 10:13:06 +0100
Received: from pcstephan (pc-stephan.epygi.de [192.168.13.32])
	by epygi.de (8.12.3/8.12.3) with SMTP id g5E9Cx3v015198
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 11:12:59 +0200 (METDST)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Subject: FW: why MTD model ? 
Date: Fri, 14 Jun 2002 11:13:02 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJAEJPCFAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi!

> 
> Can somehow we treat(emulate) memory device as a block
> device and treat memory device like a hard disk ?
>

Maybe I didn't got the point. But if you like to use some (maybe 
battery backuped) memory with a filesystem on it you could setup 
your MTD device just like this:
>>>>

static void* memremap;                                            
              
static struct mtd_info *myrammtd;                                 
              

__u8 my_ram_read8(struct map_info *map, unsigned long ofs)
{
    return *(__u8 *)(memremap  + ofs);
}
...

struct map_info my_ram_map = {
    name: "MY bbram    ",
    size: RAM_WINDOW_SIZE,
    buswidth: 4,
    read8: my_ram_read8,
    read16: my_ram_read16,
    read32: my_ram_read32,
    copy_from: my_ram_copy_from,
    write8: my_ram_write8,
    write16: my_ram_write16,
    write32: my_ram_write32,
    copy_to: my_ram_copy_to
};


...
        myrammtd = do_map_probe("map_ram", &my_ram_map);          
            
        if (myrammtd) {
            memremap = ioremap (RAM_WINDOW_ADDR, RAM_WINDOW_SIZE);
            add_mtd_device (myrammtd);
        } else {
            printk ("mtd/my.o: error installing bbdram device!\n");
        }
        return 0;
...

<<<<
(If someone thinks that this is the wrong way, feel free to send 
comments.) :o)



Stephan Linke
> 
