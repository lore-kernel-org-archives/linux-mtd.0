Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jjakk-0000Aj-Ks
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 13:54:19 +0000
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 50530BD93
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Apr 2008 15:54:11 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEZa1x4ITsY3 for <linux-mtd@lists.infradead.org>;
	Wed,  9 Apr 2008 15:54:04 +0200 (CEST)
Received: from [172.31.65.127] (inside.kranj.cetrtapot.si [192.168.66.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 5BA78BD8A
	for <linux-mtd@lists.infradead.org>;
	Wed,  9 Apr 2008 15:54:04 +0200 (CEST)
Message-ID: <47FCCA7B.7050104@cetrtapot.si>
Date: Wed, 09 Apr 2008 15:54:03 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Memory leak
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've ported 2.6.12 NAND module driver for our board to git tree version
(2.6.25-rc8). While testing the module, I've noticed that memory gets
eaten with each insmod/rmmod cycle. Eg. in ~12 minutes Slab consumption
rises from 1632 kB to 8584 kB, which is soon fatal for our embedded
system with 16megs of ram.

In my NAND driver only mtd_info and nand_chip structs are allocated in
module init, and accordingly released in module cleanup. Step by step
commenting lines in init/cleanup I came up with the conclusion that if
my drivers calls add_mtd_partition(), it leaks! If I comment out call to
add_mtd_partition() no more leaks are seen!?!?!

Quick inspectiion of /proc/slabinfo shows that 'sysfs_dir_cache' entry
'active_objs' rises from 3788 to 10800 - which is suspicious.

I've attached /proc/meminfo and /proc/slabinfo for my test, which does:
while c < 100
 insmod nand driver
 rmmod nand driver
 save meminfo
 save slabinfo
 inc c
done

I've put the dumps on the public FTP server for you to retrieve (size
71940 b):
http://4thway.0catch.com/dumps.zip

Attached is out NAND driver ported to 2.6.25-rc8.
---
/*
 *  drivers/mtd/nand/carneol.c
 *
 *  Copyright (C) 2005 Simon Posnjak (simon.posnjak@cetrtapot.si)
 *
 *  Based on :
 *    drivers/mtd/nand/spia.c
 *    Copyright (C) 2000 Steven J. Hill (sjhill@realitydiluted.com)
 *
 * Pin fliping code was "borowed" from Hinko Kocevar's TCS2301 driver
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 *  Overview:
 *   This is a device driver for the NAND flash device found on the
 *   Carneol board which utilizes the Toshiba TC58 part.
 */

#include <linux/version.h>
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,15)
#include <linux/platform_device.h>
#else
#include <linux/config.h>
#endif

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/delay.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/nand.h>
#include <linux/mtd/partitions.h>
#include <linux/fs.h>

#include <asm/io.h>
#include <asm/cpot/carneol-platform.h>

static unsigned char mod_name[]		= "carneol-nand";
static unsigned char mod_version[]	= "08040801";

static struct mtd_info *tc58512_mtd = NULL;


/*
 * All NAND flash signals are connected to cris PGx ports.
 */

/*
 * Data signals are on PG1 port pins b0 - b7. Direction of data pins must be
 * set before starting byte read/write operation on data pins.
 */
//#define TC58512_DATA		CARNEOL_PG1		/* PORTG b8 - b15 */
//#define TC58512_DATA0	CARNEOL_PG1_IO0	/* PORTG b8 */
//#define TC58512_DATA1	CARNEOL_PG1_IO1	/* PORTG b9 */
//#define TC58512_DATA2	CARNEOL_PG1_IO2	/* PORTG b10 */
//#define TC58512_DATA3	CARNEOL_PG1_IO3	/* PORTG b11 */
//#define TC58512_DATA4	CARNEOL_PG1_IO4	/* PORTG b12 */
//#define TC58512_DATA5	CARNEOL_PG1_IO5	/* PORTG b13 */
//#define TC58512_DATA6	CARNEOL_PG1_IO6	/* PORTG b14 */
//#define TC58512_DATA7	CARNEOL_PG1_IO7	/* PORTG b15 */

