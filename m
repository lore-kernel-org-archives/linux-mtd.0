Received: from mgw3.sony.co.jp ([137.153.0.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FO5Og-0008Rg-La
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 23:01:41 -0500
Received: from mail5.sony.co.jp (localhost [127.0.0.1])
	by mail5.sony.co.jp (R8/Sony) with ESMTP id k2S41RhM012739
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Mar 2006 13:01:27 +0900 (JST)
Received: from smail1.sm.sony.co.jp (smail1.sm.sony.co.jp [43.11.253.1])
	by mail5.sony.co.jp (R8/Sony) with ESMTP id k2S41RTr012732
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Mar 2006 13:01:27 +0900 (JST)
Received: from imail.sm.sony.co.jp (imail.sm.sony.co.jp [43.4.191.32]) by
	smail1.sm.sony.co.jp (8.11.6p2/8.11.6) with ESMTP id
	k2S41Ru13329 for <linux-mtd@lists.infradead.org>;
	Tue, 28 Mar 2006 13:01:27 +0900 (JST)
Received: from localhost (tidal.sm.sony.co.jp [43.4.195.112])
	by imail.sm.sony.co.jp (8.12.11/3.7W) with ESMTP id k2S41ml5005830
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Mar 2006 13:01:48 +0900 (JST)
Date: Tue, 28 Mar 2006 12:59:32 +0900 (JST)
Message-Id: <20060328.125932.92566088.kaminaga@sm.sony.co.jp>
To: linux-mtd@lists.infradead.org
From: Hiroki Kaminaga <kaminaga@sm.sony.co.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: setup cfi flash for linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm implementing snapshot boot for OSK5912 target.

It's basically extract system snapshot image, do init/setup at boot loader,
and jump to kernel resume entry point.

Details here:
http://linux.omap.com/pipermail/linux-omap-open-source/2006-March/006599.html

I'm using linux version 2.6.11, cfi_cmdset_0001.c.
Currently, I get this message from linux:
...
MUX: initialized PWL
Restarting tasks... done
waiting for erase at 00240000 to complete timed out. status = 0, Xstatus = 80.
mtdblock: erase of region [0x0, 0x20000] on "filesystem" failed
end_request: I/O error, dev mtdblock3, sector 256
~/kaminaga # 

(apart from this, command gets executed, and ping/telnet from host is
working fine.)

read/write from/to flash is working in uboot, (md.[bwl], mw.[bwl]), so
I guess I have missed the additional setups done by linux kernel.

Could someone tell me init/setup steps I have to take to enable flash?
(or should these be done by mtd resume() method?)


Thanks in advcance.

(Hiroki Kaminaga)
t
--
