Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18K0wi-0002YC-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 18:42:00 +0000
Received: from 127.0.0.1 (localhost [127.0.0.1])
	by dummy.ddiworldwide.com (Postfix) with SMTP id C36AE162F7B
	for <linux-mtd@lists.infradead.org>; Thu,  5 Dec 2002 14:13:55 -0500 (EST)
Received: from plinux.ddiworldwide.com (plinux [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 38849162F7A
	for <linux-mtd@lists.infradead.org>; Thu,  5 Dec 2002 14:13:55 -0500 (EST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Frank R Callaghan <f.callaghan@ieee.org>
Reply-To: f.callaghan@ieee.org
Subject: Fwd: NewBee Question
Date: Thu, 5 Dec 2002 14:10:28 -0500
To: LinuxMTD <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200212051410.28872.f.callaghan@ieee.org>
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

Hi All,

I am looking to use an AMD flash chip on my pc104 card
to store some non-volatile data, the chip is a 2MB part but,
the BIOS is in the first 128KB (do not want to overwrite).

After setting up the kernel with MDT I get
cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"

ok but I only need the second 1MB - is there some way to either
prevent the first meg being mapped/used ?

also I'm looking to use jffs as the file system - maybe I can partion it
to only use the second meg ???

Any help greatly appreciated,

TIA,
	Frank.
