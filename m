Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NII7g-0007Ec-8U
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 08:42:17 +0000
Subject: Re: UBIFS on kernel 2.6.24?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Jander <david.jander@protonic.nl>
In-Reply-To: <200912081745.03588.david.jander@protonic.nl>
References: <200911231510.40294.david.jander@protonic.nl>
	<1259220221.29118.55.camel@localhost>
	<200912081745.03588.david.jander@protonic.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 09 Dec 2009 10:41:48 +0200
Message-Id: <1260348108.19669.1220.camel@localhost>
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

On Tue, 2009-12-08 at 17:45 +0100, David Jander wrote:
> I have downloaded those tools, and started playing with them.
> I started with speedtest :-), oobtest, scantest and pagetest. Those al ran 
> without problems, but subpagetest stopped with an error:
> 
> [...]
> [14083.422527] subpagetest: erasing                                                                                                                                                 
> [14083.432654] subpagetest: erased 0                                                                                                                                                
> [14083.815876] subpagetest: erased 256                                                                                                                                              
> [14084.190646] subpagetest: erased 512                                                                                                                                              
> [14084.573346] subpagetest: erased 768                                                                                                                                              
> [14084.956378] subpagetest: erased 1024                                                                                                                                             
> [14085.339424] subpagetest: erased 1280                                                                                                                                             
> [14085.716865] subpagetest: erased 1536                                                                                                                                             
> [14086.099616] subpagetest: erased 1792                                                                                                                                             
> [14086.482645] subpagetest: erased 2048                                                                                                                                             
> [14086.496965] subpagetest: error -5 while erasing EB 2052                                                                                                                          
> [14086.507507] subpagetest: error -5 occurred                                                                                                                                       
> 
> If I repeat this test I get an error on the same EB.
> If I repeat pagetest now, I also get the same error on the same EB.
> If I run flash_eraseall on the device, I get this:
> 
> $ flash_eraseall /dev/mtd1
> Erasing 128 Kibyte @ 3980000 --  5 % complete.
> Skipping bad block at 0x039a0000
> Erasing 128 Kibyte @ 3f80000 --  6 % complete.
> Skipping bad block at 0x03fa0000
> Erasing 128 Kibyte @ 10080000 -- 25 % complete.
> /usr/local/sbin/flash_eraseall: /dev/mtd1: MTD Erase failure: Input/output 
> error
> Erasing 128 Kibyte @ 18760000 -- 38 % complete.
> Skipping bad block at 0x18780000
> Erasing 128 Kibyte @ 3ff60000 -- 99 % complete.
> Skipping bad block at 0x3ff80000
> Skipping bad block at 0x3ffa0000
> Skipping bad block at 0x3ffc0000
> Skipping bad block at 0x3ffe0000
> Erasing 128 Kibyte @ 40000000 -- 100 % complete.
> 
> Did this test kill my nand-flash chip?

Probably a bad block, which is normal on NAND. This is one of the
reasons why NAND-aware software is not-so-simple.

I think ubiformat would suggest you to mark this faulty eraseblock as
bad.

> > > But I'd like to know how I can get this version into my kernel. Will
> > > it work if I just copy the relevant files?
> > 
> > No. This is git, and what you should do is to merge ubifs-v2.6.24.git to
> > your tree.
> 
> I thought so. Well, I guess I'll have to do some more git manual studying 
> *sigh*.

'git pull' should do the trick.

> > > Is there a patch against 2.6.24 that I can download somewhere?
> > 
> > This is git, and you can create patches yourself. Clone
> > ubifs-v2.6.24.git and do something like:
> > 
> > git format-patch v2.6.24
> 
> Thanks for the tip, that seems safe to try.

To apply those patches to another tree, you can use 'git am'.

> > You will get all patches. Then you can merge them if you want, but this
> > is a bad idea, IMHO.
> 
> Hmmmm.... If you know how to do it the right way with git, why don't you just 
> take the little trouble of putting into the web-page? A lot of people would 
> learn from it (me included).

It is about git basics, there are many good tutorials. This is just
about doing the basic operation - 'git pull'.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
