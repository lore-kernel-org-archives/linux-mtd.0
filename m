Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gMe-00037x-Ui
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:34:21 +0000
Received: by ewy3 with SMTP id 3so1205256ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 08:34:19 -0700 (PDT)
Subject: Re: UBI memory usage on large page nand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nicholas <ciliwung36@gmail.com>
In-Reply-To: <AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 18:31:50 +0300
Message-ID: <1301671910.2789.98.camel@localhost>
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

Hi,

I agree UBI/UBIFS uses more memory than it could. There is some room for
optimizations.

On Thu, 2011-03-31 at 11:07 +0800, Nicholas wrote:
> Hi there,
> 
> I've a short of memory usage issue while using large page size of nand flash.
> Before, i was using 2KB page size of nand flash, i found UBI/UBIFS memory
> consumption on normal zone are :
> 
> 7 0xC0180858:   1024K, ubi_attach_mtd_de,
> 8 0xC0180834:   1024K, ubi_attach_mtd_de,
> 9 0xC00ED300:   1008K,      ubifs_get_sb,
> 10 0xC00ED31C:   1008K,      ubifs_get_sb,
> 11 0xC00FE7EC:   1008K,    ubifs_lpt_init,
> 11 0xC00F95AC:   1008K, ubifs_mount_orpha,
> 
> Then, i'm using 8KB page size of nand flash, and found the result as below :
> 4 0xC0180858:   4096K, ubi_attach_mtd_de,
> 5 0xC0180834:   4096K, ubi_attach_mtd_de,
> 6 0xC00FE7EC:   4064K,    ubifs_lpt_init,
> 7 0xC00ED31C:   4064K,      ubifs_get_sb,
> 8 0xC00F95AC:   4064K, ubifs_mount_orpha,
> 9 0xC00ED300:   4064K,      ubifs_get_sb,
> 
> My environment contains 2 mtd partitions for UBI.
> 
> Before, it took 6MB of memory consumption and now it takes 24MB.
> Do you have any suggestion how to reduce the memory consumption since dram size
> is pretty limited for other usage.

I think this is mainly because your eraseblock size became larger. UBI
and UBIFS allocate many buffers of eraseblock size for various purposes.
The buffers are often allocated once on attach/mount and released only
on detach/unmount. All of these buffers are allocated with vmalloc()
call, so you can find them by grepping.

The simplest thing you can try is to allocate these buffers when they
are actually needed, and then free them when they are not needed. This
should help.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
