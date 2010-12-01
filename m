Received: from webbox687.server-home.net ([195.149.74.151])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNms3-000129-7z
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2010 13:37:19 +0000
Received: from comm.systec-electronic.de (178-25-116-119-dynip.superkabel.de
	[178.25.116.119])
	by webbox687.server-home.net (Postfix) with ESMTP id EEF5E7780C9
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Dec 2010 14:37:20 +0100 (CET)
Received: from ws-stein.localnet (ws-stein.systec-electronic.de
	[192.168.10.93])
	by comm.systec-electronic.de (Postfix) with ESMTP id 8ECDB97C068
	for <linux-mtd@lists.infradead.org>;
	Wed,  1 Dec 2010 14:37:17 +0100 (CET)
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: linux-mtd@lists.infradead.org
Subject: UBI error: nor_erase_prepare: cannot invalidate PEB 76,
	write returned -5 read returned 2
Date: Wed, 1 Dec 2010 14:37:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201012011437.16978.alexander.stein@systec-electronic.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm observing the given error after starting Linux. ubiattach is called from 
within the init-script. Currently I'm running v2.6.34. The filesystem is 
mounted read-only as expected.
It gets curious that afterwards in u-boot the corresponding sector is complety 
empty, read 0xff. It seems the sector cannot be written, although it is empty.
Has anybody an idea about such phenomenon? Oh, before it forget, I use a 
Numonyx Axcell M29EW NOR-Flash 128MiB.

Best regards
Alexander
