Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QJMwp-0001pR-VV
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 09:40:16 +0000
Message-ID: <4DC7B684.4040609@free-electrons.com>
Date: Mon, 09 May 2011 11:40:20 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: joern@lazybastard.org, linux-mtd@lists.infradead.org
Subject: System hangs on logfs umount
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hello,

I'm trying to use logfs (I'm supposed to benchmark several flash FS,
including logfs) but am facing a complete system hang: no panic, no
kernel message, the umount shell call just doesn't return and I can't do
anything anymore through the serial port.

The card I'm running it on is the igepv2 (or "igep0020") ; the flash has
2KiB pages and 128KiB EBs. (I tried with config_mtd_onenand_2x_program,
which simulates 4096/256KiB, but then, syncing also causes a system hang).

I turned on full logfs debugging:
-#define LOGFS_DEBUG            (0x01)
+#define LOGFS_DEBUG            LOGFS_DEBUG_ALL
but the logs don't event print:
    log_super("LogFS: Start unmounting\n");

Here is what appears to be logged when unmounting:
Jan  1 00:07:00 buildroot user.debug kernel: [  425.028472]
move_inode_to_page(1, 11, 0)
Jan  1 00:07:00 buildroot user.debug kernel: [  425.029388]
logfs_open_area(d, 7)
Jan  1 00:07:00 buildroot user.debug kernel: [  425.032165]
logfs_segment_write(1, 10, 7) 0->1a0018 0->101c
Jan  1 00:07:00 buildroot user.debug kernel: [  425.032440]
logfs_open_area(e, 6)
Jan  1 00:07:00 buildroot user.debug kernel: [  425.033447]
logfs_segment_write(1, 11, 6) 0->1c0018 0->e4
Jan  1 00:07:00 buildroot user.debug kernel: [  425.034149]
logfs_open_area(f, 0)
Jan  1 00:07:00 buildroot user.debug kernel: [  425.035156]
logfs_segment_write(2, 1, 0) 0->1e0018 0->126
Jan  1 00:07:00 buildroot user.debug kernel: [  425.035339]
move_inode_to_page(1, 2, 0)
Jan  1 00:07:00 buildroot user.debug kernel: [  425.035827]
logfs_segment_write(1, 2, 6) e00fc->1c00fc 0->e4
Jan  1 00:07:00 buildroot user.debug kernel: [  425.035919]
logfs_segment_delete(1, 2, 6) e00fc->1c00fc 0->e4
Jan  1 00:07:04 buildroot user.debug kernel: [  429.063415] UBI DBG (pid
533): ubi_leb_write: write 2048 bytes to LEB 0:45:114688
Jan  1 00:07:04 buildroot user.debug kernel: [  429.067108] UBI DBG (pid
533): ubi_leb_write: write 2048 bytes to LEB 0:45:116736
Jan  1 00:07:04 buildroot user.debug kernel: [  429.075439] UBI DBG (pid
533): ubi_leb_write: write 2048 bytes to LEB 0:45:118784
Jan  1 00:07:04 buildroot user.debug kernel: [  429.080810] UBI DBG (pid
533): ubi_leb_write: write 2048 bytes to LEB 0:45:120832


Do anyone have any clue ?

@Jörn:
I couldn't clone the git repository and logfsprogs is nowhere else to be
found ; the webgit interface makes it possible to get a snapshot tarball
but it's not as convenient.

Regards,
David.

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
