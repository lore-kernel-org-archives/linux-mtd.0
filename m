Received: from web13201.mail.yahoo.com ([216.136.174.186])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16w0Co-00016z-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 13:31:06 +0100
Message-ID: <20020412123104.21405.qmail@web13201.mail.yahoo.com>
Date: Fri, 12 Apr 2002 05:31:04 -0700 (PDT)
From: Sanjay Kumar <sankumar73@yahoo.com>
Subject: MTD erase problem
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hi,
I am using two amd flash Am29DL323D of 4MB size each.
Each of the amd flash have two regions, i.e the first starting
8 sector is of 8K size each and the remaining sectors is of size 64KB each.
My flash organisation is shown below -
 _________
|         |<--   First flash starts at 0xbf800000
|4MB      |
|         |
|         |
|         |
|_________|
|         | <-- Second flash starts at 0xbfc00000
|         |    
|         |     
|         |
| 4MB     |
|_________|


Now I am using physmap.c file and assigning WINDOW_ADDR to 0xbf800000 and 
WINDOW_SIZE to 0x800000(8MB) in the mapping information. 
In init_physmap(), it calls the do_cfi_probe to probe the flashes and 
calls add_mtd_device() to add this as MTD device.

Now I am using the character device(crwxr--r--   1 root     root      90,   0 Mar 27  2002 

mtd0) for erase any block at a particular block offset.

It is working fine except for the starting sectors of the second flash(first 64KB, having
8 sectors of 8KB each). If I make use of "ioctl" for erasing the these sectors, it can
erase the first 8KB sector but it returns error in case of other remaining 7 secors
(8KB size each). As a result I am unable to erase the flash completely.

Do I need to look into cfi_cmdset_0002.c and change it to make it working?


Thanks & Regards,
Sanjay

__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
