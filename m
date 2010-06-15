Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OOWNS-0000s7-13
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2010 13:40:31 +0000
Subject: Re: UBIFS mount failure on NOR flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: pjohn@mvista.com
In-Reply-To: <1276606779.20001.18.camel@localhost.localdomain>
References: <1276606779.20001.18.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Jun 2010 16:37:27 +0300
Message-ID: <1276609047.19028.270.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-15 at 18:29 +0530, Philby John wrote:
> Hello,
> 
> Platform: Cavium CN5020
> Filesystem: UBIFS
> Flash Type: NOR
> Flash Size: 8MB
> Partition Details Kernel Log:
> Creating 2 MTD partitions on "phys_mapped_flash":
> 0x000000000000-0x000000700000 : "Octeon BOOT partition"
> 0x000000700000-0x000000800000 : "Octeon test partition"
> 
> 
> $mount -t ubifs ubi1:test /mnt/nor
> UBIFS error (pid 851): init_constants_early: too few LEBs (12), min. is 17
> mount: wrong fs type, bad option, bad superblock on ubi1:test,
>        missing codepage or helper program, or other error
>        (for several filesystems (e.g. nfs, cifs) you might
>        need a /sbin/mount.<type> helper program)
>        In some cases useful info is found in syslog - try
>        dmesg | tail  or so
> 
> 
> But JFFS2 is able to mount the same partition flawlessly. Shouldn't
> UBIFS be able to do the same? What I would like to know is, is this the
> expected behavior or a bug? If its a bug I would like to look into it.

Yes, this is expected. For such a tiny flash partition you should rather
use JFFS2. I've just created a FAQ entry for you:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_few_lebs

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
