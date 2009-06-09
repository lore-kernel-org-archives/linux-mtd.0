Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDtvP-0002bf-48
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 05:31:19 +0000
Subject: Re: write error while using UBI/UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manoj <manoj23@gmail.com>
In-Reply-To: <1c3f4270906081913g7e9b0334r183e87d782b2406d@mail.gmail.com>
References: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
	<1244440779.5847.334.camel@localhost.localdomain>
	<1c3f4270906081913g7e9b0334r183e87d782b2406d@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Jun 2009 08:30:03 +0300
Message-Id: <1244525403.5847.370.camel@localhost.localdomain>
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

On Mon, 2009-06-08 at 19:13 -0700, Manoj wrote:
> Thanks for the pointers. But I am using kernel v2.6.27.7. :-(

If you look at the URL I sent you, you'll find 2.6.27 back-port.
All you need to do is to apply already prepared patches to your
tree.

> 
> Meanwhile, I disabled all extra checks and
> CONFIG_MTD_NAND_VERIFY_WRITE as recommended. Now, I see this when I
> unmount and re-mount ubifs:
> 
> # mount -o sync -t ubifs ubi0:rootfs /tmp/flash/
> [  101.480000] UBIFS error (pid 164): ubifs_scan: corrupt empty space
> at LEB 1:14336
> [  101.490000] UBIFS error (pid 164): ubifs_scanned_corruption:
> corrupted data at LEB 1:14336
> [  101.500000] UBIFS error (pid 164): ubifs_scan: LEB 1 scanning failed
> [  101.530000] UBIFS error (pid 164): ubifs_recover_master_node:
> failed to recover master node
> mount: mounting ubi0:rootfs on /tmp/flash/ failed: Invalid argument

I do not see this with the newest UBI/UBIFS. Please, update yours.
See here: http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
