Received: from web13601.mail.yahoo.com ([216.136.175.112])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uQak-0007N5-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2001 04:45:02 +0100
Message-ID: <20011019035415.2958.qmail@web13601.mail.yahoo.com>
Date: Thu, 18 Oct 2001 20:54:15 -0700 (PDT)
From: Luke <luke_epsilon@yahoo.com>
Subject: Re: Serious flash problems - bad inodes? 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
In-Reply-To: <25109.1003410438@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello all,

I have some rather confusing things to say about my flash situation.  As it stands now every time
I reboot I have the same flash failure as stated in my original post.   If I try to ls or cp or mv
anything to flash I get INCOMPAT nodetype errors - and the net result is that the flash is
unaccessible.  Here is the bizarre kicker.  I should have said that I HAD the same problems stated
above and in my original post up until 10 minutes ago......now if I can figure out WHY?

A little about my system, my ttyS0 that I am using as a console (at least for now to configure my
system) is being routed through an FPGA before I get to see it through my serial cable.  As such,
since it is an FPGA, it needs to be configured after power up of the system.  The FPGA is being
configured over the parallel I/O lines (0x378 etc).  I made some minor modifications in the
verilog that is going on my FPGA (that has nothing to do with the computer or ttyS0 per se, but
instead on some behavior of an exterior peripheral being controlled by the FPGA). The bad INCOMPAT
nodetype behavior is now fixed - and I have no clue why. 

Another strange thing is that even though I have had many messages about the flash being
unformatted and then see every block seemingly being erased --now that the flash is working again,
all of my original files from last week (when the flash first failed) are intact in the flash.
weird... 

I am using the standard physmap.c as my driver by the way - with no modifications - I just have
the appropriate mem_chip selects set in bios corresponding to the configuration of mtd in
compiling the kernel.

Thanks,
Luke

ps. I just thought of one thing that probably is important.  On boot up, I (or rather the init.d
startup script) looks on either the flash or in /etc (in that order) for the file, fpga.rbf, to
download to the FPGA.  This is what it looks like when I manually mount the flash (this happens
every time on a successful mount)

$mount /flash
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0000: 0x079d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0004: 0xbc00 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0008: 0x7b80 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f000c: 0xb780 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0010: 0xcc2f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0014: 0xc0fe instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0018: 0x14c7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f001c: 0xf069 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0020: 0x6bc2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000f0024: 0x040d instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x000f93c0
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x000f0000 is not formatted. It will be erased
$
$ (prompts here - mount has completed)
$
and then I get a message that appears 1 to 20 seconds later:

Newly-erased block contained word 0x580b079d at offset 0x000f0000

Is it possible that I am trying to access the file in flash for my FPGA before the flash has
completely mounted and as such I mess up the flash somehow?  If so, I still am not sure why it is
different now - maybe the timing has changed with my new fpga.rbf????

Hmmmmmmmmmmmmmmmmmmmmm

Any suggestions would be greatly appreciated!


--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> luke_epsilon@yahoo.com said:
> > # ls
> > Unknown INCOMPAT nodetype FFFF at 0076CC3C 
> > Unknown INCOMPAT nodetype FFFF at 0076CAC0
> 
> Odd. Looks like something may have erased that flash block while it was 
> mounted. Can you reproduce it?

> > Last[2] is ff, datum is 85
> > Write of 68 bytes at 0x0076ecec failed. returned 0, retlen 0
> 
> That's a flash driver playing silly buggers. Check you can write to the 
> whole device.
> 



__________________________________________________
Do You Yahoo!?
Make a great connection at Yahoo! Personals.
http://personals.yahoo.com
