Subject: Re: Upgrading mtd-utils in uClinux.
From: David Woodhouse <dwmw2@infradead.org>
To: Glen Johnson <gjohnson@valcom.com>
In-Reply-To: <456ED562.5080307@valcom.com>
References: <456C4306.8070205@valcom.com>
	<Pine.LNX.4.64.0611290842530.5328@lnxricardw.se.axis.com>
	<456ED562.5080307@valcom.com>
Content-Type: text/plain
Date: Fri, 01 Dec 2006 11:21:22 +0000
Message-Id: <1164972082.5063.59.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-11-30 at 07:58 -0500, Glen Johnson wrote:
> Ricard Wanderlof wrote:
> > Unless someone here has had this specific problem, some form of output
> > from the compilation indicating what is going wrong would be helpful.
> >
> >   
> Yes, of course.  I have a couple more direct question. First, I found
> the mtd-utils code is not properly using zlib. 
> 
> m68k-elf-gcc -Wl,--fatal-warnings -Wl,-elf2flt -Wl,-move-rodata
> -msep-data -o mkfs.jffs2 crc32.o compr_rtime.o mkfs.jffs2.o compr_zlib.o
> compr.o -L/home/glen/src/c/linux/uClinux-dist-20060803/lib/zlib

No '-lz' on this command line -- you're not actually asking it to link
against zlib. Thus is doesn't find any of zlib's symbols.

> warning: .rodata section contains relocations

I've no idea what this is about. Perhaps the function pointers in the
jffs2_zlib_comp compressor structure?

mkfs.jffs2 builds fine for me for FR-V uClinux, although that's
ELF-FDPIC not flat. Are the relocations in .rodata actually a problem?
Doesn't m68k have ELF-FDPIC yet?

> Secondly, once I get the code to compile it appears I still need to add
> a section to the Makefile to install the files into the romfs image. 
> Can I just pull this out of the old mtd-utils/Makefile or what? 
> Suggestion's/recommendations?

Something wrong with 'make DESTDIR=/foo install' ?

--  
dwmw2
