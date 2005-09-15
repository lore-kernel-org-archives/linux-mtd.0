Received: from zeus.bridgeport.edu ([216.87.96.66])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFueF-0006gA-11
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 10:23:51 -0400
From: itche <itche@bridgeport.edu>
To: uclinux-dev@uclinux.org
Date: Thu, 15 Sep 2005 10:22:53 -0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_9OYKDVlUTAh+8Vn"
Message-Id: <200509151022.53885.itche@bridgeport.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Almost there
Reply-To: itche@bridgeport.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_9OYKDVlUTAh+8Vn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,
Claudio thanks for all your previous help.

I still don't have the device fully functional.
I am attaching a txt file containing the terminal output, and the 
modifications i have made to some of the files involved.
At this point after doing erase /dev/mtd2 the system hangs, however still 
pingable, and boa is respondig to requests. i have managed to narrow down to 
a single line of code (in /drivers/mtdchar.c) where the system stop 
responding (just after calling schedule() ). however i don't know why? my 
guess is that it is something related to the feedback from the nand (status 
register).
thanks in advance for any help.
Isack

--Boundary-00=_9OYKDVlUTAh+8Vn
Content-Type: text/plain;
  charset="us-ascii";
  name="Text File"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Text File"

=2D------------------------------------------------------------------------=
=2D------------------------------------------------
this is my boot output
uClinux/COLDFIRE(m5272)
COLDFIRE port done by Greg Ungerer, gerg@snapgear.com
=46lat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
On node 0 totalpages: 1024
zone(0): 0 pages.
zone(1): 1024 pages.
zone(2): 0 pages.
Kernel command line:
Calibrating delay loop... 43.72 BogoMIPS
Memory available: 2236k/4096k RAM, 0k/0k ROM (732k kernel code, 216k data)
kmem_create: Forcing size word alignment - vm_area_struct
kmem_create: Forcing size word alignment - mm_struct
kmem_create: Forcing size word alignment - filp
Dentry cache hash table entries: 512 (order: 0, 4096 bytes)
Inode cache hash table entries: 512 (order: 0, 4096 bytes)
kmem_create: Forcing size word alignment - inode_cache
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
kmem_create: Forcing size word alignment - bdev_cache
kmem_create: Forcing size word alignment - cdev_cache
kmem_create: Forcing size word alignment - kiobuf
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 1024 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
kmem_create: Forcing size word alignment - sock
Initializing RT netlink socket
Starting kswapd
kmem_create: Forcing size word alignment - file_lock_cache
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications =
AB.
ColdFire internal UART serial driver version 1.00
ttyS0 at 0x10000100 (irq =3D 73) is a builtin ColdFire UART
ttyS1 at 0x10000140 (irq =3D 74) is a builtin ColdFire UART
kmem_create: Forcing size word alignment - blkdev_requests
fec.c: Probe number 0 with 0x0000
eth0: FEC ENET Version 0.2, 90:02:22:25:dd:b2
fec: PHY @ 0x0, ID 0x001378e2 -- LXT971
SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=3D256).
CSLIP: code copyright 1989 Regents of the University of California.
Blkmem copyright 1998,1999 D. Jeff Dionne
Blkmem copyright 1998 Kenneth Albanowski
Blkmem 7 disk images:
0: 10D15C-1C155B [VIRTUAL 10D15C-1C155B] (RO)
1: FFE00000-FFE3FFFF [VIRTUAL FFE00000-FFE3FFFF] (RW)
2: FFE00000-FFE07FFF [VIRTUAL FFE00000-FFE07FFF] (RW)
3: FFE08000-FFE3FFFF [VIRTUAL FFE08000-FFE3FFFF] (RW)
4: FFE40000-FFFFFFFF [VIRTUAL FFE40000-FFFFFFFF] (RW)
5: FFF00000-FFFFFFFF [VIRTUAL FFF00000-FFFFFFFF] (RW)
6: FFE00000-FFFFFFFF [VIRTUAL FFE00000-FFFFFFFF] (RW)
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
PPP generic driver version 2.4.2
AMD 8MB OS FLASH: 800000 at ff000000
 Amd/Fujitsu Extended Query Table v1.1 at 0x0040
