Received: from mx51.mymxserver.com ([85.199.173.110])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KGwOE-0002Dx-A2
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 13:40:54 +0000
Received: from localhost (localhost [127.0.0.1])
	by localhost.mx51.mymxserver.com (Postfix) with ESMTP id 6AD564B01A
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jul 2008 15:40:49 +0200 (CEST)
Received: from mx51.mymxserver.com ([127.0.0.1])
	by localhost (mx51.mymxserver.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwFgZfIWNPFS for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jul 2008 15:40:49 +0200 (CEST)
Received: from lin01.mn-solutions.de (pD95F961B.dip0.t-ipconnect.de
	[217.95.150.27])
	by mx51.mymxserver.com (Postfix) with ESMTP id 19E524B014
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jul 2008 15:40:49 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-solutions.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 9E0E81E000E
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jul 2008 15:40:44 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Subject: Flash device refused suspend due to active operation (state 0)
Date: Thu, 10 Jul 2008 15:39:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807101539.46202.hs4233@mail.mn-solutions.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have, from time to time, the following strange thing on my 
device:

# sync
# shutdown -r 0

Broadcast message from root (tts/2) (Thu Jan  1 00:01:24 1970):

The system is going down for reboot NOW!
INIT: Switching to runlevel: 6
INIT: Sending processes the TERM signal
INIT: Sending pStopping Dropbear SSH server: 
stopped /usr/sbin/dropbear (pid 211)
dropbear.
Stopping syslogd/klogd: stopped syslogd (pid 218)
stopped klogd (pid 220)
done
Deconfiguring network interfaces... done.
Stopping vncserver: done
Sending TERM signal...
Sending KILL signal...
Flash device refused suspend due to active operation (state 0)
Restarting system.



This is on 2.6.25.7, PXA255, with:

flash: Found 2 x16 devices at 0x0 in 32-bit bank
flash: Found an alias at 0x2000000 for the chip at 0x0
erase region 0: offset=0x0,size=0x40000,blocks=128
0x00000000-0x00040000: "Boot"
0x00040000-0x00140000: "Linux"
0x00140000-0x02000000: "Files"
VFS: Mounted root (jffs2 filesystem).

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_PXA2XX=y

Any hint on how I could debug this?

I'm not sure if this is related to a problem that I have from 
time to
