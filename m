From: dwmw2@infradead.org (David Woodhouse)
Date: 15 Feb 2003 00:16:30 +0000
Subject: Problems with BIG_ENDIAN
In-Reply-To: <20030214170359.A16219@visi.com>
References: <3DF38B3E.CD3CA322@imc-berlin.de>
 <20030214162819.A15729@visi.com>  <20030214170359.A16219@visi.com>
Message-ID: <1045268190.13543.6.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-14 at 23:04, Grant Edwards wrote:
> On Fri, Feb 14, 2003 at 04:28:20PM -0600, Grant Edwards wrote:
> > On Sun, Dec 08, 2002 at 07:11:10PM +0100, Steven Scholz wrote:
> > 
> > > I am having trouble creating a big endian image with the latest
> > > CVS version of mkfs.jffs2!
> [...]
> > > Both options -l _and_ -b result in the same byteorder!!!
> > 
> > Yup.  And it looks like it's still that way.  Oddly, a comment
> > at the top of the file says that cross-endian support has been
> > added, but it sure looks like "-l" and "-b" are just ignored.

Looks like it got ripped out when I made the kernel code itself handle
variable endianness. Restored now.

> I'm having a go at fixing this, but I'm a bit confused by
> something in jffs2.h:
> 
>   /* Values we may expect to find in the 'magic' field */
>   #define JFFS2_OLD_MAGIC_BITMASK 0x1984
>   #define JFFS2_MAGIC_BITMASK 0x1985
>   #define KSAMTIB_CIGAM_2SFFJ 0x5981 /* For detecting wrong-endian fs */
> 
> Where does the value 0x5981 come from?  If the endian setting
> is wrong, the bytes within a 16 bit word are swapped and you
> see 0x8519 instead of 0x1985.

I plead stupidity. Fixed now too. Thanks for pointing it out.

-- 
dwmw2
