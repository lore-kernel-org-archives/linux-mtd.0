Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8PN-0005hX-S5
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:25:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Siddharth Choudhuri <choudhri@cs.tamu.edu>
In-Reply-To: <Pine.GSO.4.44.0306111054540.7463-100000@unix.cs.tamu.edu>
References: <Pine.GSO.4.44.0306111054540.7463-100000@unix.cs.tamu.edu>
Message-Id: <1055348742.2097.257.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 17:25:43 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 vs. ext3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 17:03, Siddharth Choudhuri wrote:
> I am trying jffs2 and ext3 on a 3MB Intel NOR flash. I have a piece of
> code in function part_write (mtdpart.c) that outputs the size in bytes and pid
> of the process (current) sending write requests.
> 
> With ext3, no matter how many bytes are written (by an application/user
> level program), the part_write function always gets a request that is
> multiple of 128K (131072 bytes). This does not happen with jffs2 though.
> Also, with ext3, the process is always mtdblockd, whereas with jffs2 the
> process sending the request is the actual user/application process.
> 
> Any ideas why it happens ?

The flash chip has an erase size of 128KiB. You can't treat it like a
normal hard drive -- to use a traditional file system like ext3, you
have to have some kind of 'translation layer' to fake that behaviour.

The 'mtdblock' translation layer which you seem to be using is the most
naïve implementation possible of such a thing -- every time a 512-byte
sector on the 'virtual' block device is changed, we read the 128KiB
block of flash into memory, modify 512 bytes of it accordingly and then
write back the modified data.

If you lose power during the period between the erase starting and the
writeback of the modified data completing, you lose a huge chunk of your
data.

(OK, it's actually a little more intelligent than that and does combine
subsequent writes into the same eraseblock, rather than doing an erase
for _every_ 512-byte sector write, but the principle is the same, and
it's still entirely unsafe.)

There are other, more complex, translation layers such as FTL -- these
are a kind of pseudo-filesystem which emulate a block device slightly
more safely and do give you powerfail-protection by having some kind of
journalling built-in. 

When combined with a true journalling file system atop their 'virtual'
block device, that's really not the most efficient use of the flash. 

JFFS2, on the other hand, works directly with the flash and does not
suffer the same problems.

-- 
dwmw2
