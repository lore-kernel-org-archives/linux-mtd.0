Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18b4wi-0003B9-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2003 20:24:32 +0000
Received: from there (203-96-48-192-tollfree.actrix.co.nz [203.96.48.192])
	by dragon.actrix.co.nz (Postfix) with SMTP id 32F2814AF8
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2003 09:55:25 +1300 (NZDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: linux-mtd@lists.infradead.org
Subject: Fwd: YAFFS on NOR
Date: Wed, 22 Jan 2003 09:50:56 +1300
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20030121205525.32F2814AF8@dragon.actrix.co.nz>
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



Hi folks

I thought it might be of interest to tell you that people are now starting to
use YAFFS with NOR. Whether is a Good Thing or not, I will not comment on.

Although YAFFS was designed/written with the intention of working only with
NAND, you can make it work on NOR too.

YAFFS uses the OOB space in NAND parts to store tag information. All you need
to do is simulate this area.

For instance, let us suppose you have 64kB blocks. You can do the following:
* Set YAFFS up for 124 chunks per block. ie 124x512 bytes used for data
* Use the remaining 2048 bytes to emulate OOB area (16 bytes per chunk).

YAFFS is not erase suspend aware and thus is going to stall during an
erasure. This might get addressed some time. OK, I lied, I will comment. I
think JFFSx is superior on NOR for Linux. [The person using YAFFS on NOR is
not doing this under Linux].

-- CHarles
