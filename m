Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Ap2-0001Br-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 17:15:08 +0000
Received: from gateway.pace.co.uk ([195.44.197.250] helo=exchange.saltaire.pace.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Ap0-0001Bl-00
	for mtd@infradead.org; Wed, 29 Nov 2000 17:15:07 +0000
Message-ID: <44632C76B97BD211AF6B00805FADCAB202D738E3@exchange.saltaire.pace.co.uk>
From: Simon Wood <Simon.Wood@pace.co.uk>
To: "'wear-hard@haven.org'" <wear-hard@haven.org>, "'mtd@infradead.org'"
	 <mtd@infradead.org>
Subject: M-System DOC Millennium with MTD.
Date: Wed, 29 Nov 2000 17:14:21 -0000
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello all,
I attempting to get a Millennium Disk on Chip eval board working under Linux with the MTD drivers (rather than the M-System's ones - which appear to work OK).

I've downloaded, applied the patches to the kernel and built the MTD stuff as modules. However I can not read the device, instead I get the error 'mount: /dev/nftla has wrong major or minor number'.

Any idea what is going wrong??

Lots of details.
1). ran 'mtd/utils/MAKEDEV' to set up devices -
	/dev/nftla is 93, 0

2). insmod'ed the modules (without any options) in the following order -
	nftlmount
	mtdcore
	nftl
	docprobe
	docecc
	doc2001

3). Tried to 'mount /dev/nftla /floppy' and got error 'mount: /dev/nftla has wrong major or minor number'.

4) tail /var/log/messages -
		Nov 29 15:57:03 leper kernel: Initializing MTD Layer
		Nov 29 15:57:23 leper kernel: M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
		Nov 29 15:57:23 leper kernel: $Id: mtd-patch-2.2.17,v 1.3 2000/11/15 22:56:48 sjhill Exp $
		Nov 29 15:57:33 leper kernel: M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
		Nov 29 15:58:09 leper kernel: NFTL_open
		Nov 29 15:58:09 leper kernel: ENODEV: thisNFTL = 0, minor = 23808, ip = c33b9a90, fp = c301f980
		Nov 29 15:58:09 leper kernel: NFTL_open
		Nov 29 15:58:09 leper kernel: ENODEV: thisNFTL = 0, minor = 23808, ip = c33b9a90, fp = c27fff64

5). Just for completion here's what the M-Systems drivers log -
		Nov 29 15:45:56 leper kernel: Copyright (C) 1998,2000 M-Systems Flash Disk Pioneers Ltd.
		Nov 29 15:45:56 leper kernel: Copyright (C) 2000 Lineo
		Nov 29 15:45:56 leper kernel: DOC device(s) found: 1
		Nov 29 15:45:56 leper kernel: Fat Filter Enabled
		Nov 29 15:45:56 leper kernel: fl_init: registered device at major: 100
		Nov 29 15:45:56 leper kernel: fl :fl_doc_mount: VOL: 0
		Nov 29 15:45:56 leper kernel: fl :debug: entering NFDC 2148 identification routine.
		Nov 29 15:45:56 leper kernel: fl :Debug: identified NFDC 2148.
		Nov 29 15:45:56 leper kernel: fl :Debug: starting NFTL mount.
		Nov 29 15:45:56 leper kernel: fl :Debug: finished NFTL mount.
		Nov 29 15:45:56 leper kernel:  fla: fla1
		Nov 29 15:45:56 leper kernel: partition: 0: start_sect: 0, nr_sects: 3e30 Fl_blk_size[]: 1f18kb
		Nov 29 15:45:56 leper kernel: partition: 1: start_sect: 1, nr_sects: 3e2f Fl_blk_size[]: 1f17kb
		Nov 29 15:46:18 leper kernel:  fla: fla1

Thanks in advance, I'm sure its something simple that I've missed but it's been a long day.......
Simon Wood



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
