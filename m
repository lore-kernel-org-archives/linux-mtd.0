Received: from outbound-mail.lax.untd.com ([64.136.28.164])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvl0H-0006xe-Oy
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 18:30:47 -0500
Received: from webmail21.lax.untd.com (webmail21.lax.untd.com [10.131.27.161])
	by smtpout06.lax.untd.com with SMTP id AABA97R5LA2EJN6A
	for <linux-mtd@lists.infradead.org> (sender <pevnev@juno.com>);
	Mon, 31 Jan 2005 15:29:46 -0800 (PST)
Mime-Version: 1.0
From: "Alex" <pevnev@juno.com>
Date: Mon, 31 Jan 2005 23:28:26 GMT
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <20050131.152934.3938.46960@webmail21.lax.untd.com>
Cc: bjorn.wesen@axis.com, dwmw2@infradead.org
Subject: Question re initiliazation of MTD NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Well..., it appears that I have put wrong value for CONFIG_MTD_PHYSMAP_LEN ... but what should be done to indicate that 
I want two banks (partitions) out of MTD flash each of 8Mb length ?
- or should I at this point put there the total length,
which is 16 MB ? ... deal with partioning later ?

Is there any documentation (or how to) on this?  (obviously I am doing it first time ... ;-) ).

Thanks,
Alex

-- "Alex" wrote:

Hi Bjorn and David,

I am trying to bring the custom 8xx based board on Linux 2.6.10-rc3 . 

MPC880 microprocessor
4 Mbytes Normal Flash 
8 + 8 Mbytes NAND Flash 
32 Mbytes DRAM

To what values I should set 

CONFIG_MTD_PHYSMAP_START=  /*  I  tried  0x05000401  but have problems 
                             - see log buffer supplied  */ 
and 

CONFIG_MTD_PHYSMAP_LEN=  /*  I  tried 0xFFFF8790  but have problems 
                                - see log buffer supplied  */ 
 
in .config file   ? 

The initial boot provides the following Memory map:

/*********************************************************************/

/* Chip Select FLASH Normal */
#define BR0_VAL     0x04000801  /* Offset=0x04000000 PS=16 GPCM Valid=1 */
#define OR0_VAL     0xFFC00160  /* OK */

/* Chip Select NAND */
#define BR1_VAL     0x05000401  /* MS=[00] -> GPCM */
#define OR1_VAL     0xFFFF8790
 
My current Log Buffer shows:
.....
<6>HDLC support module revision 1.17.
<6>elevator: using anticipatory as default io scheduler.

<5>physmap flash device:ffff8790 at 5000401.
<4>__iorema p(): phys addr 05000000 is RAM lr c01d93f0.
<4>__ioremap(): virt_to_phys(high_memory) addr 02000000.
<4>__ioremap(): passed first cond.
<4>__ioremap(): passed second cond.
<4>allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
<4>__ioremap(): area == 0 return NULL.
<4>Failed to ioremap.

<7>CLASS: registering class device: ID = 'mice'.
<6>mice: PS/2 mouse device common for all mice

Thanks,
Alex 

PS Do I need to do anything else - like to load extra modules before that point of booting the kernel ?


___________________________________________________________________
Speed up your surfing with Juno SpeedBand.
Now includes pop-up blocker!
Only $14.95/month -visit http://www.juno.com/surf to sign up today!
