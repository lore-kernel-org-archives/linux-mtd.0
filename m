From: grante@visi.com (Grant Edwards)
Date: Fri, 14 Feb 2003 16:28:20 -0600
Subject: Problems with BIG_ENDIAN
In-Reply-To: <3DF38B3E.CD3CA322@imc-berlin.de>; from steven.scholz@imc-berlin.de on Sun, Dec 08, 2002 at 07:11:10PM +0100
References: <3DF38B3E.CD3CA322@imc-berlin.de>
Message-ID: <20030214162819.A15729@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, Dec 08, 2002 at 07:11:10PM +0100, Steven Scholz wrote:

> I am having trouble creating a big endian image with the latest
> CVS version of mkfs.jffs2!
> 
> > mkfs.jffs2 -d /tmp/initrd.tmp.5530 -o images/pFlashdisk -l -p
> > hexdump -n 16 -x images/pFlashdisk 
> 0000000    1985    2003    000c    0000    b0b1    e41e    1985    e001
> 
> > mkfs.jffs2 -d /tmp/initrd.tmp.5530 -o images/pFlashdisk -b -p
> > hexdump -n 16 -x images/pFlashdisk 
> 0000000    1985    2003    000c    0000    b0b1    e41e    1985    e001
> 
> Both options -l _and_ -b result in the same byteorder!!!

Yup.  And it looks like it's still that way.  Oddly, a comment
at the top of the file says that cross-endian support has been
added, but it sure looks like "-l" and "-b" are just ignored.

I tried undefining JFFS2_NATIVE_ENDIAN and defining
JFFS2_BIG_ENDIAN, but then nothing builds.  (RH7.3 IA32 host)

Where can I get a version of mkfs.jffs2 that pays attention to
the "-b" flag?  [I unfortunately can't access the CVS archives.]

Thanks,

-- 
Grant Edwards
grante at visi.com
