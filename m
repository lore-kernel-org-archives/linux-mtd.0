Received: from [62.112.80.35] (helo=ipc1.karo)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeY04-0008Qv-C1
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 11:06:52 +0000
Received: from lothar by ipc1.karo with local (Exim 3.35 #1 (Debian))
	id 1AeXxo-0004Wv-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2004 12:04:32 +0100
Message-ID: <16381.14656.474765.390645@ipc1.karo>
Date: Thu, 8 Jan 2004 12:04:32 +0100
From: "Lothar Wassmann" <LW@KARO-electronics.de>
To: linux-mtd@lists.infradead.org
Sender: Lothar Wassmann <lothar@karo-electronics.de>
Subject: put_chip() called with oldstate 1!! (linux 2.6.0-rmk2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using the MTD driver with Intel flash chips on a PXA255 platform
with Redboot partitions. Whenever I write data to the flash and
subsequently unmount and remount the modified partition I get several
messages: 'put_chip() called with oldstate 1!!'.

The put_chip() routine has this switch statement:
|	switch(chip->oldstate) {
|	case FL_ERASING:
|		chip->state = chip->oldstate;
|		/* What if one interleaved chip has finished and the 
|		   other hasn't? The old code would leave the finished
|		   one in READY mode. That's bad, and caused -EROFS 
|		   errors to be returned from do_erase_oneblock because
|		   that's the only bit it checked for at the time.
|		   As the state machine appears to explicitly allow 
|		   sending the 0x70 (Read Status) command to an erasing
|		   chip and expecting it to be ignored, that's what we 
|		   do. */
|		cfi_write(map, CMD(0xd0), adr);
|		cfi_write(map, CMD(0x70), adr);
|		chip->oldstate = FL_READY;
|		chip->state = FL_ERASING;
|		break;
|
|	case FL_READY:
|		/* We should really make set_vpp() count, rather than doing this */
|		DISABLE_VPP(map);
|		break;
|	default:
|		printk(KERN_ERR "put_chip() called with oldstate %d!!\n", chip->oldstate);
|	}

Since I'm not familiar with the details of flash programming, I don't
know what to do with this error message. Should the case FL_STATUS:
(oldstate == 1) be added to the switch to silently ignore this case,
or is there something wrong with the driver or my flash chips?


Lothar Wassmann