number of CFI chips: 1
Creating 2 MTD partitions on "OS Flash - AMD 8MB":
0x00000000-0x00500000 : "OperatingSystem (5MB)"
mtd: Giving out device 0 to OperatingSystem (5MB)
0x00500000-0x00800000 : "FileSystem (3MB)"
mtd: Giving out device 1 to FileSystem (3MB)
NAND device: Manufacture ID: 0xec, Chip ID: 0x75 (Samsung K9F5608UOC)
Creating 3 MTD partitions on "Samsung K9F5608UOC":
0x00000000-0x00100000 : "test1"
mtd: Giving out device 2 to test1
0x00100000-0x00a00000 : "test2"
mtd: Giving out device 3 to test2
0x01000000-0x02000000 : "PBX Voice"
mtd: Giving out device 4 to PBX Voice
init_mtdchar: allocated major number 90.
init_mtdblock: allocated major number 31.
Linux telephony interface: v1.00
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
kmem_create: Forcing size word alignment - ip_dst_cache
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 512 bind 512)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (romfs filesystem) readonly.
=46reeing unused kernel memory: 24k freed (0xf4000 - 0xf9000)
Shell invoked to run file: /etc/rc
Command: hostname DigiTalks_PBX
Command: /bin/expand /etc/ramfs.img /dev/ram1
Command: mount -t jffs2 /dev/mtdblock1 /mnt
mtdblock_open
ok
Command: mount -t proc proc /proc
Command: mount -t ext2 /dev/ram1 /var
Command: mkdir /var/tmp
Command: mkdir /var/log
Command: mkdir /var/run
Command: mkdir /var/lock
Command: ifconfeZ=16b127.0.0.1
Command:t=EF=BF=BDadd -net 127.0.0.0hr=D1=B5=CD=AD255.0.0.0 lo
ro0]W=02=12command or file :+5
                                Command: dhcpcd -p  KX*=D1=A1=EF=BF=BD&
config: auto-negotiation on, 100FDX, 100HDX, 10FDX, 10HDX.
[16]
Command: cat /etc/motd



                Welcome to  DigiTalks ClodFire based



        **************       *************       *****           *****
        *              *     *             *      *   *         *   *
        *   ********    *    *  ********    *      *   *       *   *
        *   *      *     *   *  *      *     *      *   *     *   *
        *   *      *     *   *  *      *    *        *   *   *   *
        *   ********    *    *  ********   *          *   * *   *
        *              *     *             *           *        *
        *   ***********      *  ********   *          *   * *   *
        *   *                *  *      *     *       *   *   *   *
        *   *                *  *      *      *     *   *     *   *
        *   *                *  ********     *     *   *       *   *
        *   *                *             *      *   *         *   *
        ****                 *************       *****           *****



Running

          ____ _  _
         /  __| ||_|
    _   _| |  | | _ ____  _   _  _  _
   | | | | |  | || |  _ \| | | |\ \/ /
   | |_| | |__| || | | | | |_| |/    \
   |  ___\____|_||_|_| |_|\____|\_/\_/
   | |
   |_|


PBX Port done by Isack Waserman - DigiTalks (6/2005)

=46or further information check:
http://www.digitalks.com

Execution Finished, Exiting

Sash command shell (version 1.1.1)
/>

=2D------------------------------------------------------------------------=
=2D------------------------------------------------------------------------=
=2D------------------
this is after running the erase command

/> erase /dev/mtd2
MTD_open
MTD_ioctl - itche
MTD_ioctl - itche
 in non region erase
Erase UnMZ=17=EF=BF=BD
                 0x4000,

PerT=EF=BF=BDFlash Erase of leD=EF=BF=BD5
                                  16384
