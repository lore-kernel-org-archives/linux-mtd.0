Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LrnSi-0007zv-Ai
	for linux-mtd@lists.infradead.org; Thu, 09 Apr 2009 06:10:15 +0000
Subject: Re: Volume write-protected
From: Artem Bityutskiy <dedekind@infradead.org>
To: DATACOM - Nedel <nedel@datacom-telematica.com.br>
In-Reply-To: <49DCD7C9.2050802@datacom-telematica.com.br>
References: <49DCD7C9.2050802@datacom-telematica.com.br>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Apr 2009 09:09:21 +0300
Message-Id: <1239257361.3390.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-08 at 13:58 -0300, DATACOM - Nedel wrote:
> # mount -t ubifs ubi0!ubipart /mnt/flash/
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 8188:512, written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 8191:512, written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 8190:512, written 0 bytes
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 
> 8189:512, written 0 bytes

-5 is EIO, Input/output error. UBI tries to write 512 bytes, which is
one subpage, to offset 512 (i.e., it writes the second subpage). And
the MTD layer returns 512. So the issue is somewhere below UBI.

Possibly, your flash does not support sub-pages, but it declares that
it does. You should look at your MTD driver. The other possibility is
to force UBI not to use subpages.

> UBI error: ubi_io_write: read-only mode
> UBI error: erase_worker: failed to erase PEB 8188, error -30
> UBI error: do_work: work failed with error code -30
> UBI error: ubi_thread: ubi_bgt0d: work failed with error code -30
> UBIFS error (pid 6550): ubifs_write_node: cannot write 2048 bytes to LEB 
> 1:2048, error -30
> mount: ubi0!ubipart is write-protected, mounting read-only

UBI attaches the volume in R/O mode, because of the write error.
UBI tries to be nice to you, and instead of totally refusing the
MTD device, it attaches it R/O.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
