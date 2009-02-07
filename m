Received: from [122.160.64.235] (helo=mail.coraltele.com)
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVfGR-00017a-Od
	for linux-mtd@lists.infradead.org; Sat, 07 Feb 2009 04:58:03 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.coraltele.com (Postfix) with ESMTP id 90BE54DA1C6
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Feb 2009 10:27:53 +0530 (IST)
Received: from mail.coraltele.com ([127.0.0.1])
	by localhost (mail.coraltele.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bntAYJqwcz7 for <linux-mtd@lists.infradead.org>;
	Sat,  7 Feb 2009 10:27:53 +0530 (IST)
Received: from [192.168.4.55] (unknown [192.168.4.55])
	by mail.coraltele.com (Postfix) with ESMTP id CEDDF4DA7F8
	for <linux-mtd@lists.infradead.org>;
	Sat,  7 Feb 2009 10:27:52 +0530 (IST)
Subject: unable to mount jffs2 as rw on SST 39VF320T
From: Sachin Chauhan <sachin.chauhan@coraltele.com>
To: mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2009 10:31:04 +0530
Message-Id: <1233982864.2718.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

DEAR SIR
        
        I am using "SST 39VF320T" flash and linux 2.4 kernel  
        
        I am using this command to make the image to be finally deployed
        as my
        filesystem image
        $SUDO ./mkfs.jffs2 -b -e 0x1000 -r ${TMP_BUILD_DIR}temp-rootfs/
        -o
        ${TMP_BUILD_DIR}rootfs.inca.img
        
        but it increases the erase size to 0x2000 ie 8KiB inspite of my
        assignment of 0x1000 ie 4KiB  giving this message: (see below)
                Erase size 0x1000 too small. Increasing to 8KiB minimum
        and when I put this image in flash and finally boot from flash
        (run
        flash_all), it mount my filesystem as read only inspite if my
        assignment
        of rw on boot command line.
        BELOW are few lines of "printenv" command on boot prompt:
         
        flash_all=run jffs2args addip addmisc;bootm B0040000
        jffs2args=setenv bootargs root=/dev/mtdblock3 rw
        rootfstype=jffs2
        addip=setenv bootargs $(bootargs) ip=$(ipaddr):$(serverip):
        $(gatewayip):
        $(netmask):$(hostname)::off
        addmisc=setenv bootargs $(bootargs) console=ttyS0,$(baudrate)
        ethaddr=
        $(ethaddr) panic=1
        
        The prints below are during kernel boot sequence
        
        
        Inode cache hash table entries: 512 (order: 0, 4096 bytes)
        Mount cache hash table entries: 512 (order: 0, 4096 bytes)
        Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
        Page-cache hash table entries: 2048 (order: 1, 8192 bytes)
        Checking for 'wait' instruction...  available.
        POSIX conformance testing by UNIFIX
        Linux NET4.0 for Linux 2.4
        Based upon Swansea University Computer Society NET3.039
        Initializing RT netlink socket
        ikconfig 0.5 with /proc/ikconfig
        Starting kswapd
        devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
        devfs: boot_options: 0x1
        JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis
        Communications AB.
        Dummy keyboard driver installed.
        pty: 256 Unix98 ptys configured
        ttyS%d0 at MEM 0xb8000400 (irq = 81) is a INCAIPASC
        INCA-IP SSC driver 0.9: built Feb  6 2009 16:25:46
        registered major 254 for SSC
        eth0: incaipsw,  00 00 de 00 dd 00
        loop: loaded (max 8 devices)
        PPP generic driver version 2.4.2
        init_incaip_mtd: chip probing count 0
        qry string found VIVEK 
        Number of erase regions: 2
        Primary Vendor Command Set: 0701 (Unknown)
        No Primary Algorithm Table
        Alternative Vendor Command Set: 0000 (None)
        No Alternate Algorithm Table
        Vcc Minimum: 2.7 V
        Vcc Maximum: 3.6 V
        No Vpp line
        Typical byte/word write timeout: 8 �s
        Maximum byte/word write timeout: 16 �s
        Full buffer write not supported
        Typical block erase timeout: 16 ms
        Maximum block erase timeout: 32 ms
        Typical chip erase timeout: 32 ms
        Maximum chip erase timeout: 64 ms
        Device size: 0x400000 bytes (4 MiB)
        Flash Device Interface description: 0x0001
          - x16-only asynchronous interface
        Max. bytes in buffer write: 0x1
        Number of Erase Block Regions: 2
          Erase Region #0: BlockSize 0x1000 bytes, 1024 blocks
          Erase Region #1: BlockSize 0x10000 bytes, 64 blocks
        number of JEDEC chips: 1
        0: offset=0x0,size=0x1000,blocks=1024
        1: offset=0x400000,size=0x10000,blocks=64
        init_incaip_mtd: bank1, name:INCA-IP Bank 0, size:4194304bytes 
        INCA-IP flash0: Using static image partition definition
        Creating 4 MTD partitions on "INCA-IP Bank 0":
        0x00000000-0x00030000 : "U-Boot"
        0x00030000-0x00040000 : "Environment"
        0x00040000-0x00100000 : "Linux"
        0x00100000-0x00400000 : "rootfs"
        cryptoapi: loaded
        cryptoapi: Registered aes-ecb (0)
        cryptoapi: Registered aes-cbc (65536)
        cryptoapi: Registered aes-cfb (131072)
        cryptoapi: Registered aes-ofb (262144)
        cryptoapi: Registered aes-ctr (262144)
        cryptoapi: Registered aes-rtc (524288)
        NET4: Linux TCP/IP 1.0 for NET4.0
        IP Protocols: ICMP, UDP, TCP, IGMP
        IP: routing cache hash table of 512 buckets, 4Kbytes
        TCP: Hash tables configured (established 512 bind 1024)
        Port 0: Auto-Negotiation: 100Base-TX full-duplex, with PAUSE
        IP-Config: Unable to set interface netmask (-22).
        ip_conntrack version 2.1 (64 buckets, 512 max) - 156 bytes per
        conntrack
        ip_tables: (C) 2000-2002 Netfilter core team
        NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
        802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
        All bugs added by David S. Miller <davem@redhat.com>
        Inca-IP Switch Access Initialization
        Inca-IP Port Initialization
        INCA-IP OAK mailbox driver, Version 0.1.1.2
        (c) Copyright 2003, Infineon Technologies AG
        jffs2_scan_eraseblock(): Scanning block at 0x0
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x1000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x2000
        VIVEK sector size is 0x1000
        Found empty flash at 0x2fb8
        jffs2_scan_eraseblock(): Scanning block at 0x3000
        VIVEK sector size is 0x1000
        Found empty flash at 0x3fd8
        jffs2_scan_eraseblock(): Scanning block at 0x4000
        VIVEK sector size is 0x1000
        Found empty flash at 0x4fcc
        jffs2_scan_eraseblock(): Scanning block at 0x5000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x6000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x7000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x8000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x9000
        VIVEK sector size is 0x1000
        Found empty flash at 0x9fc0
        jffs2_scan_eraseblock(): Scanning block at 0xa000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0xb000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0xc000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0xd000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0xe000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0xf000
        VIVEK sector size is 0x1000
        Fewer than 12 bytes left to end of block. Not reading
        jffs2_scan_eraseblock(): Scanning block at 0x10000
        
        and so on..............
        
        PLZ HELP................
        