at offset _=EF=BF=BD
 sector is unlocked iKJ=D1=8D
octl - itche
in case MEMERASE
We are going to NAND.C here
nand_erase: start =3D 0x00000000, len =3D 16384
 flash is ready, going into erase state
 WP status check,nand status is:0xc0
 going into while loop for: 0x4000
 IN THE while loop for: 0x4000
 checking nand status,nand status is:0xc0
 block eras  is good - in NAND.C
 in erase status
 out of while loop
 end of function nand erase
We are returning from NAND.C here
ret=3D 0x00

before if statment

=2D------------------------------------------------------------------------=
=2D------------------------------------------------------------------------=
=2D------------------



=2D------------------------------------------------------------------------=
=2D-----------------------------------------------
this is in /drivers/mtd/nand/nand.c

static unsigned char NAND_CTRL_MIROR;
/*
 * Macros for low-level register control
 */
#define NAND_CTRL (*(volatile unsigned char *) \
			((struct nand_chip *) mtd->priv)->CTRL_ADDR)

#define nand_select()	NAND_CTRL_MIROR &=3D ~this->NCE; \
			NAND_CTRL =3D NAND_CTRL_MIROR; \
			nand_command(mtd, NAND_CMD_RESET, -1, -1); \
			udelay (10);
#define nand_deselect() NAND_CTRL_MIROR |=3D this->NCE; \
			NAND_CTRL =3D NAND_CTRL_MIROR;


/*
 * NAND erase a block
 */
