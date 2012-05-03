Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQ0fM-0004md-9E
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 18:22:14 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SQ0fE-0006bX-C3
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 20:22:04 +0200
Received: from dsl.comtrol.com ([64.122.56.22])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 20:22:04 +0200
Received: from grant.b.edwards by dsl.comtrol.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 20:22:04 +0200
To: linux-mtd@lists.infradead.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Date: Thu, 3 May 2012 18:21:54 +0000 (UTC)
Message-ID: <jnuic1$a2n$1@dough.gmane.org>
References: <jnrm65$im4$1@dough.gmane.org>
 <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
 <20120503211334.17c91b31@halley>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2012-05-03, Shmulik Ladkani <shmulik.ladkani@gmail.com> wrote:
> Hi Ricard,
> 	
> On Thu, 3 May 2012 09:35:14 +0200 (CEST) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>> 
>> On Wed, 2 May 2012, Grant Edwards wrote:
>> 
>> > The NAND flash I'm using has to be written in 4K blocks -- isn't that
>> > the "page size"?
>> 
>> The smallest writable unit in a NAND flash is called a 'page', but
>> AFAIK this is not what the -s option in mkfs.jffs2 is for. Instead,
>> it is related for the kernel memory managament page size,

It would be cool if that's what the man page actually said. :)

>> which is 4k
>> for most architectures.
>
> According to MKFS.JFFS2(1),
>
> 	-s, --pagesize=SIZE
> 		Use page size SIZE.  The default is 4 KiB.  This size is
> 		the maximum size of a data node.
>
> And according to http://linux-mtd.infradead.org/~dwmw2/jffs2.pdf
>
> 	In order to facilitate rapid decompression of
> 	data upon readpage() requests, nodes contain
> 	no more than a single page of data, according to
> 	the hardware page size on the target platform.
>
> Wow.
> I always assumed I had to set it according to NAND's page size, not
> according to target system's mm page size.

To me, that's the obvious interpretation of the man page, and I swear
I've read "howto" pages at other sites (probably ARM SoC and
eval-board vendors), that explictly told you to set the -s option to
be the flash device's page size.

> Can you tell what's the effect of incorrectly setting it to values
> such as: 512 or 2048 bytes (instead of 4KiB)?
>
> Well, I guess as data is written during runtime by the jffs2 itself,
> and as the GC gets working, new inodes will be correctly created, and
> their sizes will be up to system's page size.
>
> However what happens with these small inodes initially created by
> mkfs.jffs2? "Only" a performance penalty or something worse?

When I created them with 4 byte nodes, the filesystem seemd to work
fine.  It was just shockingly large. :)

-- 
Grant Edwards               grant.b.edwards        Yow! TAILFINS!! ... click
                                  at               ...
                              gmail.com            
