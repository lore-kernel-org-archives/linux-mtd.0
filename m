From: grante@visi.com (Grant Edwards)
Date: Fri, 14 Feb 2003 17:04:00 -0600
Subject: Problems with BIG_ENDIAN
In-Reply-To: <20030214162819.A15729@visi.com>; from grante@visi.com on Fri, Feb 14, 2003 at 04:28:20PM -0600
References: <3DF38B3E.CD3CA322@imc-berlin.de> <20030214162819.A15729@visi.com>
Message-ID: <20030214170359.A16219@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, Feb 14, 2003 at 04:28:20PM -0600, Grant Edwards wrote:
> On Sun, Dec 08, 2002 at 07:11:10PM +0100, Steven Scholz wrote:
> 
> > I am having trouble creating a big endian image with the latest
> > CVS version of mkfs.jffs2!
[...]
> > Both options -l _and_ -b result in the same byteorder!!!
> 
> Yup.  And it looks like it's still that way.  Oddly, a comment
> at the top of the file says that cross-endian support has been
> added, but it sure looks like "-l" and "-b" are just ignored.
> 
> I tried undefining JFFS2_NATIVE_ENDIAN and defining
> JFFS2_BIG_ENDIAN, but then nothing builds.  (RH7.3 IA32 host)

I'm having a go at fixing this, but I'm a bit confused by
something in jffs2.h:

  /* Values we may expect to find in the 'magic' field */
  #define JFFS2_OLD_MAGIC_BITMASK 0x1984
  #define JFFS2_MAGIC_BITMASK 0x1985
  #define KSAMTIB_CIGAM_2SFFJ 0x5981 /* For detecting wrong-endian fs */

Where does the value 0x5981 come from?  If the endian setting
is wrong, the bytes within a 16 bit word are swapped and you
see 0x8519 instead of 0x1985.

-- 
Grant Edwards
grante at visi.com
