Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FWRD-0000AN-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 08:45:26 +0100
Message-ID: <3B3B5128.7040006@niisi.msk.ru>
Date: Thu, 28 Jun 2001 11:45:44 -0400
From: Alexandr Andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
CC: jffs-dev@axis.com
Subject: Making partitions questions.
Content-Type: text/plain; charset=KOI8-R; format=flowed
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
I have some questions about making partitions on Intel CFI chips.

1. I read mtd-jffs-HOWTO, and found that can't launch fdisk and create
partitions on my flash dynamically. It have to be created and compiled in a
lowlevel driver. What is the reason? Is anybody working at it?

2. I wish to have several partitions on my flash. Can i have partitions 
with
different filesystems on it? I mean one partition with FTL & ext2 and other
with JFFS2 for example.

Thanks in advance.
