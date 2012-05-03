Received: from plane.gmane.org ([80.91.229.3])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPwoR-00088e-Lz
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 14:15:20 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SPwoJ-0000NW-WF
 for linux-mtd@lists.infradead.org; Thu, 03 May 2012 16:15:12 +0200
Received: from dsl.comtrol.com ([64.122.56.22])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 16:15:11 +0200
Received: from grant.b.edwards by dsl.comtrol.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 03 May 2012 16:15:11 +0200
To: linux-mtd@lists.infradead.org
From: Grant Edwards <grant.b.edwards@gmail.com>
Subject: Re: Question about mkfs.jffs2 "-s" option
Date: Thu, 3 May 2012 14:12:19 +0000 (UTC)
Message-ID: <jnu3o3$8ad$2@dough.gmane.org>
References: <jnrm65$im4$1@dough.gmane.org>
 <Pine.LNX.4.64.1205030930540.8107@lnxricardw.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2012-05-03, Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
>
> On Wed, 2 May 2012, Grant Edwards wrote:
>
>> The NAND flash I'm using has to be written in 4K blocks -- isn't that
>> the "page size"?
>
> The smallest writable unit in a NAND flash is called a 'page', but AFAIK 
> this is not what the -s option in mkfs.jffs2 is for. Instead, it is 
> related for the kernel memory managament page size, which is 4k for most 
> architectures. I think the jffs2 driver determines the smallest writable 
> unit runtime; it is not a parameter during the file system creation. 
> However the erase block size must be specified to mkfs.jffs2 as it affects 
> the structure of the file system image.

So the '-s' option should always be set to the kernel page size for
the target?

-- 
Grant Edwards               grant.b.edwards        Yow! Hello?  Enema Bondage?
                                  at               I'm calling because I want
                              gmail.com            to be happy, I guess ...
