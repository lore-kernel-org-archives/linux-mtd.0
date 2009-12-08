Received: from protonic.xs4all.nl ([213.84.116.84] helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NI3AX-0001wy-FR
	for linux-mtd@lists.infradead.org; Tue, 08 Dec 2009 16:44:13 +0000
From: David Jander <david.jander@protonic.nl>
To: dedekind1@gmail.com
Subject: Re: UBIFS on kernel 2.6.24?
Date: Tue, 8 Dec 2009 17:45:03 +0100
References: <200911231510.40294.david.jander@protonic.nl>
	<1259220221.29118.55.camel@localhost>
In-Reply-To: <1259220221.29118.55.camel@localhost>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <200912081745.03588.david.jander@protonic.nl>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

Thanks for replying!

> On Mon, 2009-11-23 at 15:10 +0100, David Jander wrote:
> > Hi all,
> >
> > I am forced to use this ancient kernel (2.6.24), but I also need UBIFS.
> > Our boards have 1GiB NAND flash chips with 2k pages.
> > Until now I have been testing with vanilla MTD/UBI/UBIFS from that
> > kernel, and (not entirely unexpected) now errors start to appear, which
> > look like this:
> >
> > $ cd /etc
> > $ ls -l
> > ls: reading directory .: Structure needs cleaning
> >
> > And the kernel messages look like this:
> >
> > [10871.725906] UBIFS error (pid 10801): ubifs_check_node: bad magic
> > 0x38f2aa8b, expected 0x6101831 [10871.736785] UBIFS error (pid 10801):
> > ubifs_check_node: bad node at LEB 6259:66568 [10871.745344] UBIFS error
> > (pid 10801): ubifs_read_node: expected node type 2 [10871.753209] UBIFS
> > error (pid 10801): ubifs_readdir: cannot find next direntry, error -117
> 
> Looks like your NAND driver has problems. You should run mtd tests and
>  validate it:
>  http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

I have downloaded those tools, and started playing with them.
I started with speedtest :-), oobtest, scantest and pagetest. Those al ran 
without problems, but subpagetest stopped with an error:

[...]
[14083.422527] subpagetest: erasing                                                                                                                                                 
[14083.432654] subpagetest: erased 0                                                                                                                                                
[14083.815876] subpagetest: erased 256                                                                                                                                              
[14084.190646] subpagetest: erased 512                                                                                                                                              
[14084.573346] subpagetest: erased 768                                                                                                                                              
[14084.956378] subpagetest: erased 1024                                                                                                                                             
[14085.339424] subpagetest: erased 1280                                                                                                                                             
[14085.716865] subpagetest: erased 1536                                                                                                                                             
[14086.099616] subpagetest: erased 1792                                                                                                                                             
[14086.482645] subpagetest: erased 2048                                                                                                                                             
[14086.496965] subpagetest: error -5 while erasing EB 2052                                                                                                                          
[14086.507507] subpagetest: error -5 occurred                                                                                                                                       

If I repeat this test I get an error on the same EB.
If I repeat pagetest now, I also get the same error on the same EB.
If I run flash_eraseall on the device, I get this:

$ flash_eraseall /dev/mtd1
Erasing 128 Kibyte @ 3980000 --  5 % complete.
Skipping bad block at 0x039a0000
Erasing 128 Kibyte @ 3f80000 --  6 % complete.
Skipping bad block at 0x03fa0000
Erasing 128 Kibyte @ 10080000 -- 25 % complete.
/usr/local/sbin/flash_eraseall: /dev/mtd1: MTD Erase failure: Input/output 
error
Erasing 128 Kibyte @ 18760000 -- 38 % complete.
Skipping bad block at 0x18780000
Erasing 128 Kibyte @ 3ff60000 -- 99 % complete.
Skipping bad block at 0x3ff80000
Skipping bad block at 0x3ffa0000
Skipping bad block at 0x3ffc0000
Skipping bad block at 0x3ffe0000
Erasing 128 Kibyte @ 40000000 -- 100 % complete.

Did this test kill my nand-flash chip?

> > I did not bother turning on more debug messages yet, since I think I
> > am most probably missing some important bugfixes in my version of
> > MTD/UBI/UBIFS.
> 
> May be, but this really looks like you either have problems in the
> driver, or you did not flash the UBIFS image correctly. Try to reproduce
> this problem when you attach a freshly erased NAND to UBI and then mount
> UBIFS.

I did not flash an image. To initialize a new flash chip I just do this from 
an NFS-root system:

ubiattach /dev/ubi_ctrl -m 1
ubimkvol /dev/ubi0 -N rootfs -m
mount -t ubifs ubi0:rootfs /mnt/nand/
cp -ax /path/to/rootfs/* /mnt/nand/
umount /mnt/nand

> >  Btw, is there some sort of version number in some file somewhere, so
> > I can check wich version I am actually using?
> 
> No, not really. The assumption is that the latest version should always
> be used :-)

Ok, I just meant to be able to identify a certain version which is not the 
latest.... never mind.

> > I am aware of this git repository:
> > http://git.infradead.org/users/dedekind/ubifs-v2.6.24.git
> 
> Good! Why you do not use it then? We fixed many UBI/UBIFS bugs there,
> and there were important improvements.

I usually first want to find out something is broken before trying to fix it 
;-)
We do use a nand-flash driver which is not part of the MTD tree yet, and I 
don't know if I can safely mix this driver with a newer version of MTD/UBI.
Besides I wouldn't know the necessary git magic to get this into our tree and 
knowing I don't break anything else.

> > But I'd like to know how I can get this version into my kernel. Will
> > it work if I just copy the relevant files?
> 
> No. This is git, and what you should do is to merge ubifs-v2.6.24.git to
> your tree.

I thought so. Well, I guess I'll have to do some more git manual studying 
*sigh*.

> > Is there a patch against 2.6.24 that I can download somewhere?
> 
> This is git, and you can create patches yourself. Clone
> ubifs-v2.6.24.git and do something like:
> 
> git format-patch v2.6.24

Thanks for the tip, that seems safe to try.

> You will get all patches. Then you can merge them if you want, but this
> is a bad idea, IMHO.

Hmmmm.... If you know how to do it the right way with git, why don't you just 
take the little trouble of putting into the web-page? A lot of people would 
learn from it (me included).

> > Do I need only UBIFS, or do I also need all of MTD?
> 
> There are some mtd fixes which I considered important in the
> ubifs-v2.6.24.git tree. And the tree is sufficient.
> 
> But of course, if you find some MTD problems which were fixed later, you
> may back-port more patches.
> 
> > I have a custom NAND-flash driver, do I likely need to change it, or
> > should it just work with the new version of MTD?
> 
> You really should just try things out. But I think it should be fine.

Ok, thanks a lot!

Best regards,

-- 
David Jander
Protonic Holland.
tel.: +31 (0) 229 212928
fax.: +31 (0) 229 210930
Factorij 36 / 1689 AL Zwaag