/*
 * Control signals are on PG2 port pins b1 - b6. Direction of control pins
 * is set to output in init stage.
 *
 * NOTE: PG2 pins b0 and b7 are not used for NAND flash!
 */
//#define TC58512_CTRL		CARNEOL_PG2		/* PORTG b16 - b23 */
//#define TC58512_RE		CARNEOL_PG2_IO1	/* PORTG b17 */
//#define TC58512_CE		CARNEOL_PG2_IO2	/* PORTG b18 */
//#define TC58512_CLE		CARNEOL_PG2_IO3	/* PORTG b19 */
//#define TC58512_ALE		CARNEOL_PG2_IO4	/* PORTG b20 */
//#define TC58512_WE		CARNEOL_PG2_IO5	/* PORTG b21 */
//#define TC58512_WP		CARNEOL_PG2_IO6	/* PORTG b22 */

/*
 * Status signal (chip ready) is on PG3 pin b0. Direction of status pin
 * is set to input in init stage.
 */
//#define TC58512_STATUS	CARNEOL_PG3		/* PORTG b24 - b31 */
//#define TC58512_RYBY		CARNEOL_PG3_IO0	/* PORTG b24 */

#if defined(CONFIG_CPOT_PLATFORM_AFC2)
const static struct mtd_partition partition_info[] =
{
	{
	 .name = "Carneol NAND part1 (program)",
	 .offset = 0,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part2 (dataout)",
	 .offset = 4 * 1024 * 1024,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part3 (datain)",
	 .offset = 8	* 1024 * 1024,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part4 (backup)",
	 .offset = 12 * 1024 * 1024,
	 .size = 8 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part5 (upgrade)",
	 .offset = 20 * 1024 * 1024,
	 .size = 8 * 1024 * 1024
	}
};
#define NUM_PARTITIONS 5
#elif defined(CONFIG_CPOT_PLATFORM_CDU2)
const static struct mtd_partition partition_info[] =
{
	{
	 .name = "Carneol NAND part1 (program)",
	 .offset = 0,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part2 (dataout)",
	 .offset = 4 * 1024 * 1024,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part3 (datain)",
	 .offset = 8	* 1024 * 1024,
	 .size = 4 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part4 (disk1)",
	 .offset = 12	* 1024 * 1024,
	 .size = 8 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part5 (disk2)",
	 .offset = 20	* 1024 * 1024,
	 .size = 8 * 1024 * 1024
	},
	{
	 .name = "Carneol NAND part4 (backup)",
	 .offset = 28	* 1024 * 1024,
	 .size = 4 * 1024 * 1024
	},

};
#define NUM_PARTITIONS 6
#elif defined(CONFIG_CPOT_PLATFORM_TAA2)
const static struct mtd_partition partition_info[] =
{
	{
	 .name = "Carneol NAND part1 (program)",
	 .offset = 0,
	 .size = 4 * 1024 * 1024,
	},
	{
	 .name = "Carneol NAND part2 (dataout)",
	 .offset = 4 * 1024 * 1024,
	 .size = 8 * 1024 * 1024,
	},
	{
	 .name = "Carneol NAND part3 (datain)",
	 .offset = 12	* 1024 * 1024,
	 .size = 8 * 1024 * 1024,
	},
	{
	 .name = "Carneol NAND part4 (lib)",
	 .offset = 20 * 1024 * 1024,
	 .size = 8 * 1024 * 1024,
	},
	{
	 .name = "Carneol NAND part5 (usr)",
	 .offset = 28 * 1024 * 1024,
	 .size = 4 * 1024 * 1024,
	},
};
#define NUM_PARTITIONS 5
#endif	/* CONFIG_CPOT_PLATFORM_AFC2, CDU2, TAA2 */

static u_char tc58512_read_byte (struct mtd_info *mtd);
static void tc58512_write_byte (struct mtd_info *mtd, u_char byte);
static void tc58512_write_buf (struct mtd_info *mtd, const u_char * buf,
int len);
static void tc58512_read_buf (struct mtd_info *mtd, u_char * buf, int len);
static int tc58512_verify_buf (struct mtd_info *mtd, const u_char * buf,
int len);


