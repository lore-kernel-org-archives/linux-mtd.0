Received: from elasmtp-scoter.atl.sa.earthlink.net ([209.86.89.67])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I8hLg-0002ow-EB
	for linux-mtd@lists.infradead.org; Wed, 11 Jul 2007 19:55:42 +0100
Message-ID: <469527A3.7030203@mindspring.com>
Date: Wed, 11 Jul 2007 14:55:31 -0400
From: Chuck Meade <chuckmeade@mindspring.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	"Chuck Meade (mindspring)" <chuckmeade@mindspring.com>
Subject: Re: jffs2 eraseblock size, and actual flash device eraseblock size
References: <4689F10B.9040401@mindspring.com>
In-Reply-To: <4689F10B.9040401@mindspring.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I am generating a jffs2 image for a target that can have one of two
> different flash devices installed.  One of these flash devices has
> an eraseblock size of 0x20000 bytes, and one has an eraseblock size of
> 0x10000 bytes.  The storage size of the flash devices is the same.
> It would be nice to be able to use the same jffs2 image on both target
> flash variants.
> 
> I have read what I could find related to this, including the FAQ, such
> as here:  http://www.linux-mtd.infradead.org/doc/jffs2.html
> which states "creating an image with smaller eraseblock size than the
> actual hardware is harmless -- it just gives annoying messages".
> 
> I would like to get your expert opinions on what would be the _best_
> approach here.  The possible approaches are to create an image with the
> eraseblock set to 0x10000, or to 0x20000.  The 0x10000 size would be
> smaller than the actual flash eraseblock size on the flash device with
> actual eraseblock size=0x20000.  And the opposite problem occurs if you
> create an image with eraseblock 0x20000 -- it is larger than the actual
> erase block size when using the flash device with eraseblock size 0x10000.
> 
> What are the pros and cons here, with respect to efficiency?  Would
> both of the above choices even work?

Any ideas at all on this?  I am looking for input on the following:
1. If it is a workable solution to have the same jffs2 image being used
   on devices of two different erase block sizes.
2. If so, which is the preferrable method, to generate the jffs2 image
   specifying the smaller or the larger of the two erase block sizes,
   and why?

Thanks for any info you can provide regarding this,
Chuck
