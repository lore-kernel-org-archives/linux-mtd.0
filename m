Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AXTq-00080O-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 May 2002 15:52:47 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF4B@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'ales.makarov@wolfhill.cz'" <ales.makarov@wolfhill.cz>
Cc: "David Woodhouse (E-mail)" <dwmw2@infradead.org>,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Kernel oops after sync command in jffs2
Date: Wed, 22 May 2002 10:52:43 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

The oops you was getting does not seem to come from the same problem that I
found.  In my case, do_erase_oneblock() was failing. This lead us to
discover a bug in mtdconcat.c, which was the source of the oops.

However, I had a look at do_erase_oneword() function.  I seen that to verify
if write operation has completed, we simply read back the written value
until it matches or until we read back 10000 times or more.  This works most
of the time, but in my opinion it is not the best way to do that.  

What I think we should do to determine if write operation has completed OK
is to poll DQ6 and DQ5, as we do for erase operation.  However, since
program operation takes *much* less time than erase operation ( 150 us max
accoring to my AMD spec ), we should not schedule.  We should simply poll
150 times at most, inserting a "udelay(1);" in each loop.  If DQ5 rises, we
must threat it the same way we do in do_erase_oneblock().

Also, speaking of do_erase_oneblock(), it is said in my AMD spec that when
DQ5 rises, even if that happen while DQ6 still toggle, it is necessary to
read DQ0-DQ7 twice once again and compare both values to see if it still
toggles.  If it does not toggle, it means that erase operation has completed
correctly.  You can verify that my yourself by having a look at figure 6, p.
29 in spec sheet "Am29DL322D/323D/324D, revD, May 8th, 2001". 


Frederic Giasson




Ales Makarov wrote:


I have also reported our oops messages few day ago. I traced down the
functions and I got from JFFS2 to MTD. The problem is somewhere in
cfi_amdstd_write(). The problem appears only if there are 2 consecutive
writes (immediately one after another).

This happens regulary when GC tries to reclaim some space. The kernel
dies when GC calls mtd_fake_writev()...

Now I tried the latest version of cfi_cmdset_0002.c (v1.55). The kernel
oops messages are gone, but now I get:

Last[2] is ffff, datum is 1985
Write of 50 bytes at 0x00052438 failed. returned 0, retlen 0
Not marking the space at 0x00052438 as dirty because the flash driver
returned retlen zero
jffs2_write_dirent in garbage_collect_dirent failed: -5

Ales


David Woodhouse wrote:
> 
> fgiasson@mediatrix.com said:
> > The 'called while erasing!' message means that I put a trace in the
> > map driver write16() function to tell me if write16()is called when a
> > global variable is set.  This global variable indicates that
> > do_erase_oneword has sent the erase sector command and is currently
> > polling for the erase operation to complete.
> 
> OK. We already fixed one of these by disabling fast programming mode,
after
> you pointed out that it was sending the unlock command without paying due
> attention to the state machine. If you're definitely using v1.55 of
> cfi_cmdset_0002.c, can you put a BUG() in the mtxmap_write16() call just
> after it prints the 'called while erasing!' message, and we'll see where
> it's being called _from_.
