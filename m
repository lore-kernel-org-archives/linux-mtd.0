Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qLFq-0003MX-00
	for mtd-list@infradead.org; Mon, 30 Oct 2000 20:10:02 +0000
Received: from [63.196.9.2] (helo=ftp.neontech.com)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13qLFo-0003LS-00
	for mtd@infradead.org; Mon, 30 Oct 2000 20:10:00 +0000
Date: Mon, 30 Oct 2000 12:12:30 -0800
From: Qiuyuan Liu <q.liu@acm.org>
To: mtd@infradead.org
Subject: building mtd: put_module_symbol?
In-Reply-To: <39F94471.D0E5F971@auriga.ru>
References: <39F8EAB996.E4A2Q.LIU@mail.neontech.com> <39F94471.D0E5F971@auriga.ru>
Message-Id: <39FDD62E1B8.9E6AQ.LIU@mail.neontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thank you, Nick.

I installed the linux-2.2.17.tar.gz directly on my box. 
Now I got the following 3 new errors:

1. where is put_module_symbol defined referred in mtd/map.h:
do_map_probe().


2. set_current_state redefinition

 * $Id: cfi_cmdset_0001.c,v 1.41 2000/10/19 14:26:34 nico Exp $

#if LINUX_VERSION_CODE < 0x20300
#define set_current_state(x) current->state = (x);	//line 36:
#endif

 * mtd/include/compatmac.h
 * $Id: compatmac.h,v 1.6 2000/10/23 16:56:28 sjhill Exp $

#if LINUX_VERSION_CODE < 0x20300
#define set_current_state(state_value)                        \		//line : 203 
        do { current->state = (state_value); } while (0)
#endif


3. physmap.c, line 65:
'CONFIG_MTD_PHYSMAP_BUSWIDTH' undeclared here (not in a function)
initializer elemennt for 'physmap_map.buswidth' is not constant

error exit.

struct map_info physmap_map = {
	name: "Physically mapped flash",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,	// line 65
	read8: physmap_read8,
	read16: physmap_read16,
	read32: physmap_read32,
	copy_from: physmap_copy_from,
	write8: physmap_write8,
	write16: physmap_write16,
	write32: physmap_write32,
	copy_to: physmap_copy_to
};


Thank you,
Qiuyuan Liu



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
