Received: from rcmenter.iserver.net ([192.41.35.12])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DBpm-0006t3-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 22:17:50 +0100
Message-ID: <3B32668F.8020000@asu.edu>
Date: Thu, 21 Jun 2001 14:26:39 -0700
From: Russ Dill <Russ.Dill@asu.edu>
MIME-Version: 1.0
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: safe flash filesystem
References: <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621125458.A23785@crystal.2d3d.co.za> <5.1.0.14.0.20010621083448.00a64b60@mail.spewey.com> <20010621155737.A26310@crystal.2d3d.co.za> <5.1.0.14.0.20010621091714.00a64c70@mail.spewey.com> <20010621163537.A26714@crystal.2d3d.co.za>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

If its just a config file, why make all this so complicated?

struct node {

	u32 magic;
	char valid;
	u32 version;
	u32 data_crc;
	u32 hdr_crc;
	char data[DATA_SIZE];
};

set aside 2-4 eraseblocks (preferably paramater blocks) and on mount, 
find the valid config, walk though the flash and find the valid node 
with the matching crc's and highest version (watch wraparound).

on writing a new config, if there is space left in the current erase 
block, put it after the last one, after finishing writing it, set the 
previos config's valid field to zero (flash lets you do this). If the 
eraseblock is full, write in the next eraseblock, and when you are done, 
erase the previous eraseblock.

All of this can be done in userspace or with a userspace library, just 
mmap an mtd, and then use the erase ioctls.



databases and logs...thats another story