#if 0
57 /* Select the chip by setting nCE to low */
58 #define NAND_NCE								0x01
59 /* Select the command latch by setting CLE to high */
60 #define NAND_CLE								0x02
61 /* Select the address latch by setting ALE to high */
62 #define NAND_ALE								0x04
63
64 #define NAND_CTRL_CLE					 (NAND_NCE | NAND_CLE)
65 #define NAND_CTRL_ALE					 (NAND_NCE | NAND_ALE)
66 #define NAND_CTRL_CHANGE				0x80
#endif

static void tc58512_cmd_ctrl (struct mtd_info *mtd, int cmd, unsigned
int ctrl)
{
	if (ctrl & NAND_CTRL_CHANGE)
	{
		if (ctrl & NAND_NCE)
			//carneol_pin_low(TC58512_CTRL, TC58512_CE);
			carneol_low_pg_18();
		else
			//carneol_pin_high(TC58512_CTRL, TC58512_CE);
			carneol_high_pg_18();

		if (ctrl & NAND_CLE)
			//carneol_pin_high(TC58512_CTRL, TC58512_CLE);
			carneol_high_pg_19();
		else
			//carneol_pin_low(TC58512_CTRL, TC58512_CLE);
			carneol_low_pg_19();
	
		if (ctrl & NAND_ALE)
			//carneol_pin_high(TC58512_CTRL, TC58512_ALE);
			carneol_high_pg_20();
		else
			//carneol_pin_low(TC58512_CTRL, TC58512_ALE);
			carneol_low_pg_20();
	}

	if (cmd != NAND_CMD_NONE)
	{
		tc58512_write_byte(mtd, (unsigned char)cmd);
	}
}

static int tc58512_device_ready (struct mtd_info *mtd)
{
	/* 1 - chip is ready, 0 - chip is busy. */
	//return (int) (carneol_pin_level(TC58512_STATUS, TC58512_RYBY));
	return carneol_is_high_pg_24();
}

static u_char tc58512_read_byte (struct mtd_info *mtd)
{
	u_int8_t val;

	//carneol_port_input(TC58512_DATA);
	carneol_input_pg_8();
	//carneol_pin_low(TC58512_CTRL, TC58512_RE);
	carneol_low_pg_17();

	//val = (unsigned char) carneol_port_read(TC58512_DATA);
	val = carneol_read_pg1();
	//carneol_pin_high(TC58512_CTRL, TC58512_RE);
	carneol_high_pg_17();

	return val;
}

static void tc58512_write_byte (struct mtd_info *mtd, u_char byte)
{
	//carneol_port_output(TC58512_DATA);
	carneol_output_pg_8();
	
	//carneol_port_write(TC58512_DATA, (unsigned char)byte);
	carneol_write_pg1((u_int8_t) byte);
		
	//carneol_pin_low(TC58512_CTRL, TC58512_WE);
	carneol_low_pg_21();
	//carneol_pin_high(TC58512_CTRL, TC58512_WE);
	carneol_high_pg_21();
}

static void tc58512_write_buf (struct mtd_info *mtd, const u_char * buf,
int len)
{
	int i;

	//carneol_port_output(TC58512_DATA);
	carneol_output_pg_8();

	for (i = 0; i < len; i++)
	{
		//carneol_port_write(TC58512_DATA, (unsigned char)buf[i]);
		carneol_write_pg1((u_int8_t) buf[i]);
		//carneol_pin_low(TC58512_CTRL, TC58512_WE);
		carneol_low_pg_21();
		//carneol_pin_high(TC58512_CTRL, TC58512_WE);
		carneol_high_pg_21();
	}
}

static void tc58512_read_buf (struct mtd_info *mtd, u_char * buf, int len)
{
	int i;

	//carneol_port_input(TC58512_DATA);
	carneol_input_pg_8();

	for (i = 0; i < len; i++)
	{
		//carneol_pin_low(TC58512_CTRL, TC58512_RE);
		carneol_low_pg_17();
		//buf[i] = (unsigned char) carneol_port_read(TC58512_DATA);
		buf[i] = carneol_read_pg1();
		//carneol_pin_high(TC58512_CTRL, TC58512_RE);
		carneol_high_pg_17();
	}
}