static int nand_erase (struct mtd_info *mtd, struct erase_info *instr)
{
	int i, page, len, status, pages_per_block;
	struct nand_chip *this =3D mtd->priv;
	DECLARE_WAITQUEUE(wait, current);

	DEBUG (MTD_DEBUG_LEVEL3,
		"nand_erase: start =3D 0x%08x, len =3D %i\n",
		(unsigned int) instr->addr, (unsigned int) instr->len);

	/* Start address must align on block boundary */
	if (instr->addr & (mtd->erasesize - 1)) {
		DEBUG (MTD_DEBUG_LEVEL0,
			"nand_erase: Unaligned address\n");
		return -EINVAL;
	}

	/* Length must align on block boundary */
	if (instr->len & (mtd->erasesize - 1)) {
		DEBUG (MTD_DEBUG_LEVEL0,
			"nand_erase: Length not block aligned\n");
		return -EINVAL;
	}

	/* Do not allow erase past end of device */
	if ((instr->len + instr->addr) > mtd->size) {
		DEBUG (MTD_DEBUG_LEVEL0,=20
			"nand_erase: Erase past end of device\n");
		return -EINVAL;
	}

retry:
	/* Grab the lock and see if the device is available */
	spin_lock_bh (&this->chip_lock);

	switch (this->state) {
	case FL_READY:
		DEBUG (MTD_DEBUG_LEVEL3," flash is ready, going into erase state\n");//it=
che
		this->state =3D FL_ERASING;
		break;
	=09
	default:
		set_current_state (TASK_UNINTERRUPTIBLE);
		add_wait_queue (&this->wq, &wait);
		spin_unlock_bh (&this->chip_lock);
		schedule();

		remove_wait_queue (&this->wq, &wait);
		goto retry;
	};

	/* Shift to get first page */
	page =3D (int) (instr->addr >> this->page_shift);

	/* Calculate pages in each block */
	pages_per_block =3D mtd->erasesize / mtd->oobblock;
=09
	/* Select the NAND device */
	nand_select ();

	/* Check the WP bit */
	nand_command (mtd, NAND_CMD_STATUS, -1, -1);
	DEBUG (MTD_DEBUG_LEVEL3," WP status check,nand status is:0x%02x\n",(readb =
(this->IO_ADDR)));//itche
	if (!(readb (this->IO_ADDR) & 0x80)) {
		DEBUG (MTD_DEBUG_LEVEL0,
			"nand_erase: Device is write protected!!!\n");
		nand_deselect ();
		this->state =3D FL_READY;
		spin_unlock_bh (&this->chip_lock);
		return -EIO;
	}

	/* Loop through the pages */
	len =3D instr->len;
	DEBUG (MTD_DEBUG_LEVEL3," going into while loop for: 0x%02x\n" ,instr->len=
);
	while (len) {
		/* Send commands to erase a page */
		nand_command(mtd, NAND_CMD_ERASE1, -1, page);
		nand_command(mtd, NAND_CMD_ERASE2, -1, -1);
		DEBUG (MTD_DEBUG_LEVEL3," IN THE while loop for: 0x%02x\n" ,len);
		/*
		 * Wait for program operation to complete. This could
		 * take up to 4000us (4ms) on some devices, so we try
		 * and exit as quickly as possible.
		 */
		status =3D 0;
		for (i=3D0 ; i<32 ; i++) {
			/* Delay for 125us */
			udelay (125);

			/* Check the status */
			nand_command (mtd, NAND_CMD_STATUS, -1, -1);
			status =3D (int) readb (this->IO_ADDR);
			DEBUG (MTD_DEBUG_LEVEL3," checking nand status,nand status is:0x%02x\n",=
status);//itche
			if (status & 0x40)
				break;
		}

		/* See if block erase succeeded */
		if (status & 0x01) {
			DEBUG (MTD_DEBUG_LEVEL0,
				"nand_erase: " \
				"Failed erase, page 0x%08x\n", page);
			nand_deselect ();
			this->state =3D FL_READY;
			spin_unlock_bh (&this->chip_lock);
			return -EIO;
		}
		else DEBUG (MTD_DEBUG_LEVEL3," block eras  is good - in NAND.C\n");//itche

		/* Increment page address and decrement length */
		len -=3D mtd->erasesize;
		page +=3D pages_per_block;

		/* Release the spin lock */
		spin_unlock_bh (&this->chip_lock);

erase_retry:
		/* Check the state and sleep if it changed */
		spin_lock_bh (&this->chip_lock);
		if (this->state =3D=3D FL_ERASING) {
			DEBUG (MTD_DEBUG_LEVEL3," in erase status \n");//itche
			continue;
		}
		else {
			set_current_state (TASK_UNINTERRUPTIBLE);
			add_wait_queue (&this->wq, &wait);
			spin_unlock_bh (&this->chip_lock);
			schedule();
			remove_wait_queue (&this->wq, &wait);
			DEBUG (MTD_DEBUG_LEVEL3," go back to erase_retry \n");//itche
			goto erase_retry;
		}
	}
	DEBUG (MTD_DEBUG_LEVEL3," out of while loop \n");//itche
=09
	spin_unlock_bh (&this->chip_lock);

	/* De-select the NAND device */
	nand_deselect ();
=09
	/* Do call back function */
	if (instr->callback)
		instr->callback (instr);

	/* The device is ready */
	spin_lock_bh (&this->chip_lock);
	this->state =3D FL_READY;
	spin_unlock_bh (&this->chip_lock);
=09
=09
	DEBUG (MTD_DEBUG_LEVEL3," end of function nand erase \n");
=09
=09
	/* Return happy */
	return 0;
=09
}
=2D------------------------------------------------------------------------=
=2D------------------------------------------------------------------------=
=2D-----------


=2D------------------------------------------------------------------------=
=2D-----------------------
this is in /user/mtd-utils/erase.c

