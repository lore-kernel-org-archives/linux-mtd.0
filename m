Received: from maild.telia.com ([194.22.190.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Axpx-0007dD-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 19:33:37 +0000
Message-ID: <006301c288f4$56196da0$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Marc Singer" <elf@buici.com>
Cc: <linux-mtd@lists.infradead.org>
References: <F122OgRGkQ6mBySsxVY00000854@hotmail.com> <24987.1036797874@passion.cambridge.redhat.com> <002301c288cd$c11a6180$0200a8c0@telia.com> <20021110184321.GB16087@buici.com>
Subject: Re: crc32() optimization
Date: Sun, 10 Nov 2002 21:04:11 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hmm , maybe. I tried 16, 8 & 4 also, but 6 was a little faster for me.
What would be great if someone that understands CRC better than me could
take a look at Algorithm 4 at http://www.cl.cam.ac.uk/Research/SRG/bluebook/21/crc/node6.html#SECTION00060000000000000000
and apply that on linux CRC32 code.  I tried but failed to get it correct.

        Jocke

> As it should.  I wonder if you'd do better changing the loop slightly.
> 
> Check for len == 0 and do a short-circuit return.  Then do this
> 
>   for (++len; len & 0x7; len >>= 3) {
>      ONCE(); // repeat eight times
>      ...
>      len >>= 3;
>   }
>   while (--len > 0)
>      ONCE();
> 
> This is the implementation I've written for another project which
> we've found to be relatively optimal.  Note that len *must* be an int
> even though contemporary convention is to use the size_t type.
> 
> 
> On Sun, Nov 10, 2002 at 04:28:00PM +0100, Joakim Tjernlund wrote:
> > Hi David
> > 
> > This patch improves my scan time with 22%( from 2.39 to 1.86 seconds).
> > Maybe you want to include it in the 2.4 branch.
> > 
> > I will put this in my next backport of the crc32 stuff from 2.5.
> > 
> >           Jocke
> > 
> > Index: fs/jffs2/crc32.h
> > ===================================================================
> > RCS file: /home/cvs/mtd/fs/jffs2/crc32.h,v
> > retrieving revision 1.3
> > diff -u -b -r1.3 crc32.h
> > --- fs/jffs2/crc32.h    26 Feb 2001 14:44:37 -0000      1.3
> > +++ fs/jffs2/crc32.h    10 Nov 2002 15:25:11 -0000
> > @@ -13,7 +13,16 @@
> >  crc32(__u32 val, const void *ss, int len)
> >  {
> >         const unsigned char *s = ss;
> > -        while (--len >= 0)
> > +        while (len >= 6){
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> > +         len -= 6;
> > +        }
> > +        while (len--)
> >                  val = crc32_table[(val ^ *s++) & 0xff] ^ (val >> 8);
> >          return val;
> >  }
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
