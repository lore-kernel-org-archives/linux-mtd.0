Received: from mail.allot.com ([199.203.223.202] helo=exg.allot.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 166Y3m-0001al-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2001 14:09:07 +0000
Message-ID: <3BFBB870.5D435486@allot.com>
Date: Wed, 21 Nov 2001 16:21:36 +0200
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Kernel partition
Content-Type: text/plain; charset=us-ascii
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

Hi,

I'd like to create 2 partitions on my flash disk: kernel partition
(where kernel image resides)
and normal ext2 partition. I was thinking of using fdisk and creating an
ext2 partition at
some offset from the start of the disk, thus reserving space for kernel
partition. Will this
work, or some other technique is required ?

TIA.

Felix.