int non_region_erase(int Fd, int start, int count, int unlock)
{
	mtd_info_t meminfo;

	if (ioctl(Fd,MEMGETINFO,&meminfo) =3D=3D 0)
	{
		erase_info_t erase;

		erase.start =3D start;
		printf (" in non region erase \n" );// itche

		erase.length =3D meminfo.erasesize;
		printf("Erase Unit Size\n 0x%lx, \n", meminfo.erasesize);

		for (; count > 0; count--) {
			printf("\nPerforming Flash Erase of length\n %lu \nat offset 0x%lx\n",er=
ase.length, erase.start);
			fflush(stdout);=20
			if(unlock !=3D 0)
			{
				//Unlock the sector first.
				printf("\n\rPerforming Flash unlock at offset 0x%lx",erase.start);
				if(ioctl(Fd, MEMUNLOCK, &erase) !=3D 0)
				{
					perror("\nMTD Unlock failure");
					close(Fd);
					return 8;
				}
			}
			else printf(" sector is unlocked - itche \n");//itche
		=09
			if (ioctl(Fd,MEMERASE,&erase) !=3D 0)
			{     =20
				perror("\nMTD Erase failure");
				close(Fd);
				return 8;
			}
			else printf(" eraes is good\n");//itche
		=09
			erase.start +=3D meminfo.erasesize;
		=09
		}
		printf(" done\n");
	}
	return 0;
}
=2D------------------------------------------------------------------------=
=2D-------------------------------


=2D------------------------------------------------------------------------=
=2D---------------------

/*
 * $Id: mtdchar.c,v 1.44 2001/10/02 15:05:11 dwmw2 Exp $
 *
 * Character-device access to raw MTD devices.
 * Pure 2.4 version - compatibility cruft removed to mtdchar-compat.c
 *
 */
=20
 This is in ioctl section
 case MEMERASE:
	DEBUG(MTD_DEBUG_LEVEL0, "in case MEMERASE\n");//itche
	{
		struct erase_info *erase=3Dkmalloc(sizeof(struct erase_info),GFP_KERNEL);
		if (!erase)
			ret =3D -ENOMEM;
		else {
			wait_queue_head_t waitq;
			DECLARE_WAITQUEUE(wait, current);

			init_waitqueue_head(&waitq);

			memset (erase,0,sizeof(struct erase_info));
			if (copy_from_user(&erase->addr, (u_long *)arg,
					   2 * sizeof(u_long))) {
				kfree(erase);
				return -EFAULT;
			}
			erase->mtd =3D mtd;
			erase->callback =3D mtd_erase_callback;
			erase->priv =3D (unsigned long)&waitq;
		=09
			/*
			  FIXME: Allow INTERRUPTIBLE. Which means
			  not having the wait_queue head on the stack.
			 =20
			  If the wq_head is on the stack, and we
			  leave because we got interrupted, then the
			  wq_head is no longer there when the
			  callback routine tries to wake us up.
			*/
			DEBUG(MTD_DEBUG_LEVEL0, "We are going to NAND.C here\n");//itche
			ret =3D mtd->erase(mtd, erase);
			DEBUG(MTD_DEBUG_LEVEL0, "We are returning from NAND.C here\n");//itche
			DEBUG(MTD_DEBUG_LEVEL0, "ret=3D 0x%02x \n\n",ret);//itche
			if (!ret) {
				set_current_state(TASK_UNINTERRUPTIBLE);
				add_wait_queue(&waitq, &wait);
				DEBUG(MTD_DEBUG_LEVEL0, "before if statment\n");//itche
				if (erase->state !=3D MTD_ERASE_DONE &&
				    erase->state !=3D MTD_ERASE_FAILED)
					schedule();
				=09
				DEBUG(MTD_DEBUG_LEVEL0, "after if statment\n");//itche=09
				DEBUG(MTD_DEBUG_LEVEL0, "erase->state =3D 0x%02x\n", erase->state);//it=
che
				remove_wait_queue(&waitq, &wait);
				set_current_state(TASK_RUNNING);

				ret =3D (erase->state =3D=3D MTD_ERASE_FAILED)?-EIO:0;
			}
			kfree(erase);
		}
		break;
	}=20
=2D------------------------------------------------------------------------=
=2D---------------------------------------
--Boundary-00=_9OYKDVlUTAh+8Vn--
