Received: from chambertin.convergence.de ([212.84.236.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uymP-0007Qk-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 16:43:23 +0100
Received: from router-dmz.convergence.de ([212.84.236.1] helo=convergence.de)
	by chambertin.convergence.de with esmtp (Exim 3.16 #7 (Debian))
	id 14uym9-0005gY-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 17:42:49 +0200
Message-ID: <3AF02966.9689ABA5@convergence.de>
Date: Wed, 02 May 2001 17:36:06 +0200
From: Frank Neuber <neuber@convergence.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: FIX-Problem: use counter armflash.c
Content-Type: text/plain; charset=us-ascii
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

Hi list,
I was playing with mtd's on an arm integrator board.
I think I found a bug in the clean up sequence of the module armflash.
The use counter never counts down when I unload the module armflash.
Here is my patch to correct this behavior:

---cut---
513,529d512
<         int i;
<         struct mtd_info *ret, *mtd;
< 
<         for (i=0; i < MAX_MTD_DEVICES; i++)
<         {
<                 mtd = NULL;
<                 ret = __get_mtd_device(mtd, i);
< 
< //              printk("count down %d usecount %d\n",i, ret);
<                 if(ret!=NULL)
<                 {
<                         if(del_mtd_device(ret))
<                         {
<                                 printk("cleanup %d failed\n",i);
<                         }
<                 }
<         }
---cut---

There is another usecounter problem in armflash. In the afs_cfi_init()
function the 
function do_map_probe() is called. After this call the usecount 
of the module cfi_cmdset_0001 is incremented and would never be
decremented.
How can I fix this behaviour?
Is there anybody who is working with mtd's on arm-integrator?

regards 
Frank

-- 
Dipl.-Ing. Elektrotechnik     convergence integrated media gmbh / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 50
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