static int tc58512_verify_buf (struct mtd_info *mtd, const u_char * buf,
int len)
{
	int i;

	//carneol_port_input(TC58512_DATA);
	carneol_input_pg_8();

	for (i = 0; i < len; i++)
	{
		//carneol_pin_low(TC58512_CTRL, TC58512_RE);
		carneol_low_pg_17();
		//if ((u_char) buf[i] != (unsigned char) carneol_port_read(TC58512_DATA))
		if ((u_int8_t) buf[i] != (u_int8_t) carneol_read_pg1())
			return -EFAULT;
		//carneol_pin_high(TC58512_CTRL, TC58512_RE);
		carneol_high_pg_17();
	}
	return 0;
}


static int __init tc58512_init (void)
{
	struct nand_chip *this;

	printk("Carneol %s module %s, (C) 2005 - 2008 Simon Posnjak, Hinko
Kocevar\n", mod_name, mod_version);
	
	tc58512_mtd = kmalloc(sizeof(struct mtd_info) + sizeof (struct nand_chip),
			 GFP_KERNEL);
	if (!tc58512_mtd)
	{
		printk(KERN_ERR "%s: Unable to allocate carneol NAND MTD device
structure.\n", __func__);
		return -ENOMEM;
	}

	this = (struct nand_chip *) (&tc58512_mtd[1]);

	memset((char *) tc58512_mtd, 0, sizeof(struct mtd_info));
	memset((char *) this, 0, sizeof(struct nand_chip));

	tc58512_mtd->priv = this;
	tc58512_mtd->owner = THIS_MODULE;

	//carneol_port_output(TC58512_CTRL);
	carneol_output_pg_16();
	//carneol_port_input(TC58512_DATA);
	carneol_input_pg_8();
	//carneol_port_input(TC58512_STATUS);
	carneol_input_pg_24();

	//carneol_pin_low(TC58512_CTRL, TC58512_CLE);
	carneol_low_pg_19();
	//carneol_pin_low(TC58512_CTRL, TC58512_ALE);
	carneol_low_pg_20();
	//carneol_pin_high(TC58512_CTRL, TC58512_CE);
	carneol_high_pg_18();
	//carneol_pin_high(TC58512_CTRL, TC58512_RE);
	carneol_high_pg_17();
	//carneol_pin_high(TC58512_CTRL, TC58512_WE);
	carneol_high_pg_21();
	//carneol_pin_high(TC58512_CTRL, TC58512_WP);
	carneol_high_pg_22();

	this->read_byte = tc58512_read_byte;
	//this->write_byte = tc58512_write_byte;
	this->write_buf = tc58512_write_buf;
	this->read_buf = tc58512_read_buf;
	this->verify_buf = tc58512_verify_buf;
	this->dev_ready = tc58512_device_ready;
	
	/* Set address of hardware control function */
	this->cmd_ctrl = tc58512_cmd_ctrl;
	/* 3 us command delay time */
	this->chip_delay = 3;
	this->ecc.mode = NAND_ECC_SOFT;
	
	/* Scan to find existence of the device */
	if (nand_scan(tc58512_mtd, 1))
	{
		kfree(tc58512_mtd);
		return -ENXIO;
	}

#ifdef CONFIG_MTD_PARTITIONS
	/* Register the partitions */
	add_mtd_partitions(tc58512_mtd, partition_info, NUM_PARTITIONS);
#endif
	return 0;
}

static void __exit tc58512_cleanup (void)
{
#if 0
	/* Release MTD partitions */
	del_mtd_partitions(tc58512_mtd);
#endif
	
	/* Release resources, unregister device */
	nand_release(tc58512_mtd);

	/* Free the MTD device structure */
	kfree(tc58512_mtd);

	printk("Carneol %s module version %s removed\n", mod_name, mod_version);
}

module_init(tc58512_init);
module_exit(tc58512_cleanup);

MODULE_AUTHOR("Simon Posnjak <simon.posnjak@cetrtapot.si>, Hinko Kocevar
<hinko.kocevar@cetrtapot.si>");
MODULE_DESCRIPTION("CPOT Carneol NAND flash module for TC58512
compatible flash");
MODULE_LICENSE("GPL");

---

Best regards,
Hinko



-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
